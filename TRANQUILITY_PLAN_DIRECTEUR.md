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
| 1 | **BackUpFlow** | V1.1 — v1.29.03.26 | Tranquility Cloud ✅, Header profil actif ✅, Avatars GitHub ✅ |
| 2 | **Transporter** | V1.19.03.26 — Mercury | Mercury Opening ✅, Protocole Session ✅ |
| 3 | **Launcher V2** | V1.1 — v1.29.03.26 | Tranquility Cloud ✅, Avatars GitHub ✅, Source de vérité unique ✅ |
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

## Tranquility Cloud — Architecture validée le 28-29 mars 2026

**Principe fondateur :** Launcher est le seul à écrire. Les apps ne font que lire.

```
Launcher écrit → session.json → chaque app lit sa partie → workflow alimenté automatiquement
```

- GitHub = cloud, Launcher = interface, apps = consommateurs
- `session.json` V2 : `profile`, `allProfiles`, `appSettings` (par app), `apiKeys`
- 6 profils réels dans `launcher-profiles` (privé) avec blocs `appSettings.backupflow`
- Avatars universels : repo public `tranquility-avatars`, URL raw GitHub dans `session.json`
- Expiration : 8h Mac Studio, 30 jours Mac perso

**Couche Passeport Profil :** chaque app embarque une couche de lecture `appSettings.<appname>`. Au fil des développements, chaque nouvelle app enrichit le format du profil dans Launcher sans jamais casser l'existant.

| App | session-writer | session-reader | Écran connecté | Header profil | Avatars |
|-----|---------------|----------------|----------------|---------------|---------|
| Launcher V2 | ✅ | — | — | — | ✅ |
| BackUpFlow | — | ✅ | ✅ | ✅ | ✅ |
| Transporter | — | ✅ | ✅ | À faire | À faire |
| Reviewer | — | À faire (Phase Gemini) | — | — | — |
| Manifest | — | À faire (Phase Gemini) | — | — | — |

---

## Avatars universels — Architecture

**Repo :** `RealCoolclint/tranquility-avatars` (public) — 28 avatars `.jpeg` + `.png`
**URL pattern :** `https://raw.githubusercontent.com/RealCoolclint/tranquility-avatars/main/avatar_13.jpeg`
**Règle :** `session-writer.js` de Launcher convertit toujours les chemins relatifs en URL raw GitHub à l'écriture. Les apps ne manipulent jamais de chemins locaux d'avatars.
**CSP :** toute app Electron affichant des avatars doit avoir `img-src` incluant `https://raw.githubusercontent.com`.

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

## Launcher V2 — Détail

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
- **Tranquility Cloud V1.1** — `session-writer.js` V2, avatars URL GitHub raw, source de vérité unique ✅

### En cours / À faire 🔵
- `author` dans `package.json` (warning electron-builder)
- Bouton "Mettre à jour le Plan Directeur" — MASTER → Système
- MASTER Retriever — statut connexions + âge clés API
- MASTER Équipe — santé repo GitHub, inactifs 30j, état onboarding
- Paramètres profil — permissions système, console logs, rapport santé
- Modale PlayStation — description longue, changelog, modifier chemin, doc

---

## Infrastructure GitHub

| App | Repo | Release | DMG |
|-----|------|---------|-----|
| BackUpFlow | `RealCoolclint/BackUpFlow` (public) | v1.29.03.26 — V1.1 | ✅ |
| Transporter | `RealCoolclint/Transporter` (public) | v1.19.03.26 — Mercury | ✅ 270MB |
| Launcher V2 | `RealCoolclint/Launcher` (public) | v1.29.03.26 — V1.1 | ✅ |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | — |
| Manifest | `RealCoolclint/EasyCallSheet` | GitHub Pages | — |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` avec `appSettings` | — |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | `TRANQUILITY_PLAN_DIRECTEUR.md` | — |

---

## Décisions produit actées — Phase Mercury

- **Retriever** — Launcher = source de vérité des secrets. Chaque app reste autonome avec ses propres clés.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub (Phase Gemini).
- **Profil temporaire** — en mode connecté, les apps construisent un profil en mémoire depuis `session.json` sans lookup local. Aucune synchronisation d'ID requise entre Launcher et les apps.
- **SSO implicite** — via repo `launcher-profiles` GitHub. Reporté Phase Gemini.
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique.
- **Build BackUpFlow** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist` — erreur `native.node`).
- **Avatars universels** — jamais de chemin local dans `session.json`. Toujours une URL raw GitHub absolue. Ça marche sur toutes les machines, pour toute la suite.
- **Couche Passeport Profil** — standard Mercury pour toute nouvelle app : lire `appSettings.<appname>` depuis `session.json`, injecter dans le state. Launcher = seul écrivain.

---

## Prochains chantiers — ordre prioritaire

### 🔴 Immédiat
1. Spec "Profil Passeport" — document exhaustif + spec module partagé `profile-loader.js`

### 🟠 Mercury Design suite
2. Transporter — header profil actif + avatars (modèle BackUpFlow V1.1)
3. Reviewer — dark theme, version, patch header
4. Manifest — audit + dark theme + version
5. ARK — spec, patch, Fleet HTML

### 🟡 Launcher V2 finalisation
6. `author` package.json
7. Bouton "Mettre à jour le Plan Directeur" — MASTER Système
8. MASTER Retriever — statut + âge clés
9. MASTER Équipe — santé repo, inactifs, onboarding
10. Paramètres profil
11. Modale PlayStation — enrichissement

### 🟡 Skill Mercury
12. Réécriture `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md`

### ⚫ Phase Gemini
13. SSO cross-machine — `tranquility-session`
14. Payload — UX documentation, Mode 2 et Mode 3

---

*Plan Directeur V2.1 — 29 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.0*
