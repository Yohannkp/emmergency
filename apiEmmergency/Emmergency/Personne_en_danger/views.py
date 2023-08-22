from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.authtoken.models import Token
from .models import PersonneEnDanger
from .serializer import PersonneEnDangerSerializer
from rest_framework import status
from django.contrib.auth import authenticate
import jwt, datetime



@api_view(['POST'])
def PersonneEnDangerLoginView(request):
        email = request.data.get('email') 
        password = request.data.get('password')
        personne = PersonneEnDanger.objects.filter(email=email).first()
        print(personne)
        

        if personne is None:
            raise AuthenticationFailed('Aucun Utilisateur Trouver')
        
        if not personne.check_password(password):
              raise AuthenticationFailed("Mot de passe Incorrecte")
        
        if personne:
            user = authenticate(email=email, password=password)
            if user:
                payload = {
                    'id': personne.id,
                    'nom':personne.nom,
                    'prenom': personne.prenom,
                    'email':personne.email,
                    'telephone':personne.telephone,
                    'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
                    'iat': datetime.datetime.utcnow()
                }
        
                token = jwt.encode(payload, 'secret', algorithm='HS256')
                response = Response()

                response.set_cookie(key='jwt', value=token, httponly=True)
                response.data = {
                    'jwt': token
                }
                return response
                
        return Response({'error': 'Invalid credentials'}, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['GET'])
def PersonneEnDangerLogOut(request):
        response = Response()
        response.delete_cookie('jwt')
        response.data = {
            'message': 'success'
        }
        return response

@api_view(['POST'])
def PersonneEnDangerRegistrationView(request):
        serializer = PersonneEnDangerSerializer(data=request.data)
        username = request.data.get("nom")
        if serializer.is_valid():
            personne = serializer.save()
            
            return Response("Inscription effectuée")
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)