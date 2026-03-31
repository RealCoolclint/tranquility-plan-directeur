# Plan Directeur Tranquility Suite — V2.8
*Mise à jour le 31 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 75%**

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
| 1 | **Launcher** | Desktop | Hub opérationnel, MASTER Équipe, session-writer.js | 🟣 En orbite |
| 2 | **BackUpFlow** | Desktop | Workflow complet, session conforme Spec V1.1, design aligné | 🟣 En orbite |
| 3 | **Transporter** | Desktop | Workflow valise complet, session conforme Spec V1.1, design aligné | 🟣 En orbite |
| 4 | **ARK** | Desktop | Archivage complet, session conforme Spec V1.1, Monday, design aligné | 🔵 En construction |
| 5 | **Reviewer** | Web | Design aligné, session conforme Spec V1.1 | 🟣 En orbite |
| 6 | **Manifest** | Web | Design aligné, session conforme Spec V1.1 | 🟣 En orbite |

> **Nouvelle condition transversale :** toutes les apps doivent implémenter `session-reader.js` conforme à `TRANQUILITY_SESSION_PROFILS_SPEC.md` avant Mercury exit.

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | MASTER Équipe ✅, Profil Passeport ✅, Alertes Resend ✅ |
| 2 | **Transporter** | v1.29.03.26 | Mercury complet ✅ |
| 3 | **BackUpFlow** | v1.31.03.26 | Mercury Design ✅ |
| 4 | **Reviewer** | GitHub Pages | Mercury Design ✅, tranquility-core.css ✅ |
| 5 | **Manifest** | v1.30.03.26 | Mercury Design ✅, repo renommé ✅ |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 6 | **ARK** | Scaffold + Mercury Opening + App shell ✅ | Session à migrer, sélecteur profil à faire |

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

## Ordre d'exécution — Chantiers restants Mercury

```
1. ARK              → session-reader.js + sélecteur profil + tests + build
2. TOUTES LES APPS  → migration session conforme TRANQUILITY_SESSION_PROFILS_SPEC.md
3. LAUNCHER         → session-writer.js (écriture tranquility-suite/session.json)
4. MERCURY EXIT     → 6/6 apps en orbite + session unifiée
```

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
- **Session unifiée** — `~/Library/Application Support/tranquility-suite/session.json` partagé entre toutes les apps.
- **La première app ouverte écrit la session** — les suivantes la lisent.
- **Launcher = gestion, pas connexion** — Launcher gère les profils et permissions, ne connecte pas les utilisateurs.
- **3 durées de session** — aujourd'hui / 7 jours / toujours.
- **Expiration non intrusive** — jamais en cours de workflow, seulement au prochain lancement.
- **Profils filtrés par appPermissions** — chaque app n'affiche que les profils autorisés par le MASTER.
- **Pas de PIN en Mercury** — sélection de profil suffit.
- **Avatars NASA obligatoires** dans le sélecteur de profil.
- **Badge HORS LIGNE** dans le header si pas de réseau.
- **Design Reference V2.0** — tokens CSS synchronisés avec tranquility-core.css réel (7 corrections).

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.29.03.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.31.03.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | — | 🔵 En construction |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | ✅ 6 profils |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V2.8 |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité | V1.1 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.0 ✅ |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 | V1.0 |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" | V1.0 |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json | V1.0 — à archiver |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |
| `TRANQUILITY_SUITE_MISSION_PATCHES_STATUT.md` | État des patches | V1.0 |

> **Note :** `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` est partiellement obsolète depuis la Session & Profils Spec V1.1. À archiver ou fusionner lors d'une prochaine session.

---

## Phase Gemini — Horizon

- SSO cross-machine — sync activité via GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- PIN / authentification renforcée sur le sélecteur de profil
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V2.8 — 31 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.7*
*Prochaine mise à jour : à la fin du chantier ARK*
