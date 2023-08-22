from django.db import models

# Create your models here.
from Personne_en_danger.models import PersonneEnDanger
from Hopitaux.models import Hopitaux

class Requete(models.Model):
    description = models.TextField()
    statut = models.CharField(max_length=20)
    personne_en_danger = models.ForeignKey(PersonneEnDanger, on_delete=models.CASCADE)
    hopital = models.ForeignKey(Hopitaux, on_delete=models.CASCADE,null=True)

    def __str__(self):
        return f"Requête de {self.personne_en_danger.prenom} {self.personne_en_danger.nom} à {self.hopital.nom}"
