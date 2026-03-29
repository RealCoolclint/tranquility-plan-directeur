# Tranquility Suite — Profil Passeport
## Spécification · Identité universelle de la suite · V1.0
*Cellule Vidéo L'Étudiant · Rédigé le 29 mars 2026*

---

> *Un profil Tranquility est un passeport. Il suit son porteur partout dans la suite — quelle que soit l'app, quelle que soit la machine, quelle que soit la phase.*

---

## 1. Principe fondateur

Le Profil Passeport est la **source de vérité unique sur l'identité d'un utilisateur** dans la Tranquility Suite.

Il repose sur trois règles absolues inspirées du modèle Adobe Creative Cloud :

| Règle | Détail |
|-------|--------|
| **Launcher est le seul à écrire l'identité** | Aucune app ne peut modifier les données d'identité d'un profil |
| **Chaque app lit uniquement ce dont elle a besoin** | Via le mécanisme adapté à sa famille technique |
| **Chaque app peut écrire dans son propre bloc `appSettings`** | Et uniquement dans le sien |

---

## 2. Structure complète d'un profil

```json
{
  "id": "p_1773999409329",
  "status": "active",
  "createdAt": "2026-03-01T10:00:00.000Z",
  "updatedAt": "2026-03-29T09:00:00.000Z",

  "identity": {
    "firstName": "Martin",
    "lastName": "Pavloff",
    "email": "mpavloff@letudiant.fr",
    "role": "admin",
    "avatar": "https://raw.githubusercontent.com/RealCoolclint/tranquility-avatars/main/avatar_13.jpeg",
    "initiales": "MP",
    "color": "#2563eb",
    "mondayUserId": "67082975"
  },

  "appSettings": {
    "backupflow": {
      "ssdPersoPath": "/Volumes/BACKUP PRO/POLE PAR POLE",
      "ssdStudioPath": "/Volumes/SSD-1",
      "mondayMode": "monday",
      "zipNasEnabled": false
    },
    "transporter": {
      "defaultDestination": "/Volumes/BACKUP PRO/PROJETS",
      "mondayMode": "monday"
    }
  }
}
```

---

## 3. Les deux blocs — identité vs appSettings

### 3.1 Bloc `identity` — ce qui appartient à la personne

Ce bloc contient tout ce qui définit **qui est l'utilisateur**, indépendamment de toute app.

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `firstName` | string | ✅ | Prénom |
| `lastName` | string | ✅ | Nom de famille |
| `email` | string | ✅ | Adresse email professionnelle |
| `role` | enum | ✅ | `admin` ou `user` |
| `avatar` | string | ✅ | URL raw GitHub vers l'image d'avatar |
| `initiales` | string | ✅ | 2 lettres — fallback si avatar indisponible |
| `color` | string | ✅ | Couleur de profil HEX — identité visuelle dans les apps |
| `mondayUserId` | string | ✅ | ID Monday.com — lien vers la gestion de projet |

**Règle :** Ces champs ne peuvent être modifiés que depuis **Launcher**. Aucune app ne les touche.

---

### 3.2 Bloc `appSettings` — ce qui appartient à l'app

Chaque app peut avoir son propre bloc, nommé par son identifiant (lowercase, sans espaces).

**Règle :** Une app ne peut lire et écrire que **dans son propre bloc**. Elle ignore les autres.

#### Blocs existants

**`appSettings.backupflow`**

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `ssdPersoPath` | string | ✅ | Chemin vers le SSD personnel |
| `ssdStudioPath` | string | ✅ | Chemin vers le SSD studio |
| `mondayMode` | enum | ✅ | `monday` ou `offline` |
| `zipNasEnabled` | boolean | ✅ | Compression ZIP vers NAS activée |

**`appSettings.transporter`**

| Champ | Type | Obligatoire | Description |
|-------|------|-------------|-------------|
| `defaultDestination` | string | ✅ | Chemin de destination par défaut |
| `mondayMode` | enum | ✅ | `monday` ou `offline` |

#### Ajouter un bloc pour une nouvelle app

Quand une nouvelle app entre dans la suite, son bloc `appSettings` est défini dans ce document, puis ajouté au profil de chaque utilisateur par le MASTER via Launcher.

Exemple pour une future app `cargo` :
```json
"appSettings": {
  "cargo": {
    "defaultSSDLabel": "SSD-TOURNAGE-1",
    "autoRegister": true
  }
}
```

---

## 4. Cycle de vie d'un profil

### 4.1 Statuts

| Statut | Signification | Qui peut l'attribuer |
|--------|--------------|----------------------|
| `pending` | Profil créé, en attente de validation | Automatique à la création |
| `active` | Profil validé, accès complet à la suite | MASTER uniquement |
| `archived` | Profil désactivé, conservé dans l'historique | MASTER uniquement |

La **suppression** n'est pas un statut. C'est une action destructrice et irréversible, réservée au MASTER (erreur de création, doublon, test). Un profil supprimé n'existe plus dans le repo GitHub.

En pratique, quand quelqu'un quitte l'équipe : on **archive**, on ne supprime pas — l'historique de ses actions dans les apps reste cohérent.

---

### 4.2 Création d'un profil — deux scénarios

**Scénario A — L'admin anticipe (onboarding préparé)**
```
MASTER → Launcher → onglet Équipe → "Créer un profil"
  → Remplit les champs identity
  → Profil créé en statut "pending"
  → Profil visible dans la grille Launcher pour l'arrivant
  → L'arrivant complète son profil (avatar, couleur) au premier login
  → Alerte mail à l'admin : "Profil [Prénom] complété"
```

**Scénario B — L'arrivant s'auto-enregistre**
```
Launcher → "Créer mon profil" (accessible sans être connecté)
  → Remplit ses infos identity
  → Profil créé en statut "pending"
  → Alerte mail à l'admin : "Nouveau profil en attente de validation — [Prénom Nom]"
  → L'admin valide depuis MASTER → statut passe à "active"
  → L'arrivant peut se connecter
```

Dans les deux scénarios, **aucun accès à la suite n'est possible tant que le statut est `pending`**.

---

### 4.3 Modification d'un profil

- **N'importe quel utilisateur** peut modifier ses propres données `identity` (avatar, couleur, initiales) depuis Launcher
- **Chaque app** peut modifier son propre bloc `appSettings` depuis ses paramètres
- **Toute modification** envoie une alerte mail à l'admin : "Profil [Prénom] modifié — [champ modifié]"
- **Le MASTER** peut modifier n'importe quel profil

---

### 4.4 Alertes mail — récapitulatif

| Événement | Destinataire | Expéditeur |
|-----------|-------------|------------|
| Nouveau profil créé (scénario B) | Admin | Resend — `onboarding@resend.dev` |
| Profil complété (scénario A) | Admin | Resend — `onboarding@resend.dev` |
| Profil modifié (identity) | Admin | Resend — `onboarding@resend.dev` |
| Profil validé (pending → active) | Utilisateur concerné | Resend — `onboarding@resend.dev` |
| Profil archivé | Utilisateur concerné | Resend — `onboarding@resend.dev` |

---

## 5. Comment chaque famille d'apps accède au profil

### 5.1 Apps desktop Electron — via `session.json`

C'est le mécanisme Mercury principal. Launcher écrit le profil actif dans `session.json` à chaque login.

```
~/Library/Application Support/tranquility-suite/session.json
```

Les apps lisent ce fichier via `session-reader.js`. Elles construisent un profil **en mémoire** pour la durée de la session. Elles n'écrivent jamais dans `session.json`.

**Apps concernées :** BackUpFlow, Transporter, ARK, Cargo, Guidance, Rover, Hatch

---

### 5.2 Apps web GitHub Pages — via `profiles.json` + `localStorage`

Les apps web ne peuvent pas lire `session.json` (fichier système local inaccessible depuis un navigateur).

**Mécanisme Mercury :**

```
App web ouverte dans le navigateur
  → Charge profiles.json depuis GitHub (repo launcher-profiles)
  → Affiche la grille de l'équipe (même modèle que desktop)
  → L'utilisateur clique sur son profil
  → Profil chargé en mémoire + session stockée en localStorage
  → Durée de session : 8h (Mac partagé) ou 30 jours (Mac perso — option à cocher)
```

Pas de mot de passe, pas de PIN — cohérent avec le modèle desktop. La sécurité repose sur le fait que l'URL n'est pas publique et que les utilisateurs sont 100% internes en Phase Mercury.

**Apps concernées :** Reviewer, Manifest, Beacon, Debrief

**Phase Gemini :** remplacement par un vrai token d'authentification GitHub ou Supabase. Le principe de grille de profils reste identique — seul le mécanisme de vérification évolue.

---

### 5.3 Extensions Premiere Pro CEP — Phase Gemini

Les extensions CEP ont un accès fichier limité et un contexte d'exécution propre à Adobe.

**Mercury :** Les extensions CEP (CAPCOM, DATAPAD, BLACKBOX, Telemetry) fonctionnent sans profil Passeport — elles lisent leurs propres configs locales.

**Gemini :** À définir. Piste probable : lecture de `session.json` via Node.js embarqué dans CEP, si les permissions Adobe le permettent.

---

### 5.4 Payload (Desktop + Mobile)

- **Desktop :** même mécanisme que les apps Electron — via `session.json`
- **Mobile :** même mécanisme que les apps web — via `profiles.json` + `localStorage`

---

## 6. Règles de priorité et fallbacks

### 6.1 Champ `identity` absent ou invalide

| Situation | Comportement |
|-----------|-------------|
| `avatar` absent ou URL cassée | Fallback sur les `initiales` avec la `color` du profil |
| `initiales` absent | Fallback sur les deux premières lettres du `firstName` |
| `mondayUserId` absent | Les fonctionnalités Monday sont désactivées pour cet utilisateur |
| `color` absente | Fallback sur la couleur par défaut `#2563eb` |

### 6.2 Bloc `appSettings` absent pour une app

Si une app ouvre sa session et que son bloc `appSettings` est absent :

```
→ L'app fonctionne en mode "configuration incomplète"
→ Elle affiche un écran de premier paramétrage
→ Elle écrit son bloc appSettings dans le profil (via Launcher API) une fois complété
→ Elle ne bloque pas l'accès — elle guide l'utilisateur
```

### 6.3 Session expirée

| Famille | Comportement |
|---------|-------------|
| Desktop Electron | Modale légère → spawn Launcher → poll `session.json` |
| Web GitHub Pages | Retour à la grille de profils → re-sélection |

---

## 7. Règles de non-corruption

Ces règles protègent l'intégrité des données de profil.

| Règle | Détail |
|-------|--------|
| **Les apps ne modifient pas `identity`** | Lecture seule. Toujours. |
| **Les apps écrivent uniquement dans leur propre bloc `appSettings`** | `backupflow` n'écrit pas dans `transporter`, et vice versa |
| **Le fichier `session.json` est en lecture seule pour les apps** | Seul Launcher écrit `session.json` |
| **Les profils `pending` sont invisibles dans les apps** | Seul Launcher et le MASTER les voient |
| **Les profils `archived` sont invisibles dans les apps** | Sauf dans MASTER → onglet Équipe |
| **Jamais de mot de passe dans un profil** | Ni dans `profiles.json`, ni dans `session.json` |

---

## 8. Module partagé `profile-loader.js`

Module à créer une fois et à partager entre toutes les apps desktop de la suite.

### Emplacement recommandé

```
~/Library/Application Support/tranquility-suite/shared/profile-loader.js
```

Ou, en attendant un mécanisme de partage formel, copié dans `modules/profile-loader.js` de chaque app.

### Responsabilités du module

```javascript
// profile-loader.js

/**
 * Charge le profil actif depuis session.json
 * Retourne un objet profil structuré et validé
 * Retourne null si la session est absente, expirée ou corrompue
 */
function loadActiveProfile(appName) {
  // 1. Lire session.json
  // 2. Vérifier expiration
  // 3. Extraire identity
  // 4. Extraire appSettings[appName] — ou {} si absent
  // 5. Retourner { identity, appSettings, connected: true }
  // 6. En cas d'erreur → retourner { connected: false, reason: '...' }
}

/**
 * Vérifie que tous les champs obligatoires d'appSettings[appName] sont présents
 * Retourne { valid: true } ou { valid: false, missingFields: [...] }
 */
function validateAppSettings(appSettings, appName) { ... }

/**
 * Écrit ou met à jour le bloc appSettings[appName] dans le profil GitHub
 * Via l'API GitHub (repo launcher-profiles)
 * Alerte mail automatique à l'admin
 */
async function saveAppSettings(profileId, appName, settings) { ... }

module.exports = { loadActiveProfile, validateAppSettings, saveAppSettings };
```

### Utilisation dans une app

```javascript
const { loadActiveProfile } = require('./modules/profile-loader');

const { identity, appSettings, connected } = loadActiveProfile('backupflow');

if (!connected) {
  // Afficher écran d'attente → spawn Launcher
  return;
}

// identity.firstName, identity.color, identity.mondayUserId...
// appSettings.ssdPersoPath, appSettings.mondayMode...
```

---

## 9. Relation avec les specs existantes

| Document | Relation |
|----------|----------|
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Définit le format de `session.json` et le protocole de lecture/écriture |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Définit Launcher comme gestionnaire central — ce document en est le complément identité |
| `TRANQUILITY_SSO_SPEC.md` | Couche Gemini cross-machine — indépendante, complémentaire |

---

## 10. Chantiers à ouvrir

| Chantier | App | Phase | Priorité |
|----------|-----|-------|----------|
| Onglet MASTER Équipe — création / modification / archivage profils | Launcher | Mercury | 🟠 |
| Alertes mail Resend sur événements profil | Launcher | Mercury | 🟠 |
| Grille de sélection profil dans apps web (Reviewer, Manifest) | Web apps | Mercury | 🟡 |
| `profile-loader.js` — module partagé | Toutes apps desktop | Mercury | 🟡 |
| Bloc `appSettings` pour les apps en projet (ARK, Cargo, Hatch...) | Launcher | Au besoin | ⚫ |
| Authentification renforcée apps web | Web apps | Gemini | ⚫ |
| Accès profil depuis extensions CEP | CEP | Gemini | ⚫ |

---

*Tranquility Suite · Profil Passeport Spec · V1.0*
*Cellule Vidéo L'Étudiant · 29 mars 2026*
*JARVIS + Martin*
