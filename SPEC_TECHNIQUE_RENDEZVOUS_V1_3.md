# RENDEZVOUS — Spec Technique V1.3
## Tranquility Suite · Cellule Vidéo L'Étudiant

*Contrat d'API · Architecture · Formats · Protocoles*
*Traduit des décisions architecturales D1→D13*

---

## PÉRIMÈTRE DE CE DOCUMENT

Ce document est le contrat de référence pour construire et faire évoluer RENDEZVOUS. Il traduit les treize décisions architecturales fondatrices (D1→D13) en spécifications techniques concrètes : endpoints, formats de données, protocoles, règles d'intégration.

**À lire avant tout prompt Cursor sur R5→R8.**
**À mettre à jour à chaque décision architecturale actée.**

**Hors périmètre de ce document :** les décisions purement design/CSS (tokens, conventions de nommage de variables) sont actées au niveau architectural ici (tableau ci-dessous) mais détaillées dans `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` et `CARNET_PIEGES_V18.md` — une seule source de vérité par sujet, jamais de duplication.

---

## STACK TECHNIQUE

| Composant | Choix |
|---|---|
| **Frontend** | HTML5 / CSS3 / Vanilla JS — GitHub Pages |
| **Proxy backend** | Netlify Functions (Node.js) — instance dédiée `rendezvous-proxy-tranquility.netlify.app`, repo privé `RealCoolclint/rendezvous-proxy` (séparé du site COVENANT) — **zéro dépendance npm**, fetch natif uniquement (confirmé : pas de `package.json` dans le repo) |
| **Stockage profils public** | `profiles-public.json` — repo `RealCoolclint/tranquility-core` (public) |
| **Stockage profils privé** | `profiles-private.json` — repo privé dédié `RealCoolclint/rendezvous-profiles-private` (confirmé R4, D8) |
| **Email** | Resend — domaine dédié vérifié et activé `mail.tranquilitysuite.com` (D10, B13) — notifications admin + utilisateur |
| **Tokens** | JWT — signés côté proxy via module natif `crypto` (HMAC SHA-256, à la main) — pas de lib `jsonwebtoken`, cohérence zéro dépendance |
| **Denylist** | Fichier JSON versionné sur CDN GitHub Pages |
| **Design** | `tranquility-core.css` — CDN `realcoolclint.github.io` — seule source de vérité pour les tokens (voir Design Reference) |

---

## D1 — DOUBLE FICHIER · PROXY SEUL ÉCRIVAIN

### Principe

Deux fichiers de profils coexistent en permanence. Ils sont **toujours synchrones**. Le proxy RENDEZVOUS est le **seul point d'écriture autorisé**. Toute écriture directe (manuelle, script, app) est interdite par architecture.

> **Précision D8 (20/06/2026) :** à l'étape `pending` (inscription non encore validée), le proxy n'écrit que dans `profiles-private.json`. Une inscription en attente n'est pas un profil actif — elle n'a pas vocation à apparaître dans `profiles-public.json`. Le bloc "opération atomique" ci-dessous décrit le cas général (profil actif, niveau attribué) ; il s'applique pleinement à partir de la validation admin (R7), pas à la création de la demande (R4). Voir D8 plus bas pour le détail.

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

*(Ce fichier n'est pas encore alimenté en production — la bascule `pending` → `active` qui l'écrirait pour la première fois est prévue à R7. Le schéma ci-dessus reste donc, à ce stade, un schéma cible non encore vérifié contre du code réel.)*

### `profiles-private.json` — données sensibles

**Emplacement :** repo privé dédié `RealCoolclint/rendezvous-profiles-private` (créé et opérationnel — R4, 20/06/2026)
**Accès :** proxy RENDEZVOUS uniquement, via GitHub API + token PAT fine-grained (scope unique sur ce repo, permission Contents Read/write, expiration 1 an — stocké en variable d'environnement Netlify `GITHUB_PAT` et dans le vault Bitwarden "Tranquility Suite")
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

> ### ⚠️ Écart documenté entre ce schéma et le code réel (découverte 21/06/2026, A11)
>
> Le JSON ci-dessus est le **schéma cible**, pensé en anglais dès D1, le 16/06/2026 — avant que R4 soit réellement codé. Le code livré en production (`submit-inscription.js`) utilise une convention différente pour le profil à l'étape `pending`. **C'est cette convention réelle qui fait foi**, pas l'exemple ci-dessus.
>
> | Champ schéma cible (D1, anglais) | Champ réel en production | Remarque |
> |---|---|---|
> | `id` (`uuid-v4`) | `id` (`"p_" + Date.now()`) | **Pas un UUID** — chaîne préfixée par un timestamp en millisecondes. Suffisant comme clé unique tant que le volume reste celui d'une suite interne ; collision théorique uniquement si deux inscriptions arrivent à la même milliseconde — risque résiduel non traité, à garder en tête si le volume explose un jour |
> | `firstName` | `prenom` | — |
> | `lastName` | `nom` | **Collecté et requis depuis l'origine** — corrigé dans `REGISTRE_TRAITEMENTS_RGPD_V1_1.md` le 20/06/2026 ; cette spec ne l'avait jamais répercuté avant V1.2 |
> | `status` | `statut` | valeur identique (`"pending"`) |
> | `createdAt` | `soumisLe` | — |
> | `consentGiven` | `rgpdAccepte` | — |
> | `consentDate` | `rgpdTimestamp` | — |
> | `videoRelation` | `lienVideo` | — |
> | `daemonType` | *(absent)* | **Pas collecté à l'inscription** — n'apparaît pas dans `requiredFields` du code réel. Probablement prévu pour l'onboarding daemon guidé (D5/R7), pas pour le formulaire d'inscription lui-même |
> | `level`, `activatedAt`, `deactivatedAt`, `deleteScheduledAt` | *(absents)* | Cohérent avec D8 — ces champs n'ont de sens qu'à partir de la validation admin (R7), pas à la création `pending` |
>
> **Décision actée (21/06/2026) :** la convention française (`statut`, `prenom`, `nom`, `rgpdAccepte`, `rgpdTimestamp`, `soumisLe`, `lienVideo`) est le standard officiel pour `profiles-private.json`. Pas de migration du code existant vers l'anglais — le code en production fait foi, le document s'aligne sur lui, jamais l'inverse. **Tout développement futur (R5, R7) utilise ces noms réels.** La réconciliation complète du schéma (ajout de `level`, `daemonType`, `activatedAt` etc. au moment de la validation R7) reste portée par le chantier B10/D8, pas par cette correction documentaire.

### Opération d'écriture atomique

Toute modification de profil **actif** (post-validation, R7) = **une seule opération proxy** qui met à jour les deux fichiers simultanément. Si l'une des deux écritures échoue, l'opération entière est annulée (rollback). Jamais un fichier à jour sans l'autre.

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

*(Ce payload est un nouvel artefact créé par R5 — pas de code existant à respecter ici, donc pas de conflit de convention. Les noms de claims JWT standards (`sub`, `iat`, `exp`) restent en anglais par convention technique internationale ; les champs métier (`firstName`, etc.) seront à reconstruire depuis `profiles-public.json` au moment de l'implémentation R5/R6 — donc en anglais, cohérent avec ce fichier-là, qui n'a pas encore divergé puisqu'il n'est pas encore écrit en production.)*

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

| Champ (nom réel en production) | Justification | Conservation |
|---|---|---|
| `prenom` | Identification dans la suite | Durée d'activité |
| `nom` | Identification administrative à l'inscription + notification admin (email RENDEZVOUS) — **collecté et requis depuis l'origine, corrigé en V1.2** | Durée d'activité |
| `email` | Lien magique + notifications | Durée d'activité |
| `role` | Validation accès | Durée d'activité |
| `level` *(ajouté à R7, pas à l'inscription)* | Attribution accès apps | Durée d'activité |
| `rgpdAccepte` + `rgpdTimestamp` | Traçabilité RGPD | Durée d'activité + 1 an |
| `soumisLe` / `activatedAt` *(R7)* | Audit | Durée d'activité + 1 an |

**Données jamais collectées :** téléphone, poste exact, manager, données RH.

*(Le nom de famille a été retiré de cette liste en V1.2 — il était listé ici par erreur depuis V1.0, alors qu'il est requis dans le code depuis l'origine. Voir la table de correspondance complète sous D1.)*

### Suppression — opération atomique

La désactivation d'un profil déclenche une suppression atomique sur les deux fichiers simultanément.

```
[Admin désactive un profil — R7]
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
- Back-office admin affiche : profil actif / inactif / hors ligne
- Aucun impact sur le fonctionnement des apps
- Aucun blocage si heartbeat absent

### R8 — Mode bloquant optionnel (futur)

- Apps desktop vérifient l'âge du dernier heartbeat au démarrage
- Si heartbeat > 48h → app refuse de démarrer + message utilisateur
- Fallback offline 48h garanti (aligné D2)
- **Activation = décision explicite PRÉSIDENCE** — jamais un automatisme
- Paramètre proxy : `heartbeatEnforced: true/false`

---

## D7 — GLASS DRAWER : INSCRIPTION ET CONNEXION EN MODALES PARTAGÉES

### Principe

L'inscription et la connexion ne sont **pas** des pages séparées. Elles s'ouvrent comme des tiroirs ("drawers") en surimpression de la vitrine, via un module générique partagé.

**Historique court :** cette décision renverse une décision D7 antérieure (page séparée `inscription.html`, construite intégralement puis abandonnée le 19/06/2026 après un travail exploratoire en direct). L'itération page séparée est documentée comme abandonnée, non effacée (voir `SESSION_TRAVAIL_20260619_RENDEZVOUS_D7_GLASS_DRAWER.md`).

### Architecture du module

**Fichier :** `glass-drawer.js` — module générique, partagé par `#connect-drawer` (connexion) et `#inscription-drawer` (inscription).

**Comportements garantis :**
- Morph organique depuis le bouton cliqué (le drawer "naît" visuellement du bouton, pas d'apparition brute)
- Hauteur mesurée avant ouverture — anti-saut de position
- Exclusion mutuelle stricte — un seul drawer ouvert à la fois
- Backdrop modal bloquant — clic en dehors = fermeture
- Mercury Opening conditionnel par session conservé intact — règle transverse de la suite, indépendante de l'architecture du formulaire

### Impact sur le contrat d'API

Aucun — le Glass Drawer est une couche de présentation. Les endpoints `POST /register` et `POST /auth/magic-link` sont appelés exactement de la même façon, que le formulaire soit dans une page séparée ou un drawer. Seul le déclenchement (bouton → drawer → formulaire → submit) change côté front-end.

**Statut déploiement :** construit et validé localement le 19/06/2026, mais jamais commité ni poussé avant le 20/06/2026 — piège archivé dans le Carnet de Pièges (toujours vérifier `git status`/`git log` réels, jamais se fier à un récap de session pour confirmer un déploiement).

---

## D8 — R4 : ÉCRITURE EXCLUSIVE `PROFILES-PRIVATE.JSON`, SCHÉMA PUBLIC DIFFÉRÉ

### Principe

Le proxy R4 (inscription) n'écrit **jamais** dans `profiles-public.json` à l'étape `pending`. Une inscription en attente de validation n'est pas un profil actif — elle n'a aucune raison d'apparaître dans le fichier consommé par les apps de la suite.

### Conséquence sur la réconciliation des schémas

Deux modèles de données coexistent actuellement sans réconciliation :
- Le modèle existant `role` + `appPermissions` (historique, utilisé par les apps en orbite)
- Le modèle niveau `N1`→`N4` de D1 (RENDEZVOUS)

Plutôt que de trancher cette réconciliation à l'aveugle pendant la construction du proxy R4, la décision est de la **différer à R7** — au moment de la validation admin, quand le profil bascule réellement de `pending` à `active` et doit recevoir un niveau et des permissions concrètes. C'est à ce moment précis que les deux modèles doivent se rencontrer, pas avant.

> **Complément V1.2 :** la réconciliation R7 devra aussi absorber l'écart de convention de nommage documenté sous D1 (français vs anglais) — pas seulement le modèle `role`/`appPermissions` vs `N1`→`N4`. Trois choses à faire au même moment, pas trois chantiers séparés : niveau, permissions, et nommage des champs.

### Ce que ça signifie pour R5→R8

- R5 (authentification) : le lien magique ne peut être émis que pour un profil déjà `active` — un profil `pending` n'a pas d'accès, par construction (voir D2, cycle de vie du token)
- R7 (back-office) : c'est le chantier qui portera la logique de réconciliation des schémas — pas un correctif a posteriori, une construction prévue dès le départ

---

## D9 — DOMAINE D'ENVOI RESEND : SANDBOX POUR R4, DOMAINE DÉDIÉ DIFFÉRÉ POUR R5

### Constat à l'origine de la décision

`letudiant.fr` n'a jamais été vérifié sur le compte Resend de la suite. Les notifications BackUpFlow/COVENANT, documentées comme envoyées depuis `noreply@letudiant.fr`, utilisent en réalité le bac à sable Resend `onboarding@resend.dev` (vérifié en ouvrant un email réel dans le dashboard). Ce mécanisme fonctionne uniquement parce que le destinataire est toujours le compte Resend lui-même (`mpavloff@letudiant.fr`) — Resend bloque tout envoi vers un tiers sans domaine vérifié.

### Décision actée

1. **Refus explicite de vérifier `letudiant.fr`** — domaine corporate, hors périmètre de la suite. L'IT de L'Étudiant n'est volontairement pas sollicitée, pour préserver l'autonomie technique de la suite — même si ça impose des limites à court terme.
2. La notification admin de R4 reste sur `onboarding@resend.dev` — cas d'usage valide tant que le destinataire est l'admin lui-même.
3. Un domaine dédié à la Tranquility Suite (acheté et contrôlé par l'admin, comme GitHub/Netlify/Bitwarden) sera vérifié au moment de R5 — qui nécessitera d'envoyer de vrais emails (liens magiques) à des utilisateurs autres que l'admin.

**Ce blocage est levé par D10 ci-dessous.**

---

## D10 — DOMAINE RESEND DÉDIÉ VÉRIFIÉ ET ACTIVÉ : `MAIL.TRANQUILITYSUITE.COM`

### Domaine et sous-domaine

Domaine `tranquilitysuite.com` acheté via Cloudflare (registrar + DNS unifiés). Sous-domaine d'envoi dédié `mail.tranquilitysuite.com` choisi plutôt que le domaine racine — isole la réputation d'envoi, garde la racine libre pour un usage futur non lié à l'email.

### Vérification

Vérifié via le bouton "Auto configure" de Resend — intégration **Cloudflare Domain Connect**, autorisation à usage unique explicitement affichée ("ne permet pas à Resend d'effectuer de futures modifications") — pas d'OAuth permanent, aucune révocation d'accès à prévoir.

**Enregistrements DNS posés automatiquement** (mode "DNS uniquement", grey cloud) :
- MX (`feedback-smtp`)
- TXT DKIM
- TXT SPF

Domaine passé en statut **Verified** en 9 minutes.

> **Complément B14 (21/06/2026) :** un 4ème enregistrement recommandé par Resend (DMARC) n'avait pas été posé par l'auto-configure. Ajouté manuellement (`_dmarc.tranquilitysuite.com`, `v=DMARC1; p=none;`), propagation confirmée. **Toujours comparer l'email de vérification complet de Resend à ce qui est réellement posé — l'auto-configure ne pose pas systématiquement tout ce qu'il recommande.**

### Activation dans le code (B13)

La fonction de notification `notifierMartin()` a été renommée `notifierAdmin()` (vocabulaire de rôle, D12) et son `from` basculé vers `notifications@mail.tranquilitysuite.com`. Testée en conditions réelles, email confirmé *Delivered*.

**Point de vigilance ouvert (B14, non bloquant pour R5) :** un domaine d'envoi neuf part par défaut en spam chez les gros fournisseurs (réputation, pas un défaut de configuration DNS) — le chauffage de réputation se fait dans le temps, à surveiller en parallèle du développement de R5.

### Ce que ça débloque

R5 (authentification par lien magique) peut démarrer : le domaine capable d'envoyer à de vrais utilisateurs (pas seulement à l'admin) est vérifié et actif dans le code.

---

## D12 — VOCABULAIRE DE RÔLE : IMPACT SUR LE CODE DE CE CONTRAT

Principe transverse à toute la suite (pas spécifique à RENDEZVOUS) : le code et les textes visibles par l'utilisateur ne portent jamais de nom personnel. Le rôle (`ADMIN`) prime sur la personne, même quand l'admin est aujourd'hui un titulaire unique.

**Application dans ce contrat :**
- `notifierMartin()` → `notifierAdmin()` — la fonction notifie qui détient le rôle ADMIN, pas une personne nommément
- Dans la description de l'endpoint `POST /register` ci-dessous, "email à l'admin" remplace "email à Martin"

**Hors périmètre immédiat :** ce principe s'applique au code et aux textes UI, pas à la documentation interne décrivant le fonctionnement humain (ex. : les diagrammes d'architecture continuent de dire "l'admin valide", ce qui reste vrai et clair, sans figer un nom dans le code).

**Audit suite-wide noté, non traité :** vérifier la présence du nom personnel ailleurs dans le code (COVENANT, BackUpFlow) — reste une prochaine étape, hors périmètre de ce document.

---

## RÉFÉRENCE CROISÉE — DÉCISIONS DESIGN (D11, D13)

Deux décisions architecturales touchent exclusivement aux tokens CSS de RENDEZVOUS. Elles sont actées ici pour mémoire, mais leur détail technique complet vit dans `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` et `CARNET_PIEGES_V18.md` — pas de duplication, une seule source de vérité par sujet.

| # | Décision | Essence |
|---|----------|---------|
| D11 | RENDEZVOUS n'a pas de sidebar — convention `--topbar-*` | Variables `--sidebar-*` renommées en `--topbar-*` (RENDEZVOUS n'a jamais eu de sidebar). Détail complet : Carnet de Pièges. |
| D13 | RENDEZVOUS aligné sur les valeurs officielles de `tranquility-core.css` | 25 tokens dupliqués localement supprimés de `:root` ; le core évolue désormais par sessions DESIGN + R&D dédiées, jamais en correctif réactif. Détail complet : Plan Directeur + Carnet de Pièges. |

---

## ENDPOINTS PROXY RENDEZVOUS

Tous les endpoints sont exposés par la Netlify Function dédiée RENDEZVOUS.
**Base URL :** `https://rendezvous-proxy-tranquility.netlify.app/api/rendezvous` *(instance dédiée confirmée et opérationnelle depuis R4 — distincte du site COVENANT)*

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

**Statut :** ✅ Livré et testé en production (R4, commits `9f1964e`, `0b83ec5`, `ca7b5ab`) — **restriction de domaine ajoutée et vérifiée le 21/06/2026 (commit `2149ff5`)**

**Payload entrant (réel) :**
```json
{
  "prenom": "Anne",
  "nom": "Martin",
  "email": "anne.martin@letudiant.fr",
  "role": "Journaliste vidéo",
  "lienVideo": "Je tourne 2 sujets par semaine",
  "rgpdAccepte": true
}
```

*(`daemonType` n'est pas collecté à ce stade — voir table de correspondance sous D1.)*

**Actions proxy (réelles) :**
1. Valide que `prenom`, `nom`, `email`, `role`, `lienVideo` sont des chaînes non vides
2. Vérifie le format générique de l'email (regex `^[^\s@]+@[^\s@]+\.[^\s@]+$`)
3. **Vérifie que l'email se termine par `@letudiant.fr`** (insensible à la casse) — sinon `jsonResponse(400, { error: "Seules les adresses email @letudiant.fr sont acceptées." })`. Ajouté le 21/06/2026, vérifié en conditions réelles (rejet confirmé sur domaine externe, acceptation confirmée sur `@letudiant.fr`)
4. Vérifie que `rgpdAccepte === true`
5. Génère un `id` (`"p_" + Date.now()` — pas un UUID, voir D1)
6. Crée l'entrée dans `profiles-private.json` (statut `pending`) — **uniquement ce fichier (D8)**
7. *(`profiles-public.json` non touché à ce stade — voir D8)*
8. Envoie notification email à l'admin via Resend (`notifierAdmin()`, ex-`notifierMartin()` — D12) depuis `notifications@mail.tranquilitysuite.com` (D10, B13), contenant prénom, nom, email, rôle et lien vidéo

**Réponse (réelle) :**
```json
{ "success": true }
```

*(Et non `{ "status": "pending", "message": "..." }` comme l'affirmait une version antérieure de cette spec — le message de confirmation utilisateur vit côté front-end, pas dans la réponse du proxy.)*

> ### ✅ Résolu en V1.3 — restriction de domaine
>
> V1.2 documentait l'absence de filtre de domaine comme un point ouvert non traité. **C'est désormais corrigé** : le code restreint l'inscription aux adresses `@letudiant.fr`, conforme à l'intention d'origine de la Vision Produit. Vérifié en conditions réelles le 21/06/2026 — rejet 400 sur domaine externe, acceptation 200 sur `@letudiant.fr`, profils de test nettoyés de `rendezvous-profiles-private` après vérification.

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

À partir de R5 (authentification active — tous les préalables D9/D10/B13 levés), chaque app desktop vérifie le token au démarrage :

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

*Ce bloc alimente le registre des traitements à remettre à Audrey Weiss. Voir `REGISTRE_TRAITEMENTS_RGPD_V1_1.md` pour la version complète et à jour (nom de famille + périmètre Resend corrigés, c'est la version qui fait foi).*

| Champ | Valeur |
|---|---|
| **Nom du traitement** | Gestion des accès — Tranquility Suite |
| **Responsable de traitement** | L'Étudiant — représenté par Martin Pavloff |
| **Finalité** | Gestion des accès aux outils internes de production vidéo |
| **Base légale** | Intérêt légitime (article 6.1.f RGPD) |
| **Données traitées** | Prénom, nom, email professionnel, rôle, niveau d'accès, horodatage consentement |
| **Données NON traitées** | Téléphone, données RH, géolocalisation |
| **Destinataires** | Martin Pavloff (admin) — Resend, domaine dédié `mail.tranquilitysuite.com` (email transactionnel) — GitHub (stockage) |
| **Transfert hors UE** | GitHub (USA) — couvert par DPA GitHub / clauses contractuelles types |
| **Durée de conservation** | Durée d'activité du profil + 1 an pour données d'audit |
| **Droits des personnes** | Accès, rectification, effacement (suppression atomique D4), opposition |
| **DPO requis** | Non — L'Étudiant < 250 employés, traitement non à grande échelle |
| **Mesures de sécurité** | Données sensibles en repo privé GitHub dédié — tokens JWT signés — denylist — HTTPS — domaine d'envoi dédié et vérifié — inscription restreinte au domaine `@letudiant.fr` |

---

## RÈGLES DE SÉCURITÉ NON NÉGOCIABLES

1. **Jamais de token dans l'URL** — toujours en header `Authorization: Bearer` ou body POST
2. **Jamais de données sensibles dans `profiles-public.json`** — email, nom de famille, RGPD = privé uniquement
3. **Toute écriture passe par le proxy** — aucune exception, aucun script de contournement
4. **La denylist est vérifiée au démarrage** — même hors ligne (cache local obligatoire)
5. **Le PAT GitHub du proxy** est dans les variables d'environnement Netlify — jamais dans le code
6. **Les domaines autorisés** pour les requêtes proxy : `realcoolclint.github.io` uniquement (CORS strict)
7. **Le domaine corporate `letudiant.fr` n'est jamais vérifié sur Resend** — autonomie technique de la suite, refus explicite et assumé (D9)
8. **L'inscription est restreinte aux emails `@letudiant.fr`** — vérifié en code depuis le 21/06/2026, confirmé en conditions réelles (commit `2149ff5`)

---

## VERSIONS ET ÉVOLUTION

| Version | Date | Changements |
|---|---|---|
| V1.0 | 18/06/2026 | Création — D1→D6 traduits en spec technique |
| V1.1 | 21/06/2026 | Intégration D7→D13 : Glass Drawer (D7), écriture pending différée (D8), domaine Resend sandbox→dédié (D9/D10), vocabulaire de rôle dans le code (D12), renvoi croisé design (D11/D13) ; corrections : emplacement réel `profiles-private.json`, Base URL proxy confirmée |
| V1.2 | 21/06/2026 | Correction RGPD (nom de famille collecté, pas "non stocké") ; table de correspondance schéma réel (français) vs schéma illustratif (anglais, D1) ; endpoint `/register` corrigé (payload, actions, réponse réels) ; note de vigilance sur l'absence de restriction de domaine |
| V1.3 | 21/06/2026 | **Clôture de la note de vigilance V1.2** : restriction `@letudiant.fr` codée, déployée et vérifiée en conditions réelles (commit `2149ff5`, repo `rendezvous-proxy`) — rejet 400 confirmé sur domaine externe, acceptation 200 confirmée sur `@letudiant.fr`. Profils de test nettoyés de `rendezvous-profiles-private` (5 entrées supprimées, dont 2 antérieures à la session, non liées à ce correctif). Règle de sécurité n°8 ajoutée. |

*Ce document évolue avec chaque décision architecturale actée par la PRÉSIDENCE.*
*Toute modification doit être validée contre les treize décisions fondatrices D1→D13.*

---

*Spec Technique · RENDEZVOUS · V1.3 · Tranquility Suite · Cellule Vidéo L'Étudiant · 21 juin 2026*
*Martin Pavloff · JARVIS*
