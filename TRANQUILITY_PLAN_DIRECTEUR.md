# Plan Directeur Tranquility Suite — V1.6
*Mise à jour le 22 mars 2026 18:00 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 75% (Launcher V2 features en cours)**

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
| 1 | **BackUpFlow** | V1.06.03.26 — Mercury | Installable via Launcher V2 |
| 2 | **Transporter** | V1.19.03.26 — Mercury | Monday.com intégré |
| 3 | **Reviewer** | — | Web, GitHub Pages |
| 4 | **Manifest** | — | Web, GitHub Pages |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 5 | **Launcher V2** | Phase C en cours | Chantiers MASTER + features utilisateurs |

### En projet ⚫

| # | Outil | Notes |
|---|-------|-------|
| 6 | ARK | Specs à définir |
| 7 | Cargo | — |
| 8 | Payload | Desktop + Mobile |
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
- **Favoris par profil** — étoile ★, section dédiée
- **Admin protégé** — SHA-256, code de secours, TouchID, fichier lock
- **Mode MASTER** — tour de contrôle 5 onglets
- **Retriever** — coffre-fort AES-256-GCM, keytar, sync GitHub
- **Signalement Resend** — branché Retriever, mail validé en test réel
- **Permissions granulaires** — active / vitrine / masqué par profil
- **Bouquets thématiques** — tri des apps par rôle métier
- **Notes de version via API Claude** — claude-sonnet-4-6
- **App Manager intégré** — téléchargement + installation silencieuse
- **Désinstallation** — confirmation native, redraw dashboard
- **Avatars profils** — 28 avatars NASA style, grille de sélection
- **Patches animés Mercury Opening** — Launcher + Transporter en MP4 fond noir
- **3 contextes d'animation** — splash, modale PlayStation (auto), carte dashboard (hover)
- **Touche Entrée** — sur toutes les modales (Signalement, Profil)
- **Bouton modale adapté à l'état** — Télécharger / Lancer / Mettre à jour / Localiser
- **Correction modale installation** — étape "déplacer le .app" supprimée
- **Bouton "Passer" onboarding** — skip vers grille des profils, toutes étapes
- **Caches MASTER** — 3 boutons séparés (profils, téléchargements, Retriever) avec confirmation native

### En cours 🔵
- MASTER onglet Système — enrichissement (carte flotte, logs install, espace disque, userData, versions runtime, Plan Directeur, mode diagnostic)
- MASTER onglet Retriever — statut connexions critiques, âge des clés API
- MASTER onglet Équipe — santé repo GitHub, activité profils, profils inactifs, état onboarding
- Paramètres individuels profil — permissions système, console logs, rapport santé, changelog
- Plan Directeur en ligne — repo public `tranquility-plan-directeur`, watch automatique local
- SSO implicite (session dédiée)
- Infrastructure GitHub Launcher V2

---

## Infrastructure GitHub

| App | Repo | Release | DMG |
|-----|------|---------|-----|
| BackUpFlow | `RealCoolclint/BackUpFlow` (public) | v1.06.03.26 — Mercury | ✅ |
| Transporter | `RealCoolclint/Transporter` (public) | v1.19.03.26 — Mercury | 270MB ✅ |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | — |
| Manifest | `RealCoolclint/EasyCallSheet` | GitHub Pages | — |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | `TRANQUILITY_PLAN_DIRECTEUR.md` | — |
| Launcher V2 | À créer | — | — |

---

## Décisions produit actées — Phase Mercury

- **Retriever** — Launcher = source de vérité des secrets. Chaque app reste autonome avec ses propres clés. Pas de dépendance : si Launcher n'est pas lancé, les apps fonctionnent quand même.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Destination DMG** — par profil, invisible par défaut (`userData/downloads`), dossier visible optionnel.
- **Navigateur embarqué** — backlog Phase Apollo.
- **Panneau statut Reviewer** — Phase Mercury, réservé admin/co-admin.
- **SSO implicite** — via repo `launcher-profiles` GitHub. Pré-sélection si profil existant, sinon accès normal.
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique, watch automatique local → push GitHub → lu par Launcher et JARVIS.

---

## Prochains lancements

### Lancement 5 — Launcher V2 (en cours)
**Objectif :** hub central de la suite, installable et à jour automatiquement
**État :** Phase C — MASTER enrichissement + features utilisateurs
**Prochaine release :** DMG via `RealCoolclint/Launcher-v2`

### Lancement 6 — Phase Gemini
**Objectif :** apps light pour les externes (Reviewer, Manifest déclinaisons)
**État :** en projet, dépend de Launcher V2 en orbite

---

*Plan Directeur V1.6 — 22 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V1.5*
