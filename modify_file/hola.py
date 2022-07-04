############################
# importaciones
############################
from cgitb import text
import time

############################
# funciones
############################
'''
devuelve el indice donde se encontro el string buscado. No consiera que se encuentra el string dos veces en la misma oracion.
input:
[] lista: list
return:
[] -1  -> si se encontro el "valor" buscado en mas de una linea o si no se encontro el "valor"
[] num -> el numero de la linea donde se encontro la frase buscada (la primera linea es 0 por si acaso)
'''


def buscar_frase(texto_a_buscar, lista):
    linea = 0
    lista_linea = []
    for i in lista:
        if(i.find(texto_a_buscar) != -1):
            lista_linea.append(linea)
        # si vemos que la lista tiene mas de un elemento, salimos inmediatamente con el codigo de error -1
        if(len(lista_linea) > 1):
            return -1
        linea = linea + 1
    # solo puede haber un elemento en la lista lista_linea, asi que devolvemos siempre el primer elemento
    return lista_linea[0]


'''
agrega un string a una lista segun el indice indicado
input:
[] lista: list
[] texto: str
[] indice: int
return:
[] list
'''


def agregar_texto(lista, texto, indice):
    lista.insert(indice, texto)
    return lista


def fachada(archivo, texto_a_buscar, texto_a_agregar):
    # leer datos del archivo
    file = open(archivo)
    lista = file.readlines()
    # buscar palabra en archivo...
    indice_lista = buscar_frase(texto_a_buscar, lista)
    # si la busqueda es erronea, sal con error
    if indice_lista == -1:
        file.close()
        return("error, revisa nuevamente la palabra buscada")
    # si todo ok, agrega el texto indicado
    else:
        agregar_texto(lista, texto_a_agregar, indice_lista)
    # mostramos la lista modificada
    for i in lista:
        print(i)
    file.close()
    # salimos indicando que todo esta ok
    return("todo ok!")


############################
# main
############################

# print(buscar_frase(lista))
# agregar_texto(lista,"apla",1)


texto_a_buscar = "chau"
texto_a_agregar = "aplaaa\n"
archivo = 'texto1.txt'


print(fachada(archivo, texto_a_buscar, texto_a_agregar))
############################
# testeo
############################
'''
# para determinar si es que algun proceso queda abierto (peligroso ya que puede ocacionar saturacion)
for i in range(20):
    print(i)
    time.sleep(1)
'''
