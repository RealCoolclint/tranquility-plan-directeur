# Plan Directeur Tranquility Suite — V1.8
*Mise à jour le 23 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 95% (Launcher V2 en orbite — v1.0.0)**

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
| 1 | **BackUpFlow** | V1.06.03.26 — Mercury | Installable via Launcher |
| 2 | **Transporter** | V1.19.03.26 — Mercury | Monday.com intégré |
| 3 | **Reviewer** | — | Web, GitHub Pages |
| 4 | **Manifest** | — | Web, GitHub Pages |
| 5 | **Launcher** | V1.0.0 — Mercury | Hub central, DMG publié |

### En projet ⚫

| # | Outil | Notes |
|---|-------|-------|
| 6 | ARK | Specs à définir |
| 7 | Cargo | — |
| 8 | Payload | Desktop + Mobile — Phase Gemini |
| 9 | Hatch | — |
| 10 | Guidance | — |
| 11 | Rover | — |
| 12-17 | Outils Phase Gemini/Apollo | Apps light pour externes |

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
- Mode MASTER — tour de contrôle 6 onglets
- Retriever — coffre-fort AES-256-GCM, keytar, sync GitHub
- Signalement Resend — branché Retriever, mail validé en test réel
- Permissions granulaires — active / vitrine / masqué par profil
- Bouquets thématiques — tri des apps par rôle métier
- Notes de version via API Claude — claude-sonnet-4-6
- App Manager intégré — téléchargement + installation silencieuse
- Désinstallation — confirmation native, redraw dashboard
- Avatars profils — 28 avatars NASA style, grille de sélection
- Patches animés : Launcher, Transporter, BackUpFlow, Manifest, Reviewer (MP4)
- 3 contextes d'animation — splash, modale PlayStation, carte dashboard
- Corrections modales, bouton Passer onboarding, caches MASTER
- **Citations inspirantes** — repo `tranquility-quotes`, aléatoire par session
- **Ambiance cosmos loop infini** — zoom/tilt oscillants, vignette adoucie
- **Retriever — statut connexions** — ping 5 services, latence, âge des clés
- **Diagnostic réseau** — modale dédiée dans Système
- **Équipe enrichi** — statut connexion, inactifs +30j, santé repo GitHub
- **Console de logs** — `TQ_LOGS`, catégories colorées, Rafraîchir/Vider
- **Rapport de santé exportable** — fichier .txt horodaté sur le Bureau
- **Permissions système** — Trousseau, Notifications, Accès disque
- **Changelog intégré** — releases GitHub brutes par app
- **Infrastructure GitHub** — repo `RealCoolclint/Launcher` public, release v1.0.0

---

## Infrastructure GitHub

| App | Repo | Release | DMG |
|-----|------|---------|-----|
| BackUpFlow | `RealCoolclint/BackUpFlow` (public) | v1.06.03.26 — Mercury | ✅ |
| Transporter | `RealCoolclint/Transporter` (public) | v1.19.03.26 — Mercury | ✅ |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | — |
| Manifest | `RealCoolclint/EasyCallSheet` | GitHub Pages | — |
| Launcher | `RealCoolclint/Launcher` (public) | v1.0.0 — Mercury | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | `TRANQUILITY_PLAN_DIRECTEUR.md` | — |
| Citations | `RealCoolclint/tranquility-quotes` (public) | `quotes.json` | — |

---

## Décisions produit actées — Phase Mercury

- **Retriever** — Launcher = source de vérité des secrets. Chaque app reste autonome.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher.
- **Destination DMG** — par profil, invisible par défaut, dossier visible optionnel.
- **Navigateur embarqué** — backlog Phase Apollo.
- **SSO implicite** — reporté Phase Gemini. Spec dans `TRANQUILITY_SSO_SPEC.md`. Architecture : fichier `session-[profileId].json` sur repo GitHub `tranquility-session`.
- **Plan Directeur public** — repo `tranquility-plan-directeur`, watch automatique local.
- **Langue unique** — français uniquement, option Langue retirée des réglages.
- **Audio ambiance** — 96kbps mono, sous 50MB GitHub.

---

## Phase Mercury — Bilan

### ✅ Complété
- BackUpFlow V1 Mercury
- Transporter V1 Mercury
- Launcher V1.0.0 Mercury

### 🔵 Restant avant clôture Mercury
- ARK — patch à générer, intégration flotte HTML
- Reviewer — lancement Mercury (web app)

---

## Phase Gemini — Prochains chantiers

| Priorité | Chantier | Notes |
|----------|----------|-------|
| 1 | **SSO implicite** | Repo `tranquility-session`, module `session.js` par app |
| 2 | **Payload** | UX documentation, Mode 2 (kit checkout) et Mode 3 (Mojo) |
| 3 | **ARK** | Patch + développement |
| 4 | **Reviewer Mercury** | Lancement web |
| 5 | **Apps light externes** | Déclinaisons Reviewer/Manifest |

---

*Plan Directeur V1.8 — 23 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V1.7*
