from django.urls import path
from .views import RequetePersonneEnDanger,ReponseHopitale,requeteEnAttente,ListesRequêtes

urlpatterns = [
    path("api/EnvoiDétresse/",RequetePersonneEnDanger),
    path("api/ConfirmationHopitale/<int:pk>/",ReponseHopitale,name="Confirmation d'une hopitale"),
    path("api/RequeteEnAttente/<int:pk>",requeteEnAttente),
    path("api/ListeRequêtes/",ListesRequêtes),


]