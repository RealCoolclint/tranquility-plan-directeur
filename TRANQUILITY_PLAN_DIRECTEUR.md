# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 3.9 — 8 avril 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Principe central :** GitHub = cloud de la Tranquility Suite.

**Vision produit complète :** `TRANQUILITY_SUITE_VISION_PRODUIT.md` — document fondateur, à lire avant tout chantier.

---

## Phase Mercury — État du programme

**Progression : 100% — En attente de clôture officielle**

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, alignée suite, utilisable par l'équipe |

---

## Conditions de sortie Mercury

Mercury est terminée quand ces 6 apps sont **parfaitement opérationnelles et alignées** :

| # | App | Type | Condition minimale | État |
|---|-----|------|--------------------|------|
| 1 | **Launcher** | Desktop | Hub opérationnel, MASTER Équipe, Session V1.1 writer | 🟣 En orbite |
| 2 | **BackUpFlow** | Desktop | Workflow complet, Session V1.1 ✅, build ✅ | 🟣 En orbite |
| 3 | **Transporter** | Desktop | Workflow valise complet, Session V1.1 ✅, design aligné | 🟣 En orbite |
| 4 | **ARK** | Desktop | Session V1.1 ✅, tests ✅, build ✅ | 🟣 En orbite |
| 5 | **Reviewer** | Web | WebProfileSelector ✅, localStorage ✅, profiles-public.json ✅ | 🟣 En orbite |
| 6 | **Manifest** | Web | WebProfileSelector ✅, localStorage ✅, CSP ✅ | 🟣 En orbite |

**✅ Les 6 conditions de sortie Mercury sont remplies.**

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.08.04.26 | Session V1.1 ✅, MASTER ✅, initiales éditables ✅, groupes étendus ✅, ROLES_MAP ✅, pagination grille ✅, ARK au catalogue ✅, bug suppression GitHub ✅, filtre archivés ✅, build ✅ |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, 1440×1050 ✅ |
| 3 | **BackUpFlow** | v1.02.04.26 | Session V1.1 ✅, ProfileSelector ✅, couche `_machines` ✅, build ✅, 1440×1050 ✅ |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, tests ✅, build ✅, Monday État Rushs ✅ |
| 5 | **Reviewer** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, tranquility-core.css ✅ |
| 6 | **Manifest** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, CSP ✅, patch PNG ✅ |

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

## Feuille de route Mercury — Phases

| Phase | Chantier | État |
|-------|----------|------|
| 1 | Module unifié `session-profile.js` | ✅ Terminée |
| 2 | Launcher — Session V1.1 | ✅ Terminée |
| 3 | BackUpFlow — Session V1.1 + build | ✅ Terminée |
| 4 | Transporter — Session V1.1 | ✅ Terminée |
| 5 | ARK — Session V1.1 + tests + build | ✅ Terminée |
| 6 | Reviewer + Manifest — sessions web | ✅ Terminée |
| 7 | Tests d'intégration | 🔵 Prochaine étape |
| 8 | Documentation équipe + clôture Mercury | 🔵 Prochaine étape |

> **Prochaine session :** Phase 7 Tests d'intégration → Phase 8 Clôture Mercury

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.08.04.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.02.04.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | GitHub Pages | 🟣 En orbite |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ + profiles-public.json |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 9 profils actifs |
| Profiles public | `RealCoolclint/tranquility-core` | `profiles-public.json` | ✅ 9 profils allégés |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V3.9 |

---

## Points ouverts — à traiter

### 🔴 Prioritaire
1. **Phase 7 — Tests d'intégration** — vérifier la cohérence du flux Launcher → apps desktop + web
2. **Phase 8 — Documentation équipe + clôture Mercury officielle**

### 🔵 Gemini — Vision Produit (décisions actées 7 avril 2026)
3. **Page vitrine GitHub Pages** — onboarding, téléchargement DMG Launcher, fiches produit, tutos, D.A.
4. **Écran "Je suis nouveau" dans Launcher** — auto-enregistrement, profil `pending`, notification Resend
5. **Onglet "Mon profil" dans Launcher** — Thomas édite avatar, couleur, initiales (hors rôle/email/permissions)
6. **Clés API globales MASTER → Keychain service global** — communes à toute la suite, pas dans les profils individuels
7. **Écran settings dans chaque app** — accessible après sélection de profil, settings portables via GitHub + couche `_machines`

### 🔵 Gemini — priorité haute
8. **`session-profile.js` + Keychain** — enrichir pour lire les clés API directement depuis le Keychain macOS
9. **Catalogue Launcher dynamique** — externaliser `APPS_CATALOG` en JSON sur `tranquility-core`, fetché au démarrage
10. **Reviewer UI** — amélioration générale de l'interface
11. **Système d'équipes** dans le sélecteur de profil (scalabilité)
12. **Modale RGPD** à la première connexion (consentement profils publics)
13. **Renommage dossier `Launcher-v2` → `Launcher`** — évaluer impacts

### 🔵 Gemini — ARK UX
14. **Barre de progression** — améliorer mise en forme, gamification
15. **Liste Monday** — meilleure présentation + filtre/recherche rapide
16. **Écran bilan** — écran dédié post-archivage avec résumé
17. **Nommage fichier archivé** — utiliser le nom normé Monday

### 🔵 Gemini — BackUpFlow
18. **ARK splash** — `<img>` → `<video>` MP4 quand ambiance générée

---

## Décisions architecturales actées

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

---

## Phase Gemini — Horizon

- **Vision Produit** — page vitrine onboarding, auto-enregistrement, onglet Mon Profil, settings par app portables
- **Catalogue Launcher dynamique** — `APPS_CATALOG` en JSON externe sur `tranquility-core`
- **`session-profile.js` + Keychain** — autonomie clés API sans Launcher (priorité haute)
- SSO cross-machine — sync activité via GitHub
- Reviewer V2 — Supabase Auth, commentaires timestampés, modèle Frame.io
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- PIN / authentification renforcée sur le sélecteur de profil
- Manifest — API Monday directe, historique, templates par format, champ videoManager branché sur profil connecté
- ARK UX — écran bilan, filtre Monday, gamification progression, nommage normé
- Système d'équipes dans le sélecteur de profil
- Modale RGPD première connexion
- Renommage `Launcher-v2` → `Launcher` (à évaluer)

---

*Plan Directeur V3.9 — 8 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V3.8*
*Prochaine mise à jour : après Phase 7 Tests d'intégration*
