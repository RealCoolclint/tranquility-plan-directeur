# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.4 — 14 avril 2026*

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
| 1 | **Launcher V2** | v1.18.04.26 | Session V1.1 ✅, MASTER ✅, signature ad-hoc ✅ — 13/04/2026 |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, signature valide ✅ |
| 3 | **BackUpFlow** | v1.02.04.26 | Session V1.1 ✅, signature ad-hoc ✅ — 13/04/2026 |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, signature ad-hoc ✅ — 13/04/2026 |
| 5 | **Reviewer** | commit 57ec8d3 | WebProfileSelector ✅, player adaptatif ✅, modale commentaires ✅, bugs Safari ✅, mémoire de session ✅ — 14/04/2026 |
| 6 | **Manifest** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, CSP ✅, fetch robuste ✅, Safari autocomplete ✅ — 14/04/2026 |

### En projet Gemini/Apollo ⚫

| # | Outil | Notes |
|---|-------|-------|
| 7 | Payload | Desktop + Mobile, Monday DB |
| 8 | **COVENANT** | Web app GitHub Pages · Spec architecturale validée 11/04/2026 |
| 9 | **READBACK** | Desktop Electron · Prompteur caméra · Spec validée 12/04/2026 |
| 10 | **CAPITAL** | Web app GitHub Pages · Phase Apollo |
| 11 | **SCRIPTER** | Plateforme scripts, annotation, versionning · Lien Monday · Session conception à planifier |
| 12 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 13 | Cargo | — |
| 14 | Hatch | — |
| 15 | Guidance | — |
| 16 | Beacon | Web |
| 17 | Debrief | Web |
| 18 | Telemetry | Extension Premiere |
| 19 | CAPCOM | Extension Premiere |
| 20 | DATAPAD | Extension Premiere |
| 21 | BLACKBOX | Extension Premiere |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.18.04.26 | 🟣 En orbite — signature ad-hoc ✅ |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite — signature valide ✅ |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.02.04.26 | 🟣 En orbite — signature ad-hoc ✅ |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite — signature ad-hoc ✅ |
| Reviewer | `RealCoolclint/Reviewer` | commit 57ec8d3 | 🟣 En orbite — bugs Safari + mémoire session ✅ — 14/04/2026 |
| Manifest | `RealCoolclint/Manifest` | GitHub Pages | 🟣 En orbite — fetch robuste + Safari autocomplete ✅ — 14/04/2026 |
| COVENANT | `RealCoolclint/COVENANT` | *(à créer)* | ⚫ En conception |
| READBACK | `RealCoolclint/READBACK` | *(à créer)* | ⚫ En conception |
| CAPITAL | `RealCoolclint/Capital` | *(à créer — Phase Apollo)* | ⚫ En conception |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ + profiles-public.json |
| **tranquility-suite** | `RealCoolclint/tranquility-suite` | GitHub Pages | ✅ Vitrine beta |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 9 profils actifs |
| Profiles public | `RealCoolclint/tranquility-core` | `profiles-public.json` | ✅ 9 profils allégés |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V5.4 |

---

## Phase Gemini — Ouverte

### 🟡 Points ouverts mineurs reportés de Mercury
1. **ARK : icône Electron par défaut** — configurer l'icône patch dans `electron-builder`
2. **BackUpFlow `_machines` sur Mac Maison** — valider que les chemins sont bien distincts par hostname
3. **Antoine Vassas** — initiales non assignées dans le système profils (bug ouvert)
4. **Vitrine — lien download Launcher** — à mettre à jour à chaque nouvelle release

### ✅ Corrections appliquées en Gemini

| Date | Correction |
|------|-----------|
| 10 avril 2026 | Monday — colonne formule Feuille de service — URL corrigée |
| 13 avril 2026 | Signature apps desktop — Launcher, BackUpFlow, ARK rebuildés avec signature ad-hoc |
| 14 avril 2026 | Reviewer — bug overlay patch, Safari fond noir/vitesse/bords, mémoire de session |
| 14 avril 2026 | Manifest — fetch Chrome robuste (no-cache + validation array + état chargement + bouton RÉESSAYER) |
| 14 avril 2026 | Manifest — Safari autocomplete contacts Mac supprimé (renommage attributs `name`) |

### 🔴 Bugs en attente — prochaine session

| # | App | Sujet |
|---|-----|-------|
| 1 | Launcher | "Installer" ouvre un dossier Finder au lieu de télécharger le DMG |
| 2 | Launcher | "Signaler un problème" — envoi Resend cassé |

---

### 🔵 Bloc A — Réflexion & stratégie ✅ Complet

| # | Chantier | État |
|---|----------|------|
| A1 | Audit Workflow Tranquility | ✅ Terminé — 10 avril 2026 |
| A2 | Fiches produits — toutes les apps | ✅ Terminé — 11 avril 2026 |
| A3 | COVENANT — discussion & arbitrage | ✅ Terminé — 11 avril 2026 |
| A4 | READBACK — prompteur caméra | ✅ Terminé — 12 avril 2026 |
| A5 | CAPITAL — budget production | ✅ Terminé — 12 avril 2026 |
| A6 | Agence Tranquility — Manifeste | ✅ Terminé — 12 avril 2026 |

### 🔵 Bloc B — Chantiers techniques (Cursor)

| # | Chantier | Description | Priorité |
|---|----------|-------------|----------|
| B1 | **Reviewer — ergonomie commentaires** | ✅ Terminé — 12 avril 2026 · commit 37113c5 | Haute |
| B2 | **Reviewer — player max** | ✅ Terminé — 12 avril 2026 · commit 37113c5 | Haute |
| B3 | **Landing page Tranquility — enrichissement** | Fiches produit, tutos, D.A. | Moyenne |
| B4 | **Launcher — cartes style PlayStation** | Refonte visuelle des cartes apps | Moyenne |
| B5 | **Audit section Paramètres** | Cohérence cross-apps | Basse |

### 🔵 Chantiers d'infrastructure Gemini

| # | Chantier | Description |
|---|----------|-------------|
| I1 | **`session-profile.js` + Keychain** | Lire les clés API depuis le Keychain macOS |
| I2 | **`APPS_CATALOG` externalisé** | JSON sur `tranquility-core`, fetché au démarrage |
| I3 | **Supabase Auth — Reviewer** | Authentification réelle modèle Frame.io |
| I4 | **Page vitrine + onboarding** | Showcase GitHub Pages + auto-enregistrement Launcher |
| I5 | **`managers.json` sur `tranquility-core`** | Responsables projet Manifest synchronisés cross-navigateurs · MASTER write via push Terminal |

---

## Journal des décisions — Gemini

### 14 avril 2026 — Corrections Manifest

**Bug Chrome — fetch profils fragile :**
- `fetch()` passe en `{ cache: 'no-cache' }` pour éviter le cache agressif Chrome
- Validation `Array.isArray(data) && data.length > 0` après `res.json()`
- État de chargement "CHARGEMENT..." visible dans `#ps-grid` pendant le fetch
- Bouton RÉESSAYER affiché si aucun profil après fetch échoué

**Bug Safari — autocomplete contacts Mac :**
- `name="managerName"` → `name="manager-contact"`
- `name="videoManagerName"` → `name="video-manager-contact"`
- Webkit ignore `autocomplete="off"` si l'attribut `name` contient un mot reconnu comme champ de contact

**Décision architecture — managers.json :**
Les responsables projet/vidéo sont actuellement en localStorage (cloisonné par navigateur). Chantier Gemini I5 créé : héberger `managers.json` sur `tranquility-core`, pattern identique à `profiles-public.json`. Solution immédiate : export/import CSV disponible dans Manifest.

### 14 avril 2026 — Corrections Reviewer + mémoire de session

**Bugs corrigés (commit `57ec8d3`) :**

- **Overlay patch** : suppression du `localStorage.setItem('reviewerDefaultOverlay')` qui persistait tout PNG importé comme overlay par défaut, y compris le patch de l'app.
- **Safari fond blanc** : ajout de `background: #000` sur `#videoPlayer` et les overrides `.web-app`, `background: #0a0a0a` sur `.player-row`. Suppression de `body:not(.dark-theme)` qui forçait `#ffffff`.
- **Safari vitesse Apple** : remplacement de `'SF Pro Display', -apple-system` par `'Lato', sans-serif` + `-webkit-appearance: none` sur `.speed-selector`.
- **Bords arrondis** : `border-radius: 0` sur `#videoPlayer`, `.player-row .video-container`, `.player-section.player-block`.

**Feature mémoire de session :**
- Sauvegarde automatique en localStorage : nom du fichier + position + notes (toutes les 5s + à chaque note)
- Restauration silencieuse au re-dépôt d'une vidéo avec le même nom
- Toast "SESSION RESTAUREE — X NOTE(S)"
- Clé : `reviewer_memory` + `reviewer_memory_filename`

### 13 avril 2026 — Audit signature Gatekeeper

**Problème :** electron-builder produisait une signature partielle cassée sur Launcher, BackUpFlow, ARK. macOS Gatekeeper bloquait l'ouverture sans recours.

**Solution : signature ad-hoc** (`codesign --force --deep --sign -`) appliquée après le build, avant le DMG. Gratuite, sans Apple Developer account. L'utilisateur passe par Réglages Système → Confidentialité et sécurité → Ouvrir quand même, une seule fois par machine.

**Résultat audit :**
- Launcher ❌ → ✅ rebuild
- BackUpFlow ❌ → ✅ rebuild
- Transporter ✅ → inchangé
- ARK ❌ → ✅ rebuild

**Documents mis à jour :** `WORKFLOW_RELEASE_TRANQUILITY_SUITE.md` V2 · `TRANQUILITY_GUIDE_DEMARRAGE_EQUIPE.md` V1.1

### 12 avril 2026 — B1+B2 Reviewer

**B2 — Player adaptatif :** surcharges CSS ciblées `.web-app`. Sizing natif optimal.

**B1 — Ergonomie commentaires :** deux niveaux de modale. Modale liste + modale détail. `confirm()` natif supprimé. z-index stack : top-bar 1002 · liste 1003 · détail 1020.

### 12 avril 2026 — Agence Tranquility

**23 postes formalisés** en 6 familles. Instruction permanente ajoutée dans Claude.

### 11 avril 2026 — Workflow Captif

**Philosophie fondatrice formalisée** — trois lois, grille opérationnelle.

### 9 avril 2026 — Clôture Mercury

Vitrine beta · Guide équipe V1.0 · Tests intégration validés.

---

## Standard build desktop — Séquence obligatoire

```
CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder --mac dir
codesign --force --deep --sign - "dist/mac-arm64/NomApp.app"
xattr -cr "dist/mac-arm64/NomApp.app"
hdiutil create -volname "NomApp" -srcfolder "dist/mac-arm64/NomApp.app" -ov -format UDZO "dist/NomApp-V1.JJ.MM.AA.dmg"
gh release upload vX.XX.XX.XX "dist/NomApp-V1.JJ.MM.AA.dmg" --repo RealCoolclint/NomRepo --clobber
```

*Référence complète : `WORKFLOW_RELEASE_TRANQUILITY_SUITE.md` V2*

---

## Patron WebProfileSelector — validé sur Reviewer + Manifest

- `show()` appelé AVANT `syncProfiles()` — jamais d'écran blanc
- Badge ADMIN en style inline dans le template JS
- `cloneNode(false)` + déplacement manuel des enfants pour reset les listeners
- `changeProfile()` doit toujours appeler `_syncProfiles()`
- Clé localStorage : `ts_session_[appname]`
- Le champ `avatar` dans `profiles-public.json` contient l'URL complète — ne jamais préfixer
- CSP : `img-src` doit contenir `https://raw.githubusercontent.com`
- CSP : `connect-src` doit contenir `https://realcoolclint.github.io`
- `fetch(PROFILES_URL, { cache: 'no-cache' })` — obligatoire pour éviter le cache Chrome
- Toujours valider `Array.isArray(data) && data.length > 0` après `res.json()`

---

## Leçons clés

### Signature desktop macOS
La signature ad-hoc est obligatoire dans tout build Tranquility Suite. Electron-builder sans certificat produit une signature cassée — pire que pas de signature du tout. Toujours appliquer `codesign --force --deep --sign -` après le build.

### Reviewer — z-index stack
top-bar : 1002 · modale liste : 1003 · modale détail : 1020.

### Reviewer — Safari
`-webkit-appearance: none` obligatoire sur tout `<select>` custom. `background: #000` doit être posé sur `#videoPlayer` ET sur ses overrides `.web-app` plus spécifiques. Ne jamais utiliser `body:not(.dark-theme)` pour forcer un fond clair — cette règle s'applique en Safari même avec la classe présente.

### Manifest — Safari autocomplete
Safari ignore `autocomplete="off"` si l'attribut `name` contient un mot reconnu comme champ de contact (`name`, `email`, `phone`, etc.). Solution : renommer l'attribut `name` avec un terme neutre (`manager-contact`, `video-manager-contact`).

### Manifest — fetch Chrome
Toujours passer `{ cache: 'no-cache' }` au fetch de `profiles-public.json`. Chrome met en cache agressivement les JSON GitHub Pages. Toujours valider que la réponse est un tableau non vide avant de l'assigner.

### Push GitHub dans Launcher
Un seul push par opération. Géré par `saveConfig()` dans le renderer. `main.js` ne push jamais.

---

## Groupes et rôles Launcher

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
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail — 23 postes · 6 familles | V1.0 ✅ |
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
| `WORKFLOW_RELEASE_TRANQUILITY_SUITE.md` | Workflow release — séquence build obligatoire | V2.0 ✅ |
| `WORKFLOW_TRANQUILITY_V1.md` | Cartographie workflow prod/post-prod | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Philosophie fondatrice — trois lois | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille opérationnelle | V1.0 ✅ |
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

*Plan Directeur V5.4 — 14 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V5.3*
*Phase Mercury : ✅ Clôturée — 9 avril 2026*
*Phase Gemini : Ouverte — Bloc A ✅ · B1 ✅ · B2 ✅ · B3→B5 à venir · Bugs Launcher en attente*
