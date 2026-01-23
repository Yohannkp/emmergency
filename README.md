# 🚨 Emmergency - Plateforme d'Urgence Intégrée

> Une solution complète et multi-plateforme pour la gestion des situations critiques et les services d'urgence

---

## 📋 Vue d'ensemble

**Emmergency** est une plateforme intégrée conçue pour améliorer significativement la réponse aux situations critiques et d'urgence. L'application combine une **API backend robuste** avec des **interfaces utilisateur modernes et responsives** pour les appareils mobiles et de bureau.

Le système permet aux personnes en danger de signaler rapidement leur situation aux services d'urgence les plus proches, facilitant une intervention rapide et coordonnée.

---

## 🎯 Fonctionnalités principales

### Pour les Personnes en Danger
- 🆘 **Signalement d'Urgence** : Envoyez instantanément une demande de secours avec votre localisation
- 📍 **Géolocalisation Intégrée** : Partage automatique de votre position aux hôpitaux
- 📱 **Interface Mobile Intuitive** : Design optimisé pour une utilisation d'urgence
- 🔔 **Notifications en Temps Réel** : Suivi en direct de l'état de votre requête
- ⏱️ **Minuteur de Décompte** : Visualisation du temps d'attente estimé

### Pour les Services Hospitaliers
- 📊 **Tableau de Bord Desktop** : Gestion centralisée des demandes d'urgence
- ✅ **Système de Confirmation** : Acceptation/Refus des requêtes d'urgence
- 📈 **Historique des Requêtes** : Suivi complet de toutes les interventions
- 🏥 **Informations Hospitalières** : Horaires et détails des services disponibles

### Fonctionnalités Communes
- 👤 **Authentification Sécurisée** : Système de login/registration pour tous les utilisateurs
- 📞 **Répertoire d'Urgence** : Accès aux numéros de secours locaux
- 🤖 **Chatbot Intelligent** : Assistance et conseils de premiers secours
- 🔐 **Authentification par Token** : Protection des données via tokens JWT

---

## 🏗️ Architecture du Projet

\`\`\`
emmergency/
├── apiEmmergency/                    # API Backend Django
│   └── Emmergency/
│       ├── Personne/                 # Modèle utilisateur de base
│       ├── Personne_en_danger/       # Personnes signalant une urgence
│       ├── Hopitaux/                 # Gestion des hôpitaux
│       ├── Employé/                  # Personnel hospitalier
│       ├── Requêtes/                 # Gestion des demandes d'urgence
│       ├── TypeDeService/            # Classification des services
│       └── Service/                  # Modèle de service générique
├── emmergencymobile/                 # Application Flutter Mobile
│   └── lib/
│       ├── Page/                     # Pages de l'application
│       ├── Models/                   # Modèles de données
│       ├── Service/                  # Services API
│       └── Assets/                   # Images et ressources
└── emmergencydesktop/                # Application Flutter Desktop
    └── lib/
        ├── HomePage/                 # Interface principale
        ├── HopitauxService/          # Gestion des hôpitaux
        ├── Models/                   # Modèles de données
        └── Asset/                    # Ressources
\`\`\`

---

## 🔧 Stack Technologique

### Backend
| Technologie | Version | Usage |
|-------------|---------|-------|
| **Django** | 4.2.3 | Framework backend principal |
| **Django REST Framework** | - | Création d'API RESTful |
| **MySQL** | 5.7+ | Base de données relationnelle |
| **Python** | 3.8+ | Langage de programmation |
| **CORS Headers** | - | Gestion des requêtes cross-origin |

### Frontend
| Technologie | Version | Usage |
|-------------|---------|-------|
| **Flutter** | 3.0.5+ | Framework multi-plateforme |
| **Dart** | 3.0.5+ | Langage de programmation |
| **HTTP** | 1.1.0 | Communication API |
| **Awesome Notifications** | 0.7.4+ | Notifications push (Mobile) |
| **Window Manager** | 0.3.5+ | Gestion de fenêtres (Desktop) |

---

## 📊 Modèles de Données

### Personne (Utilisateur)
\`\`\`
- nom, prenom
- email (unique)
- telephone
- password
- timestamp (créé à)
\`\`\`

### Personne en Danger
\`\`\`
- Héritage: Personne
- localisation
\`\`\`

### Hôpitaux
\`\`\`
- Héritage: Service
- horaire
- types de services disponibles
\`\`\`

### Requête (Demande d'Urgence)
\`\`\`
- description
- statut (en attente, acceptée, rejetée)
- personne_en_danger (FK)
- hopital (FK)
- timestamp
\`\`\`

---

## 🚀 Installation et Démarrage

### Prérequis
- **Python 3.8+**
- **MySQL 5.7+**
- **Flutter 3.0.5+**
- **Git**

### 1️⃣ Configuration du Backend (API Django)

\`\`\`bash
# Cloner le dépôt
git clone https://github.com/Yohannkp/emmergency.git
cd emmergency/apiEmmergency/Emmergency

# Créer un environnement virtuel Python
python -m venv venv
source venv/bin/activate  # Sur Windows: venv\Scripts\activate

# Installer les dépendances
pip install django==4.2.3 djangorestframework pymysql django-cors-headers

# Configurer la base de données MySQL
# Modifier les paramètres dans Emmergency/settings.py:
# - NAME: 'emergency'
# - USER: 'root'
# - PASSWORD: 'votre_mot_de_passe'
# - HOST: '127.0.0.1'

# Exécuter les migrations
python manage.py makemigrations
python manage.py migrate

# Créer un superutilisateur (optionnel)
python manage.py createsuperuser

# Démarrer le serveur
python manage.py runserver
# L'API sera accessible à http://localhost:8000
\`\`\`

### 2️⃣ Configuration de l'Application Mobile

\`\`\`bash
cd emmergency/emmergencymobile

# Installer les dépendances Flutter
flutter pub get

# Lancer sur un appareil/émulateur
flutter run

# Ou compiler un APK
flutter build apk --release
\`\`\`

### 3️⃣ Configuration de l'Application Desktop

\`\`\`bash
cd emmergency/emmergencydesktop

# Installer les dépendances Flutter
flutter pub get

# Lancer l'application
flutter run -d windows    # Windows
flutter run -d macos      # macOS
flutter run -d linux      # Linux
\`\`\`

---

## 🔌 Endpoints API

### Authentification
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| POST | \`/api/PersonneEnDanger/Registration/\` | Enregistrement d'une personne en danger |
| POST | \`/api/PersonneEnDanger/Login/\` | Connexion d'une personne en danger |

### Gestion des Requêtes
| Méthode | Endpoint | Description |
|---------|----------|-------------|
| POST | \`/api/EnvoiDétresse/\` | Envoyer une demande d'urgence |
| POST | \`/api/ConfirmationHopitale/<id>/\` | Confirmation par un hôpital |
| GET | \`/api/RequeteEnAttente/<id>/\` | Vérifier l'état d'une requête |
| GET | \`/api/ListeRequêtes/\` | Obtenir toutes les requêtes |

---

## 🔐 Sécurité

- ✅ **Authentification Token** : Chaque requête authentifiée est sécurisée par un token
- ✅ **CORS configuré** : Communication sécurisée entre le frontend et l'API
- ✅ **Email unique** : Prévention des doublons d'utilisateurs
- ⚠️ **À améliorer** : 
  - Passer les secrets en variables d'environnement
  - Implémenter HTTPS en production
  - Ajouter une validation SSL/TLS

---

## 📱 Fonctionnalités Détaillées par Platform

### Application Mobile (Flutter)
- ✅ Notifications locales et push
- ✅ Bottom navigation persistante
- ✅ Animations fluides (Lottie)
- ✅ Accès au système de notification du téléphone
- ✅ Partage de localisation en temps réel

### Application Desktop (Flutter)
- ✅ Interface de gestion pour les hôpitaux
- ✅ Gestion des fenêtres personnalisée
- ✅ Tableau de bord centralisé
- ✅ Support multi-écran

---

## 🛠️ Développement

### Structure du Code

**Backend (Django)**
\`\`\`
apiEmmergency/
├── apps/
│   ├── views.py          # Logique métier
│   ├── models.py         # Modèles de données
│   ├── serializers.py    # Sérialisation JSON
│   └── urls.py           # Routage
└── settings.py           # Configuration globale
\`\`\`

**Frontend (Flutter)**
\`\`\`
lib/
├── Page/                 # Écrans (UI)
├── Models/              # Modèles de données locaux
├── Service/             # Appels API
└── main.dart            # Point d'entrée
\`\`\`

### Commandes Utiles

\`\`\`bash
# Backend
python manage.py runserver              # Démarrer l'API
python manage.py makemigrations         # Créer les migrations
python manage.py migrate                # Appliquer les migrations

# Frontend
flutter clean                           # Nettoyer le projet
flutter pub get                         # Installer les packages
flutter run                             # Lancer l'app
\`\`\`

---

## 📈 Améliorations Futures

- [ ] Intégration de Google Maps pour une géolocalisation avancée
- [ ] Système de notification push multi-plateforme
- [ ] Chiffrement de bout en bout des données sensibles
- [ ] Historique et statistiques détaillées
- [ ] Support multi-langues
- [ ] Sauvegardes automatiques
- [ ] Mode hors ligne avec synchronisation
- [ ] Tests unitaires et d'intégration complets
- [ ] Documentation API Swagger/OpenAPI
- [ ] Déploiement sur cloud (AWS, GCP, Azure)

---

## 👥 Contribution

Les contributions sont bienvenues ! Pour contribuer :

1. Fork le projet
2. Créez une branche (\`git checkout -b feature/AmazingFeature\`)
3. Commit vos changements (\`git commit -m 'Add some AmazingFeature'\`)
4. Push vers la branche (\`git push origin feature/AmazingFeature\`)
5. Ouvrez une Pull Request

---

## 📝 Licence

Ce projet est sous licence [MIT](LICENSE).

---

## 📞 Support et Contact

Pour toute question ou problème :
- 📧 Email : support@emmergency.app
- 🐛 Issues : [GitHub Issues](https://github.com/Yohannkp/emmergency/issues)
- 💬 Discussions : [GitHub Discussions](https://github.com/Yohannkp/emmergency/discussions)

---

## 📊 Statistiques du Projet

- **Backend** : 7 applications Django
- **Frontend** : 2 applications Flutter (Mobile + Desktop)
- **Base de données** : MySQL avec 7 modèles principaux
- **API Endpoints** : 5+ endpoints RESTful
- **Plateforme cible** : iOS, Android, Windows, macOS, Linux

---

**Dernière mise à jour** : 2026-01-23 | **Version** : 1.0.0
