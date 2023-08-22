from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


from django.contrib.auth.models import AbstractUser

class Personne(AbstractUser):
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    email = models.EmailField(max_length=254, unique=True)
    password = models.CharField(max_length=128)
    telephone = models.CharField(max_length=15)
    username = models.CharField(max_length=100)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def __str__(self):
        return f"{self.prenom} {self.nom}"
