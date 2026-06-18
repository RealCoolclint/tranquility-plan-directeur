# RENDEZVOUS — Spec Technique V1
## Tranquility Suite · Cellule Vidéo L'Étudiant

*Contrat d'API · Architecture · Formats · Protocoles*
*Traduit des décisions architecturales D1→D6*

---

## PÉRIMÈTRE DE CE DOCUMENT

Ce document est le contrat de référence pour construire et faire évoluer RENDEZVOUS. Il traduit les six décisions architecturales fondatrices (D1→D6) en spécifications techniques concrètes : endpoints, formats de données, protocoles, règles d'intégration.

**À lire avant tout prompt Cursor sur R2→R8.**
**À mettre à jour à chaque décision architecturale actée.**

---

## STACK TECHNIQUE

| Composant | Choix |
|---|---|
| **Frontend** | HTML5 / CSS3 / Vanilla JS — GitHub Pages |
| **Proxy backend** | Netlify Functions (Node.js) — instance dédiée RENDEZVOUS |
| **Stockage profils public** | `profiles-public.json` — repo `RealCoolclint/tranquility-core` (public) |
| **Stockage profils privé** | `profiles-private.json` — repo `RealCoolclint/true-me` ou repo privé dédié |
| **Email** | Resend — notifications admin + utilisateur |
| **Tokens** | JWT — signés côté proxy, vérifiés côté apps |
| **Denylist** | Fichier JSON versionné sur CDN GitHub Pages |
| **Design** | `tranquility-core.css` — CDN `realcoolclint.github.io` |

---

## D1 — DOUBLE FICHIER · PROXY SEUL ÉCRIVAIN

### Principe

Deux fichiers de profils coexistent en permanence. Ils sont **toujours synchrones**. Le proxy RENDEZVOUS est le **seul point d'écriture autorisé**. Toute écriture directe (manuelle, script, app) est interdite par architecture.

### `profiles-public.json` — données non sensibles

**Emplacement :** `RealCoolclint/tranquility-core` (repo public)
**URL CDN :** `https://realcoolclint.github.io/tranquility-core/profiles-public.json`
**Consommé par :** toutes les apps de la suite (lecture seule)

```json
{
  "profiles": [
    {
      "id": "uuid-v4",
      "firstName": "Thomas",
      "initials": "TH",
      "avatarId": "apollo-11",
      "color": "#E8A838",
      "level": "N1",
      "status": "active",
      "apps": ["backupflow", "transporter", "ark", "rover", "reviewer", "manifest", "covenant"]
    }
  ],
  "meta": {
    "version": 1,
    "updatedAt": "2026-06-18T10:00:00Z"
  }
}
```

**Champs autorisés :** `id`, `firstName`, `initials`, `avatarId`, `color`, `level`, `status`, `apps`
**Champs interdits :** email, nom de famille, données RGPD, token

### `profiles-private.json` — données sensibles

**Emplacement :** repo privé GitHub (à définir — `RealCoolclint/launcher-profiles` ou repo dédié)
**Accès :** proxy RENDEZVOUS uniquement via GitHub API + token PAT
**Jamais exposé publiquement**

```json
{
  "profiles": [
    {
      "id": "uuid-v4",
      "firstName": "Thomas",
      "lastName": "Dupont",
      "email": "thomas.dupont@letudiant.fr",
      "level": "N1",
      "status": "active",
      "daemonType": "bureau",
      "consentGiven": true,
      "consentDate": "2026-06-18T10:00:00Z",
      "createdAt": "2026-06-18T10:00:00Z",
      "activatedAt": "2026-06-18T10:30:00Z",
      "deactivatedAt": null,
      "deleteScheduledAt": null
    }
  ],
  "meta": {
    "version": 1,
    "updatedAt": "2026-06-18T10:00:00Z"
  }
}
```

**Champs RGPD :** `consentGiven`, `consentDate`, `createdAt`, `activatedAt`, `deactivatedAt`, `deleteScheduledAt`

### Opération d'écriture atomique

Toute modification de profil = **une seule opération proxy** qui met à jour les deux fichiers simultanément. Si l'une des deux écritures échoue, l'opération entière est annulée (rollback). Jamais un fichier à jour sans l'autre.

```
[Proxy reçoit la mutation]
    │
    ├─ Lecture profiles-public.json (SHA GitHub actuel)
    ├─ Lecture profiles-private.json (SHA GitHub actuel)
    │
    ├─ Calcul des deux nouveaux états
    │
    ├─ PUT profiles-public.json (avec SHA pour éviter les conflits)
    └─ PUT profiles-private.json (avec SHA pour éviter les conflits)
         │
         ├─ Succès : répondre 200
         └─ Échec sur l'un : rollback + répondre 500
```

---

## D2 — TOKENS SIGNÉS · FALLBACK 48H · DENYLIST

### Cycle de vie d'un token

```
[Utilisateur se connecte via lien magique]
        │
        ▼
Proxy RENDEZVOUS vérifie l'email dans profiles-private.json
        │
        ├─ Statut "active" → émet un token JWT signé
        └─ Statut "pending" / "inactive" → refuse
        
[Token JWT émis]
        │
        ├─ Payload : id, level, sessionMode, expiresAt, issuedAt
        ├─ Signé avec secret proxy (HMAC SHA-256)
        └─ Durée : 4h (renouvelable silencieusement si actif)

[App reçoit le token]
        │
        ├─ Vérifie la signature
        ├─ Vérifie l'expiration
        ├─ Vérifie que l'id n'est pas dans la denylist
        └─ Si tout OK → session active
```

### Format du token JWT

**Header :**
```json
{ "alg": "HS256", "typ": "JWT" }
```

**Payload :**
```json
{
  "sub": "uuid-v4",
  "level": "N1",
  "sessionMode": "persistent",
  "firstName": "Thomas",
  "initials": "TH",
  "avatarId": "apollo-11",
  "color": "#E8A838",
  "apps": ["backupflow", "transporter", "ark"],
  "iat": 1750000000,
  "exp": 1750014400
}
```

### Fallback offline 48h

Les apps stockent le dernier token valide en cache local.

| Scénario | Comportement |
|---|---|
| Proxy disponible | Validation en ligne à chaque démarrage |
| Proxy indisponible — cache < 48h | Session maintenue depuis le cache |
| Proxy indisponible — cache > 48h | Session expirée — reconnexion requise |
| Token dans la denylist | Session révoquée immédiatement — même hors ligne |

**Stockage cache :**
- Desktop : `~/Library/Application Support/tranquility-suite/session-cache.json`
- Web : `localStorage` clé `tranquility_session`

### Denylist CDN

**Emplacement :** `RealCoolclint/tranquility-core` (public)
**URL :** `https://realcoolclint.github.io/tranquility-core/denylist.json`
**Vérification :** au démarrage de chaque app — avant toute action

```json
{
  "version": 3,
  "updatedAt": "2026-06-18T10:00:00Z",
  "revokedIds": ["uuid-suspendu-1", "uuid-suspendu-2"]
}
```

**Règle :** si l'`id` du token est dans `revokedIds` → session invalide, déconnexion immédiate, même si le token n'est pas expiré et même sans réseau (denylist mise en cache localement).

---

## D3 — TROIS MODES DE SESSION

### Définition des modes

| Mode | Contexte | Durée token | Comportement déconnexion | Sélecteur |
|---|---|---|---|---|
| `persistent` | Mac personnel | 48h renouvelable | Manuel uniquement | Non |
| `bounded` | Mac bureau partagé ponctuellement | 4h max | Automatique à expiration | Non |
| `ephemeral` | Mac Studio partagé | Session navigateur | À la fermeture du navigateur / app | Obligatoire |

### Règle du mode le plus strict

Si plusieurs signaux de mode coexistent → **le plus strict gagne toujours**.

Ordre de priorité (du plus strict au plus souple) :
1. `ephemeral`
2. `bounded`
3. `persistent`

**Le mode est encodé dans le token.** Les apps lisent le mode depuis le token — elles n'ont pas à le décider elles-mêmes.

### Mode `ephemeral` — sélecteur obligatoire

Sur les postes partagés (Mac Studio), RENDEZVOUS affiche un sélecteur de profil à chaque connexion. Aucun profil n'est pré-sélectionné. Le token `ephemeral` est détruit à la fermeture de la session navigateur (pas de `localStorage` — `sessionStorage` uniquement).

---

## D4 — RGPD NATIF

### Données collectées — minimisation à la source

| Champ | Justification | Conservation |
|---|---|---|
| `firstName` | Identification dans la suite | Durée d'activité |
| `email` | Lien magique + notifications | Durée d'activité |
| `role` | Validation accès | Durée d'activité |
| `level` | Attribution accès apps | Durée d'activité |
| `consentGiven` + `consentDate` | Traçabilité RGPD | Durée d'activité + 1 an |
| `createdAt` / `activatedAt` | Audit | Durée d'activité + 1 an |

**Données jamais collectées :** nom de famille (optionnel, non stocké), téléphone, poste exact, manager, données RH.

### Suppression — opération atomique

La désactivation d'un profil déclenche une suppression atomique sur les deux fichiers simultanément.

```
[Martin désactive un profil — R7]
        │
        ▼
Proxy RENDEZVOUS
        │
        ├─ profiles-private.json : champs sensibles effacés, statut → "deleted"
        ├─ profiles-public.json : entrée supprimée
        ├─ id ajouté à denylist.json
        └─ deleteScheduledAt horodaté pour audit
```

**Délai de grâce :** 30 jours avant suppression définitive (permet réactivation si erreur).

### Base légale

**Intérêt légitime de l'employeur** — L'Étudiant a un intérêt légitime à gérer les accès aux outils internes de production vidéo. Plus robuste que le consentement en contexte RH interne (le consentement d'un salarié n'est pas librement donné).

---

## D5 — LAUNCHER DAEMON · RENDEZVOUS AUTORITÉ UNIQUE

### Rôle du daemon dans l'architecture

```
RENDEZVOUS proxy
        │
        │  Token JWT signé (niveau N1 + mode session)
        ▼
Launcher daemon (macOS — Electron)
        │
        ├─ Lit profiles-public.json (CDN — lecture seule)
        ├─ Maintient session.json à jour
        └─ Ping heartbeat → proxy RENDEZVOUS (D6)
        │
        │  session.json
        ▼
Apps desktop (BackUpFlow, Transporter, ARK, ROVER...)
```

### Format `session.json` (inchangé)

**Emplacement :** `~/Library/Application Support/tranquility-suite/session.json`
**Écrit par :** Launcher daemon uniquement
**Lu par :** toutes les apps desktop

```json
{
  "profileId": "uuid-v4",
  "firstName": "Thomas",
  "initials": "TH",
  "avatarId": "apollo-11",
  "color": "#E8A838",
  "level": "N1",
  "sessionMode": "persistent",
  "apps": ["backupflow", "transporter", "ark", "rover"],
  "token": "jwt.signé.ici",
  "tokenExpiresAt": "2026-06-18T14:00:00Z",
  "sessionStartedAt": "2026-06-18T10:00:00Z"
}
```

### Règles Launcher daemon

- **Lecture seule** sur `profiles-public.json` — jamais d'écriture directe
- **Jamais d'interface utilisateur** — icône barre de menu uniquement
- **Jamais d'écriture sur profiles-public.json ou profiles-private.json** — toute mutation passe par le proxy
- **MASTER archivé** — non accessible en usage normal

---

## D6 — HEARTBEAT PROGRESSIF

### Protocole heartbeat

Le daemon Launcher envoie un ping au proxy RENDEZVOUS à intervalle régulier.

**Intervalle :** toutes les 15 minutes (configurable côté proxy)
**Endpoint :** `POST /heartbeat`

**Payload :**
```json
{
  "profileId": "uuid-v4",
  "token": "jwt.signé.ici",
  "daemonVersion": "1.18.04.26",
  "sessionMode": "persistent",
  "timestamp": "2026-06-18T10:15:00Z"
}
```

**Réponse proxy :**
```json
{
  "status": "ok",
  "profileStatus": "active",
  "denylistVersion": 3,
  "message": null
}
```

### R6 — Mode indicateur (actuel)

- Proxy enregistre le dernier heartbeat reçu par profil
- Back-office Martin affiche : profil actif / inactif / hors ligne
- Aucun impact sur le fonctionnement des apps
- Aucun blocage si heartbeat absent

### R8 — Mode bloquant optionnel (futur)

- Apps desktop vérifient l'âge du dernier heartbeat au démarrage
- Si heartbeat > 48h → app refuse de démarrer + message utilisateur
- Fallback offline 48h garanti (aligné D2)
- **Activation = décision explicite PRÉSIDENCE** — jamais un automatisme
- Paramètre proxy : `heartbeatEnforced: true/false`

---

## ENDPOINTS PROXY RENDEZVOUS

Tous les endpoints sont exposés par la Netlify Function dédiée RENDEZVOUS.
**Base URL :** `https://musical-tanuki-a691a5.netlify.app/api/rendezvous` *(à confirmer — instance dédiée à créer)*

### Endpoints publics (sans authentification)

| Méthode | Endpoint | Description |
|---|---|---|
| `POST` | `/register` | Inscription nouvelle demande — crée profil `pending` |
| `POST` | `/auth/magic-link` | Demande lien magique — envoie email via Resend |
| `GET` | `/auth/verify?token=xxx` | Vérifie le lien magique — émet token JWT |
| `GET` | `/fleet` | Retourne la liste des apps (vitrine publique) |

### Endpoints authentifiés (token JWT requis)

| Méthode | Endpoint | Description |
|---|---|---|
| `GET` | `/me` | Profil de l'utilisateur connecté |
| `POST` | `/heartbeat` | Ping daemon Launcher (D6) |
| `POST` | `/auth/refresh` | Renouvellement token avant expiration |
| `POST` | `/auth/logout` | Invalidation session |

### Endpoints admin (token ADMIN uniquement)

| Méthode | Endpoint | Description |
|---|---|---|
| `GET` | `/admin/pending` | Liste des profils en attente de validation |
| `POST` | `/admin/validate/:id` | Valide un profil — attribue niveau — notifie utilisateur |
| `POST` | `/admin/deactivate/:id` | Désactive un profil — suppression atomique D4 |
| `PUT` | `/admin/profile/:id` | Modifie niveau ou accès apps |
| `GET` | `/admin/heartbeats` | Tableau de bord activité daemon N1 (D6 R6) |
| `POST` | `/admin/denylist/add/:id` | Ajoute un id à la denylist — révocation immédiate |

### Endpoint inscription — `POST /register`

**Payload entrant :**
```json
{
  "firstName": "Anne",
  "email": "anne.martin@letudiant.fr",
  "role": "Journaliste vidéo",
  "videoRelation": "Je tourne 2 sujets par semaine",
  "consentGiven": true,
  "daemonType": "bureau"
}
```

**Actions proxy :**
1. Valide les champs requis
2. Vérifie que l'email se termine par `@letudiant.fr`
3. Génère un `uuid-v4` unique
4. Crée l'entrée dans `profiles-private.json` (statut `pending`)
5. Crée l'entrée dans `profiles-public.json` (statut `pending`)
6. Envoie email à Martin via Resend : "Nouvelle demande en attente"
7. Envoie email à l'utilisateur : "Demande reçue — en attente de validation"

**Réponse :**
```json
{ "status": "pending", "message": "Demande reçue — Martin vous contactera sous 48h" }
```

---

## INTÉGRATION APPS EXISTANTES

### Migration `profiles.json` → `profiles-public.json`

Les apps de la suite consomment actuellement `profiles.json` depuis `tranquility-core`. La migration vers `profiles-public.json` se fait progressivement — le format est compatible.

| App | Impact | Priorité migration |
|---|---|---|
| BackUpFlow | Lecture profils au démarrage | R4 (proxy opérationnel) |
| Transporter | Lecture profils | R4 |
| ARK | Lecture profils | R4 |
| ROVER | Lecture profils | R4 |
| Reviewer | Lecture profils publics | R4 |
| Manifest | Lecture profils publics | R4 |
| COVENANT | Lecture profils publics | R4 |

### Vérification token dans les apps desktop

À partir de R5 (authentification active), chaque app desktop vérifie le token au démarrage :

```javascript
// Lecture session.json
const session = JSON.parse(fs.readFileSync(SESSION_PATH));

// Vérification denylist (cache local)
const denylist = await fetchDenylist(); // CDN ou cache
if (denylist.revokedIds.includes(session.profileId)) {
  // Session révoquée — déconnexion
  clearSession();
  return;
}

// Vérification expiration
if (Date.now() > new Date(session.tokenExpiresAt).getTime()) {
  // Token expiré — fallback 48h
  const cacheAge = Date.now() - new Date(session.sessionStartedAt).getTime();
  if (cacheAge > 48 * 3600 * 1000) {
    clearSession();
    return;
  }
}

// Session valide — app démarre
```

### Vérification token dans les apps web

```javascript
// Lecture localStorage
const token = localStorage.getItem('tranquility_session');
if (!token) { redirectToRENDEZVOUS(); return; }

// Décodage JWT (sans vérification signature côté client — proxy vérifie)
const payload = JSON.parse(atob(token.split('.')[1]));

// Vérification expiration
if (Date.now() / 1000 > payload.exp) { redirectToRENDEZVOUS(); return; }

// Vérification niveau d'accès
if (!payload.apps.includes(APP_KEY)) { showUnauthorized(); return; }
```

---

## SCHÉMA RGPD — REGISTRE DES TRAITEMENTS

*Ce bloc alimente le registre des traitements à remettre à Audrey Weiss.*

| Champ | Valeur |
|---|---|
| **Nom du traitement** | Gestion des accès — Tranquility Suite |
| **Responsable de traitement** | L'Étudiant — représenté par Martin Pavloff |
| **Finalité** | Gestion des accès aux outils internes de production vidéo |
| **Base légale** | Intérêt légitime (article 6.1.f RGPD) |
| **Données traitées** | Prénom, email professionnel, rôle, niveau d'accès, horodatage consentement |
| **Données NON traitées** | Nom de famille, téléphone, données RH, géolocalisation |
| **Destinataires** | Martin Pavloff (admin) — Resend (email transactionnel) — GitHub (stockage) |
| **Transfert hors UE** | GitHub (USA) — couvert par DPA GitHub / clauses contractuelles types |
| **Durée de conservation** | Durée d'activité du profil + 1 an pour données d'audit |
| **Droits des personnes** | Accès, rectification, effacement (suppression atomique D4), opposition |
| **DPO requis** | Non — L'Étudiant < 250 employés, traitement non à grande échelle |
| **Mesures de sécurité** | Données sensibles en repo privé GitHub — tokens JWT signés — denylist — HTTPS |

---

## RÈGLES DE SÉCURITÉ NON NÉGOCIABLES

1. **Jamais de token dans l'URL** — toujours en header `Authorization: Bearer` ou body POST
2. **Jamais de données sensibles dans `profiles-public.json`** — email, nom de famille, RGPD = privé uniquement
3. **Toute écriture passe par le proxy** — aucune exception, aucun script de contournement
4. **La denylist est vérifiée au démarrage** — même hors ligne (cache local obligatoire)
5. **Le PAT GitHub du proxy** est dans les variables d'environnement Netlify — jamais dans le code
6. **Les domaines autorisés** pour les requêtes proxy : `realcoolclint.github.io` uniquement (CORS strict)

---

## VERSIONS ET ÉVOLUTION

| Version | Date | Changements |
|---|---|---|
| V1.0 | 18/06/2026 | Création — D1→D6 traduits en spec technique |

*Ce document évolue avec chaque décision architecturale actée par la PRÉSIDENCE.*
*Toute modification doit être validée contre les six décisions fondatrices D1→D6.*

---

*Spec Technique · RENDEZVOUS · V1.0 · Tranquility Suite · Cellule Vidéo L'Étudiant · 18 juin 2026*
*Martin Pavloff · JARVIS*
