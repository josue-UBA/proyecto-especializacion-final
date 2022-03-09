###################################################
# variables globales
###################################################

set ruta_del_programa "/home/josue/Escritorio/programa/"
set ruta_del_proyecto "/home/josue/Escritorio/hola/"
set acelerador "hardware_2"


###################################################
# configuraciones previas
###################################################

set COMMENTED_OUT {
create_project project_1 $env(PWD)/project_1 -part xc7z010clg400-1
set_property board_part digilentinc.com:arty-z7-10:part0:1.0 [current_project]

# cuando le doy a "Create Block Design" estos comandos se ejecutan:
create_bd_design "design_1"
update_compile_order -fileset sources_1
}

# cuando creas un proyecto estos comandos se ejecutan:
start_gui
create_project project_1 $ruta_del_proyecto\project_1 -part xc7z010clg400-1
set_property board_part digilentinc.com:arty-z7-10:part0:1.0 [current_project]

# cuando le doy a "Create Block Design" estos comandos se ejecutan:
create_bd_design "design_1"
update_compile_order -fileset sources_1

# cuando agrego "design sources" para crear el hardware se ejecutan estos comandos:
file mkdir $ruta_del_proyecto\project_1/project_1.srcs/sources_1/new
close [ open $ruta_del_proyecto\project_1/project_1.srcs/sources_1/new/creando_hardware.v w ]
add_files $ruta_del_proyecto\project_1/project_1.srcs/sources_1/new/creando_hardware.v
update_compile_order -fileset sources_1

# editar y guardar el archivo verilog en la siguiente ubicación
# C:\Users\josue\project_1\project_1.srcs\sources_1\new


###################################################
# gestion de archivos
###################################################
# dejamos que el mismo programa cree los archivos verilog. En este paso nos dedicamos a editar el archivo.
# me guie de este tutorial para abrir y copiar archivos
# https://www.youtube.com/watch?v=TUuQkj3uf6A
# ruta: contiene el acelerador que tenemos en la carpeta proyecto
# ruta_hardware: archivo verilog creaado por el proyecto. Debe tener el acelerador

set ruta $ruta_del_programa$acelerador
set ruta_hardware $ruta_del_proyecto\project_1/project_1.srcs/sources_1/new/creando_hardware.v
set f_w [ open $ruta_hardware w ]
set f_r [ open $ruta r ]
while { ! [eof $f_r ] } {
        gets $f_r line
        puts $f_w $line
}
close $f_r
close $f_w


###################################################
# gestion de archivos
###################################################

# después de editar el archivo “creando_hardware.v” ejecutar los siguientes comandos
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1


###################################################
# crear contraints (TCL)
###################################################

file mkdir C:/Users/josue/project_1/project_1.srcs/constrs_1
file mkdir C:/Users/josue/project_1/project_1.srcs/constrs_1/new
close [ open C:/Users/josue/project_1/project_1.srcs/constrs_1/new/archivo_const.xdc w ]
add_files -fileset constrs_1 C:/Users/josue/project_1/project_1.srcs/constrs_1/new/archivo_const.xdc

haciendo diseño (TCL)


###################################################
# preparando HW
###################################################

# crear zynq 7000
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0
endgroup

# run block automation para zynq
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" }  [get_bd_cells processing_system7_0]

# agregando primer AXI GPIO (identificador: “axi_gpio_0”)
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0
endgroup
# agregando segundo AXI GPIO (identidicador: “axi_gpio_1”)
startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1
endgroup

# configurando “axi_gpio_0”: todos los pines como input y cambiando el tamaño del bus a 1 bit
startgroup
set_property -dict [list CONFIG.C_GPIO_WIDTH {1} CONFIG.C_ALL_INPUTS {1}] [get_bd_cells axi_gpio_0]
endgroup

# configurando “axi_gpio_1”: todos los pines como output y cambiando el tamaño del bus a 1 bit
set_property -dict [list CONFIG.C_GPIO_WIDTH {1} CONFIG.C_ALL_OUTPUTS {1}] [get_bd_cells axi_gpio_1]


###################################################
# A partir de aquí se requiere el diseño hecho. “creando_hardware” es el nombre del hardware creado
###################################################

# creando diseño del archivo verilog creado
create_bd_cell -type module -reference creando_hardware creando_hardware_0

# conexiones externas
startgroup
make_bd_pins_external  [get_bd_pins creando_hardware_0/a]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins creando_hardware_0/b]
endgroup
startgroup
make_bd_pins_external  [get_bd_pins axi_gpio_1/gpio_io_o]
endgroup

# conexiones internas (AND con GPIO)
connect_bd_net [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins creando_hardware_0/y]


# cambiando los nombres de los puertos
set_property name sw0 [get_bd_ports a_0]
set_property name sw1 [get_bd_ports b_0]
set_property name LED [get_bd_ports gpio_io_o_0]

# aplicamos run block automation
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_gpio_0/S_AXI} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_gpio_0/S_AXI]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config { Clk_master {Auto} Clk_slave {Auto} Clk_xbar {Auto} Master {/processing_system7_0/M_AXI_GP0} Slave {/axi_gpio_1/S_AXI} ddr_seg {Auto} intc_ip {New AXI Interconnect} master_apm {0}}  [get_bd_intf_pins axi_gpio_1/S_AXI]
endgroup

# validando diseño
validate_bd_design

# ordenando diseño
regenerate_bd_layout

# guardando diseño
save_bd_design

# creando wrapper
make_wrapper -files [get_files C:/Users/josue/project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse c:/Users/josue/project_1/project_1.gen/sources_1/bd/design_1/hdl/design_1_wrapper.v
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1

# generate bitstream
