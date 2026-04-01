# Plan Directeur Tranquility Suite — V3.1
*Mise à jour le 1er avril 2026 (nuit) — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 88%**

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
| 4 | **ARK** | Desktop | Session V1.1 ✅ — tests fonctionnels + build à faire | 🔵 En construction |
| 5 | **Reviewer** | Web | Design aligné, session web à implémenter | 🟣 En orbite |
| 6 | **Manifest** | Web | Design aligné, session web à implémenter | 🟣 En orbite |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | MASTER Équipe ✅, Profil Passeport ✅, Alertes Resend ✅ |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, 1440×1050 ✅ |
| 3 | **BackUpFlow** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, build ✅, 1440×1050 ✅ |
| 4 | **Reviewer** | GitHub Pages | Mercury Design ✅, tranquility-core.css ✅ |
| 5 | **Manifest** | v1.30.03.26 | Mercury Design ✅, repo renommé ✅ |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 6 | **ARK** | Session V1.1 ✅, ProfileSelector ✅, 1440×1050 ✅ | Tests fonctionnels + build à faire |

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

## Feuille de route Mercury — Phases restantes

| Phase | Chantier | État |
|-------|----------|------|
| 1 | Module unifié `session-profile.js` | ✅ Terminée |
| 2 | Launcher — migration Session V1.1 | En attente |
| 3 | BackUpFlow — migration Session V1.1 + build | ✅ Terminée |
| 4 | Transporter — migration Session V1.1 | ✅ Terminée |
| 5 | ARK — Session V1.1 + tests + build | Session V1.1 ✅ — tests + build à faire |
| 6 | Reviewer + Manifest — sessions web | En attente |
| 7 | Tests d'intégration | En attente |
| 8 | Documentation équipe + clôture Mercury | En attente |

> **Ordre prochaines sessions :** ARK tests + build → Launcher Session V1.1 → Reviewer + Manifest web → Mercury exit

---

## Points ouverts — à traiter

### 🔴 Prioritaire
1. **ARK — tests fonctionnels** — HandBrake, ZIP, Monday (codés mais jamais testés)
2. **ARK — Build + Release** — pas encore buildé
3. **Launcher — Session V1.1** — Phase 2, migration écriture `session.json`

### 🟠 À ne pas oublier
4. **BackUpFlow `appSettings` couche `_machine`** — SSD1 + NAS via `spLoadSettings`
5. **`session-reader.js`** dans BackUpFlow/modules/ — peut être supprimé
6. **ARK splash** — `<img>` → `<video>` MP4 quand ambiance générée
7. **Reviewer + Manifest** — sessions web localStorage (Phase 6)

---

## Patron de migration Session V1.1 — validé

Le patron est documenté dans `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md`.

**Apps migrées :** Transporter ✅ · BackUpFlow ✅ · ARK ✅
**Apps restantes :** Launcher

**Spécificités ARK documentées :**
- Architecture plate (pas de `src/`) — même que BackUpFlow
- Namespace preload : `window.electronAPI`
- `APP_KEY = 'ark'`
- Fix session existante : tester `profileId` (pas `profile`) + reconstruire `profileFromSession`
- Permissions ARK ajoutées sur les 8 profils GitHub (commit `a63519f`)

---

## Standard fenêtre Tranquility Suite

**Décision actée le 1er avril 2026 :**

| Paramètre | Valeur |
|---|---|
| `width` | `1440` |
| `height` | `1050` |
| `minWidth` | `1440` |
| `minHeight` | `1050` |
| `center` | `true` |
| `backgroundColor` | `'#0a0f1e'` |
| `resizable` | `true` |

Un seul profil standard pour toutes les apps desktop de la suite.

---

## Décisions produit actées

### Actées le 28 mars 2026
- **Retriever** — Launcher = source de vérité des secrets. Apps lisent depuis Keychain.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Build apps Electron** — `CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder`.
- **Comparaison versions** — par `published_at` GitHub Releases (pas par tag).
- **Design Reference** — condition de sortie Mercury = checklist complète.
- **CSP Electron** — `<meta http-equiv="Content-Security-Policy">` dans chaque app.

### Actées le 31 mars 2026
- **GitHub = cloud de la Tranquility Suite** — profils, avatars, mises à jour, design system.
- **Chaque app est autonome** — Launcher jamais requis pour lancer une app.
- **Session unifiée** — `~/Library/Application Support/tranquility-suite/session.json` partagé.
- **La première app ouverte écrit la session** — les suivantes la lisent.
- **3 durées de session** — aujourd'hui / 7 jours / toujours.
- **Profils filtrés par appPermissions** — chaque app n'affiche que les profils autorisés.
- **Pas de PIN en Mercury** — sélection de profil suffit.

### Actées le 1er avril 2026
- **`session-profile.js`** — module unifié copié à l'identique dans chaque app desktop. Ne jamais réécrire, toujours copier depuis Transporter.
- **`bootProfileSelector(forceSelect)`** — pattern validé pour bypass session existante vs changement forcé.
- **Architecture plate** — le patron de migration s'adapte à la structure de chaque app.
- **Standard top bar Mercury** — `top-bar-brand` / `top-bar-nav` / `top-bar-actions` — identique sur toutes les apps desktop.
- **Standard fenêtre** — 1440×1050, un seul profil pour toute la suite.
- **Build BackUpFlow** — `dist/mac-arm64/` (arm64), DMG manuel avec `hdiutil`.
- **Fix session ARK** — tester `profileId` et non `profile` dans `bootProfileSelector`.

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.01.04.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | — | 🔵 En construction |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` (public) | `profiles.json` | ✅ 8 profils + perm ARK |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V3.1 |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité | V1.1 ✅ |
| `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md` | Patron de migration Session V1.1 | V1.0 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.1 (standard fenêtre + top bar à ajouter) |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 | V1.0 |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" | V1.0 |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |
| `TRANQUILITY_SUITE_MISSION_PATCHES_STATUT.md` | État des patches | V1.0 |

---

## Phase Gemini — Horizon

- SSO cross-machine — sync activité via GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- PIN / authentification renforcée sur le sélecteur de profil
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V3.1 — 1er avril 2026 (nuit) — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V3.0*
*Prochaine mise à jour : après tests ARK + build + Launcher Session V1.1*
