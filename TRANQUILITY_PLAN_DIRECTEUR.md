# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.1 — 12 avril 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Philosophie centrale : le workflow captif.**
La suite est conçue pour que les bonnes pratiques de l'équipe soient encodées dans les outils — pas confiées à la mémoire ou à la rigueur individuelle. La conformité est une conséquence de l'usage, pas un effort conscient. Chaque chantier, chaque feature, chaque décision d'architecture est évalué contre cette philosophie avant d'être validé.
*Référence complète : `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` · Grille opérationnelle : `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md`*

**Mode de travail : l'Agence Tranquility.**
Travailler sur la suite, c'est opérer en mode Agence — une réorganisation du cerveau en 23 cellules expertes réparties en 6 familles : Commandement, Création, Réalisation, Garantie, Humain, Rayonnement. Martin Pavloff est le titulaire unique de tous les postes. JARVIS est l'interface opérationnelle de chaque cellule.
*Référence complète : `AGENCE_TRANQUILITY_MANIFESTE.md`*

**Principe technique :** GitHub = cloud de la Tranquility Suite.

**Vision produit complète :** `TRANQUILITY_SUITE_VISION_PRODUIT.md` — document fondateur, à lire avant tout chantier.

---

## Phase Mercury — ✅ Clôturée — 9 avril 2026

**Progression : 100% — Toutes les phases terminées.**

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, alignée suite, utilisable par l'équipe |

---

## Conditions de sortie Mercury — ✅ Toutes remplies

| # | App | Type | Condition minimale | État |
|---|-----|------|--------------------|------|
| 1 | **Launcher** | Desktop | Hub opérationnel, MASTER Équipe, Session V1.1 writer | 🟣 En orbite |
| 2 | **BackUpFlow** | Desktop | Workflow complet, Session V1.1 ✅, build ✅ | 🟣 En orbite |
| 3 | **Transporter** | Desktop | Workflow valise complet, Session V1.1 ✅, design aligné | 🟣 En orbite |
| 4 | **ARK** | Desktop | Session V1.1 ✅, tests ✅, build ✅ | 🟣 En orbite |
| 5 | **Reviewer** | Web | WebProfileSelector ✅, localStorage ✅, profiles-public.json ✅ | 🟣 En orbite |
| 6 | **Manifest** | Web | WebProfileSelector ✅, localStorage ✅, CSP ✅, index.html ✅ | 🟣 En orbite |

---

## Feuille de route Mercury — Phases

| Phase | Chantier | État |
|-------|----------|------|
| 1 | Module unifié `session-profile.js` | ✅ Terminée |
| 2 | Launcher — Session V1.1 | ✅ Terminée |
| 3 | BackUpFlow — Session V1.1 + build | ✅ Terminée |
| 4 | Transporter — Session V1.1 | ✅ Terminée |
| 5 | ARK — Session V1.1 + tests + build | ✅ Terminée |
| 6 | Reviewer + Manifest — sessions web | ✅ Terminée |
| 7 | Tests d'intégration | ✅ Terminée — 9 avril 2026 |
| 8 | Documentation équipe + clôture Mercury | ✅ Terminée — 9 avril 2026 |

---

## Inventaire de la flotte — 20+ outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.18.04.26 | Session V1.1 ✅, MASTER ✅, initiales éditables ✅, groupes étendus ✅, ROLES_MAP ✅, pagination grille ✅, ARK au catalogue ✅, bug suppression GitHub ✅, filtre archivés ✅, URL Manifest corrigée ✅, build ✅ |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, 1440×1050 ✅ |
| 3 | **BackUpFlow** | v1.02.04.26 | Session V1.1 ✅, ProfileSelector ✅, couche `_machines` ✅, build ✅, 1440×1050 ✅ |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, tests ✅, build ✅, Monday État Rushs ✅ |
| 5 | **Reviewer** | commit 37113c5 | WebProfileSelector ✅, player adaptatif ✅ (B2), modale liste + détail commentaires ✅ (B1) |
| 6 | **Manifest** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, CSP ✅, patch PNG ✅, index.html ✅ |

### En projet Gemini/Apollo ⚫

| # | Outil | Notes |
|---|-------|-------|
| 7 | Payload | Desktop + Mobile, Monday DB |
| 8 | **COVENANT** | Web app GitHub Pages · Spec architecturale validée 11/04/2026 · `FICHE_PRODUIT_COVENANT_V1.md` ✅ |
| 9 | **READBACK** | Desktop Electron · Prompteur caméra + cohabitation ATEM · Spec validée 12/04/2026 · `FICHE_PRODUIT_READBACK_V1.md` ✅ |
| 10 | **CAPITAL** | Web app GitHub Pages · Budget production ligne par ligne · Spec validée 12/04/2026 · `FICHE_PRODUIT_CAPITAL_V1.md` ✅ · Phase Apollo |
| 11 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 12 | Cargo | — |
| 13 | Hatch | — |
| 14 | Guidance | — |
| 15 | Beacon | Web |
| 16 | Debrief | Web |
| 17 | Telemetry | Extension Premiere |
| 18 | CAPCOM | Extension Premiere |
| 19 | DATAPAD | Extension Premiere |
| 20 | BLACKBOX | Extension Premiere |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.18.04.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.02.04.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | commit 37113c5 | 🟣 En orbite — B1+B2 ✅ |
| Manifest | `RealCoolclint/Manifest` | GitHub Pages | 🟣 En orbite |
| COVENANT | `RealCoolclint/COVENANT` | *(à créer)* | ⚫ En conception |
| READBACK | `RealCoolclint/READBACK` | *(à créer)* | ⚫ En conception |
| CAPITAL | `RealCoolclint/Capital` | *(à créer — Phase Apollo)* | ⚫ En conception |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ + profiles-public.json |
| **tranquility-suite** | `RealCoolclint/tranquility-suite` | GitHub Pages | ✅ Vitrine beta — 9 avril 2026 |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 9 profils actifs |
| Profiles public | `RealCoolclint/tranquility-core` | `profiles-public.json` | ✅ 9 profils allégés |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V5.1 |

---

## Phase Gemini — Ouverte

### 🟡 Points ouverts mineurs reportés de Mercury
1. **ARK : icône Electron par défaut** — configurer l'icône patch dans `electron-builder`
2. **BackUpFlow `_machines` sur Mac Maison** — valider que les chemins sont bien distincts par hostname
3. **Antoine Vassas** — initiales non assignées dans le système profils (bug ouvert)
4. **Vitrine — lien download Launcher** — à mettre à jour à chaque nouvelle release

### ✅ Corrections appliquées en Gemini
- **Monday — colonne formule Feuille de service** — URL corrigée : `EasyCallSheet/EasyCallSheets.html` → `Manifest/` — 10 avril 2026

---

### 🔵 Bloc A — Réflexion & stratégie (pas de Cursor)

| # | Chantier | Description | Priorité |
|---|----------|-------------|----------|
| A1 | **Audit Workflow Tranquility** | ✅ Terminé — 10 avril 2026 · `WORKFLOW_TRANQUILITY_V1.md` + carte de décision HTML | Haute |
| A2 | **Fiches produits — toutes les apps** | ✅ Terminé — 11 avril 2026 · 8 fiches · format standard défini | Haute |
| A3 | **COVENANT — discussion & arbitrage** | ✅ Terminé — 11 avril 2026 · Architecture validée · `FICHE_PRODUIT_COVENANT_V1.md` | Haute |
| A4 | **READBACK — prompteur caméra** | ✅ Terminé — 12 avril 2026 · Architecture validée · `FICHE_PRODUIT_READBACK_V1.md` | Moyenne |
| A5 | **CAPITAL — budget production** | ✅ Terminé — 12 avril 2026 · Architecture validée · `FICHE_PRODUIT_CAPITAL_V1.md` · Phase Apollo | Moyenne |
| A6 | **Postes RP/Com de l'Agence** | ✅ Terminé — 12 avril 2026 · `AGENCE_TRANQUILITY_MANIFESTE.md` · 23 postes · 6 familles · Bloc A complet | Haute |

### 🔵 Bloc B — Chantiers techniques (Cursor)

| # | Chantier | Description | Priorité |
|---|----------|-------------|----------|
| B1 | **Reviewer — ergonomie commentaires** | ✅ Terminé — 12 avril 2026 · Modale liste + modale détail · commit 37113c5 | Haute |
| B2 | **Reviewer — player max** | ✅ Terminé — 12 avril 2026 · Player adaptatif responsive · commit 37113c5 | Haute |
| B3 | **Landing page Tranquility — enrichissement** | Fiches produit, tutos, D.A. complète sur la vitrine | Moyenne |
| B4 | **Cartes Launcher — enrichissement** | Style PlayStation, enrichissement visuel des cartes apps | Moyenne |
| B5 | **Audit section Paramètres** | Revue de la section Paramètres dans chaque app — cohérence, utilité, angles morts | Moyenne |

### 🔵 Infrastructure Gemini (priorité haute)

| # | Chantier | Description |
|---|----------|-------------|
| I1 | **`session-profile.js` + Keychain** | Enrichir pour lire les clés API directement depuis le Keychain macOS |
| I2 | **`APPS_CATALOG` externalisé** | JSON sur `tranquility-core`, fetché au démarrage — élimine rebuild Launcher pour ajouter une app |
| I3 | **Supabase Auth — Reviewer** | Authentification réelle modèle Frame.io (Gemini) |
| I4 | **Page vitrine + onboarding** | Showcase GitHub Pages + auto-enregistrement Launcher |

---

## Journal des décisions — Gemini

### 12 avril 2026 — B1+B2 Reviewer

**B2 — Player adaptatif :** surcharges CSS ciblées dans le contexte `.web-app`. `max-width/max-height: 100%` + `aspect-ratio` dynamique JS = sizing natif optimal. Neutralisation des règles legacy `min(280px, 45vw)` et `calc(100vh - 14rem)`.

**B1 — Ergonomie commentaires :** deux niveaux de modale. Modale liste (panoramique, catégories + suppression + export) ouverte depuis sidebar. Modale détail (édition texte, navigation, timecode) ouverte depuis la liste uniquement. `confirm()` natif supprimé. z-index stack : top-bar 1002 · modale liste 1003 · modale détail 1020.

### 12 avril 2026 — Agence Tranquility

**23 postes formalisés** en 6 familles. Instruction permanente ajoutée dans les instructions Claude du projet. Martin = titulaire unique. JARVIS = interface opérationnelle. MÉMOIRE, NAVIGATION, MISSION CONTROL permanents.

**Livrables :** `AGENCE_TRANQUILITY_MANIFESTE.md` V1.0 · `INSTRUCTION_AGENCE_TRANQUILITY.md`

### 11 avril 2026 — Workflow Captif

**Philosophie fondatrice formalisée** — trois lois, grille opérationnelle, instruction permanente JARVIS.

**Livrables :** `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` + `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md`

### 10 avril 2026 — A1 Audit Workflow Tranquility

**Cartographie complète** du workflow production/post-production réalisée par audit conversationnel.

**3 régimes identifiés :** Cellule/OPS · Rédaction · SOLO

**9 angles morts documentés :**
- AM-01 : Backup SOLO non tracé (élevé) → BackUpFlow mobile à envisager
- AM-02 : Nomenclature non universelle → extension BackUpFlow
- AM-03 : Planification ressources (moyen) → outil planning Monday à créer
- AM-04 : Matériel Mojo non tracé → Payload
- AM-05 : Intégrité copies non vérifiée → Guidance
- AM-06 : Template Premiere non vérifié → standard documenté
- AM-07 : Miniature non standardisée → guide retouche équipe
- AM-08 : Sous-titres dans Reviewer → Reviewer V2
- AM-09 : Post-diffusion non outillée (élevé) → ARK + chantier dédié

**Livrables :** `WORKFLOW_TRANQUILITY_V1.md` + `workflow_tranquility_arbre_decision.html`

### 10 avril 2026 — Ouverture Phase Gemini

**Backlog Gemini structuré** en trois blocs : Bloc A (réflexion/stratégie), Bloc B (technique Cursor), Infrastructure.

### 9 avril 2026 — Phase 8 Clôture Mercury

**Livrables produits :**
- `TRANQUILITY_GUIDE_DEMARRAGE_EQUIPE.md` V1.0
- Annonce interne email envoyée (Virginie de Montard en copie)
- Vitrine beta déployée : `https://realcoolclint.github.io/tranquility-suite/`
- Plan Directeur V4.2

### 9 avril 2026 — Phase 7 Tests d'intégration validée

**Flux Launcher → apps desktop :** `session.json` lu correctement par BackUpFlow, Transporter, ARK sans passer par Launcher. Format V1.1 conforme.

**Apps web :** Reviewer et Manifest WebProfileSelector opérationnels. Profils archivés filtrés. localStorage persistant.

**Corrections intégrées au build v1.18.04.26 :**
- URL Manifest dans `APPS_CATALOG` : `EasyCallSheet` → `Manifest` (`src/renderer/app.js`)
- `EasyCallSheets.html` renommé `index.html` dans le repo Manifest
- Remote git Manifest mis à jour : `https://github.com/RealCoolclint/Manifest.git`

### 8 avril 2026 — BackUpFlow couche `_machines`

**Architecture settings portables implémentée :**
- `ssdPersoPath` : profile-level (portable GitHub)
- `ssdStudioPath` / `nasPath` : machine-level via `_machines[os.hostname()]`

### 7 avril 2026 — Vision Produit (5 décisions)

**D1** — Launcher optionnel dans le quotidien, indispensable dans les moments clés
**D2** — Thomas est acteur de son profil
**D3** — Architecture settings à deux niveaux (portable GitHub + couche `_machines`)
**D4** — Onboarding : page vitrine + auto-enregistrement Launcher
**D5** — Modèle C : Launcher hub optionnel mais précieux (référence Adobe CC)

---

## Patron WebProfileSelector — validé sur Reviewer + Manifest

**Règles définitives :**
- `show()` appelé AVANT `syncProfiles()` — jamais d'écran blanc
- Badge ADMIN en style inline dans le template JS
- `cloneNode(false)` + déplacement manuel des enfants pour reset les listeners
- `changeProfile()` doit toujours appeler `_syncProfiles()`
- Clé localStorage : `ts_session_[appname]`
- Le champ `avatar` dans `profiles-public.json` contient l'URL complète — ne jamais préfixer
- CSP : `img-src` doit contenir `https://raw.githubusercontent.com`
- CSP : `connect-src` doit contenir `https://realcoolclint.github.io`
- Patch dans `.app-header` : toujours `<img>` PNG fixe — jamais `<video>`

---

## Leçons clés

### Reviewer — z-index stack
top-bar : 1002 · modale liste : 1003 · modale détail : 1020. Toujours vérifier le z-index de la top-bar avant d'assigner des z-index aux overlays.

### Reviewer — player adaptatif web-app
Les règles legacy Electron (min/max en px, calc(100vh)) doivent être neutralisées dans le contexte `.web-app` avec des surcharges ciblées. Ne pas modifier les règles globales — elles servent à d'autres contextes.

### Nettoyage profils Launcher
Toujours passer par le MASTER panel. Sources simultanées : `profiles.json` GitHub, `config.json` local, `profiles-cache.json` local.

### Push GitHub dans Launcher
Un seul push par opération. Géré par `saveConfig()` dans le renderer. `main.js` ne push jamais.

### Format Passeport dans les renderers
Toujours passer par `getProfileDisplay(profile)`. Ne jamais lire `profile.firstName` directement.

### BackUpFlow — profils Launcher
Si `state.selectedProfile.fromLauncher === true`, utiliser `spSaveSettings` — jamais `updateProfile` local.

### BackUpFlow — splash version
`window.APP_VERSION` assigné dans `DOMContentLoaded` avant `runSplash`.

---

## Groupes et rôles Launcher — validés 7 avril 2026

| Groupe | Valeur | Rôles |
|--------|--------|-------|
| Cellule Vidéo | `cellule` | Directeur.rice, Cadreur.se/Monteur.se (4 niveaux) |
| Rédaction | `redaction` | Journaliste, Rédacteur.rice en chef, Secrétaire rédac, Stagiaire, Pigiste |
| RS | `rs` | Community Manager, Social Media Manager, Alternant.e CM, Stagiaire CM |
| OPS | `ops` | Chef.fe projets OPS, Chargé.e de projet, Prestataire |
| Direction | `direction` | Directeur.rice, Directeur.rice adjoint.e, Responsable de pôle |
| Externe | `externe` | Tous rôles externes |

---

## Standard fenêtre Tranquility Suite

| Paramètre | Valeur |
|---|---|
| `width` | `1440` |
| `height` | `1050` |
| `minWidth` | `1440` |
| `minHeight` | `1050` |
| `center` | `true` |
| `backgroundColor` | `'#0a0f1e'` |
| `resizable` | `true` |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail — 23 postes · 6 familles · gouvernance | V1.0 ✅ |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision UX + décisions fondatrices | V1.0 ✅ |
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité technique | V1.1 ✅ |
| `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md` | Patron de migration Session V1.1 | V1.0 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.1 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport | V1.1 ✅ |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole session Launcher | V1.0 |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |
| `TRANQUILITY_SUITE_MISSION_PATCHES_STATUT.md` | État des patches | V1.0 |
| `WORKFLOW_TRANQUILITY_V1.md` | Cartographie workflow prod/post-prod + 9 angles morts | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Philosophie fondatrice — trois lois | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille opérationnelle — avant tout chantier | V1.0 ✅ |
| `FICHE_PRODUIT_BACKUPFLOW_V1.md` | Fiche produit — BackUpFlow | V1.0 ✅ |
| `FICHE_PRODUIT_LAUNCHER_V1.md` | Fiche produit — Launcher | V1.0 ✅ |
| `FICHE_PRODUIT_TRANSPORTER_V1.md` | Fiche produit — Transporter | V1.0 ✅ |
| `FICHE_PRODUIT_ARK_V1.md` | Fiche produit — ARK | V1.0 ✅ |
| `FICHE_PRODUIT_REVIEWER_V1.md` | Fiche produit — Reviewer | V1.0 ✅ |
| `FICHE_PRODUIT_MANIFEST_V1.md` | Fiche produit — Manifest | V1.0 ✅ |
| `FICHE_PRODUIT_COVENANT_V1.md` | Fiche produit — COVENANT | V1.0 ✅ |
| `FICHE_PRODUIT_READBACK_V1.md` | Fiche produit — READBACK | V1.1 ✅ |
| `FICHE_PRODUIT_CAPITAL_V1.md` | Fiche produit — CAPITAL | V1.0 ✅ |

---

*Plan Directeur V5.1 — 12 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V5.0*
*Phase Mercury : ✅ Clôturée — 9 avril 2026*
*Phase Gemini : Ouverte — Bloc A ✅ complet · Bloc B : B1 ✅ B2 ✅ · B3→B5 à venir*
