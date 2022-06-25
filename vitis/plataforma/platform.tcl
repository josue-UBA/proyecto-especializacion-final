# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\josue\Desktop\asd\plataforma\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\josue\Desktop\asd\plataforma\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {plataforma}\
-hw {C:\Users\josue\Desktop\asd\project_1\design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {C:/Users/josue/Desktop/asd}

platform write
platform generate -domains 
platform active {plataforma}
bsp reload
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform active {plataforma}
bsp reload
domain active {zynq_fsbl}
bsp reload
platform active {plataforma}
bsp reload
platform generate
platform active {plataforma}
platform generate -domains 
platform active {plataforma}
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate
bsp reload
platform generate -domains 
platform active {plataforma}
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform active {plataforma}
platform generate -domains 
platform active {plataforma}
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform active {plataforma}
platform generate -domains 
platform active {plataforma}
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform generate
platform active {plataforma}
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform active {plataforma}
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform active {plataforma}
platform config -updatehw {C:/Users/josue/Desktop/asd/project_1/design_1_wrapper.xsa}
platform generate -domains 
platform active {plataforma}
bsp reload
