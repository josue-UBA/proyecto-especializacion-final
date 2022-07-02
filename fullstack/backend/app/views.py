from cgitb import reset
from urllib import response
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import json
import os
import subprocess

# Create your views here.
@csrf_exempt
def home(request):

    if request.method == 'GET':
        response = {
            'info': 'get'
        }

    elif request.method == 'POST':
        # reviso informacion entregada por el cliente...
        asd = json.loads(request.body)
        # en base a ello ejecuto la terminal
        os.chdir("/home/josue/Documentos/GitHub/proyecto-especializacion-final/programa_2")
        os.system('./primero.sh')
        #print(asd["dato"])
        # finalmente respondemos al cliente con la info que necesita
        response = {
            'info': 'post'
        }

    else:
        response = {
            'info': 'otro'
        }

    return JsonResponse(response)