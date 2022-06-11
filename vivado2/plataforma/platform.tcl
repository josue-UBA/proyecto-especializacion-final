# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\josue\Documents\GitHub\proyecto-especializacion-final\vivado2\plataforma\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\josue\Documents\GitHub\proyecto-especializacion-final\vivado2\plataforma\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {plataforma}\
-hw {C:\Users\josue\Documents\GitHub\proyecto-especializacion-final\vivado2\proyecto\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {C:/Users/josue/Documents/GitHub/proyecto-especializacion-final/vivado2}

platform write
platform generate -domains 
platform active {plataforma}
platform generate
