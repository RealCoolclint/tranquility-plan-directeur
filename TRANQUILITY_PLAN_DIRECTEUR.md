# Plan Directeur Tranquility Suite — V2.0
*Mise à jour le 28 mars 2026 — Cellule Vidéo L'Étudiant*

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
| 1 | **BackUpFlow** | V1.05.03.26 — Mercury | Mercury Opening ✅, Protocole Session ✅, Tranquility Cloud ✅ |
| 2 | **Transporter** | V1.19.03.26 — Mercury | Mercury Opening ✅, Protocole Session ✅ |
| 3 | **Reviewer** | — | Web, GitHub Pages — Mercury Design à faire |
| 4 | **Manifest** | — | Web, GitHub Pages — Mercury Design à faire |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 5 | **Launcher V2** | Phase C — finalisation | Tranquility Cloud ✅, session.json V2 ✅ |

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

## Tranquility Cloud — Architecture validée le 28 mars 2026

**Principe fondamental : GitHub = cloud, Launcher = interface, apps = consommateurs.**

Document de référence : `TRANQUILITY_CLOUD_SPEC.md`

### Règles absolues
- Aucune app ne possède ses propres profils — jamais
- Launcher est la seule interface de configuration des profils
- Les apps lisent `session.json` au démarrage et consomment silencieusement
- Les clés API ne sont jamais stockées en local dans les apps

### session.json V2 — Format enrichi
```json
{
  "version": 2,
  "profile": { "id", "name", "role", "avatar", "email", "mondayUserId", "prefs", "appSettings" },
  "allProfiles": [ { "id", "name", "initiales", "mondayUserId", "ssdPersoPath", "appSettings" } ],
  "apiKeys": { "monday", "resend", "gofile", "anthropic", "github" }
}
```

### État de la migration
| App | profiles.json local | session.json V2 | appSettings |
|-----|--------------------|--------------------|-------------|
| BackUpFlow | 🔲 À supprimer | ✅ | ✅ |
| Transporter | — | ✅ reader en place | 🔲 À câbler |
| Launcher | ✅ source de vérité | ✅ écrivain | ✅ |

---

## Protocole Session Launcher — Mercury

**Implémenté et validé. Architecture Tranquility Cloud.**

| App | session-writer | session-reader | Écran connecté | Grille profils | Header actif |
|-----|---------------|----------------|----------------|----------------|--------------|
| Launcher V2 | ✅ V2 | — | — | — | — |
| BackUpFlow | — | ✅ V1+V2 | ✅ | ✅ | 🔲 |
| Transporter | — | ✅ | ✅ | 🔲 | 🔲 |
| Reviewer | — | À faire (Gemini) | — | — | — |
| Manifest | — | À faire (Gemini) | — | — | — |

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
- **Session Launcher V2** — `session-writer.js` format V2, `allProfiles`, `appSettings`, clés API ✅
- **Tranquility Cloud** — migration profils BackUpFlow → `appSettings.backupflow` sur GitHub ✅

### En cours / À faire 🔵
- Header profil actif dans les apps (indicateur + changement rapide)
- Spec "Profil Passeport" — exhaustivité des données embarquées
- Interface `appSettings` par app dans Launcher (Phase Gemini)
- `author` dans `package.json` (warning electron-builder)
- Bouton "Mettre à jour le Plan Directeur" — MASTER → Système
- MASTER Retriever — statut connexions + âge clés API
- MASTER Équipe — santé repo GitHub, inactifs 30j, état onboarding
- Paramètres profil — permissions système, console logs, rapport santé
- Modale PlayStation — description longue, changelog, modifier chemin, doc
- Release GitHub Launcher V1.1

---

## Infrastructure GitHub

| App | Repo | Release | DMG |
|-----|------|---------|-----|
| BackUpFlow | `RealCoolclint/BackUpFlow` (public) | v1.05.03.26 — Mercury | ✅ |
| Transporter | `RealCoolclint/Transporter` (public) | v1.19.03.26 — Mercury | ✅ 270MB |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | — |
| Manifest | `RealCoolclint/EasyCallSheet` | GitHub Pages | — |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` avec `appSettings` | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | `TRANQUILITY_PLAN_DIRECTEUR.md` | — |
| Launcher V2 | `RealCoolclint/Launcher` (public) | v1.0.0 → V1.1 à faire | ✅ |

---

## Décisions produit actées — Phase Mercury

- **Tranquility Cloud** — GitHub = cloud, Launcher = interface, apps = consommateurs. Document fondateur `TRANQUILITY_CLOUD_SPEC.md`.
- **Profil Passeport** — chaque profil embarque `appSettings` par app. Structure extensible : nouvelles apps ajoutent leur bloc sans casser les existants.
- **session.json V2** — format enrichi avec `profile` imbriqué, `allProfiles` complet, `appSettings` par app, clés API.
- **Zéro profil local dans les apps** — `profiles.json` de BackUpFlow à supprimer après validation complète.
- **Retriever** — Launcher = source de vérité des secrets. Clés API dans `session.json` déchiffrées par Launcher.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub (Phase Gemini).
- **SSO implicite** — via repo `launcher-profiles` GitHub. Reporté Phase Gemini.
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique.
- **Build BackUpFlow** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist` — erreur `native.node`).

---

## Prochains chantiers — ordre prioritaire

### 🔴 Immédiat
1. **Header profil actif BackUpFlow** — indicateur + changement rapide (modèle Adobe CC avatar)
2. **Spec "Profil Passeport"** — document exhaustif des données embarquées par profil
3. **Audit `selectLauncherProfile()`** — vérifier que tous les `appSettings.backupflow` sont bien appliqués
4. **Build BackUpFlow V1.1** + Release GitHub
5. **Build Launcher V1.1** + Release GitHub

### 🟠 Mercury Design suite
6. Reviewer — dark theme, version, patch header
7. Manifest — audit + dark theme + version
8. ARK — spec, patch, Fleet HTML

### 🟡 Launcher V2 finalisation
9. `author` package.json
10. Bouton "Mettre à jour le Plan Directeur" — MASTER Système
11. MASTER Retriever — statut + âge clés
12. MASTER Équipe — santé repo, inactifs, onboarding
13. Paramètres profil
14. Modale PlayStation — enrichissement
15. Release GitHub Launcher V1.1

### 🟡 Skill Mercury
16. Réécriture `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md`

### ⚫ Phase Gemini
17. SSO cross-machine — `tranquility-session`
18. Interface `appSettings` dans Launcher
19. Payload — UX documentation, Mode 2 et Mode 3

---

*Plan Directeur V2.0 — 28 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V1.9*
