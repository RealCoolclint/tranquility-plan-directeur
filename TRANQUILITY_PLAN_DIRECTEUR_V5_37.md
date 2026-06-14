# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.37 — 14 juin 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Philosophie centrale : le workflow captif.**
La suite est conçue pour que les bonnes pratiques de l'équipe soient encodées dans les outils — pas confiées à la mémoire ou à la rigueur individuelle. La conformité est une conséquence de l'usage, pas un effort conscient. Chaque chantier, chaque feature, chaque décision d'architecture est évalué contre cette philosophie avant d'être validé.
*Référence complète : `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` · Grille opérationnelle : `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md`*

**Mode de travail : l'Agence Tranquility.**
Travailler sur la suite, c'est opérer en mode Agence — une réorganisation du cerveau en 23 cellules expertes réparties en 6 familles : Commandement, Création, Réalisation, Garantie, Humain, Rayonnement. Martin Pavloff est le titulaire unique de tous les postes. JARVIS est l'interface opérationnelle de chaque cellule.
*Référence complète : `AGENCE_TRANQUILITY_MANIFESTE.md` · Agents : `AGENCE_TRANQUILITY_AGENTS.md` · Protocole : `AGENCE_TRANQUILITY_COUNCIL_SKILL.md`*

**Points Présidence — sessions régulières.**
Des sessions de bilan d'alignement et de pilotage général sont institutionnalisées. Elles ne sont pas greffées sur des sessions techniques — elles ont leur propre espace. Fréquence cible : trimestrielle minimum. Première session réalisée le 7 juin 2026.

**Principe technique :** GitHub = cloud de la Tranquility Suite.

**Workflow Git — Mac Switching :** `PROTOCOLE_GIT_MAC_SWITCHING.md` — clone dans `~/Documents/GitHub/` sur chaque Mac, pull au début, push à la fin. Toujours.

**Vision produit complète :** `TRANQUILITY_SUITE_VISION_PRODUIT.md` — document fondateur, à lire avant tout chantier. ⚠️ Révision nécessaire — potentiellement obsolète sur plusieurs points depuis avril 2026.

---

## Stratégie IA — Décisions PRESIDENCE (14 juin 2026)

**Principe :** IA gratuite uniquement en phase Gemini et Apollo. Post-Apollo si modèle économique associé à la suite.

**Architecture en 3 approches :**
- **Approche A** — Binding Node.js natif, embarqué dans le DMG. Zéro dépendance externe. (Whisper, Tesseract, RNNoise)
- **Approche B** — Processus Python externe. Mac Studio uniquement, usage interne Martin/Antoine. Jamais distribué à l'équipe.
- **Approche C** — Ollama comme serveur local. Installé une fois, toutes les apps en bénéficient.

**Règle des points d'entrée :** dans chaque app où l'IA a une valeur identifiée, une fonction fait aujourd'hui le travail mécanique et appellera l'IA en Phase Apollo. Elle n'affecte pas le comportement actuel.

**Veille IA :** process permanent. JARVIS veille passive à chaque session. Revue mensuelle premier lundi du mois. Audit semestriel janvier/juillet.

*Références complètes : `TRANQUILITY_IA_STRATEGIE.md` · `TRANQUILITY_VEILLE_IA.md`*

---

## Versioning canonique — Décision PRESIDENCE (12 juin 2026)

**Format unique pour toute la suite, toutes apps présentes et futures :**

`V[MAJEUR].[JOUR].[MOIS].[ANNÉE]`

Exemples : `V1.12.06.26`, `V2.03.09.26`

- Le jour et le mois sont toujours sur 2 chiffres
- L'année sur 2 chiffres
- Ce format s'applique au `package.json`, aux DMG, aux noms de release, aux fiches produit
- La date = date du build/déploiement, jamais la date d'ouverture du chantier

---

## Shared Data Layer — Pattern architectural officiel

Le repo `tranquility-core` (GitHub Pages) est le hub de données en lecture seule de la suite. Tout fichier JSON hébergé à sa racine constitue une donnée partagée accessible par toutes les apps, sur tous les navigateurs, sur tous les Mac.

**Règles :**
- **Lecture :** toute app, tout navigateur, tout Mac
- **Écriture :** MASTER uniquement, via push Terminal sur le repo `tranquility-core` (branche `master`)
- **Fetch :** toujours `{ cache: 'no-cache' }`, validation du type de réponse (`Array.isArray()` ou équivalent), fallback gracieux si le fetch échoue

**Inventaire :**

| Fichier | URL | Rôle | État |
|---------|-----|------|------|
| `tranquility-core.css` | `https://realcoolclint.github.io/tranquility-core/tranquility-core.css` | Design system | ✅ En production |
| `profiles-public.json` | `https://realcoolclint.github.io/tranquility-core/profiles-public.json` | Profils allégés + emailPrefix | ✅ En production — emailPrefix ajouté 08/06/2026 |
| `managers.json` | `https://realcoolclint.github.io/tranquility-core/managers.json` | Responsables projet/vidéo | ✅ En production — `a622e12` |
| `apps-catalog.json` | — | Catalogue apps | ⚫ Conditionnel — 10+ apps en orbite |

---

## Phase Mercury — ✅ Clôturée — 9 avril 2026

**Progression : 100%**

---

## Phase Gemini — Active

### Inventaire de flotte Gemini

| # | App | Type | État |
|---|-----|------|------|
| 1 | **ROVER** | Desktop | 🟣 En orbite — V1.04.06.26 |
| 2 | **COVENANT** | Web | 🔵 En lancement — C1→C7 ✅ · C9 ✅ · C11 ✅ · C12 ✅ · PWA ✅ · C10 ⚫ fermé |
| 3 | **READBACK** | Desktop | ⚫ En projet |
| 4 | **PAYLOAD** | Desktop + Mobile | ⚫ En projet |

### Chantiers d'infrastructure Gemini

| # | Chantier | Type | État |
|---|----------|------|------|
| I1 | **Launcher bugs** — DMG + Resend | Infrastructure | ✅ Terminé — 06/06/2026 |
| I2 | **APPS_CATALOG externalisé** | Infrastructure | ⚫ Conditionnel — 10+ apps en orbite |
| I3 | **managers.json** — Shared Data Layer | Infrastructure | ✅ Terminé — 02/06/2026 |
| I4 | **SSD recovery** — protocole migration | Infrastructure | ⚫ À faire — nouveau SSD requis |
| I5 | **managers.json** — arbitrages + schema | Infrastructure | ✅ Terminé — 02/06/2026 |
| I6 | **tranquility-web-template** | Infrastructure | ✅ Terminé — commit `a9733ed` — 14/06/2026 |
| **B7** | **Bitwarden** — vault "Tranquility Suite" | Infrastructure | ✅ Terminé — 5 entrées — 13/06/2026 |

---

## I6 — tranquility-web-template — ✅ Terminé (14 juin 2026)

**Décision PRESIDENCE :** I6 = Phase Gemini. On ne laisse pas la dette traîner.

**Référence absolue :** Reviewer — splash Mercury, sélecteur de profil, top bar, layout général.

**Livrable :** repo `RealCoolclint/tranquility-web-template` — GitHub Template Repository activé.

**Contenu :**
- `index.html` — splash Mercury, sélecteur de profil, top bar, layout vide, modale commentée
- `style.css` — variables, reset, Mercury, profile selector, top bar, boutons, notifications, modale commentée
- `app.js` — WebProfileSelector complet, onMercuryComplete, showNotification, switchView, blocs commentés métier + navigation
- `TEMPLATE_GUIDE_V1.md` — versionné, tableau des remplacements obligatoires, dettes connues, règles non négociables

**Décisions actées :**
- Template repo sans déploiement GitHub Pages — zéro maintenance
- Périmètre : 6 briques universelles prouvées + optionnels commentés + TEMPLATE_GUIDE versionné
- Reviewer = référence absolue — toute future app web copie ce template, jamais d'improvisation

**Dette connue documentée dans TEMPLATE_GUIDE_V1.md :**
- `style.css` contient des règles `.dark-theme` résiduelles de Reviewer — à nettoyer en V2
- `syncProfiles()` requiert connexion réseau au premier lancement

**État du chantier assainissement Reviewer (référence) :**
- ✅ Audit CSS complet — `7e6014b` → `060bff0`
- ✅ Corrections UI Reviewer (10 points) — `1ebfe7d`
- ✅ Bugs marqueurs timeline + commentaires minuscules — `f3a6cfd`

---

## B7 — Bitwarden — ✅ Terminé (13 juin 2026)

**Vault :** "Tranquility Suite" — compte `mpavloff@letudiant.fr`
**Code de récupération :** imprimé + rangé physiquement au bureau

**5 entrées :**
1. `GitHub — RealCoolclint` — identifiant + MDP
2. `Netlify — musical-tanuki-a691a5` — email Gmail perso + MDP
3. `Resend — Tranquility Suite` — mpavloff@letudiant.fr + MDP
4. `Resend — Clé API active` — Note sécurisée
5. `GitHub CLI — Token gh (Mac Bureau)` — Note sécurisée (protocole, pas valeur brute)

**Périmètre délibérément limité :**
- Gofile = API anonyme → hors scope
- Monday = Retriever Launcher → hors scope
- Clés API desktop = Retriever Launcher → hors scope

---

## COVENANT — État des chantiers

| # | Chantier | État | Commit |
|---|----------|------|--------|
| C1 | Scaffolding HTML + CSP | ✅ | `b33194c` → `59c6545` |
| C2 | WebProfileSelector | ✅ | `c533925` |
| C2b | Proxy Netlify (Resend) | ✅ | `musical-tanuki-a691a5` |
| C3 | Projets Monday | ✅ Supprimé | — |
| C4 | Templates JSON majeur/mineur | ✅ | `b9d4f66` |
| C5 | Interface wizard + splash Mercury | ✅ | `dedd751` |
| C6 | Génération PDF | ✅ | `e7c8e6b` → `6a6de03` |
| C7 | Envoi Resend + triple sécurité + UX refonte | ✅ | `64e4b3b` → `3b2fddc` |
| C8 | Mise à jour Monday | ✅ Supprimé — Monday exclu | — |
| C9 | File d'attente offline | ✅ | `4f63aaa` |
| C10 | Safari vs Opera UI | ⚫ Fermé — dette acceptable | — |
| C11 | Email interviewé dans recap | ✅ | — |
| C12 | Alignement écran confirmation | ✅ | — |
| PWA | Service Worker + manifest | ✅ | — |

---

## Chantiers Gemini — Familles A, B, I

### Famille A — Méthode et outillage JARVIS

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| A1 | **TRANQUILITY COMPASS** — document d'orientation JARVIS permanent | 🔴 Critique | ✅ Terminé — 07/06/2026 |
| A2 | **Workflow Assist** — blocs contexte ROVER + COVENANT | 🔴 Critique | ✅ Terminé — 07/06/2026 |
| A3 | **Signature JARVIS** — fil conducteur sessions | 🔴 Critique | ✅ Terminé — 07/06/2026 |
| A4 | **READBACK** — fiche produit + spec complète | 🟠 Important | ✅ Terminé — 12/04/2026 |
| A5 | **CAPITAL** — fiche produit + spec complète | 🟠 Important | ✅ Terminé — 12/04/2026 |
| A6 | **Agence Tranquility** — manifeste + agents + council skill | 🔴 Critique | ✅ Terminé — 12/04/2026 |

### Famille B — Architecture et infrastructure

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| B1 | **TRANQUILITY_SERVICES_TIERS.md** | 🟠 Important | ✅ V1.2 — 09/06/2026 — commit `443b846` · V1.3 à intégrer (addendum IA) |
| B2 | **Reviewer** — référence apps web | 🔴 Critique | ✅ Assainissement + corrections UI terminés |
| B7 | **Bitwarden** — vault "Tranquility Suite" | 🟠 Important | ✅ Terminé — 5 entrées — 13/06/2026 |

### Famille I — Infrastructure produit

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| I6 | **tranquility-web-template** | 🟠 Important | ✅ Terminé — commit `a9733ed` — 14/06/2026 |

---

## Carnet de pièges — Référence

`CARNET_PIEGES_V9.md` — 14 juin 2026 — inchangé cette session

---

## Flotte complète — 22 outils

| # | Nom | Catégorie | État |
|---|-----|-----------|------|
| 1 | BackUpFlow | Desktop | 🟡 Build V1.12.06.26 — migration Session V1.1 incomplète (main.js) |
| 2 | Transporter | Desktop | 🟣 En orbite |
| 3 | Reviewer | Web | 🟣 En orbite — assainissement CSS ✅ · corrections UI ✅ · bugs marqueurs + minuscules ✅ |
| 4 | Manifest | Web | 🟣 En orbite — identity crisis (repo EasyCallSheet) |
| 5 | Launcher V2 | Desktop | 🟣 En orbite |
| 6 | ARK | Desktop | 🟣 En orbite |
| 7 | ROVER | Desktop | 🟣 En orbite — V1.04.06.26 |
| 8 | COVENANT | Web | 🟣 En orbite — C9 ✅ · PWA ✅ · C10 ⚫ fermé |
| 9 | READBACK | Desktop | ⚫ En projet |
| 10 | CAPITAL | Desktop | ⚫ En projet |
| 11 | PAYLOAD | Desktop + Mobile | ⚫ En projet |
| 12 | Cargo | Desktop | ⚫ En projet |
| 13 | Hatch | Web | ⚫ En projet |
| 14 | Guidance | Web | ⚫ En projet |
| 15 | Beacon | Desktop | ⚫ En projet |
| 16 | Debrief | Web | ⚫ En projet |
| 17 | Telemetry | Web | ⚫ En projet |
| 18 | CAPCOM | Extension | ⚫ En projet |
| 19 | DATAPAD | Extension | ⚫ En projet |
| 20 | BLACKBOX | Extension | ⚫ En projet |
| 21 | Scripter | À définir | ⚫ En idée |
| 22 | **SIGNAL** | Web | ⚫ En idée — Phase Apollo — vue pilotage flotte + résumé Ollama · *OMNIA CONSPICUA* |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail Agence | V1 |
| `AGENCE_TRANQUILITY_AGENTS.md` | 23 postes — personnalités et réflexes | V1 |
| `AGENCE_TRANQUILITY_COUNCIL_SKILL.md` | Protocole consultation multi-agents | V1 |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision produit — 5 décisions fondatrices | V2 ⚠️ Révision nécessaire |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design — règles UI non négociables | V2 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format profils — architecture settings | V1.1 ⚠️ V1.2 à produire |
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Protocole session — sync GitHub — 12 règles | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Les trois lois du workflow captif | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille d'évaluation opérationnelle | V1 |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Trois automatismes JARVIS | V3 — 08/06/2026 |
| `TRANQUILITY_INSTRUCTION_VISION_ANCRAGE.md` | Checklist avant tout prompt Cursor | V1 |
| `PROTOCOLE_GIT_MAC_SWITCHING.md` | Workflow Git inter-Mac | V1 |
| `LAUNCHER_PROTOCOLE_AJOUT_APP.md` | Workflow ajout app au Launcher — 5 phases | V1 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Skill développement Electron | V1 |
| `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md` | Skill UX/Design | V1 |
| `TRANQUILITY_COMPASS.md` | Document d'orientation JARVIS permanent | ✅ Créé — 07/06/2026 |
| `CARNET_PIEGES_V9.md` | Carnet de pièges | ✅ Mis à jour — 14/06/2026 |
| `TRANQUILITY_SERVICES_TIERS.md` | Inventaire services tiers critiques | ✅ V1.2 — 09/06/2026 · V1.3 à intégrer |
| `TRANQUILITY_SUITE_COM_MARKETING_V2.md` | Bible COM mise à jour | ⚫ À créer — D1 |
| `TRANQUILITY_IA_STRATEGIE.md` | Décisions PRESIDENCE — stratégie IA | ✅ V1.0 — 14/06/2026 |
| `TRANQUILITY_VEILLE_IA.md` | Veille IA — panorama + points d'entrée + revues | ✅ V1.0 — 14/06/2026 |

---

## Règles d'architecture — non négociables

### GitHub = seul cloud
Tout fichier de configuration, profil, catalogue est versionné sur GitHub. Aucun cloud tiers.

### Versioning canonique
`V[MAJEUR].[JOUR].[MOIS].[ANNÉE]` — uniforme sur toute la suite. Date = date du build/déploiement.

### Signature desktop macOS
`CSC_IDENTITY_AUTO_DISCOVERY=false ./node_modules/.bin/electron-builder --mac dir` → codesign ad-hoc → hdiutil. Dans cet ordre, sans exception. Jamais `npx electron-builder`.

### Session JSON
Format V2 — champs plats, `expiresAt` ISO, `writtenBy` = nom de l'app. N'importe quelle app écrit `session.json`. Launcher n'est jamais requis.

### Settings par app
Chaque app lit son propre bloc `appSettings.<appname>`. La couche `_machines` gère les chemins locaux. Clés API dans le Keychain global via `keytar`.

### Portabilité
Aucun chemin en dur. Tout fichier local doit fonctionner sur Mac Maison, Mac Bureau, Mac Studio sans modification.

### Les 4 contrats architecturaux (formalisés le 7 juin 2026)
À vérifier sur chaque app, sans exception :
- **Design** : `tranquility-core.css` first, zéro token local, dark theme, uppercase, zéro emoji
- **Identité** : `session.json` V2, Launcher optionnel, n'importe quelle app peut écrire la session
- **Portabilité** : settings dans profil GitHub, couche `_machines` pour chemins locaux, clés API dans Keychain global
- **Vérité** : shared data layer `tranquility-core`, fetch `no-cache`, MASTER only pour écriture

### Apps web — Reviewer = référence absolue
Pour toute nouvelle app web Tranquility : cloner `tranquility-web-template`. Ne jamais improviser.

### Apps web — tranquility-web-template
Repo `RealCoolclint/tranquility-web-template` — GitHub Template Repository. Point de départ obligatoire pour toute future app web. Contient : splash Mercury, sélecteur de profil, top bar, layout, toast system, helpers fetch. TEMPLATE_GUIDE_V1.md = référence des remplacements obligatoires.

### Apps web — Splash Mercury
`window.onMercuryComplete` = seul point d'entrée. Jamais `DOMContentLoaded`, jamais `window.load`.

### Apps web — Cache-bust
Toujours versionner `style.css` et `app.js` avec `?v=APP_VERSION`.

### Apps web — tranquility-core.css
⚠️ Décision PRESIDENCE requise (I6) — les apps web redéfinissent actuellement les variables localement.

### Apps web — Sélecteur de profil
Reviewer = référence absolue. Card modale centrée, durée de session (AUJOURD'HUI / 7 JOURS / TOUJOURS), bouton SE CONNECTER. Ne jamais improviser une variante.

### IA — Règle des points d'entrée
Dans chaque app où l'IA a une valeur identifiée, une fonction nommée fait aujourd'hui le travail mécanique et appellera l'IA en Phase Apollo. Elle n'affecte pas le comportement actuel. Si l'IA est absente, comportement identique à aujourd'hui.

### IA — Approche par défaut
Whisper = Approche A (binding Node.js). LLM = Approche C (Ollama serveur local). Python lourd = Approche B (interne uniquement). Référence : `TRANQUILITY_IA_STRATEGIE.md`.

### ROVER — Sélecteur de format yt-dlp
`bestvideo[height<=H]+bestaudio/bestvideo[height<=H]/best`. Ne jamais contraindre le codec sur Instagram.

### ROVER — TikTok watermark
`--extractor-args "tiktok:api_hostname=api16-normal-c-useast1a.tiktokv.com"`. Fonctionne uniquement depuis Electron.

### ROVER — Migration SQLite
Toujours entourer les `ALTER TABLE` d'un `try/catch` silencieux.

### managers.json — schema
`id`, `firstName`, `lastName`, `phone`, `role` — deux valeurs : `"Responsable vidéo"` et `"Responsable projet"`.

### Launcher — Protocole ajout app
Workflow complet en 5 phases dans `LAUNCHER_PROTOCOLE_AJOUT_APP.md`. Sans exception.

### COVENANT — PWA + Service Worker
COVENANT est une PWA installable. URL de distribution : `https://realcoolclint.github.io/COVENANT/`. Service Worker offline-first — assets statiques + SignaturePad + pdf-lib + `profiles-public.json` précachés. `CACHE_NAME` à incrémenter (`covenant-v2`, etc.) à chaque déploiement majeur pour forcer la mise à jour du cache.

### COVENANT — Monday
Monday = supprimé. Archivage via Resend → boîte mail studio + copie email responsable signature.

### COVENANT — Signature PDF
Lecture canal alpha du canvas SignaturePad. Jamais `toDataURL()` direct sur le pad blanc.

### COVENANT — Logo PDF
Base64 embarqué dans `assets/logo-data.js`. Jamais `fetch` seul (peu fiable selon contexte déploiement).

---

*Plan Directeur V5.37 · Tranquility Suite · Cellule Vidéo L'Étudiant · 14 juin 2026*
*Mise à jour — Stratégie IA actée · SIGNAL ajoutée en flotte · TRANQUILITY_IA_STRATEGIE.md + TRANQUILITY_VEILLE_IA.md créés · SERVICES_TIERS V1.3 à intégrer*
