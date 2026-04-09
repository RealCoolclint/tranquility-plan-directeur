# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 4.2 — 9 avril 2026*

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

## Inventaire de la flotte — 17 outils

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
| 8 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 9 | Cargo | — |
| 10 | Hatch | — |
| 11 | Guidance | — |
| 12 | Beacon | Web |
| 13 | Debrief | Web |
| 14 | Telemetry | Extension Premiere |
| 15 | CAPCOM | Extension Premiere |
| 16 | DATAPAD | Extension Premiere |
| 17 | BLACKBOX | Extension Premiere |

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
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V4.2 |

---

## Phase Gemini — Ouverte

### 🟡 Points ouverts mineurs reportés de Mercury
1. **ARK : icône Electron par défaut** — configurer l'icône patch dans `electron-builder`
2. **BackUpFlow `_machines` sur Mac Maison** — valider que les chemins sont bien distincts par hostname
3. **Antoine Vassas** — initiales non assignées dans le système profils (bug ouvert)

### 🔵 Vision Produit (décisions actées 7 avril 2026)
4. **Vitrine GitHub Pages** — beta déployée le 9 avril 2026 ✅. Version complète (fiches produit, tutos, D.A.) à construire en Gemini
5. **Écran "Je suis nouveau" dans Launcher** — auto-enregistrement, profil `pending`, notification Resend
6. **Onglet "Mon profil" dans Launcher** — Thomas édite avatar, couleur, initiales (hors rôle/email/permissions)
7. **Clés API globales MASTER → Keychain service global** — communes à toute la suite, pas dans les profils individuels
8. **Écran settings dans chaque app** — accessible après sélection de profil, settings portables via GitHub + couche `_machines`

### 🔵 Priorité haute
9. **`session-profile.js` + Keychain** — enrichir pour lire les clés API directement depuis le Keychain macOS
10. **Catalogue Launcher dynamique** — externaliser `APPS_CATALOG` en JSON sur `tranquility-core`, fetché au démarrage
11. **Reviewer UI** — amélioration générale de l'interface
12. **Système d'équipes** dans le sélecteur de profil (scalabilité)
13. **Modale RGPD** à la première connexion (consentement profils publics)
14. **Renommage dossier `Launcher-v2` → `Launcher`** — évaluer impacts

### 🔵 ARK UX
15. **Barre de progression** — améliorer mise en forme, gamification
16. **Liste Monday** — meilleure présentation + filtre/recherche rapide
17. **Écran bilan** — écran dédié post-archivage avec résumé
18. **Nommage fichier archivé** — utiliser le nom normé Monday

---

## Décisions architecturales actées

### 9 avril 2026 — Phase 8 Clôture Mercury

**Livrables produits :**
- `TRANQUILITY_GUIDE_DEMARRAGE_EQUIPE.md` V1.0 — guide destiné à l'équipe (Thomas, Antoine, Charlyne, Lisa, Maëlle)
- Annonce interne envoyée par email avec Virginie de Montard en copie
- Vitrine beta déployée : `https://realcoolclint.github.io/tranquility-suite/`
- Plan Directeur V4.2 — clôture Mercury actée

### 9 avril 2026 — Phase 7 Tests d'intégration validée

**Flux Launcher → apps desktop :** `session.json` lu correctement par BackUpFlow, Transporter, ARK sans passer par Launcher. Format V1.1 conforme.

**Apps web :** Reviewer et Manifest WebProfileSelector opérationnels. Profils archivés filtrés. localStorage persistant.

**Corrections intégrées au build v1.18.04.26 :**
- URL Manifest dans `APPS_CATALOG` : `EasyCallSheet` → `Manifest` (`src/renderer/app.js`)
- `EasyCallSheets.html` renommé `index.html` dans le repo Manifest
- Remote git Manifest mis à jour : `https://github.com/RealCoolclint/Manifest.git`

### 8 avril 2026 — BackUpFlow couche `_machines`

**Architecture settings portables implémentée :**
- `ssdPersoPath` : profile-level (portable GitHub, commun à toutes les machines)
- `ssdStudioPath` / `nasPath` : machine-level via `_machines[os.hostname()]`
- Lecture au démarrage de session via `spLoadSettings` dans `onSessionReady` (async)
- Persistance à chaque sauvegarde via `spSaveSettings` dans `saveSettings`
- Handler IPC `get-machine-name` → `os.hostname()` ajouté dans `main.js`

### 7 avril 2026 — Vision Produit (5 décisions)

**D1 — Launcher est optionnel dans le quotidien, indispensable dans les moments clés**
Hub optionnel mais précieux. Modèle Adobe Creative Cloud. Jamais obligatoire, toujours désirable.

**D2 — Thomas est acteur de son profil**
Tout utilisateur peut modifier avatar, couleur, initiales, prénom/nom. Le MASTER garde le contrôle sur rôle, email, permissions, statut.

**D3 — Architecture settings à deux niveaux**
- Launcher : 10 réglages globaux (identité, session, machine, mises à jour, affichage)
- Chaque app : ses propres settings dans son interface, portables via GitHub + couche `_machines`
- Clés API : globales, MASTER uniquement, Keychain macOS service global

**D4 — Onboarding : page vitrine + auto-enregistrement Launcher**
Page GitHub Pages → téléchargement DMG → auto-enregistrement dans Launcher → profil `pending` → Martin valide + permissions → `active` → notifications Resend dans les deux sens.

**D5 — Modèle C : Launcher hub optionnel mais précieux**
Trois modèles évalués (A=admin pur, B=obligatoire, C=optionnel précieux). C acté.

### 7 avril 2026 — Catalogue dynamique (décision)
`APPS_CATALOG` hardcodé dans `app.js` du Launcher → à externaliser en JSON sur `tranquility-core` en phase Gemini.

### 6 avril 2026 — profiles-public.json
- `launcher-profiles/profiles.json` (privé) — source de vérité complète avec emails
- `tranquility-core/profiles-public.json` (public) — version allégée sans nom complet ni email
- Les apps web fetchent uniquement la version publique

---

## Patron WebProfileSelector — validé sur Reviewer + Manifest

**Règles définitives :**
- `show()` appelé AVANT `syncProfiles()` — jamais d'écran blanc
- Badge ADMIN en style inline dans le template JS — seule solution stable contre `.dark-theme *`
- `cloneNode(false)` (shallow) + déplacement manuel des enfants pour reset les listeners
- `changeProfile()` doit toujours appeler `_syncProfiles()` — sinon grille vide
- Clé localStorage : `ts_session_[appname]`
- Le champ `avatar` dans `profiles-public.json` contient l'URL complète — **ne jamais préfixer**
- CSP obligatoire : `img-src` doit contenir `https://raw.githubusercontent.com`
- CSP obligatoire : `connect-src` doit contenir `https://realcoolclint.github.io`
- Inline style `#profile-selector-screen` : une seule déclaration `display` — toujours `display:none`
- Patch dans `.app-header` : toujours `<img>` PNG fixe — jamais `<video>`

---

## Patron de migration Session V1.1 — validé

Le patron est documenté dans `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md`.

**Apps migrées :** Launcher ✅ · Transporter ✅ · BackUpFlow ✅ · ARK ✅

---

## Leçons clés

### Nettoyage profils Launcher
Le nettoyage de profils dans Launcher doit toujours passer par le **MASTER panel**. Sources à nettoyer simultanément si nettoyage manuel requis :
1. `profiles.json` GitHub (`launcher-profiles`)
2. `config.json` dans `~/Library/Application Support/launcher-v2/`
3. `profiles-cache.json` dans `~/Library/Application Support/launcher-v2/`

### Push GitHub dans le Launcher — règle de non-duplication
Un seul push GitHub par opération. Le push est géré par `saveConfig()` dans le renderer. Le handler `delete-profile` dans `main.js` **ne doit pas** appeler `GithubSync.push()`.

### Format Passeport dans les renderers
Toute fonction de rendu qui affiche un profil doit passer par **`getProfileDisplay(profile)`**.

### BackUpFlow — profils Launcher
Si `state.selectedProfile.fromLauncher === true`, ne jamais appeler `updateProfile` local — le profil n'existe pas en local. Utiliser `spSaveSettings` pour tout ce qui est settings.

### BackUpFlow — splash version
`window.APP_VERSION` doit être assigné dans `DOMContentLoaded` avant que `runSplash` soit appelé. La version est fetchée async via `getAppVersion()`.

---

## Groupes et rôles Launcher — validés 7 avril 2026

**`ROLES_MAP` au niveau module dans `app.js` :**

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
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision UX + décisions fondatrices — à lire avant tout chantier | V1.0 ✅ |
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

*Plan Directeur V4.2 — 9 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V4.1*
*Phase Mercury : ✅ Clôturée — 9 avril 2026*
*Phase Gemini : Ouverte*
