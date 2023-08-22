from django.db import models
from Personne.models import Personne
from TypeDeService.models import TypeDeService
from Hopitaux.models import Hopitaux
# Create your models here.
class Employé(Personne):
    carteIdentite = models.CharField(max_length=20)
    addresse = models.CharField(max_length=200)
    typedeservice = models.ForeignKey(TypeDeService, on_delete=models.CASCADE)
    hopitale = models.ForeignKey(Hopitaux,on_delete=models.CASCADE,null= True)
    def __str__(self):
        return f"{self.prenom} {self.nom}"