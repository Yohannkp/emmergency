from rest_framework import serializers

from .models import Requete


class RequeteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Requete
        fields = ("id","description","statut","personne_en_danger","hopital")