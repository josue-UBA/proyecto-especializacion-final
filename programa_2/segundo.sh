#!/bin/bash
echo "==============================="
echo "mi programa: Inicio del bash..."
echo "==============================="
# ejecutamos bash de vivado...
source /tools/Xilinx/Vivado/2020.2/settings64.sh
# Vamos a la carpeta vivado para poner todos los archivos del proyecto ahi
cd vivado
# Ejecutar el archivo TCL. Tener en cuenta que estamos considerando que se trata de un proyecto nuevo!
vivado
echo "==============================="
echo "mi programa: Fin. Adios."
echo "==============================="
