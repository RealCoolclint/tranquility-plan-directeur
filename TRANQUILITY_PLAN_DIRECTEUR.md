# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 3.3 — 2 avril 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Principe central :** GitHub = cloud de la Tranquility Suite.

---

## Phase Mercury — État du programme

**Progression : 98%**

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
| 5 | **Reviewer** | Web | Design aligné, session web à implémenter | 🟣 En orbite |
| 6 | **Manifest** | Web | Design aligné, session web à implémenter | 🟣 En orbite |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.02.04.26 | Session V1.1 ✅, MASTER ✅, CSP avatars ✅, profils propres ✅ |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, 1440×1050 ✅ |
| 3 | **BackUpFlow** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, build ✅, 1440×1050 ✅ |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, tests ✅, build ✅, Monday État Rushs ✅ |
| 5 | **Reviewer** | GitHub Pages | Mercury Design ✅, tranquility-core.css ✅ |
| 6 | **Manifest** | v1.30.03.26 | Mercury Design ✅, repo renommé ✅ |

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
| 6 | Reviewer + Manifest — sessions web | En attente |
| 7 | Tests d'intégration | En attente |
| 8 | Documentation équipe + clôture Mercury | En attente |

> **Prochaine session :** Phase 6 — Reviewer + Manifest sessions web (localStorage)

---

## Points ouverts — à traiter

### 🔴 Prioritaire
1. **Phase 6 — Reviewer + Manifest** — sessions web localStorage

### 🟠 À ne pas oublier
2. **BackUpFlow `appSettings` couche `_machine`** — SSD1 + NAS via `spLoadSettings`
3. **`session-reader.js`** dans BackUpFlow/modules/ — peut être supprimé
4. **ARK splash** — `<img>` → `<video>` MP4 quand ambiance générée

### 🔵 Gemini — priorité haute
5. **`session-profile.js` + Keychain** — enrichir pour lire les clés API directement depuis le Keychain macOS, sans dépendance à Launcher. Chaque app autonome sur les clés.

### 🔵 Gemini — ARK UX
6. **Barre de progression** — améliorer mise en forme, gamification
7. **Liste Monday** — meilleure présentation + filtre/recherche rapide
8. **Écran bilan** — écran dédié post-archivage avec résumé + GIFs
9. **Nommage fichier archivé** — utiliser le nom normé Monday (comme BackUpFlow)

---

## Patron de migration Session V1.1 — validé

Le patron est documenté dans `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md`.

**Apps migrées :** Launcher ✅ · Transporter ✅ · BackUpFlow ✅ · ARK ✅
**Toutes les apps desktop Mercury sont migrées.**

---

## Leçon clé — Nettoyage profils Launcher

Le nettoyage de profils dans Launcher doit toujours passer par le **MASTER panel** (interface officielle). Nettoyer uniquement GitHub ou uniquement le local est insuffisant — GithubSync re-pollue au démarrage.

Sources à nettoyer simultanément si nettoyage manuel requis :
1. `profiles.json` GitHub (`launcher-profiles`)
2. `config.json` dans `~/Library/Application Support/launcher-v2/`
3. `profiles-cache.json` dans `~/Library/Application Support/launcher-v2/`

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
- **`session-profile.js`** — module unifié copié à l'identique dans chaque app desktop.
- **`bootProfileSelector(forceSelect)`** — pattern validé.
- **Standard top bar Mercury** — `top-bar-brand` / `top-bar-nav` / `top-bar-actions`.
- **Standard fenêtre** — 1440×1050, un seul profil pour toute la suite.

### Actées le 2 avril 2026
- **Format session.json V2** — champs plats, pas d'apiKeys, pas d'allProfiles, `expiresAt` ISO.
- **Expiration session** — calculée via `expiresAt` (ISO) et non `expiresAfterHours`.
- **MASTER password** — stocké dans Keychain macOS, machine-spécifique. À configurer sur chaque Mac.
- **Nettoyage profils Launcher** — toujours via MASTER panel. Nettoyage manuel = 3 sources simultanées.
- **Monday colonne "État Rushs"** — `column_id: color_mm219hny` — 4 statuts : Dispo / Archivé / Pas de rushs / N/R.
- **HandBrake streaming** — `execFile` → `spawn` + split `\r`. Pattern à réutiliser.
- **ARK drag & drop** — `webUtils.getPathForFile(file)` obligatoire avec `contextIsolation: true`.
- **`session-profile.js` + Keychain** — enrichissement planifié Gemini priorité haute.

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.02.04.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.01.04.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🟣 En orbite |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 6 profils |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V3.3 |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité | V1.1 ✅ |
| `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md` | Patron de migration Session V1.1 | V1.0 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.1 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 | V1.0 |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole session Launcher | V1.0 |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |
| `TRANQUILITY_SUITE_MISSION_PATCHES_STATUT.md` | État des patches | V1.0 |

---

## Phase Gemini — Horizon

- **`session-profile.js` + Keychain** — autonomie clés API sans Launcher (priorité haute)
- SSO cross-machine — sync activité via GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- PIN / authentification renforcée sur le sélecteur de profil
- Manifest — API Monday directe, historique, templates par format
- ARK UX — écran bilan, filtre Monday, gamification progression, nommage normé

---

*Plan Directeur V3.3 — 2 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V3.2*
*Prochaine mise à jour : après Phase 6 Reviewer + Manifest sessions web*
