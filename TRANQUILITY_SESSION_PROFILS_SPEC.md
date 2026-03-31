# Tranquility Suite — Session & Profils
## Source de vérité unique · Validée le 31 mars 2026
*Cellule Vidéo L'Étudiant · JARVIS + Martin*

---

> *Ce document fait loi pour toute la suite. Il ne se modifie que sur validation explicite de Martin. Toute implémentation de session ou de profil dans n'importe quelle app doit s'y conformer sans exception.*

---

## 1. Principe fondamental

**Chaque app est autonome.**

Launcher n'est jamais requis pour utiliser une app de la suite. Launcher est un outil de gestion — des apps, des profils, de la suite — pas un portier.

Le modèle de référence est Netflix : l'app TV ne dépend pas que Netflix soit ouvert sur ton téléphone.

---

## 2. GitHub est le cloud de la Tranquility Suite

C'est le **principe central de toute la suite**.

GitHub n'est pas juste du versioning de code. C'est l'infrastructure de synchronisation qui garantit que toutes les machines de la cellule sont toujours à jour — tant qu'internet fonctionne.

| Ce qui est synchronisé | Repo GitHub | Accès |
|------------------------|-------------|-------|
| Profils de l'équipe | `RealCoolclint/launcher-profiles` | Privé |
| Avatars NASA | `RealCoolclint/tranquility-avatars` | Public |
| Mises à jour des apps | Releases de chaque repo app | Public |
| Design system CSS | `RealCoolclint/tranquility-core` | Public |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | Public |

**Règle absolue :** une modification faite par le MASTER dans Launcher est disponible sur tous les Macs au prochain lancement de n'importe quelle app. Aucune action manuelle requise sur les autres machines.

---

## 3. Où sont stockés les profils

### Source de vérité → GitHub (privé)

```
repo    : RealCoolclint/launcher-profiles
fichier : profiles.json
```

Ce fichier contient tous les profils de l'équipe. C'est lui qui fait autorité sur toutes les machines. Seul Launcher (via le MASTER) peut le modifier.

```json
{
  "version": 2,
  "updatedAt": "2026-03-31T09:00:00.000Z",
  "profiles": [
    {
      "id": "p_1773999409329",
      "firstName": "Martin",
      "lastName": "Pavloff",
      "role": "admin",
      "avatar": "https://raw.githubusercontent.com/RealCoolclint/tranquility-avatars/main/avatar_13.jpeg",
      "initiales": "MP",
      "color": "#2563eb",
      "appPermissions": {
        "backupflow":  true,
        "transporter": true,
        "ark":         true,
        "reviewer":    true,
        "manifest":    true
      }
    }
  ]
}
```

### Cache local → sur chaque Mac

```
~/Library/Application Support/tranquility-suite/profiles-cache.json
```

Copie locale du fichier GitHub. Mise à jour automatique à chaque démarrage d'app si internet est disponible. Utilisée telle quelle en mode hors ligne. **Jamais supprimée.**

---

## 4. Le cycle de synchronisation

À chaque démarrage d'app, dans cet ordre :

```
App ouverte
      ↓
Mercury Opening (splash)
      ↓
Tentative de sync GitHub
      │
     OUI (internet) ──→ Télécharge profiles.json
                        Télécharge mises à jour dispo
                        Met à jour profiles-cache.json
                        Badge HORS LIGNE : masqué
      │
     NON (offline)  ──→ Utilise profiles-cache.json
                        Badge HORS LIGNE : visible
      ↓
Lecture session.json
      │
   Valide ──→ App shell directement (aucune question)
      │
   Absente/expirée ──→ Sélecteur de profil
```

---

## 5. Les 12 règles — gravées dans le marbre

### Règle 1 — Autonomie des apps
Chaque app fonctionne de façon totalement indépendante. Launcher peut être fermé, absent, non installé : l'app démarre quand même.

### Règle 2 — GitHub = source de vérité
Les profils et avatars viennent toujours de GitHub. Le cache local n'est qu'un filet de sécurité pour le mode hors ligne. Tant qu'internet fonctionne, toutes les machines sont synchronisées.

### Règle 3 — La première app écrit la session
La première app ouverte dans la journée affiche le sélecteur de profil. Une fois connecté, elle écrit `session.json` dans le dossier partagé. Toutes les apps suivantes lisent ce fichier et se lancent directement sans rien demander.

### Règle 4 — Un seul profil actif à la fois
Un seul `session.json` sur la machine. Un seul profil actif. Si un deuxième utilisateur change de profil dans une app, la session est écrasée. Le premier est déconnecté silencieusement à son prochain lancement. Rien ne casse.

### Règle 5 — Rester connecté : 3 choix
À chaque connexion, l'utilisateur choisit la durée de sa session :
- **Aujourd'hui** — expire à minuit
- **7 jours** — expire dans 7 jours
- **Toujours** — n'expire jamais (Mac personnel)

### Règle 6 — Expiration non intrusive
Si la session expire pendant qu'une app est ouverte, rien ne se passe. L'app continue. La reconnexion est demandée uniquement au prochain lancement. **Priorité absolue au workflow.**

### Règle 7 — Profils filtrés par le MASTER
Le sélecteur affiche uniquement les profils autorisés pour cette app (`appPermissions`). Un profil sans permission n'apparaît pas dans le sélecteur.

### Règle 8 — Pas de PIN en Mercury
La sélection d'un profil suffit pour se connecter. Pas de mot de passe en Phase Mercury. Authentification renforcée prévue en Gemini/Apollo.

### Règle 9 — Changement de profil sans splash
Changer de profil depuis le menu avatar recharge l'interface silencieusement. Le Mercury Opening n'est pas rejoué.

### Règle 10 — Mode hors ligne toujours disponible
Le cache local permet à l'app de démarrer sans réseau. Les fonctions cloud (Monday, Gofile, Resend) se désactivent silencieusement sans bloquer le workflow.

### Règle 11 — Badge HORS LIGNE visible
Quand le réseau est absent, un badge "HORS LIGNE" apparaît dans le header. Discret mais permanent tant que la connexion est absente.

### Règle 12 — Les avatars sont obligatoires
Le sélecteur affiche toujours les avatars NASA de chaque profil. Jamais de sélecteur texte seul. La Tranquility Suite est une expérience — on la protège.

---

## 6. Flow utilisateur exact

### Premier lancement (ou session expirée)

```
App ouverte → Mercury Opening → Sync GitHub
      ↓
┌─────────────────────────────────────┐
│  [Patch de l'app]                   │
│                                     │
│       QUI SE CONNECTE ?             │
│                                     │
│  [Avatar] MARTIN P.    [ADMIN]      │
│  [Avatar] ANTOINE V.                │
│  [Avatar] THOMAS R.                 │
│  [Avatar] MAËLLE D.                 │
│                                     │
│  Rester connecté :                  │
│  ○ AUJOURD'HUI  ● 7 JOURS  ○ TOUJOURS│
└─────────────────────────────────────┘
      ↓ sélection profil
session.json écrit → App shell
```

### Lancement suivant (session valide)

```
App ouverte → Mercury Opening → Sync GitHub
      ↓
session.json valide → App shell directement
```

### Changement de profil en cours de session

```
Clic avatar dans le header
      ↓
┌──────────────────────┐
│ [Avatar] MARTIN P.   │
│          ADMIN       │
│ ──────────────────── │
│  CHANGER DE PROFIL   │
└──────────────────────┘
      ↓
Sélecteur de profil (sans Mercury Opening)
      ↓ sélection
Recharge silencieuse de l'interface
```

---

## 7. Le fichier session.json

### Emplacement partagé entre toutes les apps
```
~/Library/Application Support/tranquility-suite/session.json
```

### Format
```json
{
  "version": 2,
  "writtenBy": "ark",
  "writtenAt": "2026-03-31T09:00:00.000Z",
  "expiresAt": "2026-04-07T09:00:00.000Z",
  "profileId": "p_1773999409329",
  "profileName": "Martin Pavloff",
  "profileRole": "admin",
  "profileAvatar": "https://raw.githubusercontent.com/RealCoolclint/tranquility-avatars/main/avatar_13.jpeg",
  "profileInitiales": "MP",
  "profileColor": "#2563eb"
}
```

### Règles

| Règle | Détail |
|-------|--------|
| **Jamais de secrets** | Aucune API key, token ou mot de passe |
| **Identité uniquement** | Nom, avatar, rôle, couleur — c'est tout |
| **Écrasement propre** | Toute nouvelle connexion écrase le fichier |
| **Pas de suppression** | Jamais supprimé à la fermeture d'une app — expire via `expiresAt` |

### Où sont les API keys ?
Dans le **Keychain macOS** via `keytar`, service `tranquility-retriever`. Launcher les y stocke. Les apps les lisent directement. Elles ne transitent jamais par `session.json`.

---

## 8. Le module session-reader.js

Module commun dans `modules/session-reader.js` de chaque app Electron.

```javascript
const fs    = require('fs');
const path  = require('path');
const os    = require('os');
const https = require('https');

const SUITE_DIR    = path.join(os.homedir(), 'Library', 'Application Support', 'tranquility-suite');
const SESSION_PATH = path.join(SUITE_DIR, 'session.json');
const CACHE_PATH   = path.join(SUITE_DIR, 'profiles-cache.json');
const PROFILES_URL = 'https://raw.githubusercontent.com/RealCoolclint/launcher-profiles/main/profiles.json';

// ── Lecture session ────────────────────────────────────────────
function readSession() {
  try {
    if (!fs.existsSync(SESSION_PATH)) return null;
    const data = JSON.parse(fs.readFileSync(SESSION_PATH, 'utf-8'));
    if (data.expiresAt && new Date(data.expiresAt) < new Date()) return null;
    return data;
  } catch (e) { return null; }
}

// ── Écriture session ───────────────────────────────────────────
function writeSession(profile, durationChoice, appName) {
  if (!fs.existsSync(SUITE_DIR)) fs.mkdirSync(SUITE_DIR, { recursive: true });

  const expiresAt = (() => {
    if (durationChoice === 'always') return null;
    const d = new Date();
    if (durationChoice === 'today')  d.setHours(23, 59, 59, 0);
    if (durationChoice === '7days')  d.setDate(d.getDate() + 7);
    return d.toISOString();
  })();

  const session = {
    version:          2,
    writtenBy:        appName,
    writtenAt:        new Date().toISOString(),
    expiresAt,
    profileId:        profile.id,
    profileName:      `${profile.firstName} ${profile.lastName}`,
    profileRole:      profile.role,
    profileAvatar:    profile.avatar,
    profileInitiales: profile.initiales,
    profileColor:     profile.color
  };

  fs.writeFileSync(SESSION_PATH, JSON.stringify(session, null, 2), 'utf-8');
  return session;
}

// ── Sync profils depuis GitHub ─────────────────────────────────
function syncProfiles(appKey) {
  return new Promise((resolve) => {
    https.get(PROFILES_URL, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          if (!fs.existsSync(SUITE_DIR)) fs.mkdirSync(SUITE_DIR, { recursive: true });
          fs.writeFileSync(CACHE_PATH, JSON.stringify(json, null, 2), 'utf-8');
          const profiles = json.profiles.filter(p => p.appPermissions?.[appKey]);
          resolve({ online: true, profiles });
        } catch (e) { resolve(readCachedProfiles(appKey)); }
      });
    }).on('error', () => resolve(readCachedProfiles(appKey)));
  });
}

// ── Lecture cache local ────────────────────────────────────────
function readCachedProfiles(appKey) {
  try {
    const json     = JSON.parse(fs.readFileSync(CACHE_PATH, 'utf-8'));
    const profiles = json.profiles.filter(p => p.appPermissions?.[appKey]);
    return { online: false, profiles };
  } catch (e) { return { online: false, profiles: [] }; }
}

module.exports = { readSession, writeSession, syncProfiles };
```

---

## 9. Ce que Launcher fait (et ne fait pas)

| Launcher FAIT | Launcher NE FAIT PAS |
|---------------|----------------------|
| Gérer les profils (créer, éditer, archiver) | Connecter les utilisateurs aux apps |
| Gérer les permissions par app (MASTER) | Être requis pour lancer une app |
| Pousser `profiles.json` sur GitHub | Écrire `session.json` pour les apps |
| Stocker les API keys dans le Keychain | Supprimer `session.json` à sa fermeture |
| Distribuer les mises à jour des apps | Être le portier de la suite |

---

## 10. Checklist — Conformité session & profils

Toute app Mercury doit cocher toutes ces cases avant de sortir :

- [ ] `modules/session-reader.js` présent avec `readSession`, `writeSession`, `syncProfiles`
- [ ] Sync GitHub au démarrage → `profiles-cache.json` mis à jour
- [ ] Sélecteur de profil avec avatars NASA
- [ ] Profils filtrés par `appPermissions[appKey]`
- [ ] 3 choix "Rester connecté" (aujourd'hui / 7 jours / toujours)
- [ ] Session écrite dans `~/Library/Application Support/tranquility-suite/session.json`
- [ ] Pas d'API keys dans `session.json`
- [ ] Menu profil sur clic avatar dans le header
- [ ] Changement de profil = recharge silencieuse sans Mercury Opening
- [ ] Badge "HORS LIGNE" dans le header si offline
- [ ] Badge "ADMIN" sur le profil admin dans le sélecteur
- [ ] Pas de PIN (Mercury)

---

## 11. Phases d'implémentation

| Phase | Fonctionnalité |
|-------|---------------|
| **Mercury** | Session locale, sync GitHub profils + mises à jour, 3 durées, mode offline, badge HORS LIGNE |
| **Gemini** | PIN / authentification renforcée, sync cross-machine activité |
| **Apollo** | SSO complet, historique par profil, algorithme par profil |

---

*Tranquility Suite · Session & Profils Spec V1.1*
*Cellule Vidéo L'Étudiant · 31 mars 2026 · JARVIS + Martin*
*Document fondateur — ne se modifie que sur validation explicite de Martin*
*GitHub = cloud de la Tranquility Suite — principe central et non négociable*
