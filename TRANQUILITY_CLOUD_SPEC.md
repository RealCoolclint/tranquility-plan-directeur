# Tranquility Cloud — Document Fondateur
## Architecture de synchronisation de la Tranquility Suite
*Cellule Vidéo L'Étudiant · Rédigé le 28 mars 2026*
*JARVIS + Martin Pavloff*

---

> *Ce document définit l'architecture complète du système de gestion des profils, des réglages et de la synchronisation dans la Tranquility Suite. Il fait référence pour toutes les décisions d'implémentation futures. Toute donnée de profil stockée localement dans une app est une violation de cette spec.*

---

## 1. Principe fondamental

**GitHub est le cloud. Launcher est l'interface. Les apps consomment.**

| Rôle | Qui |
|------|-----|
| Source de vérité absolue | GitHub (`launcher-profiles` repo privé) |
| Interface de configuration | Launcher V2 uniquement |
| Pont local entre Launcher et les apps | `session.json` |
| Consommateurs silencieux | Toutes les apps (BackUpFlow, Transporter, Reviewer…) |

Le modèle de référence est **Adobe Creative Cloud** :
- Creative Cloud = Launcher
- GitHub = les serveurs Adobe
- Premiere, After Effects, etc. = les apps de la Tranquility Suite

**Règle absolue : aucune app ne possède ses propres profils. Jamais.**

---

## 2. Architecture globale

```
┌─────────────────────────────────────────────────────────────┐
│                        GITHUB                               │
│              repo privé : launcher-profiles                 │
│                                                             │
│  profiles.json — tous les profils de l'équipe              │
│  settings.json — réglages globaux de la suite              │
│  api-keys.json — clés API partagées (chiffrées)            │
└──────────────────────────┬──────────────────────────────────┘
                           │ sync bidirectionnelle (chokidar)
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                      LAUNCHER V2                            │
│              Seule interface de configuration               │
│                                                             │
│  • Gestion des profils (créer, modifier, archiver)         │
│  • Réglages de la suite                                     │
│  • Clés API (déchiffrement via Retriever)                  │
│  • Mises à jour des apps                                    │
│  • Sélection du profil actif → écriture session.json       │
└──────────────────────────┬──────────────────────────────────┘
                           │ session.json (local, éphémère)
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                     LES APPS                                │
│       BackUpFlow · Transporter · Reviewer · ARK…           │
│                                                             │
│  • Lisent session.json au démarrage                        │
│  • Appliquent les réglages du profil connecté              │
│  • Écrivent leurs données métier sur GitHub en background  │
│  • Aucune interface de configuration de profil             │
└─────────────────────────────────────────────────────────────┘
```

---

## 3. Ce que GitHub contient

### 3.1 Structure du repo `launcher-profiles`

```
launcher-profiles/
├── profiles.json          — tous les profils de l'équipe
├── settings.json          — réglages globaux de la suite
└── api-keys.encrypted     — clés API chiffrées (jamais en clair sur GitHub)
```

### 3.2 Structure d'un profil dans `profiles.json`

```json
{
  "profiles": [
    {
      "id": "p_1773999409329",
      "firstName": "Martin",
      "lastName": "Pavloff",
      "initiales": "MP",
      "role": "admin",
      "email": "mpavloff@letudiant.fr",
      "avatar": "avatar_13",
      "color": "#2563eb",
      "mondayUserId": "67082975",
      "prefs": {
        "ssdPersoPath": "/Volumes/BACKUP PRO/POLE PAR POLE",
        "ssdStudioPath": "/Volumes/SSD-1",
        "mondayMode": "monday",
        "zipNasEnabled": false,
        "theme": "dark"
      },
      "archived": false,
      "createdAt": "2025-11-01T18:53:56.077Z",
      "updatedAt": "2026-03-28T00:00:00.000Z"
    }
  ]
}
```

**Règle : les clés API ne sont JAMAIS dans `profiles.json`. Elles sont dans un fichier chiffré séparé, déchiffré uniquement par Launcher via le Retriever.**

---

## 4. Ce que `session.json` contient

Fichier local et éphémère, écrit par Launcher au login, supprimé au quit.

```
~/Library/Application Support/tranquility-suite/session.json
```

```json
{
  "version": 2,
  "launcherVersion": "1.0.0",
  "writtenAt": "2026-03-28T14:14:00.000Z",
  "expiresAfterHours": 8,

  "profile": {
    "id": "p_1773999409329",
    "name": "Martin Pavloff",
    "role": "admin",
    "avatar": "assets/avatars/avatar_13.jpeg",
    "email": "mpavloff@letudiant.fr",
    "mondayUserId": "67082975",
    "prefs": {
      "ssdPersoPath": "/Volumes/BACKUP PRO/POLE PAR POLE",
      "ssdStudioPath": "/Volumes/SSD-1",
      "mondayMode": "monday",
      "zipNasEnabled": false,
      "theme": "dark"
    }
  },

  "allProfiles": [
    {
      "id": "p_1773999409329",
      "name": "Martin Pavloff",
      "initiales": "MP",
      "mondayUserId": "67082975",
      "ssdPersoPath": "/Volumes/BACKUP PRO/POLE PAR POLE"
    },
    {
      "id": "17620274114058o6qg2c5n",
      "name": "Antoine Paley",
      "initiales": "AP",
      "mondayUserId": "67085115",
      "ssdPersoPath": "/Users/studiovideo/Downloads/ZONE TEST"
    }
  ],

  "apiKeys": {
    "monday": "eyJhbGci...",
    "resend": "re_abc123...",
    "gofile": "tok_xyz..."
  },

  "retrieverAvailable": true
}
```

### Règles de `session.json`

| Règle | Détail |
|-------|--------|
| **Expiration 8h** | Au-delà de 8h, les apps ignorent la session |
| **Suppression au quit** | Launcher supprime le fichier à la fermeture |
| **Clés en clair** | Déchiffrées par Launcher — les apps lisent directement |
| **Jamais de mot de passe** | Aucune donnée d'authentification |
| **`allProfiles` minimal** | Seulement les champs utiles aux apps (pas les prefs complètes) |

---

## 5. Ce que les apps font

### 5.1 Au démarrage

```
1. Lire session.json
   │
   ├── Absent ou expiré → Modale de connexion (non-dismissable)
   │   └── Bouton "Ouvrir Launcher" → spawn Launcher → poll toutes les 2s
   │
   └── Valide → Écran de confirmation
       ├── "Continuer en tant que [Prénom]" → accès direct
       └── "Changer de profil" → retour modale connexion
```

### 5.2 Pendant l'utilisation

- Les apps lisent les prefs du profil depuis `session.profile.prefs`
- Les apps lisent les chemins de tous les profils depuis `session.allProfiles`
- Les apps utilisent les clés API depuis `session.apiKeys`
- **Les apps n'ont aucune interface de configuration de profil**

### 5.3 Écriture vers GitHub (Phase Gemini)

Les apps écrivent silencieusement vers GitHub uniquement pour leurs **données métier** :
- BackUpFlow → historique de backups
- Transporter → historique d'envois
- Reviewer → commentaires, statuts de review
- ARK → registre d'archivage

**Les apps n'écrivent JAMAIS les profils ni les réglages sur GitHub. C'est réservé à Launcher.**

---

## 6. Ce que Launcher fait

### 6.1 Responsabilités exclusives de Launcher

| Action | Où |
|--------|----|
| Créer / modifier / archiver un profil | Interface Launcher → push GitHub |
| Modifier les clés API | Interface Launcher → chiffrement → push GitHub |
| Modifier les réglages globaux de la suite | Interface Launcher → push GitHub |
| Mettre à jour les apps | Interface Launcher (modèle Adobe CC) |
| Écrire `session.json` | Au login profil |
| Supprimer `session.json` | Au quit |

### 6.2 Ce que Launcher écrit dans `session.json`

Au moment du login profil, Launcher :
1. Lit le profil actif depuis `profiles.json` (GitHub)
2. Déchiffre les clés API via le Retriever
3. Compile `allProfiles` — tous les profils non archivés, champs minimalistes
4. Écrit `session.json` complet

---

## 7. Règles d'or — Ce qui est interdit

| Interdit | Pourquoi |
|----------|----------|
| `profiles.json` local dans une app | Duplication de données, désynchronisation |
| Clés API en dur dans le code | Sécurité |
| Interface de gestion de profil dans une app | Fragmentation — Launcher est l'unique point de config |
| Écriture de profils ou réglages sur GitHub par une app | Réservé à Launcher |
| Session standalone avec sélection de profil locale | Supprimé en Phase Mercury |

---

## 8. Migration — Plan par app

| App | Action Mercury | Action Gemini |
|-----|----------------|---------------|
| **BackUpFlow** | Supprimer `profiles.json`, modale connexion Launcher | Écriture historique GitHub |
| **Transporter** | Session-reader déjà en place, modale connexion | Écriture historique GitHub |
| **Reviewer** | — | Architecture Supabase → GitHub |
| **ARK** | Session-reader | Écriture registre GitHub |
| **Launcher** | Enrichir `session.json` avec `allProfiles` + `profile.prefs` | Interface complète profils |

---

## 9. Relation avec les specs existantes

| Document | Rôle |
|----------|------|
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique `session.json` (couche Mercury) |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine via GitHub (couche Gemini) |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" |
| **Ce document** | Vision globale et règles absolues du Tranquility Cloud |

---

## 10. Phases d'implémentation

### Phase Mercury (en cours)
- ✅ `session.json` couche locale — Launcher écrit, apps lisent
- ✅ BackUpFlow session-reader
- ✅ Transporter session-reader
- 🔲 Modale connexion BackUpFlow (remplace l'écran d'attente)
- 🔲 Enrichissement `session.json` avec `allProfiles` + `profile.prefs` dans Launcher
- 🔲 Suppression `profiles.json` de BackUpFlow

### Phase Gemini
- 🔲 Sync GitHub bidirectionnelle pour les données métier des apps
- 🔲 SSO cross-machine
- 🔲 Remontée d'activité vers MASTER

---

*Tranquility Suite · Tranquility Cloud · v1.0*
*Cellule Vidéo L'Étudiant · 28 mars 2026*
*JARVIS + Martin Pavloff*
