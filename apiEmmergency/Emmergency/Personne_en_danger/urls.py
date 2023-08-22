from django.urls import path
from .views import PersonneEnDangerLoginView,PersonneEnDangerRegistrationView

urlpatterns = [
    path("api/PersonneEnDanger/Login/",PersonneEnDangerLoginView),
    path("api/PersonneEnDanger/Registration/",PersonneEnDangerRegistrationView),
]