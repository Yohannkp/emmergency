# 🚀 Guide de Démarrage Rapide - Emmergency

**Durée estimée** : 15-20 minutes pour une première exécution

---

## ⚡ TL;DR (Trop Long; Pas Lu)

```bash
# Backend
cd apiEmmergency/Emmergency
python -m venv venv && source venv/bin/activate
pip install django==4.2.3 djangorestframework pymysql django-cors-headers
python manage.py runserver

# Frontend Mobile
cd emmergencymobile
flutter pub get && flutter run

# Frontend Desktop
cd emmergencydesktop
flutter pub get && flutter run
```

---

## 📋 Prérequis Obligatoires

### Système
```bash
# Vérifier les versions requises
python --version          # >= 3.8
flutter --version         # >= 3.0.5
git --version            # Toute version récente
mysql --version          # >= 5.7
```

### Installation des Prérequis

#### Sur Ubuntu/Debian
```bash
# Python et pip
sudo apt-get update
sudo apt-get install python3 python3-pip python3-venv

# MySQL
sudo apt-get install mysql-server mysql-client

# Flutter (voir https://flutter.dev/docs/get-started/install/linux)
# Git
sudo apt-get install git
```

#### Sur macOS
```bash
# Avec Homebrew
brew install python mysql git

# Flutter
# Télécharger depuis https://flutter.dev/docs/get-started/install/macos
```

#### Sur Windows
```powershell
# Avec Chocolatey
choco install python mysql git

# Flutter
# Télécharger depuis https://flutter.dev/docs/get-started/install/windows
```

---

## 🔧 Configuration Backend (Django API)

### Étape 1️⃣ : Cloner et Préparer

```bash
# Cloner le projet
git clone https://github.com/Yohannkp/emmergency.git
cd emmergency/apiEmmergency/Emmergency

# Créer environnement virtuel
python -m venv venv

# Activer l'environnement
# Linux/macOS:
source venv/bin/activate
# Windows:
venv\Scripts\activate
```

### Étape 2️⃣ : Installer les Dépendances

```bash
# Mettre à jour pip
pip install --upgrade pip

# Installer packages
pip install django==4.2.3
pip install djangorestframework
pip install pymysql
pip install django-cors-headers
```

**Optionnel** : Créer `requirements.txt`
```bash
pip freeze > requirements.txt

# Pour installer depuis requirements.txt:
pip install -r requirements.txt
```

### Étape 3️⃣ : Configurer la Base de Données

#### A. Créer la Base MySQL

```sql
-- Se connecter à MySQL
mysql -u root -p

-- Créer la base
CREATE DATABASE emergency CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Créer un utilisateur (optionnel mais recommandé)
CREATE USER 'emergency_user'@'localhost' IDENTIFIED BY 'strong_password_123';
GRANT ALL PRIVILEGES ON emergency.* TO 'emergency_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

#### B. Configurer Django

Éditer `Emmergency/settings.py` :

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'emergency',
        'USER': 'root',              # ou 'emergency_user'
        'PASSWORD': '',              # ou 'strong_password_123'
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}
```

### Étape 4️⃣ : Exécuter les Migrations

```bash
# Créer les migrations
python manage.py makemigrations

# Appliquer les migrations
python manage.py migrate

# Créer un superutilisateur (optionnel)
python manage.py createsuperuser
# Email: admin@example.com
# Password: admin123456
```

### Étape 5️⃣ : Démarrer le Serveur

```bash
# Lancer le serveur de développement
python manage.py runserver

# Accès:
# API: http://localhost:8000
# Admin: http://localhost:8000/admin
```

✅ **Le backend est prêt !**

---

## 📱 Configuration Frontend Mobile (Flutter)

### Étape 1️⃣ : Préparer Flutter

```bash
# Vérifier l'installation
flutter doctor

# Résoudre les problèmes (si nécessaire)
flutter doctor --android-licenses
```

### Étape 2️⃣ : Installer l'App Mobile

```bash
# Aller dans le répertoire
cd emmergency/emmergencymobile

# Obtenir les dépendances
flutter pub get

# Lancer l'app
flutter run
```

### Étape 3️⃣ : Configurer l'API Backend

Éditer `lib/Service/` pour pointer vers votre API :

```dart
// Dans votre service API
const String API_BASE_URL = 'http://10.0.2.2:8000';  // Emulateur Android
// const String API_BASE_URL = 'http://localhost:8000'; // iOS physical device
```

### Étape 4️⃣ : Tester l'App

```bash
# Lancer l'app sur émulateur
flutter run

# Ou sur appareil physique
flutter devices                    # Voir appareils connectés
flutter run -d <device_id>        # Spécifier l'appareil
```

✅ **L'app mobile est prête !**

---

## 💻 Configuration Frontend Desktop (Flutter)

### Étape 1️⃣ : Préparer Desktop

```bash
# Vérifier support desktop
flutter config --enable-windows-desktop
# ou
flutter config --enable-macos-desktop
# ou
flutter config --enable-linux-desktop
```

### Étape 2️⃣ : Installer l'App Desktop

```bash
# Aller dans le répertoire
cd emmergency/emmergencydesktop

# Obtenir les dépendances
flutter pub get

# Lancer l'app
flutter run -d windows    # Windows
# ou
flutter run -d macos      # macOS
# ou
flutter run -d linux      # Linux
```

### Étape 3️⃣ : Tester l'App

```bash
# L'app desktop devrait se lancer dans une fenêtre native
```

✅ **L'app desktop est prête !**

---

## ✅ Checklist de Vérification

### Backend ✓
- [ ] MySQL en cours d'exécution
- [ ] `python manage.py migrate` exécuté sans erreur
- [ ] `http://localhost:8000` accessible
- [ ] `/admin/` fonctionne
- [ ] API endpoints répondent

### Mobile ✓
- [ ] `flutter pub get` terminé
- [ ] API base URL pointant sur le backend
- [ ] `flutter run` exécuté
- [ ] App s'ouvre sur émulateur/appareil
- [ ] Bouton SOS visible

### Desktop ✓
- [ ] `flutter pub get` terminé
- [ ] `flutter run` exécuté
- [ ] App s'ouvre dans fenêtre desktop
- [ ] Écran principal affiche tableau de bord

---

## 🧪 Test d'une Requête d'Urgence (E2E)

### 1. Depuis l'App Mobile

```bash
# Dans l'app mobile:
1. Tap sur le bouton SOS
2. Confirmer l'envoi
3. Observer la notification
```

### 2. Depuis le Terminal (cURL)

```bash
# Créer une personne en danger
curl -X POST http://localhost:8000/api/PersonneEnDanger/Registration/ \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "test123456",
    "nom": "Test",
    "prenom": "User",
    "telephone": "+33612345678"
  }'

# Réponse: Recevez un token

# Envoyer une requête d'urgence
curl -X POST http://localhost:8000/api/EnvoiDétresse/ \
  -H "Authorization: Token YOUR_TOKEN_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "description": "Test urgence",
    "localisation": "48.8566,2.3522",
    "personne_en_danger": 1
  }'
```

### 3. Vérifier sur le Desktop

```bash
# L'app desktop devrait afficher la nouvelle requête
# en temps réel
```

---

## 🐛 Dépannage Courant

### Backend

#### Erreur: "ModuleNotFoundError: No module named 'django'"
```bash
# Solution: Installer django
pip install django==4.2.3

# Ou vérifier que l'environnement virtuel est activé
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate     # Windows
```

#### Erreur: "Can't connect to MySQL"
```bash
# Solution 1: Démarrer MySQL
sudo service mysql start        # Linux
brew services start mysql       # macOS
# Windows: Services → MySQL

# Solution 2: Vérifier les credentials dans settings.py
```

#### Erreur: "No such table: ..."
```bash
# Solution: Exécuter les migrations
python manage.py migrate
```

### Mobile/Desktop

#### Erreur: "Could not resolve host"
```bash
# Solution: Vérifier que le backend est en cours d'exécution
python manage.py runserver

# Vérifier l'IP correcte dans le service API
```

#### Erreur: "Could not connect to Docker daemon"
```bash
# Si vous utilisez Docker, assurez-vous qu'il est lancé
docker start

# Sinon, ignorez ce message
```

---

## 📚 Ressources Supplémentaires

### Documentation Officielle
- [Django Documentation](https://docs.djangoproject.com/)
- [Django REST Framework](https://www.django-rest-framework.org/)
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)

### Commandes Utiles

```bash
# Django
python manage.py help                          # Aide générale
python manage.py shell                         # Python interactif
python manage.py test                          # Exécuter tests
python manage.py createsuperuser              # Admin user

# Flutter
flutter doctor                                 # Diagnostic complet
flutter devices                               # Appareils disponibles
flutter clean                                 # Nettoyer cache
flutter pub outdated                          # Packages obsolètes
```

---

## 🎯 Prochaines Étapes

Après avoir configuré avec succès:

1. **Explorer le code** - Lisez `ANALYSIS.md`
2. **Modifier le frontend** - Customisez les couleurs, logos
3. **Ajouter des données** - Créez des hôpitaux via l'admin
4. **Implémenter des tests** - Ajoutez la couverture de test
5. **Déployer** - Préparez pour production

---

## 💬 Support

- 📧 Issues: [GitHub Issues](https://github.com/Yohannkp/emmergency/issues)
- 📖 Wiki: [GitHub Wiki](https://github.com/Yohannkp/emmergency/wiki)
- 💬 Discussions: [GitHub Discussions](https://github.com/Yohannkp/emmergency/discussions)

---

**Bon développement! 🚀**
