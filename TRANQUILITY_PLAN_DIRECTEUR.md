# Plan Directeur Tranquility Suite — V2.1
*Mise à jour le 29 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 92%**

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, lancée et en utilisation |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **BackUpFlow** | v1.29.03.26 — Mercury | Mercury Opening ✅, Protocole Session ✅, Avatars ✅ |
| 2 | **Transporter** | V1.19.03.26 — Mercury | Mercury Opening ✅, Protocole Session ✅ |
| 3 | **Launcher V2** | v1.29.03.26 — Mercury | Session writer ✅, Avatars ✅, Retriever ✅ |
| 4 | **Reviewer** | — | Web, GitHub Pages — Mercury Design à faire |
| 5 | **Manifest** | — | Web, GitHub Pages — Mercury Design à faire |

### En projet ⚫

| # | Outil | Notes |
|---|-------|-------|
| 6 | ARK | Spec à définir |
| 7 | Cargo | — |
| 8 | Payload | Desktop + Mobile, Phase Gemini |
| 9 | Hatch | — |
| 10 | Guidance | — |
| 11 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 12-17 | Outils Phase Gemini/Apollo | CAPCOM, DATAPAD, BLACKBOX, Telemetry, Beacon, Debrief |

---

## Protocole Session Launcher — Mercury

**Implémenté le 28 mars 2026. Architecture validée.**

Modèle Adobe CC — couplage faible par fichier local :
- Launcher écrit `~/Library/Application Support/tranquility-suite/session.json` au login profil
- Apps lisent le fichier au démarrage — aucune communication temps réel
- Expiration automatique 8h (Mac partagé) — 30 jours (Mac perso, option "Rester connecté")
- Suppression au quit de Launcher
- Mode standalone : chaque app reste pleinement fonctionnelle sans Launcher

| App | session-writer | session-reader | Écran connecté | Persistance retour |
|-----|---------------|----------------|----------------|--------------------|
| Launcher V2 | ✅ | — | — | — |
| BackUpFlow | — | ✅ | ✅ | ✅ |
| Transporter | — | ✅ | ✅ | ✅ |
| Reviewer | — | À faire (Phase Gemini) | — | — |
| Manifest | — | À faire (Phase Gemini) | — | — |

---

## Profil Passeport — Architecture identité

**Spécifié le 29 mars 2026. Voir `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` V1.0.**

Modèle Adobe CC — Launcher est le seul gestionnaire d'identité :

- Bloc `identity` — nom, email, avatar URL GitHub, rôle, initiales, couleur, mondayUserId
- Bloc `appSettings` — préférences par app, chaque app dans son coin
- Trois statuts de profil : `pending` → `active` → `archived`
- Deux scénarios de création : onboarding préparé (MASTER) ou auto-enregistrement
- Alertes mail Resend sur tout événement profil
- Apps web (Reviewer, Manifest…) : accès via `profiles.json` GitHub + grille de sélection + localStorage

| Famille | Mécanisme Mercury | Phase Gemini |
|---------|------------------|--------------|
| Desktop Electron | `session.json` via Launcher | Cross-machine via GitHub |
| Web GitHub Pages | `profiles.json` + localStorage | Auth renforcée |
| CEP Premiere | Non couvert | À définir |

---

## Mercury Design — État de la normalisation

Norme Mercury Opening : grille canvas + cercle radar SVG + patch animé `<video>` + flash blanc.

| App | Dark theme | Mercury Opening | Header patch | Bouton QUITTER |
|-----|-----------|----------------|-------------|----------------|
| BackUpFlow | ✅ | ✅ | ✅ | ✅ supprimé |
| Transporter | ✅ | ✅ | ✅ | ✅ supprimé |
| Launcher V2 | ✅ | ✅ | ✅ | — |
| Reviewer | À faire | À faire | À faire | — |
| Manifest | À faire | À faire | À faire | — |

---

## Launcher V2 — Détail Phase C

### Livré ✅
- Splash screen Mercury + cosmos dashboard (1100 étoiles, constellations, étoiles filantes)
- Dashboard : cartes 280px, devise latine, bouton lancement direct
- Modale PlayStation : ambiances canvas, parallaxe, depth particles
- Profils GitHub sync (`launcher-profiles` privé)
- GitHub Releases API — badges "À jour" / "↑ Mise à jour"
- Icône barre de menu macOS (tray)
- CSP propre — `version.js` externalisé
- Favoris par profil — étoile ★, section dédiée
- Admin protégé — SHA-256, code de secours, TouchID, fichier lock
- Mode MASTER — tour de contrôle 5 onglets
- Retriever — coffre-fort AES-256-GCM, keytar, sync GitHub
- Signalement Resend — branché Retriever, mail validé en test réel
- Permissions granulaires — active / vitrine / masqué par profil
- Bouquets thématiques — tri des apps par rôle métier
- Notes de version via API Claude — claude-sonnet-4-6
- App Manager intégré — téléchargement + installation silencieuse
- Désinstallation — confirmation native, redraw dashboard
- Avatars profils — 28 avatars NASA style, grille de sélection, URL raw GitHub
- Patches animés Mercury Opening — Launcher + Transporter en MP4 fond noir
- 3 contextes d'animation — splash, modale PlayStation (auto), carte dashboard (hover)
- Touche Entrée — sur toutes les modales
- Bouton modale adapté à l'état — Télécharger / Lancer / Mettre à jour / Localiser
- Correction modale installation — étape "déplacer le .app" supprimée
- Bouton "Passer" onboarding — skip vers grille des profils
- Caches MASTER — 3 boutons séparés avec confirmation native
- **Session Launcher** — `session-writer.js`, écriture au login, suppression au quit ✅
- **Avatars** — URL raw GitHub écrites dans `session.json` (profil + allProfiles) ✅

### En cours / À faire 🔵
- `author` dans `package.json` (warning electron-builder)
- Bouton "Mettre à jour le Plan Directeur" — MASTER → Système
- MASTER Retriever — statut connexions + âge clés API
- **MASTER Équipe — création / modification / archivage profils + alertes mail** (Profil Passeport)
- Paramètres profil — permissions système, console logs, rapport santé
- Modale PlayStation — description longue, changelog, modifier chemin, doc
- Release GitHub Launcher mise à jour (Plan Directeur V2.1 + DMG)

---

## Infrastructure GitHub

| Ressource | Repo | Contenu | Visibilité |
|-----------|------|---------|-----------|
| BackUpFlow | `RealCoolclint/BackUpFlow` | Release v1.29.03.26 — DMG ✅ | Public |
| Transporter | `RealCoolclint/Transporter` | Release v1.19.03.26 — DMG ✅ 270MB | Public |
| Launcher V2 | `RealCoolclint/Launcher` | Release v1.29.03.26 — DMG ✅ | Public |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | Public |
| Manifest | `RealCoolclint/EasyCallSheet` | GitHub Pages | Public |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` — 6 profils équipe | Privé |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars NASA style | Public |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` + specs | Public |

---

## Décisions produit actées — Phase Mercury

- **Retriever** — Launcher = source de vérité des secrets. Chaque app reste autonome avec ses propres clés.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub.
- **Profil temporaire** — en mode connecté, les apps construisent un profil en mémoire depuis `session.json` sans lookup local.
- **SSO implicite** — via repo `launcher-profiles` GitHub. Reporté Phase Gemini.
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique.
- **Build BackUpFlow** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist` — erreur `native.node`).
- **Profil Passeport** — identité universelle sur toute la suite, modèle Adobe CC. Launcher seul écrit `identity`. Chaque app gère son `appSettings`. Trois statuts : `pending`, `active`, `archived`. Voir `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` V1.0.
- **Avatars profils** — repo public `tranquility-avatars`, URL raw GitHub dans `session.json` et `profiles.json`. Jamais de chemin local.

---

## Prochains chantiers — ordre prioritaire

### 🔴 Immédiat
1. Transporter — 2ème test production (valise avec médias accessibles localement)

### 🟠 Mercury Design suite
2. Reviewer — dark theme, version, patch header
3. Manifest — audit + dark theme + version
4. ARK — spec, patch, Fleet HTML

### 🟠 Profil Passeport — implémentation
5. MASTER Équipe — création / modification / archivage profils avec alertes mail Resend
6. Grille de sélection profil dans apps web (Reviewer, Manifest)
7. `profile-loader.js` — module partagé desktop

### 🟡 Launcher V2 finalisation
8. `author` package.json
9. Bouton "Mettre à jour le Plan Directeur" — MASTER Système
10. MASTER Retriever — statut + âge clés
11. Paramètres profil
12. Modale PlayStation — enrichissement
13. Release GitHub Launcher mise à jour

### 🟡 Skill Mercury
14. Réécriture `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md`

### ⚫ Phase Gemini
15. SSO cross-machine — `tranquility-session`
16. Payload — UX documentation, Mode 2 et Mode 3
17. Auth renforcée apps web (token GitHub ou Supabase)
18. Accès profil depuis extensions CEP

---

*Plan Directeur V2.1 — 29 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.0*
