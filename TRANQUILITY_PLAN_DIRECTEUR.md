# Plan Directeur Tranquility Suite — V2.3
*Mise à jour le 29 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 60%**

> *Launcher V2 est en orbite avec le modèle Profil Passeport complet. Transporter est en orbite (Design Reference validée). BackUpFlow est en lancement avancé (audit Design Reference à faire). Reviewer et Manifest restent à aligner. ARK reste à construire.*

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

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 3 | **BackUpFlow** | Session V2 ✅ · Design Reference à auditer | Mercury Opening ✅ |

### En projet Mercury ⚫

| # | Outil | Notes |
|---|-------|-------|
| 4 | **ARK** | Construction complète — condition de sortie Mercury |
| 5 | **Reviewer** | Alignement design uniquement — fonctionnel primitif conservé |
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

## Ordre d'exécution Mercury

```
1. LAUNCHER        ✅ En orbite v1.29.03.26
2. TRANSPORTER     ✅ En orbite v1.29.03.26
3. BACKUPFLOW      🔵 Audit Design Reference → puis release
4. REVIEWER        ⚫ Alignement design (web, indépendant)
   MANIFEST        ⚫ Alignement design (web, indépendant)
5. ARK             ⚫ Construction complète sur écosystème validé
6. DOCUMENTATION   Fil rouge tout au long
```

---

## Décisions produit actées — 29 mars 2026

### Profil Passeport — format V1 (définitif Mercury)

Structure complète d'un profil dans le repo `launcher-profiles` :
- Bloc `identity` : firstName, lastName, email, role, avatar (URL GitHub raw), initiales, color, mondayUserId
- Bloc `appSettings` : un sous-bloc par app (backupflow, transporter, ark…)
- Champs cycle de vie : `status` (pending / active / archived), `createdAt`, `updatedAt`

**Règles absolues :**
- Launcher est le seul à écrire `identity`
- Chaque app écrit uniquement dans son propre bloc `appSettings`
- `session.json` est en lecture seule pour les apps

**Document de référence :** `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md`

### MASTER Équipe — fonctionnalités Mercury

- Création profil (scénario A admin) avec statut `pending`
- Activation `pending → active` + alerte mail Resend à l'utilisateur
- Modification identity (prénom, nom, email, mondayUserId, couleur)
- Archivage / Rétablissement
- Suppression (action destructrice, profil admin protégé)
- Alertes Resend sur tous les événements (expéditeur `onboarding@resend.dev`)

### Condition de sortie Mercury — Design Reference (réévaluation 29 mars)

Une app desktop est "En orbite" quand elle passe la **checklist complète** de `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` — pas seulement le Mercury Opening.

---

## Décisions produit actées — Sessions précédentes

- **Modèle "Launcher = Licence"** — Launcher seul gestionnaire d'identité, calqué Adobe CC
- **Retriever** — Launcher = source de vérité des secrets. Chaque app lit depuis session.json.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub.
- **Avatars universels** — toujours URL GitHub raw dans session.json, jamais chemin local
- **Build apps** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist`)
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique.
- **Comparaison version** — par `published_at` GitHub Releases, pas par tag lexicographique

---

## Détail des chantiers Mercury restants

### BACKUPFLOW — Audit Design Reference (Étape 4bis)

| Chantier | Priorité |
|----------|----------|
| Tokens CSS `--success` / `--warning` corrects | 🟠 |
| Suppression monospace dans l'UI visible | 🟠 |
| Version dynamique `V1.JJ.MM.AA` | 🟠 |
| CSP `raw.githubusercontent.com` | 🟠 |
| Flash écran home au démarrage | 🟠 |
| Build final + Release GitHub | 🟡 |

### REVIEWER — Alignement design (Étape 3)

| Chantier | Priorité |
|----------|----------|
| Dark theme par défaut | 🟠 |
| Mercury Opening avec patch Reviewer | 🟠 |
| Patch circulaire dans le header | 🟠 |
| Variables CSS Design Reference | 🟠 |
| Grille sélection profil GitHub Pages | 🟠 |
| CSP | 🟠 |
| Version dynamique | 🟠 |
| Deploy GitHub Pages | 🟡 |

### MANIFEST — Alignement design (Étape 4)

| Chantier | Priorité |
|----------|----------|
| Dark theme par défaut | 🟠 |
| Mercury Opening avec patch Manifest | 🟠 |
| Patch circulaire dans le header | 🟠 |
| Variables CSS Design Reference | 🟠 |
| Grille sélection profil GitHub Pages | 🟠 |
| CSP | 🟠 |
| Version dynamique | 🟠 |

### ARK — Construction complète (Étape 7)

| Chantier | Priorité |
|----------|----------|
| Spec fonctionnelle complète | 🔴 |
| Patch + identité visuelle | 🔴 |
| Architecture Electron | 🔴 |
| Mercury Opening | 🔴 |
| Session Launcher (natif) | 🔴 |
| Analyse projet Premiere | 🔴 |
| Compression vidéo HandBrake | 🔴 |
| ZIP dossier projet | 🔴 |
| Gestion destination (remplacement ou double) | 🔴 |
| Monday : lecture + écriture statut ARCHIVÉ | 🔴 |
| Release GitHub | 🟡 |

### LAUNCHER — Finalisation (Étape 6)

| Chantier | Priorité |
|----------|----------|
| `author` dans `package.json` | 🟡 |
| Changelog en modale interne (vs navigateur) | 🟡 |
| Bouton Plan Directeur | 🟡 |
| MASTER Retriever — onglet enrichi | 🟡 |
| Bouton "Installer" → flux DMG si release disponible | 🟡 |

### MODULE PARTAGÉ (Étape 5)

| Chantier | Priorité |
|----------|----------|
| `profile-loader.js` — lecture session.json + avatar header | 🟡 |
| Déploiement BackUpFlow + Transporter | 🟡 |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.29.03.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.29.03.26 | 🔵 Lancement |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | ⚫ En projet |
| Manifest | `RealCoolclint/EasyCallSheet` | GitHub Pages | ⚫ En projet |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | ✅ 6 profils |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ |
| ARK | À créer | — | ⚫ |

---

## Ressources du projet

| Document | Rôle |
|----------|------|
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 — référence définitive |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète — Launcher V2 comme étalon |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen détaillée |

---

## Phase Gemini — Horizon

- SSO cross-machine — `tranquility-session` GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V2.3 — 29 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.0*
*Prochaine mise à jour : à la fin du chantier Reviewer*
