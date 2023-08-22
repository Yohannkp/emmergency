from django.db import models
from Service.models import Service
# Create your models here.


class Hopitaux(Service):
    horaire = models.TextField()

    def __str__(self):
        return f"{self.nom} (Hôpital)"
