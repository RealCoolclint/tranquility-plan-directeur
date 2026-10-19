# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.39 — 14 juin 2026*

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

## Architecture Identité & Portail — Décisions PRESIDENCE (14 juin 2026)

### RENDEZVOUS — Portail web public de la suite

**RENDEZVOUS** est le 23e outil de la flotte. Portail web public GitHub Pages. Porte d'entrée officielle de la Tranquility Suite pour tout collaborateur de L'Étudiant ayant un rapport à la vidéo.

**Phrase fondatrice :** *"Un rendez-vous raté, c'est toute une mission qui s'arrête."*

**Principe directeur :** simple, efficace, sécurisé. Dans cet ordre.

**Deux états :**
- Non connecté → vitrine de la suite, présentation de la flotte, formulaire d'inscription
- Connecté → profil, apps disponibles selon niveau, statut d'accès par app, nouveautés

**Périmètre — ce que RENDEZVOUS fait :**
- Vitrine publique de la suite — présentation de la flotte et de la philosophie
- Inscription avec validation admin obligatoire
- État connecté : profil visible + apps accessibles + statut + section nouveautés
- Back-office Martin : validation des `pending`, gestion des profils, attribution des niveaux

**Périmètre — ce que RENDEZVOUS ne fait pas :**
- Modifier des settings d'apps (→ chaque app gère ses propres settings)
- Remplacer les apps en orbite
- Devenir un intranet ou un hub de communication quotidien

**Modèle d'inscription :** public + validation admin obligatoire. Modèle SAS. Invitation bidirectionnelle.

**Ouverture utilisateurs :** tout L'Étudiant (120 collaborateurs max). Critère unique : rapport réel à la vidéo. Pas de liste blanche à l'entrée — filtre sémantique + validation admin = double protection.

**Admin unique :** Martin Pavloff. Délégation = Phase Apollo.

**RGPD :** case à cocher obligatoire à l'inscription. Consentement explicite et traçable.

**Communication :** réunions managers trimestrielles L'Étudiant = vecteur naturel de présentation.

### Grille de profils RENDEZVOUS (actée PRÉSIDENCE — 14 juin 2026)

| Niveau | Nom | Qui | Rapport vidéo | Accès apps |
|--------|-----|-----|--------------|------------|
| ADMIN | Martin Pavloff | Martin uniquement | Détenteur de la suite | Total |
| N1 | OPÉRATEURS | Cellule vidéo — ~10 personnes | Usage quotidien | Apps assignées — visibles uniquement |
| N2 | PÉRIPHÉRIQUES | Touchent à la vidéo par ricochet — ~20 personnes | Usage ponctuel ou partiel | Apps limitées — sur demande |
| N3 | OBSERVATEURS | Direction, IT, développeurs | Supervision, maintenance | Lecture — pas d'apps de production |
| N4 | INSTITUTIONNELS | Juridique, RH, financiers, direction générale | Vision stratégique | Vitrine uniquement |

**Règles transverses :**
- Invisibilité par défaut : une app non autorisée n'apparaît pas — ce qu'on ne voit pas, on ne peut pas le casser
- Vitrine flotte visible même connecté : statut par app — *disponible · sur demande · réservé*
- Mobilité entre niveaux : demande utilisateur + validation Martin
- Grille vivante — s'ajuste à l'usage réel

### Matrice accès app × niveau (actée PRÉSIDENCE — 14 juin 2026)

| App | N1 Opérateurs | N2 Périphériques | N3 Observateurs | N4 Institutionnels |
|-----|:---:|:---:|:---:|:---:|
| BackUpFlow | ✅ | ❌ | ❌ | ❌ |
| Transporter | ✅ | ❌ | ❌ | ❌ |
| Reviewer | ✅ | ✅ | 🔔 sur demande | 🔔 sur demande |
| Manifest | ✅ | ✅ | 🔔 sur demande | ❌ |
| ARK | ✅ | ❌ | ❌ | ❌ |
| ROVER | ✅ | ❌ | ❌ | ❌ |
| COVENANT | ✅ | ✅ | ✅ | ❌ |
| Launcher | ✅ | ❌ | ❌ | ❌ |

*✅ Accès complet · 🔔 Sur demande — visible vitrine, accès sur validation Martin · ❌ Invisible*

### Architecture technique RENDEZVOUS

```
GitHub Pages (repo public RENDEZVOUS)
  → Formulaire inscription + RGPD checkbox
  → Proxy Netlify (nouveau site dédié — pas musical-tanuki)
  → API GitHub — écriture profil "pending" dans profiles.json sur tranquility-core
  → Resend — notification mail Martin "nouvelle demande pending"
       ↓
  Martin valide dans back-office RENDEZVOUS (interface admin intégrée)
       ↓
  → API GitHub — profil passe "active" + niveau N1/N2/N3/N4 assigné
  → Resend — notification mail utilisateur "accès accordé"
```

**Base de données :** `profiles.json` sur `tranquility-core` via API GitHub. Option A définitive. Zéro nouveau service tiers.

### Roadmap de build RENDEZVOUS (R1→R8)

| # | Chantier | Estimation |
|---|----------|-----------|
| R1 | Fondations — scaffolding, GitHub Pages, Design Reference | 1 session |
| R2 | Vitrine publique — présentation flotte, 8 fiches app | 2 sessions |
| R3 | Formulaire d'inscription + RGPD | 1 session |
| R4 | Proxy Netlify + API GitHub (écriture profil pending) | 2-3 sessions |
| R5 | Authentification — lien magique par email | 2 sessions |
| R6 | État connecté — profil + flotte + statuts par app | 2 sessions |
| R7 | Back-office MASTER admin Martin | 2-3 sessions |
| R8 | Polish + tests tous devices + communication + lancement | 1-2 sessions |

**Estimation totale : 13 à 16 sessions avant V1.**

### Dettes à solder avant lancement RENDEZVOUS

| Dette | Urgence | Mac | État |
|-------|---------|-----|------|
| BackUpFlow `main.js` — migration Session V1.1 | 🔴 Critique | Bureau | ⏳ En attente |
| Manifest identity crisis — repo EasyCallSheet | 🟠 Avant R2 | Maison | ✅ Soldée 14/06/2026 |
| Launcher back-office MASTER — spec à produire | 🟠 Avant R7 | — | ⚫ À faire |
| COVENANT emailPrefix — simplification | 🟡 Post-lancement | — | ⚫ Acceptable après |

### Launcher — Redéfinition du rôle (14 juin 2026)

Launcher n'est plus un hub visible pour l'utilisateur standard. Il devient un **agent local silencieux**.

**Ce que Launcher fait — définitif :**
- Keychain macOS — stockage et lecture des clés API globales
- Écriture / lecture `session.json`
- Détection et installation des mises à jour des apps desktop
- MASTER — gestion des profils, permissions, validation `pending` (Martin uniquement)

**Ce que Launcher ne fait plus :**
- Hub de découverte des apps (→ RENDEZVOUS)
- Interface principale utilisateur standard (→ RENDEZVOUS)

**Principe :** les apps restent autonomes. Launcher enrichit l'expérience silencieusement, ne la conditionne pas.

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
| `profiles-public.json` | `https://realcoolclint.github.io/tranquility-core/profiles-public.json` | Profils allégés + emailPrefix | ✅ En production |
| `managers.json` | `https://realcoolclint.github.io/tranquility-core/managers.json` | Responsables projet/vidéo | ✅ En production — `a622e12` |
| `profiles.json` | — | Profils complets — pending/active/niveau | ⚫ À créer pour RENDEZVOUS |
| `apps-catalog.json` | — | Catalogue apps + statuts par niveau | ⚫ À créer pour RENDEZVOUS R2 |

---

## Phase Mercury — ✅ Clôturée — 9 avril 2026

**Progression : 100%**

---

## Phase Gemini — Active

### Inventaire de flotte Gemini

| # | App | Type | État |
|---|-----|------|------|
| 1 | **ROVER** | Desktop | 🟣 En orbite — V1.04.06.26 |
| 2 | **COVENANT** | Web | 🟣 En orbite — C1→C7 ✅ · C9 ✅ · C11 ✅ · C12 ✅ · PWA ✅ · C10 ⚫ fermé |
| 3 | **READBACK** | Desktop | ⚫ En projet |
| 4 | **PAYLOAD** | Desktop + Mobile | ⚫ En projet |
| 5 | **RENDEZVOUS** | Web | 🔵 Spec complète ✅ — Build R1 à démarrer |

### Chantiers d'infrastructure Gemini

| # | Chantier | Type | État |
|---|----------|------|------|
| I1 | **Launcher bugs** — DMG + Resend | Infrastructure | ✅ Terminé — 06/06/2026 |
| I2 | **APPS_CATALOG externalisé** | Infrastructure | ⚫ Conditionnel — 10+ apps en orbite |
| I3 | **managers.json** — Shared Data Layer | Infrastructure | ✅ Terminé — 02/06/2026 |
| I4 | **SSD recovery** — protocole migration | Infrastructure | ⚫ À faire — nouveau SSD requis |
| I5 | **managers.json** — arbitrages + schema | Infrastructure | ✅ Terminé — 02/06/2026 |
| I6 | **tranquility-web-template** | Infrastructure | ✅ Terminé — commit `a9733ed` — 14/06/2026 |
| I7 | **RENDEZVOUS** — portail public + refonte rôle Launcher | Infrastructure | 🔵 Spec complète ✅ — Build R1 à démarrer |

---

## Chantiers ouverts — Vue consolidée

### Famille A — Documentation fondatrice

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| A1 | **Audit Workflow** — cartographie + 26 chantiers | 🔴 Critique | ✅ Terminé — 10/04/2026 |
| A2 | **Fiches produit** — BackUpFlow → Manifest | 🟠 Important | ✅ Terminé — 11/04/2026 |
| A3 | **Fiche produit COVENANT** | 🟠 Important | ✅ Terminé — 11/04/2026 |
| A4 | **READBACK + CAPITAL** — fiches produit + spec complète | 🟠 Important | ✅ Terminé — 12/04/2026 |
| A5 | **Agence Tranquility** — manifeste + agents + council skill | 🔴 Critique | ✅ Terminé — 12/04/2026 |
| A6 | **RENDEZVOUS** — spec complète | 🔴 Critique | ✅ Terminé — 14/06/2026 |

### Famille B — Architecture et infrastructure

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| B1 | **TRANQUILITY_SERVICES_TIERS.md** | 🟠 Important | ✅ V1.3 — 14/06/2026 — commit `353c05a` |
| B2 | **Reviewer** — référence apps web | 🔴 Critique | ✅ Assainissement + corrections UI terminés |
| B7 | **Bitwarden** — vault "Tranquility Suite" | 🟠 Important | ✅ Terminé — 5 entrées — 13/06/2026 |

### Famille I — Infrastructure produit

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| I6 | **tranquility-web-template** | 🟠 Important | ✅ Terminé — commit `a9733ed` — 14/06/2026 |
| I7 | **RENDEZVOUS** — build R1→R8 | 🔴 Critique | 🔵 Spec ✅ — R1 à démarrer |

---

## Carnet de pièges — Référence

`CARNET_PIEGES_V9.md` — 14 juin 2026 — inchangé cette session

---

## Flotte complète — 23 outils

| # | Nom | Catégorie | État |
|---|-----|-----------|------|
| 1 | BackUpFlow | Desktop | 🟡 Build V1.12.06.26 — migration Session V1.1 incomplète (main.js) — Mac Bureau |
| 2 | Transporter | Desktop | 🟣 En orbite |
| 3 | Reviewer | Web | 🟣 En orbite — assainissement CSS ✅ · corrections UI ✅ · bugs marqueurs + minuscules ✅ |
| 4 | Manifest | Web | 🟣 En orbite — identity crisis ✅ soldée 14/06/2026 — repo renommé `Manifest` |
| 5 | Launcher V2 | Desktop | 🟣 En orbite — rôle redéfini : agent local silencieux |
| 6 | ARK | Desktop | 🟣 En orbite |
| 7 | ROVER | Desktop | 🟣 En orbite — V1.04.06.26 |
| 8 | COVENANT | Web | 🟣 En orbite — C9 ✅ · PWA ✅ · C10 ⚫ fermé |
| 9 | READBACK | Desktop | ⚫ En projet |
| 10 | CAPITAL | Desktop | ⚫ En projet |
| 11 | PAYLOAD | Desktop + Mobile | ⚫ En projet |
| 12 | Cargo | Desktop | ⚫ En projet |
| 13 | Hatch | Web | ⚫ En projet — Organizer multicam — rôle original conservé |
| 14 | Guidance | Web | ⚫ En projet |
| 15 | Beacon | Desktop | ⚫ En projet |
| 16 | Debrief | Web | ⚫ En projet |
| 17 | Telemetry | Web | ⚫ En projet |
| 18 | CAPCOM | Extension | ⚫ En projet |
| 19 | DATAPAD | Extension | ⚫ En projet |
| 20 | BLACKBOX | Extension | ⚫ En projet |
| 21 | Scripter | À définir | ⚫ En idée |
| 22 | **SIGNAL** | Web | ⚫ En idée — Phase Apollo — vue pilotage flotte + résumé Ollama · *OMNIA CONSPICUA* |
| 23 | **RENDEZVOUS** | Web | 🔵 Spec complète ✅ — portail public — inscription · profil · découverte flotte · back-office admin |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail Agence | V1 |
| `AGENCE_TRANQUILITY_AGENTS.md` | 23 postes — personnalités et réflexes | V1 |
| `AGENCE_TRANQUILITY_COUNCIL_SKILL.md` | Protocole consultation multi-agents | V1 |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision produit — 5 décisions fondatrices | V2 ⚠️ Révision nécessaire |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design — règles UI non négociables | V2 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format profils — architecture settings | V1.1 ⚠️ V1.2 à produire — impactée par RENDEZVOUS |
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
| `TRANQUILITY_SERVICES_TIERS.md` | Inventaire services tiers critiques | ✅ V1.3 — 14/06/2026 — commit `353c05a` |
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

### Launcher — Rôle définitif (14 juin 2026)
Agent local silencieux. Trois missions uniquement : Keychain, session.json, mises à jour. Interface réduite au strict nécessaire. Hub de découverte et d'onboarding → RENDEZVOUS.

### RENDEZVOUS — Portail public (spec complète 14 juin 2026)
Simple, efficace, sécurisé. Inscription publique + validation admin obligatoire. 4 niveaux utilisateurs. Invisibilité par défaut. RGPD obligatoire. Architecture proxy Netlify dédié + API GitHub pour écriture profiles.json.

### RENDEZVOUS — Base de données
GitHub (profiles.json via API GitHub) = Option A définitive. 120 utilisateurs max = largement dans les limites de l'API GitHub. Zéro service tiers supplémentaire.

### Apps web — Reviewer = référence absolue
Pour toute nouvelle app web Tranquility : cloner `tranquility-web-template`. Ne jamais improviser.

### Apps web — tranquility-web-template
Repo `RealCoolclint/tranquility-web-template` — GitHub Template Repository. Point de départ obligatoire pour toute future app web.

### Apps web — Splash Mercury
`window.onMercuryComplete` = seul point d'entrée. Jamais `DOMContentLoaded`, jamais `window.load`.

### Apps web — Cache-bust
Toujours versionner `style.css` et `app.js` avec `?v=APP_VERSION`.

### IA — Règle des points d'entrée
Dans chaque app où l'IA a une valeur identifiée, une fonction nommée fait aujourd'hui le travail mécanique et appellera l'IA en Phase Apollo.

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
COVENANT est une PWA installable. URL de distribution : `https://realcoolclint.github.io/COVENANT/`. Service Worker offline-first. `CACHE_NAME` à incrémenter à chaque déploiement majeur.

### COVENANT — Monday
Monday = supprimé. Archivage via Resend → boîte mail studio + copie email responsable signature.

### COVENANT — Signature PDF
Lecture canal alpha du canvas SignaturePad. Jamais `toDataURL()` direct sur le pad blanc.

### COVENANT — Logo PDF
Base64 embarqué dans `assets/logo-data.js`. Jamais `fetch` seul.

---

*Plan Directeur V5.39 · Tranquility Suite · Cellule Vidéo L'Étudiant · 14 juin 2026*
*Mise à jour — Spec RENDEZVOUS complète (5 blocs) · Grille profils 4 niveaux · Matrice accès · Roadmap R1→R8 · Manifest identity crisis soldée · Services Tiers V1.3 finalisé*
