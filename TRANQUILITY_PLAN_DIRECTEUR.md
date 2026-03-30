# Plan Directeur Tranquility Suite — V2.4
*Mise à jour le 30 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 65%**

> *Launcher V2 en orbite (Profil Passeport complet, MASTER Équipe). Transporter en orbite. Reviewer en orbite (Mercury Design complet). BackUpFlow en lancement avancé (audit Design Reference à faire). Manifest et ARK restent à traiter.*

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, alignée suite, utilisable par l'équipe |

---

## Conditions de sortie Mercury

Mercury est terminée quand ces 6 apps sont **parfaitement opérationnelles et alignées** :

| # | App | Type | Condition minimale |
|---|-----|------|--------------------|
| 1 | **Launcher** | Desktop | Hub opérationnel, modèle licence, équipe peut se connecter |
| 2 | **BackUpFlow** | Desktop | Workflow complet, modèle profils Launcher, design aligné |
| 3 | **Transporter** | Desktop | Workflow valise complet, modèle profils Launcher, design aligné |
| 4 | **ARK** | Desktop | Archivage complet, Monday, design aligné |
| 5 | **Reviewer** | Web | Design aligné (fonctionnel primitif conservé) |
| 6 | **Manifest** | Web | Design aligné (fonctionnel primitif conservé) |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | Hub central, MASTER Équipe, Profil Passeport complet |
| 2 | **Transporter** | v1.29.03.26 | Workflow valise complet, Design Reference ✅ |
| 3 | **Reviewer** | — | Mercury Design complet, GitHub Pages ✅ |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 4 | **BackUpFlow** | Session V2 ✅ · Design Reference à auditer | Mercury Opening ✅ |

### En projet Mercury ⚫

| # | Outil | Notes |
|---|-------|-------|
| 5 | **ARK** | Construction complète — condition de sortie Mercury |
| 6 | **Manifest** | Alignement design uniquement — fonctionnel primitif conservé |

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

## Ordre d'exécution Mercury — programme actuel

### ✅ Étape 1 — Transporter test production — TERMINÉ
### ✅ Étape 2 — Launcher MASTER Équipe + Profil Passeport — TERMINÉ
### ✅ Étape 3 — Mercury Design : Reviewer — TERMINÉ

### 🟠 Étape 4 — Mercury Design : Manifest
Repo `RealCoolclint/EasyCallSheet` · même chantier que Reviewer

### 🟠 Étape 4bis — Design Reference : BackUpFlow
Tokens CSS `--success`/`--warning` · suppression monospace UI · version dynamique · CSP · flash home fix

### 🟡 Étape 5 — profile-loader.js : module partagé desktop
Lecture `session.json` · validation · avatar header · déploiement BackUpFlow + Transporter

### 🟡 Étape 6 — Launcher V2 : finalisation
`author` package.json · Changelog en modale interne · bouton Plan Directeur · MASTER Retriever · bouton Installer → flux DMG · release

### 🟡 Étape 7 — ARK : spec + patch + construction

### 🟡 Étape 8 — Skill Mercury : réécriture UX Design Skill

---

## Décisions produit actées — 30 mars 2026

### Apps web GitHub Pages — sans profil en Mercury (nouveau)

**Décision définitive.**

Les apps web (Reviewer, Manifest) ne gèrent **aucun profil utilisateur en Phase Mercury**.

**Motif technique :** les apps web ne peuvent pas lire `session.json` (fichier système local inaccessible depuis un navigateur). La sécurité repose sur le fait que l'URL n'est pas publique et que les utilisateurs sont 100% internes.

**Plan par phase :**
- **Mercury** → apps web autonomes, sans profil, sans authentification
- **Gemini** → SSO via token GitHub ou Supabase (`TRANQUILITY_SSO_SPEC.md`)

**Apps concernées :** Reviewer, Manifest (Mercury) · Beacon, Debrief (Gemini/Apollo)

---

## Décisions produit actées — 29 mars 2026

- **Profil Passeport V1** — format définitif Mercury. Trois blocs : `identity`, `appSettings`, `status`. Trois statuts : `pending` → `active` → `archived`.
- **Launcher = seul gestionnaire d'identité** — seul écrivain de `session.json`. Apps = consommateurs uniquement.
- **Avatars universels** — URL GitHub raw dans `session.json`, jamais chemin local. Repo public `RealCoolclint/tranquility-avatars`.
- **gh CLI** — installé sur Mac Maison. Standard pour toutes les releases.
- **Condition de sortie Mercury redéfinie** — checklist complète `TRANQUILITY_SUITE_DESIGN_REFERENCE.md`, pas seulement Mercury Opening.
- **Avatar header** — standardisé via `profile-loader.js` (Étape 5) — pas d'implémentation ad hoc par app.

---

## Décisions produit actées — 28 mars 2026

- **Retriever** — Launcher = source de vérité des secrets. Apps lisent depuis `session.json`.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub.
- **Build apps Electron** — `CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder`.
- **Comparaison versions** — par `published_at` GitHub Releases (pas par tag).
- **Design Reference** — condition de sortie Mercury = checklist complète `TRANQUILITY_SUITE_DESIGN_REFERENCE.md`.
- **CSP Electron** — `<meta http-equiv="Content-Security-Policy">` dans chaque app avec `img-src raw.githubusercontent.com`.
- **GIFs dans le build** — dossiers assets à déclarer dans `asarUnpack` + pattern `app.asar.unpacked` dans les handlers.

---

## Détail des chantiers Mercury restants

### MANIFEST — Alignement design (Étape 4)

| Chantier | Priorité |
|----------|----------|
| Dark theme par défaut | 🟠 |
| Mercury Opening avec patch Manifest | 🟠 |
| Patch circulaire dans le header | 🟠 |
| Variables CSS Design Reference | 🟠 |
| CSP GitHub Pages | 🟠 |
| Version dynamique `V1.JJ.MM.AA` | 🟠 |
| Bouton thème supprimé | 🟠 |
| Deploy GitHub Pages | 🟡 |

### BACKUPFLOW — Audit Design Reference (Étape 4bis)

| Chantier | Priorité |
|----------|----------|
| Tokens CSS `--success` / `--warning` corrects | 🟠 |
| Suppression monospace dans l'UI visible | 🟠 |
| Version dynamique `V1.JJ.MM.AA` | 🟠 |
| CSP `raw.githubusercontent.com` | 🟠 |
| Flash écran home au démarrage | 🟠 |
| Build final + Release GitHub | 🟡 |

### ARK — Construction complète (Étape 7)

| Chantier | Priorité |
|----------|----------|
| Spec fonctionnelle complète | 🔴 |
| Patch + identité visuelle | 🔴 |
| Architecture Electron | 🔴 |
| Mercury Opening | 🔴 |
| Écran d'attente session (natif) | 🔴 |
| Analyse projet Premiere | 🔴 |
| Compression vidéo HandBrake (seuil à définir) | 🔴 |
| ZIP dossier projet | 🔴 |
| Gestion destination (remplacement ou double) | 🔴 |
| Monday : lecture + écriture statut ARCHIVÉ | 🔴 |
| Release GitHub | 🟡 |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.29.03.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.29.03.26 | 🔵 Lancement |
| Manifest | `RealCoolclint/EasyCallSheet` (à renommer) | GitHub Pages | ⚫ En projet |
| ARK | À créer | — | ⚫ En projet |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` — 6 profils | ✅ |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | V2.4 | ✅ |

---

## Règles techniques importantes

- **GIFs/MP4 dans le build** — dossiers dans `asarUnpack` + pattern `app.asar.unpacked`
- **CSP Electron** — `<meta http-equiv="Content-Security-Policy">` avec `img-src raw.githubusercontent.com`
- **CSP GitHub Pages** — pas de meta CSP Electron, fetch GitHub API autorisé
- **Version dynamique** — calculée depuis `new Date()` dans un script inline du `<head>`
- **Build apps Electron** — `CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder`
- **Releases** — `gh release create` (gh CLI installé sur Mac Maison)
- **Avatar header** — via `profile-loader.js` Étape 5, pas d'implémentation ad hoc
- **Push Transporter** — toujours `git push origin clean-main:main --force`
- **chokidar** — v3 uniquement (v4 incompatible CommonJS)
- **`require()` bloqué dans renderers Electron** — tout via preload/IPC

## Localisation des apps

```
/Volumes/BACKUP PRO/Outils/App Persos/BackUpFlow/
/Volumes/BACKUP PRO/Outils/App Persos/Launcher-v2/
/Volumes/BACKUP PRO/Outils/App Persos/Transporter/
/Volumes/BACKUP PRO/Outils/App Persos/Reviewer/
/Volumes/BACKUP PRO/Outils/App Persos/tranquility-plan-directeur/
```

**Machine principale : Mac Maison** (`martinpavloff`, home `/Users/martinpavloff/`)

---

## Ressources du projet

| Document | Rôle |
|----------|------|
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète — Launcher V2 comme étalon |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Profil Passeport V1 — référence définitive |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen détaillée |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron |
| `TRANQUILITY_MACHINES.md` | Cartographie des trois machines |
| `PLAN_DIRECTEUR_PUSH_WORKFLOW.md` | Workflow push Plan Directeur |

---

## Phase Gemini — Horizon

- SSO cross-machine — `tranquility-session` GitHub ou Supabase (couvre Reviewer + Manifest)
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés, extension CEP Premiere
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V2.4 — 30 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.3*
