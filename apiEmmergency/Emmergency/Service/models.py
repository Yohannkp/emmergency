from django.db import models

# Create your models here.


class Service(models.Model):
    nom = models.CharField(max_length=100)
    localisation = models.CharField(max_length=200)

    def __str__(self):
        return self.nom
