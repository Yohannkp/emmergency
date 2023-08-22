# Create your views here.
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.authtoken.models import Token
from .models import Requete
from .serializer import RequeteSerializer
from rest_framework import status
from django.contrib.auth import authenticate
import jwt, datetime



@api_view(['POST'])
def RequetePersonneEnDanger(request):
        serializer = RequeteSerializer(data=request.data)
        if serializer.is_valid():
            requete = serializer.save()
            
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



@api_view(['POST'])
def ReponseHopitale(request,pk):
    requete = Requete.objects.get(id=pk)

    if requete.hopital == None:
        serializer = RequeteSerializer(instance=requete,data=request.data)
        if serializer.is_valid():
            serializer.save()
            print(requete)
            return Response("Votre demande à été acceptée par {}".format(requete))
    else :
        return Response("Un autre centre à déjà accepté la requête")
         

    
    return Response(serializer.data)


@api_view(['GET'])
def requeteEnAttente(request,pk):
    requete = Requete.objects.get(id=pk)
    serialiser = RequeteSerializer(requete)
    return Response(serialiser.data)


@api_view(['GET'])
def ListesRequêtes(request):
    produits = Requete.objects.all()
    serializer = RequeteSerializer(produits,many = True)
    return Response(serializer.data)