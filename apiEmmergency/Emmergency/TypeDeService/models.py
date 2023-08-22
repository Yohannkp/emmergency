from django.db import models

# Create your models here.
class TypeDeService(models.Model):
    nom = models.CharField(max_length=100)
    description = models.TextField()

    def __str__(self):
        return self.nom