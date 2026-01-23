# 🤝 Guide de Contribution - Emmergency

**Version** : 1.0.0  
**Dernière mise à jour** : 2026-01-23

---

## 📋 Table des Matières

1. [Avant de Commencer](#avant-de-commencer)
2. [Processus de Contribution](#processus-de-contribution)
3. [Standards de Codage](#standards-de-codage)
4. [Commit Messages](#commit-messages)
5. [Pull Requests](#pull-requests)
6. [Tests](#tests)
7. [Documentation](#documentation)
8. [Reporting Bugs](#reporting-bugs)
9. [Feature Requests](#feature-requests)

---

## ✅ Avant de Commencer

### Prérequis
- Compte GitHub
- Git installé et configuré
- Familiarité avec le projet (lire README.md)
- Python 3.8+ et Flutter 3.0.5+ installés

### Fork & Clone

```bash
# 1. Fork le projet sur GitHub
# Cliquez sur "Fork" en haut à droite

# 2. Clone votre fork
git clone https://github.com/YOUR_USERNAME/emmergency.git
cd emmergency

# 3. Ajouter upstream
git remote add upstream https://github.com/Yohannkp/emmergency.git

# 4. Vérifier les remotes
git remote -v
# origin (your fork)
# upstream (main repo)
```

---

## 🔄 Processus de Contribution

### Étape 1: Créer une Branche

```bash
# Mettre à jour master
git checkout main
git pull upstream main

# Créer une branche feature
git checkout -b feature/votre-feature-nom

# Ou pour un bugfix
git checkout -b bugfix/votre-bug-nom

# Ou pour de la documentation
git checkout -b docs/votre-doc-nom
```

### Étape 2: Faire vos Modifications

```bash
# Backend
cd apiEmmergency/Emmergency
python manage.py test  # Tester avant de committer

# Frontend
cd emmergencymobile   # ou emmergencydesktop
flutter test         # Tester avant de committer
```

### Étape 3: Committer vos Changements

```bash
# Vérifier les changements
git status

# Staged les fichiers
git add .

# Committer avec message descriptif
git commit -m "feat: Add SOS button timeout feature"
```

### Étape 4: Pousser vers votre Fork

```bash
# Pousser la branche
git push origin feature/votre-feature-nom
```

### Étape 5: Créer une Pull Request

1. Allez sur GitHub
2. Cliquez sur "Compare & pull request"
3. Remplissez le template PR (voir [Pull Requests](#pull-requests))
4. Cliquez sur "Create Pull Request"

### Étape 6: Attendre la Review

- Les mainteneurs vont réviser votre code
- Soyez réactif aux commentaires
- Mettez à jour votre PR si des changements sont demandés

```bash
# Si besoin de modifications
git add .
git commit -m "style: Fix lint issues"
git push origin feature/votre-feature-nom
# La PR se mettra à jour automatiquement
```

---

## 📝 Standards de Codage

### Python (Backend)

#### Style
- Suivre PEP 8
- Max 79 caractères par ligne
- 4 espaces pour l'indentation

```python
# ✅ BON
class PersonneEnDanger(Personne):
    """Modèle pour une personne en danger."""
    
    localisation = models.CharField(max_length=200)
    
    def __str__(self):
        """Retourner une représentation lisible."""
        return f"{self.prenom} {self.nom}"


# ❌ MAUVAIS
class PersonneEnDanger(Personne):
    localisation = models.CharField(max_length=200)
    def __str__(self): return f"{self.prenom} {self.nom}"
```

#### Conventions de Nommage
```python
# Variables: snake_case
user_name = "John"

# Classes: PascalCase
class PersonneEnDanger:
    pass

# Constants: UPPER_SNAKE_CASE
MAX_RETRIES = 3

# Private methods: _leading_underscore
def _validate_email(self):
    pass
```

#### Docstrings
```python
def create_emergency_request(user_id, location):
    """
    Créer une requête d'urgence.
    
    Args:
        user_id (int): ID de la personne en danger
        location (str): Localisation GPS (lat,lon)
    
    Returns:
        dict: Requête créée avec statut et ID
    
    Raises:
        ValueError: Si localisation est invalide
    """
    pass
```

### Dart/Flutter (Frontend)

#### Style
- Suivre Effective Dart
- Max 80 caractères par ligne
- 2 espaces pour l'indentation

```dart
// ✅ BON
class SOSButton extends StatelessWidget {
  const SOSButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _handleSOS,
      child: const Icon(Icons.phone),
    );
  }

  void _handleSOS() {
    // Handle emergency
  }
}


// ❌ MAUVAIS
class SOSButton extends StatelessWidget{
const SOSButton({Key? key}) : super(key: key);
Widget build(BuildContext context){
return FloatingActionButton(onPressed: _handleSOS, child: const Icon(Icons.phone));
}}
```

#### Conventions de Nommage
```dart
// Variables: camelCase
String userName = "John";

// Classes: PascalCase
class EmergencyButton {}

// Constants: lowerCamelCase
const maxRetries = 3;

// Private methods: _leadingUnderscore
void _validateInput() {}
```

---

## 📌 Commit Messages

### Format Conventionnel

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types
- **feat**: Nouvelle fonctionnalité
- **fix**: Correction de bug
- **docs**: Documentation
- **style**: Formatage, pas de changement logique
- **refactor**: Refactorisation du code
- **perf**: Optimisation performance
- **test**: Ajout/modification de tests
- **chore**: Outils, dépendances, etc.

### Exemples

```bash
# ✅ BON
git commit -m "feat(mobile): Add GPS location tracking to SOS button"

git commit -m "fix(api): Resolve database connection timeout issue

- Increased connection pool size from 10 to 50
- Added connection retry logic
- Updated documentation"

git commit -m "docs(readme): Update installation instructions"

git commit -m "refactor(backend): Extract hospital validation logic into service"

git commit -m "test(api): Add unit tests for emergency request creation"


# ❌ MAUVAIS
git commit -m "fixed stuff"
git commit -m "WIP"
git commit -m "asdf"
git commit -m "changes"
```

---

## 🔀 Pull Requests

### Template de PR

```markdown
## Description
Décrivez vos changements en détail.

## Type de Changement
- [ ] Bug fix
- [ ] Nouvelle fonctionnalité
- [ ] Breaking change
- [ ] Documentation

## Comment ça a été testé?
Décrivez les tests effectués.

## Checklist
- [ ] Mes changements ne créent pas de warnings
- [ ] J'ai ajouté des tests couvrant mes changements
- [ ] J'ai mis à jour la documentation
- [ ] Les tests passent localement
- [ ] Je n'ai pas créé de problèmes de lint

## Screenshots (si applicable)
Ajoutez des captures d'écran pour les changements UI.

## Notes supplémentaires
Contexte additionnel si nécessaire.
```

### Directives PR

1. **Une fonctionnalité par PR** - Ne pas mélanger plusieurs features
2. **Branche à jour** - Mergez les changements upstream avant la PR
3. **Messages clairs** - Titre descriptif + description détaillée
4. **Tests inclus** - Toute feature doit avoir des tests
5. **Documentation** - Mettez à jour les docs si nécessaire

### Avant de Soumettre

```bash
# Vérifier les changements
git diff origin/main

# S'assurer que vous êtes à jour
git fetch upstream
git rebase upstream/main

# Exécuter les tests locaux
python manage.py test              # Backend
flutter test                       # Frontend

# Vérifier la qualité du code
flake8 .                           # Python
flutter analyze                    # Dart
```

---

## 🧪 Tests

### Backend (Django)

```bash
# Exécuter tous les tests
python manage.py test

# Tests d'une app spécifique
python manage.py test Personne_en_danger

# Avec couverture
pip install coverage
coverage run --source='.' manage.py test
coverage report
coverage html
```

#### Écrire des Tests

```python
from django.test import TestCase
from .models import Requete, PersonneEnDanger

class RequeteTestCase(TestCase):
    def setUp(self):
        """Initialiser les données de test."""
        self.user = PersonneEnDanger.objects.create_user(
            email='test@example.com',
            password='testpass123'
        )
    
    def test_requete_creation(self):
        """Tester la création d'une requête."""
        requete = Requete.objects.create(
            description='Test',
            personne_en_danger=self.user,
            statut='en_attente'
        )
        self.assertEqual(requete.statut, 'en_attente')
    
    def test_invalid_status(self):
        """Tester un statut invalide."""
        with self.assertRaises(ValueError):
            Requete.objects.create(
                description='Test',
                personne_en_danger=self.user,
                statut='invalid_status'
            )
```

### Frontend (Flutter)

```bash
# Exécuter tous les tests
flutter test

# Tests d'un fichier spécifique
flutter test test/models/requete_test.dart

# Avec couverture
flutter test --coverage
```

#### Écrire des Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:emergency/models/requete.dart';

void main() {
  group('Requete Model', () {
    test('creation with valid data', () {
      final requete = Requete(
        id: 1,
        description: 'Emergency',
        statut: 'en_attente',
      );
      expect(requete.id, equals(1));
      expect(requete.statut, equals('en_attente'));
    });

    test('validates description not empty', () {
      expect(
        () => Requete(
          id: 1,
          description: '',
          statut: 'en_attente',
        ),
        throwsAssertionError,
      );
    });
  });
}
```

---

## 📚 Documentation

### Ajouter de la Documentation

1. **Code Comments** - Pour logique complexe
2. **Docstrings** - Pour fonctions/classes
3. **README** - Pour instructions générales
4. **ARCHITECTURE.md** - Pour design decisions
5. **API Docs** - Pour endpoints

### Quand Mettre à Jour la Doc

- ✅ Ajouter une nouvelle fonctionnalité
- ✅ Modifier un endpoint API
- ✅ Changer l'architecture
- ✅ Ajouter une dépendance
- ❌ Correction simple de typo (peut être dans la PR)

---

## 🐛 Reporting Bugs

### Avant de Reporter

```bash
# Vérifier si le bug existe déjà
1. Aller sur GitHub Issues
2. Chercher avec mots-clés
3. Chercher dans les issues fermées
```

### Créer un Bug Report

```markdown
## Description
Brève description du bug.

## Reproduction
Étapes pour reproduire:
1. ...
2. ...
3. ...

## Comportement Attendu
Ce qui devrait se passer.

## Comportement Actuel
Ce qui se passe réellement.

## Screenshots
[Si applicable]

## Environnement
- OS: [e.g., Windows 10]
- Flutter version: [e.g., 3.0.5]
- Python version: [e.g., 3.9]
- Django version: [e.g., 4.2.3]

## Logs
[Coller les stack traces]
```

---

## 💡 Feature Requests

### Format

```markdown
## Description
Description de la fonctionnalité demandée.

## Cas d'Usage
Pourquoi cette fonctionnalité est nécessaire?

## Solution Proposée
Comment cette fonctionnalité pourrait fonctionner?

## Alternatives
Y a-t-il d'autres approches?

## Context Supplémentaire
Informations additionnelles.
```

---

## 🎓 Ressources Utiles

### Documentation
- [Git Guide](https://git-scm.com/doc)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [PEP 8 Style Guide](https://www.python.org/dev/peps/pep-0008/)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

### Outils
```bash
# Python
pip install flake8          # Linter Python
pip install black           # Formatter Python
pip install pylint          # Code analysis

# Flutter
flutter pub global activate effective_dart_analyzer
```

---

## 🏆 Merci de Contribuer!

Votre contribution aide à améliorer Emmergency pour tous. Nous apprécions:

- 🐛 Les rapports de bugs détaillés
- ✨ Les suggestions de fonctionnalités
- 📝 Les améliorations de documentation
- 💻 Le code de qualité
- 🧪 Les tests exhaustifs
- 🤝 La patience et la courtoisie

### Code de Conduite

Soyez respectueux. Acceptez les critiques constructives. Aidez les autres contributeurs.

---

## ❓ Questions?

- 📧 Ouvrez une discussion: [GitHub Discussions](https://github.com/Yohannkp/emmergency/discussions)
- 🐛 Signalez un bug: [GitHub Issues](https://github.com/Yohannkp/emmergency/issues)
- 💬 Rejoignez le chat: [Discord/Slack - À venir]

---

**Merci pour votre intérêt pour Emmergency! 🚨**
