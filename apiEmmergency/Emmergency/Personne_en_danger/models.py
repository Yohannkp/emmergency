from django.db import models
from Personne.models import Personne

class PersonneEnDanger(Personne):
    localisation = models.CharField(max_length=200)

    def __str__(self):
        return f"{self.prenom} {self.nom} est une personne en danger"
