# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 4.3 — 10 avril 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Principe central :** GitHub = cloud de la Tranquility Suite.

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

## Inventaire de la flotte — 18+ outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.18.04.26 | Session V1.1 ✅, MASTER ✅, initiales éditables ✅, groupes étendus ✅, ROLES_MAP ✅, pagination grille ✅, ARK au catalogue ✅, bug suppression GitHub ✅, filtre archivés ✅, URL Manifest corrigée ✅, build ✅ |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, 1440×1050 ✅ |
| 3 | **BackUpFlow** | v1.02.04.26 | Session V1.1 ✅, ProfileSelector ✅, couche `_machines` ✅, build ✅, 1440×1050 ✅ |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, tests ✅, build ✅, Monday État Rushs ✅ |
| 5 | **Reviewer** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, tranquility-core.css ✅ |
| 6 | **Manifest** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, CSP ✅, patch PNG ✅, index.html ✅ |

### En projet Gemini/Apollo ⚫

| # | Outil | Notes |
|---|-------|-------|
| 7 | Payload | Desktop + Mobile, Monday DB |
| 8 | COVENANT | Signature RGPD droit à l'image — spec V1.0 reçue 10/04/2026 |
| 9 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 10 | Cargo | — |
| 11 | Hatch | — |
| 12 | Guidance | — |
| 13 | Beacon | Web |
| 14 | Debrief | Web |
| 15 | Telemetry | Extension Premiere |
| 16 | CAPCOM | Extension Premiere |
| 17 | DATAPAD | Extension Premiere |
| 18 | BLACKBOX | Extension Premiere |

### Idées à creuser (pas encore au catalogue) 💡

| Outil | Concept | Phase estimée |
|-------|---------|---------------|
| **Prompteur caméra** | Contrôle et saisie du prompteur depuis laptop/tablet | Apollo ? |
| **Budget projet** | Budgétisation d'un projet vidéo, intégration Monday | Gemini ? |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.18.04.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.02.04.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | GitHub Pages | 🟣 En orbite |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ + profiles-public.json |
| **tranquility-suite** | `RealCoolclint/tranquility-suite` | GitHub Pages | ✅ Vitrine beta — 9 avril 2026 |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 9 profils actifs |
| Profiles public | `RealCoolclint/tranquility-core` | `profiles-public.json` | ✅ 9 profils allégés |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V4.3 |

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
| A1 | **Audit Workflow Tranquility** | Cartographie complète prod/post-prod, arbre de décision, angles morts, arbitrage logiciel oui/non | Haute |
| A2 | **Fiches produits — toutes les apps** | Documentation officielle par app (format standard à définir) | Haute |
| A3 | **COVENANT — discussion & arbitrage** | Valider direction, trancher Vue.js vs vanilla JS, positionner dans roadmap | Haute |
| A4 | **Prompteur caméra — mini-fiche** | Creuser le besoin, rédiger une mini-spec | Moyenne |
| A5 | **Budget projet — mini-fiche** | Creuser le besoin, intégration Monday, rédiger mini-spec | Moyenne |
| A6 | **Postes RP/Com de l'Agence** | Mettre en action les profils supplémentaires pour les équipes RP et Com | À clarifier |

### 🔵 Bloc B — Chantiers techniques (Cursor)

| # | Chantier | Description | Priorité |
|---|----------|-------------|----------|
| B1 | **Reviewer — ergonomie commentaires** | Modale de navigation/modification des commentaires existants | Haute |
| B2 | **Reviewer — player max** | Player toujours à la plus grande taille, sans crop, responsive | Haute |
| B3 | **Landing page Tranquility — enrichissement** | Fiches produit, tutos, D.A. complète sur la vitrine | Moyenne |
| B4 | **Cartes Launcher — enrichissement** | Style PlayStation, enrichissement visuel des cartes apps | Moyenne |
| B5 | **Audit section Paramètres** | Revue de la section Paramètres dans chaque app — cohérence, utilité, angles morts | Moyenne |

### 🔵 Infrastructure Gemini (priorité haute)

| # | Chantier | Description |
|---|----------|-------------|
| I1 | **`session-profile.js` + Keychain** | Enrichir pour lire les clés API directement depuis le Keychain macOS |
| I2 | **Catalogue Launcher dynamique** | Externaliser `APPS_CATALOG` en JSON sur `tranquility-core` |
| I3 | **Écran "Je suis nouveau" dans Launcher** | Auto-enregistrement, profil `pending`, notification Resend |
| I4 | **Onglet "Mon profil" dans Launcher** | Thomas édite avatar, couleur, initiales (hors rôle/email/permissions) |
| I5 | **Système d'équipes** | Dans le sélecteur de profil (scalabilité) |
| I6 | **Modale RGPD** | À la première connexion (consentement profils publics) |

### 🔵 Grands chantiers Gemini

| # | Chantier | Description |
|---|----------|-------------|
| G1 | **Reviewer V2** | Supabase Auth, commentaires timestampés, modèle Frame.io |
| G2 | **Payload** | Desktop + Mobile, Monday DB |
| G3 | **ARK UX** | Barre de progression gamifiée, écran bilan, filtre Monday, nommage normé |
| G4 | **Extensions Premiere** | CAPCOM, DATAPAD, BLACKBOX, Telemetry |

---

## Décisions architecturales actées

### 10 avril 2026 — Ouverture Phase Gemini

**Backlog Gemini structuré** en trois blocs : Bloc A (réflexion/stratégie), Bloc B (technique Cursor), Infrastructure.

**COVENANT** — fiche produit V1.0 reçue. Signal d'alarme : Vue.js mentionné dans la spec. Décision architecture (vanilla JS vs Vue.js) à trancher en Bloc A avant tout développement.

**Idées nouvelles entrées au radar** : Prompteur caméra, Budget projet — mini-fiches à rédiger en Bloc A.

**Postes RP/Com de l'Agence** — à clarifier (infrastructure profils).

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
| `TRANQUILITY_GUIDE_DEMARRAGE_EQUIPE.md` | Guide de démarrage destiné à l'équipe | V1.0 ✅ |

---

*Plan Directeur V4.3 — 10 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V4.2*
*Phase Mercury : ✅ Clôturée — 9 avril 2026*
*Phase Gemini : Ouverte — 10 avril 2026*
