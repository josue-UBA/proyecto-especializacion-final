ns impl_1 -to_step write_bitstream -jobs 2

# __exportando hardware__
write_hw_platform -fixed -include_bit -force -file C:/Users/josue/project_1/design_1_wrapper.xsa
como deberia quedar el diseño



# __tutoriales__
## __PS + PL super básico (no oficial)__
link: https://www.youtube.com/watch?v=_odNhKOZjEo
      
### __comandos iniciales (TCL)__
```
# cuando creas un proyecto estos comandos se ejecutan:
start_gui
create_project project_1 C:/Users/josue/project_1 -part xc7z010clg400-1
set_property board_part digilentinc.com:arty-z7-10:part0:1.0 [current_project]

# cuando le doy a "Create Block Design" estos comandos se ejecutan:
create_bd_design "design_1"
update_compile_order -fileset sources_1

# cuando agrego "design sources" para crear el hardware se ejecutan estos comandos:
file mkdir C:/Users/josue/project_1/project_1.srcs/sources_1/new
close [ open C:/Users/josue/project_1/project_1.srcs/sources_1/new/creando_hardware.v w ]
add_files C:/Users/josue/project_1/project_1.srcs/sources_1/new/creando_hardware.v
update_compile_order -fileset sources_1

# editar y guardar el archivo verilog en la siguiente ubicación
# C:\Users\josue\project_1\project_1.srcs\sources_1\new

```

### __edición del PL (edit file)__
```
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.01.2022 13:58:18
// Design Name: 
// Module Name: creando_hardware
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module creando_hardware(
	input a,b,
	output y
	);
	assign y = a & b;
endmodule

```


### __actualización del archivo verilog (TCL)__
```
# después de editar el archivo “creando_hardware.v” ejecutar los siguientes comandos
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1
```
### __crear contraints (TCL)__
```
file mkdir C:/Users/josue/project_1/project_1.srcs/constrs_1
file mkdir C:/Users/josue/project_1/project_1.srcs/constrs_1/new
close [ open C:/Users/josue/project_1/project_1.srcs/constrs_1/new/archivo_const.xdc w ]
add_files -fileset constrs_1 C:/Users/josue/project_1/project_1.srcs/constrs_1/new/archivo_const.xdc
```
### __edición de constraint (edit file)__

Copiar https://raw.githubusercontent.com/Digilent/digilent-xdc/master/Arty-Z7-10-Master.xdc en el archivo 
```
C:/Users/josue/project_1/project_1.srcs/constrs_1/new/archivo_const.xdc y editar lo siguiente:

de…
## Switches
#set_property -dict { PACKAGE_PIN M20  IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; #IO_L7N_T1_AD2N_35 Sch=SW0
#set_property -dict { PACKAGE_PIN M19  IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; #IO_L7P_T1_AD2P_35 Sch=SW1

a
## Switches
#set_property -dict { PACKAGE_PIN M20  IOSTANDARD LVCMOS33 } [get_ports { sw0 }]; #IO_L7N_T1_AD2N_35 Sch=SW0
#set_property -dict { PACKAGE_PIN M19  IOSTANDARD LVCMOS33 } [get_ports { sw1 }]; #IO_L7P_T1_AD2P_35 Sch=SW1

y de…
## RGB LEDs
#set_property -dict { PACKAGE_PIN L15    IOSTANDARD LVCMOS33 } [get_ports { led4_b }]; #IO_L22N_T3_AD7P_35 Sch=LED4_B

a…
## RGB LEDs
#set_property -dict { PACKAGE_PIN L15    IOSTANDARD LVCMOS33 } [get_ports { LED }]; #IO_L22N_T3_AD7P_35 Sch=LED4_B
```
### __haciendo diseño (TCL)__
```
########################################################## 
# preparando HW
##########################################################

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

########################################################## 
# A partir de aquí se requiere el diseño hecho. “creando_hardware” es el nombre del hardware creado
########################################################## 

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
```
### __funciones__
```
XGpio input, output;
int a;
XGpio_Initialize(&input, XPAR_AXI_GPIO_0_DEVICE_ID);
XGpio_Initialize(&output, XPAR_AXI_GPIO_1_DEVICE_ID);

XGpio_SetDataDirection(&input, 1, 1);
XGpio_SetDataDirection(&output, 1, 0);

while (1) {
a = XGpio_DiscreteRead(&input, 1);
	if (a == 1) {
		y = 0;
	} else {
		y = 1;
	}
	XGpio_DiscreteWrite(&output, 1, y);
}
```

# asd
https://www.avnet.com/wps/wcm/connect/onesite/557e3453-20d7-4737-b2a8-8afc404dc81e/designing_a_custom_axi_slave_rev1.pdf?MOD=AJPERES&CVID=nxFlYvm&CVID=nxFlYvm&CVID=nxFlYvm&CVID=nxFlYvm

# intento de conexion mediante axi lite 4
- crear proyecto
- crear bloque diseño