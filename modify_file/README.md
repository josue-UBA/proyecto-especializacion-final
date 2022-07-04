
# - hola (acomodar)
# - ver procesos ID e hilos

sera importante para validar que al abrir y cerrar un archivo para modificarlo no quede al proceso en ejecucion :D
```bash
# para buscar PID del proceso ejecutar:
ps aux | grep serialService 
# ahora termina el programa dandole la señal:
kill -s SIGINT <pid>
# o ...
kill -s SIGTERM <pid>
# En caso quieras ver cuantos hilos estan ejecutandose al mismo tiempo, ejecutar:
ps -o nlwp <pid>
```