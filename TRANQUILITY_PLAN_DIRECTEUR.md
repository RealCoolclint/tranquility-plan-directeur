# Plan Directeur Tranquility Suite — V2.0
*Mise à jour le 28 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 90%**

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
| 1 | **BackUpFlow** | V1.06.03.26 — Mercury | Mercury Opening ✅, Protocole Session reader ⏳ |
| 2 | **Transporter** | V1.19.03.26 — Mercury | Mercury Opening ✅, Protocole Session reader ⏳ |
| 3 | **Reviewer** | — | Web, GitHub Pages — Mercury Design à faire |
| 4 | **Manifest** | — | Web, GitHub Pages — Mercury Design à faire |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 5 | **Launcher V2** | Phase C — finalisation | Session complète ✅ — build V1.1 à faire |

### En projet ⚫

| # | Outil | Notes |
|---|-------|-------|
| 6 | ARK | Spec complète dans prompt de continuation |
| 7 | Cargo | — |
| 8 | Payload | Desktop + Mobile, Phase Gemini |
| 9 | Hatch | — |
| 10 | Guidance | — |
| 11 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 12-17 | Outils Phase Gemini/Apollo | CAPCOM, DATAPAD, BLACKBOX, Telemetry, Beacon, Debrief |

---

## Protocole Session Launcher — Mercury

**Implémenté et validé le 28 mars 2026.**

Modèle Adobe CC — couplage faible par fichier local :
- Launcher écrit `~/Library/Application Support/tranquility-suite/session.json` au login profil
- Apps lisent le fichier au démarrage — aucune communication temps réel
- Expiration 8h (Mac partagé) ou 720h (Mon Mac — "Rester connecté 30 jours")
- Suppression au quit uniquement si session courte (8h)
- Mode standalone : chaque app reste pleinement fonctionnelle sans Launcher

| App | session-writer | session-reader | Écran login | Persistance 30j |
|-----|---------------|----------------|-------------|-----------------|
| Launcher V2 | ✅ | ✅ | ✅ | ✅ |
| BackUpFlow | — | ⏳ À faire | ⏳ À faire | ⏳ À faire |
| Transporter | — | ⏳ À faire | ⏳ À faire | ⏳ À faire |
| Reviewer | — | Phase Gemini | — | — |
| Manifest | — | Phase Gemini | — | — |

---

## Modèle "Launcher = Licence"

**Décision définitive actée le 28 mars 2026.**

- Launcher est le seul gestionnaire d'identité de la suite
- Les apps n'ont plus de profils locaux propres (à supprimer dans BackUpFlow et Transporter)
- Si une app démarre sans session Launcher → elle spawne Launcher automatiquement
- L'app affiche un écran d'attente et poll `session.json` toutes les 2 secondes
- Reprise automatique dès que la session apparaît

---

## Machines de travail

| Machine | Username | Home |
|---------|----------|------|
| Mac Maison | `martinpavloff` | `/Users/martinpavloff/` |
| Mac Bureau Perso | `mpavloff` | `/Users/mpavloff/` |
| Mac Studio | `studiovideo` | `/Users/studiovideo/` |

Disque commun : `/Volumes/BACKUP PRO/Outils/App Persos/`
Référence complète : `TRANQUILITY_MACHINES.md`

---

## Mercury Design — État de la normalisation

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
- **Protocole Session complet** — login, persistance 8h/720h, écran Continuer ✅

### En cours / À faire 🔵
- `author` dans `package.json` (warning electron-builder)
- MASTER Retriever — statut connexions + âge clés API
- MASTER Équipe — santé repo GitHub, inactifs 30j
- Paramètres profil — permissions système, console logs, rapport santé
- Release GitHub Launcher V1.1 (après BackUpFlow connecté)

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
| Launcher V2 | `RealCoolclint/Launcher` (public) | v1.0.0 → V1.1 à faire | ✅ |

---

## Décisions produit actées — Phase Mercury

- **Modèle "Launcher = Licence"** — calqué sur Adobe CC. Actée le 28 mars 2026.
- **Retriever** — Launcher = source de vérité des secrets. Chaque app reste autonome avec ses propres clés.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Protocole Session** — 8h Mac partagé, 720h Mon Mac. Couche Gemini : sync cross-machine via GitHub.
- **SSO implicite** — via repo `launcher-profiles` GitHub. Reporté Phase Gemini.
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique.
- **Build BackUpFlow** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist`).
- **Comparaison versions** — par `published_at` GitHub Releases (pas par tag).

---

## Prochains chantiers — ordre prioritaire

### 🔴 Immédiat — BackUpFlow
1. Supprimer les profils locaux de BackUpFlow
2. Ajouter lecteur `session.json` au démarrage
3. Écran d'attente si pas de session → spawn Launcher automatique
4. Build BackUpFlow V1.1
5. Build Launcher V1.1 + Release GitHub des deux

### 🟠 Mercury suite
6. Transporter — même pattern que BackUpFlow (profils locaux → session)
7. Reviewer — dark theme, Mercury Design
8. Manifest — dark theme, Mercury Design
9. ARK — construction complète

### 🟡 Launcher finalisation
10. `author` package.json
11. MASTER Retriever — statut + âge clés
12. MASTER Équipe — santé repo, inactifs
13. Paramètres profil

### ⚫ Phase Gemini
14. SSO cross-machine
15. Payload — UX documentation, Mode 2 et Mode 3
16. Reviewer V2 — Supabase + CEP

---

*Plan Directeur V2.0 — 28 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V1.9*
