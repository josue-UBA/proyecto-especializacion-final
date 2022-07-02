# - Diseño
## -- Organizacion de carpetas
- __vivado__: carpeta que contiene el proyecto oficial
- __vivado2__: aqui se guarda los archivos adicionales
- __archivos__: adicionales
- __primero.sh__: ejecutar este bash y se correra todo desde la terminal
- __segundo.sh__: abre la GUI para que trabajes desde ahi.

ir al archivo __archivos/project_1.tcl__ y cambiar

```
set origin_dir "*"
```
por
```
set origin_dir "/home/josue/Documentos/GitHub/proyecto-especializacion-final/programa_2/vivado2"
```
# - Despliegue
ejecutar estos comandos para que se genere el hardware:
```bash
cd (ruta del repo)/programa_2
./primero.sh
```
en caso quiera usar la GUI, ejecutar los siguientes comandos:
```bash
cd (ruta del repo)/programa_2
./segundo.sh
```
