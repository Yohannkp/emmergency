# 🏗️ Architecture Technique - Emmergency

**Version** : 1.0.0  
**Date** : 2026-01-23  
**Auteur** : Équipe Emmergency

---

## 📑 Table des Matières

1. [Vue d'Ensemble Architecturale](#1-vue-densemble-architecturale)
2. [Composants Systèmes](#2-composants-systèmes)
3. [Flux de Données](#3-flux-de-données)
4. [Communication Inter-Services](#4-communication-inter-services)
5. [Sécurité](#5-sécurité)
6. [Scalabilité](#6-scalabilité)
7. [Déploiement](#7-déploiement)

---

## 1. Vue d'Ensemble Architecturale

### Diagramme Haute Niveau

```
┌────────────────────────────────────────────────────────────┐
│                    CLIENTS (Utilisateurs)                  │
├──────────────────┬──────────────────┬──────────────────────┤
│  App Mobile      │  App Desktop     │  Navigateur (futur)  │
│  (Flutter iOS)   │  (Flutter Win)   │  (Web)               │
│  (Flutter Andr.) │  (Flutter Mac)   │                      │
└──────┬───────────┴──────┬───────────┴──────────┬───────────┘
       │ HTTP/HTTPS       │ HTTP/HTTPS           │
       ├──────────────────┼──────────────────────┤
       │                  ▼                      │
┌──────▼──────────────────────────────────────────────────────┐
│              API Gateway / Load Balancer                     │
│                  (Nginx / AWS ALB)                           │
└──────┬────────────────────────────────────────────────────┬─┘
       │ HTTP/1.1 + WebSocket (futur)                       │
       │                                                     │
┌──────▼─────────────────────────────────────────────────────▼┐
│                   BACKEND TIER                              │
├────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │ Django App  │  │ Django App  │  │ Django App  │ ...   │
│  │ Instance 1  │  │ Instance 2  │  │ Instance N  │        │
│  └────┬────────┘  └────┬────────┘  └────┬────────┘        │
│       │                │                │                  │
│       └────────────────┼────────────────┘                  │
│                        │                                    │
│                   ┌────▼──────┐                             │
│                   │   Celery   │  (Task Queue - Futur)     │
│                   │   Workers  │                             │
│                   └────┬──────┘                             │
│                        │                                    │
│       ┌────────────────┼────────────────┐                  │
│       │                │                │                  │
│   ┌───▼───┐      ┌──────▼────┐   ┌──────▼────┐            │
│   │ Auth  │      │ Emergency │   │  Hospital │            │
│   │ App   │      │ App       │   │ App       │            │
│   └───────┘      └───────────┘   └───────────┘            │
│                                                             │
└─────────────────────┬──────────────────────────────────────┘
                      │ ORM (SQLAlchemy)
                      │
┌─────────────────────▼──────────────────────────────────────┐
│                   DATA TIER                                │
├────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────────┐      ┌──────────────────┐            │
│  │ MySQL (Primary)  │      │  Redis Cache     │            │
│  │ - Personnes      │      │  - Sessions      │            │
│  │ - Requêtes       │      │  - Queues        │            │
│  │ - Hôpitaux       │      │  - Real-time     │            │
│  └──────────────────┘      └──────────────────┘            │
│                                                             │
└────────────────────────────────────────────────────────────┘
```

---

## 2. Composants Systèmes

### 2.1 Frontend - Application Mobile

#### Architecture Interne

```
┌─────────────────────────────────────┐
│        Main App (main.dart)          │
├─────────────────────────────────────┤
│                                     │
│  ┌─────────────────────────────┐   │
│  │   Routing & Navigation      │   │
│  │   - HomePage                │   │
│  │   - SOS Flow                │   │
│  │   - NotificationPage        │   │
│  │   - SettingsPage            │   │
│  └─────────────────────────────┘   │
│              │                      │
│  ┌───────────▼─────────────────┐   │
│  │   Models                    │   │
│  │   - Personne                │   │
│  │   - Requete                 │   │
│  │   - Hopital                 │   │
│  └──────────┬──────────────────┘   │
│             │                      │
│  ┌──────────▼──────────────────┐   │
│  │   Services (API Calls)      │   │
│  │   - AuthService             │   │
│  │   - RequestService          │   │
│  │   - HopitalService          │   │
│  └──────────┬──────────────────┘   │
│             │                      │
│  ┌──────────▼──────────────────┐   │
│  │   Utilities                 │   │
│  │   - Location Manager        │   │
│  │   - Notification Handler    │   │
│  │   - Storage (SharedPrefs)   │   │
│  └─────────────────────────────┘   │
│                                     │
└─────────────────────────────────────┘
```

#### État et Gestion

```
App State
  ├─ AuthState
  │   ├─ isAuthenticated
  │   ├─ user
  │   └─ token
  ├─ EmergencyState
  │   ├─ isSOSActive
  │   ├─ currentRequest
  │   ├─ hospitalAssigned
  │   └─ ETA
  └─ LocationState
      ├─ currentLocation
      ├─ isTracking
      └─ accuracy
```

### 2.2 Frontend - Application Desktop

#### Architecture Interne

```
┌─────────────────────────────────────┐
│      Main App (main.dart)           │
├─────────────────────────────────────┤
│                                     │
│  ┌─────────────────────────────┐   │
│  │   Window Manager            │   │
│  │   - Size & Position         │   │
│  │   - Title Bar               │   │
│  └─────────────────────────────┘   │
│              │                      │
│  ┌───────────▼─────────────────┐   │
│  │   HomePage (Dashboard)      │   │
│  │   - RequestList             │   │
│  │   - Map Integration         │   │
│  │   - HospitalStats           │   │
│  └──────────┬──────────────────┘   │
│             │                      │
│  ┌──────────▼──────────────────┐   │
│  │   Models                    │   │
│  │   - RequestDetail           │   │
│  │   - HospitalInfo            │   │
│  │   - StatsData               │   │
│  └──────────┬──────────────────┘   │
│             │                      │
│  ┌──────────▼──────────────────┐   │
│  │   Services (API Calls)      │   │
│  │   - HospitalService         │   │
│  │   - RequestManagementService│   │
│  │   - StatisticsService       │   │
│  └──────────┬──────────────────┘   │
│             │                      │
│  ┌──────────▼──────────────────┐   │
│  │   Utilities                 │   │
│  │   - DataFormatter           │   │
│  │   - ExportTools             │   │
│  │   - ReportGenerator         │   │
│  └─────────────────────────────┘   │
│                                     │
└─────────────────────────────────────┘
```

### 2.3 Backend - Django API

#### Structure des Applications

```
apiEmmergency/Emmergency/
│
├── Emmergency/ (Config)
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── asgi.py
│
├── Personne/
│   ├── models.py ────────┐
│   ├── views.py          │
│   ├── serializers.py    │
│   ├── urls.py           │
│   ├── admin.py          │
│   └── migrations/       │
│                         │
├── Personne_en_danger/   │ Héritage
│   ├── models.py ────────┤
│   ├── views.py  (Login) │
│   ├── urls.py           │
│   └── migrations/       │
│                         │
├── Hopitaux/             │ Héritage
│   ├── models.py ────────┘
│   ├── views.py
│   ├── migrations/
│   └── urls.py
│
├── Service/
│   ├── models.py (Parent)
│   ├── views.py
│   └── migrations/
│
├── Requêtes/
│   ├── models.py (Requete)
│   ├── views.py
│   ├── serializers.py
│   ├── urls.py
│   └── migrations/
│
├── Employé/
│   ├── models.py
│   └── migrations/
│
└── TypeDeService/
    ├── models.py
    └── migrations/
```

---

## 3. Flux de Données

### 3.1 Flux d'Authentification

```
1. User signs up
   ├─ POST /api/PersonneEnDanger/Registration/
   ├─ Backend validates email uniqueness
   ├─ Create user with hashed password
   └─ Return token + user data

2. User logs in
   ├─ POST /api/PersonneEnDanger/Login/
   ├─ Verify credentials
   ├─ Generate token
   └─ Return token

3. Subsequent requests
   ├─ Include: Authorization: Token abc123...
   ├─ Backend validates token
   └─ Process request
```

### 3.2 Flux d'Urgence (SOS)

```
PERSONNE EN DANGER          BACKEND API         HÔPITAUX
        │                       │                  │
   1. SOS Click─────────────────→                  │
        │                       │                  │
        │     2. Validate ─────→                  │
        │                       │                  │
        │     3. Save ─────────→                  │
        │                       │                  │
        │     4. Find 3 closest─────────────────→ │
        │                       │              Notify
        │                       │              Board
        │                       │                  │
   5. Accept ←─ Return Status ─────── Confirm ─→ │
        │       + Hospital Info                   │
        │                       │                  │
   6. Show Timer              │                  │
   + Hospital Info            │                  │
        │                       │                  │
   7. Update ETA ←──────────────────────────────→ │
   Every 30s                   │    Real-time     │
        │                       │                  │
   8. Arrive                  │                  │
        │     9. Close ─────────→                 │
        │                       │   Mark Done    │
        │                       │←────────────────│
        │                       │                  │
```

### 3.3 Flux de Données Temps Réel

```
Mobile App                  API Middleware           Hospital Dashboard
     │                            │                          │
     │ Poll every 5s              │                          │
     ├──────────────────────────→ │                          │
     │ /RequeteEnAttente/<id>     │                          │
     │                            │                          │
     │ ← Status Update ───────────┤                          │
     │   (JSON Response)          │                          │
     │                            │                          │
     │ Display Update             │                          │
     │                            │ WebSocket (Futur)        │
     │                            ├─────────────────────────→ │
     │                            │ Real-time Notification   │
     │                            │                          │
     │                            │ ← Hospital Accepts ──┐   │
     │                            │                      │   │
     │ ← Status Update ─── From DB ← Hospital Response ──┘   │
     │                            │                          │
```

---

## 4. Communication Inter-Services

### 4.1 API REST Endpoints

```
Base URL: /api/

Authentication Group:
  POST /PersonneEnDanger/Registration/
  POST /PersonneEnDanger/Login/

Request Management Group:
  POST /EnvoiDétresse/              → Create emergency
  POST /ConfirmationHopitale/<id>/  → Hospital accepts/rejects
  GET  /RequeteEnAttente/<id>/      → Check status
  GET  /ListeRequêtes/              → Get all requests

Hospital Group (Futur):
  GET  /Hopitaux/                   → List hospitals
  POST /Hopitaux/<id>/Stats/        → Hospital statistics
  GET  /Hopitaux/<id>/Schedule/     → Operating hours
```

### 4.2 Sérialisation des Données

#### Request (Demande d'Urgence)

```json
{
  "id": 1,
  "description": "Accident de voiture",
  "statut": "en_attente",
  "localisation": "48.8566,2.3522",
  "date_creation": "2026-01-23T14:30:00Z",
  "personne_en_danger": {
    "id": 1,
    "nom": "Dupont",
    "prenom": "Jean",
    "telephone": "+33612345678"
  },
  "hopital": {
    "id": 5,
    "nom": "CHU Necker",
    "telephone": "0140123456",
    "localisation": "48.8530,2.3597",
    "distance_km": 0.45,
    "temps_arrivee_min": 12
  }
}
```

#### Hopital (Hospital)

```json
{
  "id": 5,
  "nom": "CHU Necker",
  "adresse": "149 Rue de Sèvres, Paris",
  "telephone": "0140123456",
  "localisation": {
    "latitude": 48.8530,
    "longitude": 2.3597
  },
  "horaires": {
    "lundi": "08:00-20:00",
    "mardi": "08:00-20:00",
    "mercredi": "08:00-20:00",
    "jeudi": "08:00-20:00",
    "vendredi": "08:00-20:00",
    "samedi": "09:00-18:00",
    "dimanche": "09:00-18:00"
  },
  "services": [
    "Urgences",
    "Traumatologie",
    "Cardiologie",
    "Pédiatrie"
  ]
}
```

---

## 5. Sécurité

### 5.1 Authentification & Autorisation

```
┌─────────────────────────────────────┐
│  Token-Based Authentication         │
├─────────────────────────────────────┤
│                                     │
│ 1. User sends credentials           │
│    └─→ POST /api/Login/             │
│                                     │
│ 2. Backend validates                │
│    ├─ Check email exists            │
│    └─ Hash & compare password       │
│                                     │
│ 3. Generate Token                   │
│    ├─ Algorithm: Token (DRF)        │
│    ├─ Expiry: (configurable)        │
│    └─ Return: JSON + Token          │
│                                     │
│ 4. Client stores token              │
│    └─ SharedPreferences (Mobile)    │
│    └─ LocalStorage (Web-Futur)      │
│                                     │
│ 5. Subsequent requests              │
│    ├─ Include: Authorization header │
│    ├─ Value: "Token <token>"        │
│    └─ Backend validates token       │
│                                     │
└─────────────────────────────────────┘
```

### 5.2 CORS Configuration

**Actuel** (Non Sécurisé)
```python
CORS_ORIGIN_ALLOW_ALL = True  # ❌ DANGER!
```

**Recommandé** (Production)
```python
CORS_ALLOWED_ORIGINS = [
    "https://emmergency.app",
    "https://www.emmergency.app",
    "https://app-mobile.emmergency.app",
]

CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_HEADERS = [
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'x-csrftoken',
    'x-requested-with',
]
```

### 5.3 Sécurité des Données

```
┌─────────────────────────────────────┐
│     Data Security Layers            │
├─────────────────────────────────────┤
│                                     │
│ Layer 1: HTTPS/TLS                 │
│  ├─ Encrypt data in transit        │
│  └─ Certificate: Let's Encrypt     │
│                                     │
│ Layer 2: Database                  │
│  ├─ Password hashing: Django Auth  │
│  ├─ Parameterized queries          │
│  └─ No SQL injection               │
│                                     │
│ Layer 3: Input Validation          │
│  ├─ Client-side: Flutter UI        │
│  └─ Server-side: Django validators │
│                                     │
│ Layer 4: Logging & Monitoring      │
│  ├─ Audit trail                    │
│  ├─ Error logging                  │
│  └─ Suspicious activity alerts     │
│                                     │
└─────────────────────────────────────┘
```

---

## 6. Scalabilité

### 6.1 Horizontal Scaling

```
Current (Single Instance):
┌──────────────────┐
│  Django Server   │
│  Port 8000       │
└──────────────────┘

Scaled (Multiple Instances):
┌──────────────────────────┐
│   Nginx Load Balancer    │
│   (Reverse Proxy)        │
└──────────┬───────────────┘
           │
    ┌──────┼──────┬──────┐
    │      │      │      │
┌───▼──┐┌──▼──┐┌─▼───┐┌─▼───┐
│ App1 ││ App2││ App3││ App4 │
└───┬──┘└──┬──┘└─┬───┘└─┬───┘
    └──────┼─────┼──────┘
           │     │
      ┌────┴─────┴───┐
      │  Django ORM   │
      │  (Pooling)    │
      └────┬──────────┘
           │
      ┌────▼──────────┐
      │  MySQL DB     │
      │  (Primary)    │
      └───────────────┘
```

### 6.2 Database Optimization

```
Optimization Strategies:

1. Indexing
   ├─ Primary Keys: Auto-indexed
   ├─ Foreign Keys: Add indexes
   └─ Search fields: email, telephone

2. Query Optimization
   ├─ N+1 Query Fix: select_related()
   ├─ Caching: Redis
   └─ Pagination: 50 items/page

3. Connection Pooling
   ├─ Max connections: 100
   ├─ Min connections: 10
   └─ Connection timeout: 300s

4. Replication (Futur)
   ├─ Master: Write operations
   ├─ Slave 1: Read operations
   └─ Slave 2: Backup
```

### 6.3 Caching Strategy

```
Cache Layers:

L1: Browser Cache (Mobile/Desktop)
├─ Static assets (CSS, JS, images)
└─ Cache-Control: 3600s

L2: Application Cache (Redis)
├─ Hospital list
├─ User profile
├─ Active requests
└─ TTL: 300-3600s

L3: Database Cache
├─ Query cache
├─ Connection pool
└─ Prepared statements
```

---

## 7. Déploiement

### 7.1 Environment Separation

```
Development (Local)
├─ DEBUG: True
├─ Database: SQLite / Local MySQL
├─ Allowed Hosts: localhost
└─ Logging: Console

Staging (Pre-Production)
├─ DEBUG: False
├─ Database: AWS RDS MySQL
├─ Allowed Hosts: staging.emmergency.app
├─ SSL: Self-signed
└─ Logging: CloudWatch

Production
├─ DEBUG: False
├─ Database: AWS RDS MySQL (Replica)
├─ Allowed Hosts: emmergency.app
├─ SSL: Let's Encrypt
├─ Logging: Sentry + CloudWatch
└─ Monitoring: Datadog / New Relic
```

### 7.2 Deployment Architecture

```
┌─────────────────────────────────────┐
│      CloudFlare CDN                 │
│  (Global Distribution)              │
└────────────┬────────────────────────┘
             │
┌────────────▼────────────────────────┐
│   AWS Application Load Balancer     │
│   (Multi-AZ, Auto-Scaling)          │
└────────────┬────────────────────────┘
             │
┌────────────▼─────────────────────┐
│  ECS Cluster (Docker Containers) │
├────────────┬──────────────────────┤
│ Task 1     │  Task 2     │ Task 3 │
│ (Django)   │  (Django)   │Django) │
└────────────┼──────────────────────┘
             │
    ┌────────┼────────┐
    │        │        │
┌───▼──┐ ┌──▼──┐ ┌──▼───┐
│ RDS  │ │Redis│ │ S3   │
│ Mysql│ │Cache│ │Files │
└──────┘ └─────┘ └──────┘
```

### 7.3 CI/CD Pipeline

```
GitHub Repository
       │
       ├─ On Push to main
       │
    ┌──▼──────────┐
    │ GitHub      │
    │ Actions     │
    └──┬──────────┘
       │
    ┌──▼─────────────────┐
    │ 1. Test            │
    │    - Unit tests    │
    │    - Integration   │
    └──┬─────────────────┘
       │
    ┌──▼─────────────────┐
    │ 2. Build           │
    │    - Docker image  │
    │    - Push to ECR   │
    └──┬─────────────────┘
       │
    ┌──▼─────────────────┐
    │ 3. Deploy Staging  │
    │    - ECS update    │
    │    - Smoke tests   │
    └──┬─────────────────┘
       │
    ┌──▼─────────────────┐
    │ 4. Approval        │
    │    - Manual review │
    └──┬─────────────────┘
       │
    ┌──▼─────────────────┐
    │ 5. Deploy Prod     │
    │    - Blue-Green    │
    │    - Traffic shift │
    └────────────────────┘
```

---

## 📊 Résumé des Composants

| Composant | Technologie | Version | Rôle |
|-----------|---|---|---|
| API | Django | 4.2.3 | Backend logique |
| Framework REST | DRF | Latest | Sérialisation |
| Base de données | MySQL | 5.7+ | Persistance |
| Cache | Redis | 6.0+ | Performance |
| Mobile | Flutter | 3.0.5+ | iOS/Android |
| Desktop | Flutter | 3.0.5+ | Windows/Mac/Linux |
| Frontend Lang | Dart | 3.0.5+ | UI logic |
| Backend Lang | Python | 3.8+ | API logic |
| Proxy | Nginx | 1.20+ | Load balancing |

---

**Document Technique Complété** | v1.0.0 | 2026-01-23
