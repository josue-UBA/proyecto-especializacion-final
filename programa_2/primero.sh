#!/bin/bash
echo "==============================="
echo "mi programa: Inicio del bash..."
echo "==============================="
# ejecutamos bash de vivado...
source /tools/Xilinx/Vivado/2020.2/settings64.sh
# Eliminamos la carpeta vivado. Si no existe la carpeta no hay problema.
rm -r vivado
# Creamos la carperta vivado.
mkdir vivado
# copiamos TCL
# cp ./archivos/project_1_1.tcl ./vivado
# Vamos a la carpeta vivado para poner todos los archivos del proyecto ahi
cd vivado
# Ejecutar el archivo TCL. Tener en cuenta que estamos considerando que se trata de un proyecto nuevo!
vivado -mode batch -source ../archivos/project_1_1.tcl
echo "==============================="
echo "mi programa: Fin. Adios."
echo "==============================="
