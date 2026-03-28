# Plan Directeur Tranquility Suite — V1.9
*Mise à jour le 28 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 88%**

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
| 1 | **BackUpFlow** | V1.06.03.26 — Mercury | Mercury Opening ✅, Protocole Session ✅ |
| 2 | **Transporter** | V1.19.03.26 — Mercury | Mercury Opening ✅, Protocole Session ✅ |
| 3 | **Reviewer** | — | Web, GitHub Pages — Mercury Design à faire |
| 4 | **Manifest** | — | Web, GitHub Pages — Mercury Design à faire |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 5 | **Launcher V2** | Phase C — finalisation | Session Launcher côté écrivain ✅ |

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
- Expiration automatique 8h
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

## Mercury Design — État de la normalisation

Norme Mercury Opening : grille canvas + cercle radar SVG + patch animé `<video>` + flash blanc.

| App | Dark theme | Mercury Opening | Header patch | Bouton QUITTER |
|-----|-----------|----------------|-------------|----------------|
| BackUpFlow | ✅ | ✅ | ✅ | ✅ supprimé |
| Transporter | ✅ | ✅ | ✅ | ✅ supprimé |
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
- Avatars profils — 28 avatars NASA style, grille de sélection
- Patches animés Mercury Opening — Launcher + Transporter en MP4 fond noir
- 3 contextes d'animation — splash, modale PlayStation (auto), carte dashboard (hover)
- Touche Entrée — sur toutes les modales
- Bouton modale adapté à l'état — Télécharger / Lancer / Mettre à jour / Localiser
- Correction modale installation — étape "déplacer le .app" supprimée
- Bouton "Passer" onboarding — skip vers grille des profils
- Caches MASTER — 3 boutons séparés avec confirmation native
- **Session Launcher** — `session-writer.js`, écriture au login, suppression au quit ✅

### En cours / À faire 🔵
- `author` dans `package.json` (warning electron-builder)
- Bouton "Mettre à jour le Plan Directeur" — MASTER → Système
- MASTER Retriever — statut connexions + âge clés API
- MASTER Équipe — santé repo GitHub, inactifs 30j, état onboarding
- Paramètres profil — permissions système, console logs, rapport santé
- Modale PlayStation — description longue, changelog, modifier chemin, doc
- Release GitHub Launcher mise à jour (Plan Directeur V1.9 + DMG)

---

## Infrastructure GitHub

| App | Repo | Release | DMG |
|-----|------|---------|-----|
| BackUpFlow | `RealCoolclint/BackUpFlow` (public) | v1.06.03.26 — Mercury | ✅ |
| Transporter | `RealCoolclint/Transporter` (public) | v1.19.03.26 — Mercury | ✅ 270MB |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | — |
| Manifest | `RealCoolclint/EasyCallSheet` | GitHub Pages | — |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | `TRANQUILITY_PLAN_DIRECTEUR.md` | — |
| Launcher V2 | `RealCoolclint/Launcher` (public) | v1.0.0 | ✅ |

---

## Décisions produit actées — Phase Mercury

- **Retriever** — Launcher = source de vérité des secrets. Chaque app reste autonome avec ses propres clés.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub (Phase Gemini).
- **Profil temporaire** — en mode connecté, les apps construisent un profil en mémoire depuis `session.json` sans lookup local. Aucune synchronisation d'ID requise entre Launcher et les apps.
- **SSO implicite** — via repo `launcher-profiles` GitHub. Reporté Phase Gemini.
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique.
- **Build BackUpFlow** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist` — erreur `native.node`).

---

## Prochains chantiers — ordre prioritaire

### 🔴 Immédiat
1. Transporter — 2ème test production (valise avec médias accessibles localement)

### 🟠 Mercury Design suite
2. Reviewer — dark theme, version, patch header
3. Manifest — audit + dark theme + version
4. ARK — spec, patch, Fleet HTML

### 🟡 Launcher V2 finalisation
5. `author` package.json
6. Bouton "Mettre à jour le Plan Directeur" — MASTER Système
7. MASTER Retriever — statut + âge clés
8. MASTER Équipe — santé repo, inactifs, onboarding
9. Paramètres profil
10. Modale PlayStation — enrichissement
11. Release GitHub Launcher mise à jour

### 🟡 Skill Mercury
12. Réécriture `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md`

### ⚫ Phase Gemini
13. SSO cross-machine — `tranquility-session`
14. Payload — UX documentation, Mode 2 et Mode 3

---

*Plan Directeur V1.9 — 28 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V1.8*
