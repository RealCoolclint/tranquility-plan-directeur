# Tranquility Services Tiers
## Inventaire des dépendances externes critiques
### Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 1.2 — 9 juin 2026*

---

> **Mode d'emploi de ce document**
> Ce document est la carte des dépendances critiques de la Tranquility Suite vis-à-vis de services extérieurs. Il répond à une seule question : *si ce service disparaît demain, qu'est-ce qui s'arrête, et qu'est-ce qu'on fait ?*
>
> Il couvre aussi la gouvernance des accès et le protocole de succession — ce que doit savoir un successeur pour reprendre la suite sans perte.

---

## GOUVERNANCE DES ACCÈS

### Situation actuelle

Tous les comptes critiques de la Tranquility Suite (GitHub, Netlify, Resend) sont créés sur l'adresse personnelle Gmail de Martin Pavloff. Les mots de passe sont stockés dans le Keychain macOS — un Keychain par Mac, non synchronisés entre eux. Il n'existe pas de copie des accès en dehors des Keychains locaux.

**Conséquence directe :** si Martin quitte L'Étudiant sans préavis, ou si les Macs deviennent inaccessibles, la suite est orpheline. Aucun successeur ne peut reprendre les accès sans intervention de Martin.

**C'est une dette de sécurité critique. Elle est documentée et fait l'objet du chantier B7.**

---

### Solution actée — Chantier B7

**Décision PRESIDENCE — 9 juin 2026**

| Champ | Valeur |
|-------|--------|
| **Outil retenu** | Bitwarden — gestionnaire de mots de passe |
| **Plan** | Free (suffisant — partage avec 1 personne inclus) |
| **Coffre dédié** | "Tranquility Suite" |
| **Comptes à y déposer** | GitHub · Netlify · Resend · Monday |
| **Email de création Bitwarden** | À décider — `mpavloff@letudiant.fr` recommandé (rattachement institutionnel) |
| **Sécurité du compte Bitwarden** | Mot de passe maître fort + code de récupération imprimé, rangé physiquement au bureau |
| **Statut** | ⚫ À faire |

**Pourquoi Bitwarden :**
- Gratuit et open source (audité publiquement)
- Coffres partageables — transfert à un successeur en un clic
- Disponible Mac, iPhone, navigateur
- Exportable si changement d'outil

**Objectif à long terme (Apollo) :**
Migrer les comptes GitHub, Netlify et Resend vers une adresse institutionnelle ou un compte "rôle" dédié à la cellule (ex. `tranquility@letudiant.fr`). Aujourd'hui : Option B (documentation + protocole de transfert). Demain : Option A (compte rôle).

---

### Protocole de transfert — Succession

Ce protocole s'applique en cas de départ de Martin Pavloff, prévu ou non.

**Étape 1 — Accès Bitwarden**
Le successeur reçoit l'accès au coffre "Tranquility Suite" dans Bitwarden. Martin partage le coffre depuis l'interface Bitwarden. Si Martin est indisponible : le code de récupération imprimé au bureau permet à un admin IT de récupérer le compte.

**Étape 2 — GitHub**
Transférer la propriété du compte `RealCoolclint` ou inviter le successeur comme collaborateur sur tous les repos critiques. Repos à transférer en priorité : `tranquility-core`, `Reviewer`, `covenant`, `ROVER`, `launcher-profiles`, `tranquility-plan-directeur`.

**Étape 3 — Netlify**
Transférer l'instance `musical-tanuki-a691a5` vers le compte du successeur via les paramètres Netlify (Transfer site ownership). Ou recréer le proxy depuis zéro — la procédure est documentée dans les sessions COVENANT C2b.

**Étape 4 — Resend**
Transférer le domaine d'envoi et la clé API vers un nouveau compte Resend. Mettre à jour la variable d'env Netlify : `npx netlify env:set RESEND_API_KEY "nouvelle_clé" --force`.

**Étape 5 — Monday.com**
Compte entreprise L'Étudiant — contacter l'admin IT pour transférer les droits d'accès au board `5033664702`.

**Étape 6 — Macs**
Le successeur a besoin des trois Macs ou d'un accès aux repos GitHub pour récupérer le code source. Les apps desktop sont dans `~/Documents/GitHub/` sur chaque Mac.

**Étape 7 — Documentation**
Lire dans l'ordre : `TRANQUILITY_COMPASS.md` → `TRANQUILITY_PLAN_DIRECTEUR.md` → `TRANQUILITY_SUITE_DESIGN_REFERENCE.md`. Ces trois documents suffisent à comprendre la suite.

---

## 1. Services cloud

### GitHub

| Champ | Valeur |
|-------|--------|
| **Usage** | Hébergement code source · GitHub Pages (apps web) · Shared Data Layer (`tranquility-core`) · Releases desktop · Profils équipe |
| **Compte** | `RealCoolclint` |
| **Criticité** | 🔴 Maximale — c'est le cloud unique de la suite |
| **Apps dépendantes** | Toute la suite sans exception |
| **Plan** | Free (GitHub Pages public uniquement) |
| **Identifiant** | Email Gmail personnel Martin |
| **MDP** | Keychain Mac Bureau (`mpavloff`) → à migrer vers Bitwarden (B7) |
| **Authentification CLI** | `gh` CLI — token stocké en Keychain macOS · authentifié sur Mac Maison + Mac Bureau |
| **Limite connue** | GitHub Pages = repos publics uniquement — COVENANT et covenant-proxy sont publics par nécessité |
| **URL de statut** | https://www.githubstatus.com |

**Repos critiques en production :**

| Repo | Branche | Rôle |
|------|---------|------|
| `tranquility-core` | `master` | Shared data layer — CSS + JSON |
| `Reviewer` | `main` | App web en orbite |
| `EasyCallSheet` | `main` | App web Manifest (dette B5 — renommage) |
| `covenant` | `master` | App web COVENANT |
| `covenant-proxy` | `master` | Proxy Netlify Resend |
| `tranquility-plan-directeur` | `main` | Roadmap officielle |
| `launcher-profiles` | — | Profils privés — sync cross-Mac |
| `ROVER` | `main` | App desktop (Git LFS actif) |
| `true-me` | — | Données TRUE_ME (privé) |

**Alternative si GitHub tombe :**
Apps desktop fonctionnent en local si déjà installées. Apps web (Reviewer, Manifest, COVENANT) inaccessibles. Profils non chargés — mode dégradé local (chantier B4 à formaliser). En pratique : attendre, les pannes GitHub durent rarement plus d'une heure.

---

### Netlify

| Champ | Valeur |
|-------|--------|
| **Usage** | Proxy serverless pour les appels Resend — protège la clé API côté client |
| **Instance** | `musical-tanuki-a691a5` |
| **Apps dépendantes** | COVENANT |
| **Criticité** | 🟠 Haute — COVENANT ne peut pas envoyer d'email si Netlify est down |
| **Plan** | Free |
| **Identifiant** | Email Gmail personnel Martin |
| **MDP** | Keychain Mac Bureau (`mpavloff`) → à migrer vers Bitwarden (B7) |
| **Authentification CLI** | `npx netlify` — token stocké localement sur Mac Maison |
| **Limite connue** | Interface Netlify tronque les longues valeurs d'env → toujours `npx netlify env:set "valeur" --force` en CLI |
| **URL de statut** | https://www.netlifystatus.com |

**Alternative si Netlify tombe :**
Triple sécurité COVENANT dégrade proprement : PDF local téléchargeable (niveau 1). Niveaux 2 et 3 (emails Resend) silencieusement perdus jusqu'au retour. Durée typique : < 2h.

---

### Resend

| Champ | Valeur |
|-------|--------|
| **Usage** | Envoi emails transactionnels — confirmation backup (BackUpFlow) + contrats signés (COVENANT) |
| **Apps dépendantes** | BackUpFlow · COVENANT · Launcher (signalement problème — bug ouvert) |
| **Criticité** | 🟠 Haute |
| **Plan** | Free — 100 emails/jour · 3 000 emails/mois |
| **Identifiant** | Email Gmail personnel Martin |
| **MDP** | Keychain Mac Bureau (`mpavloff`) → à migrer vers Bitwarden (B7) |
| **Clé API** | Netlify env vars (COVENANT) + Keychain macOS via Launcher MASTER (BackUpFlow) — jamais dans le code |
| **Limite connue** | 100 emails/jour en plan Free — suffisant en conditions normales. Surveiller après journée intense de tournages avec beaucoup de contrats COVENANT. |
| **URL de statut** | https://resend.com/status |

**Alternative si Resend tombe ou quota dépassé :**
BackUpFlow : backup termine normalement, seul le mail de confirmation est perdu. COVENANT : PDF local disponible, envoi email impossible. Si quota dépassé durablement : Resend Pro (~$20/mois, 5 000 emails). Alternatives à terme : Brevo (300/jour gratuit), SendGrid (100/jour gratuit), Postmark (payant, très fiable). Migration = modifier `send-email.js` sur covenant-proxy uniquement.

---

### Monday.com

| Champ | Valeur |
|-------|--------|
| **Usage** | Suivi de production vidéo · Intégration Transporter (sous-éléments valise) · Intégration BackUpFlow (mise à jour statut) |
| **Board ID** | `5033664702` |
| **Apps dépendantes** | BackUpFlow · Transporter |
| **Criticité** | 🟡 Moyenne — les apps fonctionnent sans Monday |
| **Plan** | Compte Entreprise L'Étudiant — **sans droits admin** |
| **Identifiant** | `mpavloff@letudiant.fr` |
| **MDP** | Compte IT L'Étudiant — contacter admin IT pour transfert ou réinitialisation |
| **Token API** | `~/Library/Application Support/TransPorter/monday-config.json` (Transporter) + Keychain macOS (BackUpFlow) |
| **Limite connue** | Pas de droits admin → pas de liens publics, pas de token API autonome. Monday bloque les IPs des clouds publics (HTTP 403) — appels depuis Electron uniquement. CORS bloque les appels directs depuis apps web. |
| **URL de statut** | https://status.monday.com |

**Alternative si Monday tombe :**
BackUpFlow et Transporter fonctionnent normalement sans Monday. Suivi de production en mode manuel. Durée typique : < 4h.

---

### Gofile.io

| Champ | Valeur |
|-------|--------|
| **Usage** | Upload rushes compressés pour partage immédiat à distance |
| **Apps dépendantes** | BackUpFlow · Transporter |
| **Criticité** | 🟡 Moyenne — backup SSD + NAS reste possible sans Gofile |
| **Plan** | Free anonyme — aucun compte requis |
| **Identifiant** | Aucun |
| **MDP** | — |
| **Limite connue** | Fichiers hébergés temporairement — ne pas utiliser comme archivage long terme. Pas de SLA ni de garantie de pérennité du service. |

**Alternative si Gofile tombe :**
Backup continue normalement. Partage distant manuel (WeTransfer, lien NAS si accessible en HTTPS). Si Gofile devient instable durablement : WeTransfer API ou Filebin comme remplacement.

---

## 2. Binaires locaux

### yt-dlp

| Champ | Valeur |
|-------|--------|
| **Usage** | Téléchargement vidéo multi-plateformes (YouTube, Instagram, TikTok, +1000) |
| **Apps dépendantes** | ROVER |
| **Type** | Binaire embarqué dans le bundle Electron via `asarUnpack` |
| **Criticité** | 🔴 Maximale pour ROVER |
| **Fréquence de mise à jour** | Mensuelle (préventif) ou immédiate sur rupture plateforme |
| **Procédure update** | `pip install -U yt-dlp` → rebuild ROVER → nouvelle release |
| **Politique formalisée** | ⚫ Chantier B6 à faire |
| **Limite connue** | TikTok watermark : `--extractor-args "tiktok:api_hostname=api16-normal-c-useast1a.tiktokv.com"` — Electron uniquement. Format selector : `bestvideo[height<=H]+bestaudio/bestvideo[height<=H]/best` — jamais contraindre le codec sur Instagram. |
| **Source** | https://github.com/yt-dlp/yt-dlp |

**Alternative si yt-dlp est cassé :**
Mettre à jour en priorité — la communauté corrige les régressions majeures en < 24h. Téléchargement manuel navigateur en dernier recours.

---

### HandBrakeCLI

| Champ | Valeur |
|-------|--------|
| **Usage** | Compression vidéo avant envoi NAS (BackUpFlow) et compression rushes web (ROVER) |
| **Apps dépendantes** | BackUpFlow · ROVER |
| **Version installée** | HandBrake 1.11.1 |
| **Criticité** | 🟠 Haute — compression impossible, mais backup/téléchargement reste possible |
| **Preset utilisé** | `Fast 1080p30` — seul preset disponible dans HB 1.11.1 |
| **⚠️ DETTE E1** | Preset `Fast 1080p25` référencé dans BackUpFlow n'existe pas dans HB 1.11.1 → corriger en `Fast 1080p30` |
| **Installation** | `brew install handbrake` |
| **Vérification presets** | `HandBrakeCLI --preset-list` |

**Alternative si HandBrakeCLI absent ou cassé :**
BackUpFlow continue en copie brute sans compression. Secours compression : `ffmpeg -vcodec libx264 -crf 23`.

---

### ffmpeg

| Champ | Valeur |
|-------|--------|
| **Usage** | Post-traitement vidéo — probe métadonnées, fusion audio/vidéo (yt-dlp) |
| **Apps dépendantes** | ROVER (indirectement via yt-dlp) |
| **Criticité** | 🟠 Haute pour ROVER sur certains formats |
| **Installation** | `brew install ffmpeg` |
| **Limite connue** | Probe lente sur gros fichiers → `-show_entries format=duration` uniquement. Ne jamais cibler un bitrate supérieur au bitrate source. |

---

### Node.js

| Champ | Valeur |
|-------|--------|
| **Usage** | Runtime Electron — toutes les apps desktop |
| **Apps dépendantes** | Launcher · BackUpFlow · Transporter · ARK · ROVER |
| **Criticité** | 🔴 Maximale |
| **Version de référence** | Node v25+ |
| **Installation** | https://nodejs.org ou `brew install node` |
| **Limite connue** | `better-sqlite3` incompatible Node v25+ → toujours `sql.js` pour SQLite |

---

## 3. Dépendances npm critiques

| App | Package | Usage | Criticité | Notes |
|-----|---------|-------|-----------|-------|
| **COVENANT** | `pdf-lib` | Génération PDF côté client | 🔴 | Seule lib compatible iPad Safari |
| **COVENANT** | `signature_pad` | Capture signature numérique | 🔴 | `penColor: '#ffffff'` — blanc sur fond bleu |
| **ROVER** | `sql.js` | SQLite WebAssembly | 🔴 | Seule option Node v25+ |
| **TOUTES DESKTOP** | `electron` | Runtime apps desktop | 🔴 | Toujours en `devDependencies` |
| **TOUTES DESKTOP** | `electron-builder` | Build DMG | 🟠 | Séquence obligatoire : `CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder --mac dir` → codesign → hdiutil |
| **TOUTES DESKTOP** | `keytar` | Keychain macOS | 🟠 | Stockage clés API — jamais en clair |
| **TRANSPORTER** | `archiver` | Création ZIP | 🟠 | ZIP level 0 ~20.3 Mo/s |

---

## 4. Politique de mise à jour

| Service | Fréquence | Déclencheur | Responsable |
|---------|-----------|-------------|-------------|
| **GitHub / Netlify / Resend** | Jamais (services managés) | — | Automatique |
| **Monday.com** | Jamais (service entreprise) | — | IT L'Étudiant |
| **yt-dlp** | Mensuelle ou immédiate sur rupture | Site majeur qui échoue | Martin |
| **HandBrakeCLI** | Sur bug bloquant uniquement | Compression en erreur | Martin |
| **Node.js / npm** | Par chantier — jamais en production isolée | Incompatibilité signalée | Martin |

### Signaux d'alerte

| Signal | Cause probable | Action |
|--------|---------------|--------|
| ROVER ne télécharge plus YouTube | yt-dlp périmé | `pip install -U yt-dlp` + rebuild ROVER |
| ROVER ne télécharge plus TikTok | Changement API TikTok | Vérifier `--extractor-args`, issues yt-dlp GitHub |
| COVENANT n'envoie plus d'email | Resend ou Netlify down / quota dépassé | Dashboard Resend + statut Netlify |
| BackUpFlow n'envoie plus le mail | Resend down ou quota | Dashboard Resend |
| BackUpFlow compression en erreur | Dette E1 — preset incorrect | Corriger `Fast 1080p25` → `Fast 1080p30` |
| GitHub Pages ne se met plus à jour | Build non déclenché | `gh api repos/RealCoolclint/[repo]/pages/builds -X POST` |
| Profils ne se chargent plus | tranquility-core GitHub Pages down | Mode dégradé local — B4 à formaliser |
| Erreur Monday HTTP 403 | Monday bloque les IPs cloud | Normal — appels Monday depuis Electron uniquement |

---

## 5. Scénarios de panne

### GitHub down
**Impact :** Apps web inaccessibles. Profils non chargés. **Action :** Attendre — pannes rarement > 1h. https://www.githubstatus.com

### Netlify down
**Impact :** COVENANT ne peut plus envoyer d'email. PDF local reste disponible. **Action :** Informer l'utilisateur terrain. Durée typique < 2h.

### Resend — quota dépassé ou down
**Impact :** Emails silencieusement perdus (BackUpFlow + COVENANT). **Action :** Dashboard Resend. Si quota structurellement dépassé : Resend Pro (~$20/mois) ou migration Brevo.

### Monday.com down
**Impact :** Pas de mise à jour statut projet. Apps fonctionnent normalement. **Action :** Mise à jour Monday manuelle si critique. Durée typique < 4h.

### Gofile.io down
**Impact :** Pas de lien de partage. Backup SSD + NAS non affecté. **Action :** Partage alternatif manuel.

### yt-dlp — rupture plateforme
**Impact :** ROVER inopérant sur les plateformes affectées. **Action :** `pip install -U yt-dlp` + rebuild. Correctifs communauté en général < 24h.

### HandBrake — preset introuvable
**Impact :** Compression en erreur dans BackUpFlow. **Action :** Corriger dette E1. Vérifier : `HandBrakeCLI --preset-list`.

---

## Annexe — Tableau de synthèse

| Service | Apps | Criticité | Plan | Identifiant | MDP |
|---------|------|-----------|------|-------------|-----|
| **GitHub** | Toute la suite | 🔴 | Free | Gmail perso Martin | Keychain Mac Bureau → Bitwarden (B7) |
| **Netlify** | COVENANT | 🟠 | Free | Gmail perso Martin | Keychain Mac Bureau → Bitwarden (B7) |
| **Resend** | BackUpFlow · COVENANT | 🟠 | Free 100/j | Gmail perso Martin | Keychain Mac Bureau → Bitwarden (B7) |
| **Monday.com** | BackUpFlow · Transporter | 🟡 | Entreprise | `mpavloff@letudiant.fr` | Compte IT L'Étudiant |
| **Gofile.io** | BackUpFlow · Transporter | 🟡 | Free anonyme | Aucun | — |
| **yt-dlp** | ROVER | 🔴 | Open source | — | — |
| **HandBrakeCLI** | BackUpFlow · ROVER | 🟠 | Open source | — | — |
| **ffmpeg** | ROVER | 🟠 | Open source | — | — |
| **Node.js** | Toutes desktop | 🔴 | Open source | — | — |

---

*TRANQUILITY_SERVICES_TIERS.md · V1.2 · 9 juin 2026*
*Document fondateur — Tranquility Suite · Cellule Vidéo L'Étudiant*
*À mettre à jour à chaque ajout ou suppression d'un service tiers dans la suite*
