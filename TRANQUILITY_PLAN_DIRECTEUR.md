# Plan Directeur Tranquility Suite — V2.9
*Mise à jour le 1er avril 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 55%**

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
| 1 | **Launcher** | Desktop | Hub opérationnel, MASTER Équipe, session V1.1 | 🟣 En orbite — session à migrer |
| 2 | **BackUpFlow** | Desktop | Workflow complet, session conforme Spec V1.1, design aligné | 🟣 En orbite — session à migrer |
| 3 | **Transporter** | Desktop | Workflow valise complet, session conforme Spec V1.1, design aligné | ✅ Session V1.1 migrée |
| 4 | **ARK** | Desktop | Archivage complet, session conforme Spec V1.1, Monday, design aligné | 🔵 En construction |
| 5 | **Reviewer** | Web | Design aligné, session conforme Spec V1.1 | 🟣 En orbite — session à implémenter |
| 6 | **Manifest** | Web | Design aligné, session conforme Spec V1.1 | 🟣 En orbite — session à implémenter |

> **Condition transversale :** toutes les apps doivent implémenter `session-profile.js` conforme à `TRANQUILITY_SESSION_PROFILS_SPEC.md` V1.1 avant Mercury exit.

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | MASTER Équipe ✅, Profil Passeport ✅, Alertes Resend ✅ — session à migrer |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, Design Reference ✅ |
| 3 | **BackUpFlow** | v1.31.03.26 | Mercury Design ✅ — session à migrer |
| 4 | **Reviewer** | GitHub Pages | Mercury Design ✅, tranquility-core.css ✅ — session web à implémenter |
| 5 | **Manifest** | v1.30.03.26 | Mercury Design ✅, repo renommé ✅ — session web à implémenter |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 6 | **ARK** | Scaffold + Mercury Opening + App shell ✅ | Session à implémenter avec session-profile.js |

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

## Feuille de route Mercury — Phases restantes

| Phase | Chantier | Durée estimée | État |
|-------|----------|---------------|------|
| 0 | Résolution ambiguïtés architecturales | ~1h | ✅ Terminée |
| 1 | Module unifié `session-profile.js` | ~2h | ✅ Terminée |
| 2 | Launcher — migration Session V1.1 | ~3h | En attente |
| 3 | BackUpFlow — migration Session V1.1 | ~2h | Prochaine session |
| 4 | Transporter — migration Session V1.1 | ~2h | ✅ Terminée |
| 5 | ARK — construction complète | ~5h | En attente |
| 6 | Reviewer + Manifest — sessions web | ~2.5h | En attente |
| 7 | Tests d'intégration | ~2h | En attente |
| 8 | Documentation équipe + clôture Mercury | ~1h | En attente |

> **Ordre prochaines sessions :** BackUpFlow (Phase 3) → Launcher (Phase 2) → ARK (Phase 5) → Reviewer + Manifest (Phase 6)

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
- **Session unifiée** — `~/Library/Application Support/tranquility-suite/session.json` partagé.
- **La première app ouverte écrit la session** — les suivantes la lisent.
- **Launcher = gestion, pas connexion** — gère les profils et permissions, ne connecte pas.
- **3 durées de session** — aujourd'hui / 7 jours / toujours.
- **Expiration non intrusive** — jamais en cours de workflow, seulement au prochain lancement.
- **Profils filtrés par appPermissions** — chaque app n'affiche que les profils autorisés.
- **Pas de PIN en Mercury** — sélection de profil suffit.
- **Avatars NASA obligatoires** dans le sélecteur de profil.
- **Badge HORS LIGNE** dans le header si pas de réseau.
- **Design Reference V2.0** — tokens CSS synchronisés avec tranquility-core.css réel.

### Actées le 1er avril 2026
- **session-profile.js** — module unifié (fusion session-reader.js + profile-loader.js). Copié dans chaque app desktop.
- **profiles.json public** — le repo launcher-profiles est public. Pas de secrets dans profiles.json.
- **Format profiles.json** — tableau `[...]` à la racine (pas d`{ profiles: [...] }`). Filtre adapté dans session-profile.js.
- **Avatars URLs absolues** — `https://raw.githubusercontent.com/RealCoolclint/tranquility-avatars/main/avatar_XX.jpeg`. Jamais de chemins locaux.
- **`initiales` + `color` obligatoires** à la racine de chaque profil dans profiles.json.
- **`.screen.active { opacity: 1 !important }`** — fix universel pour l'animation fadeIn de tranquility-core.css dans les apps Electron.
- **Transporter = modèle de référence** — pattern Session V1.1 validé, à répliquer sur BackUpFlow et ARK.
- **Nom du profil dans le welcome-header** (pas dans la top bar). Top bar = patch + version + actions.

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | ✅ Session V1.1 |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.31.03.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | — | 🔵 En construction |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` (public) | `profiles.json` | ✅ 8 profils |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V2.9 |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité | V1.1 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.0 ✅ |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 | V1.0 — partiellement obsolète |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json | V1.0 — à archiver |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |

---

## Phase Gemini — Horizon

- SSO cross-machine — sync activité via GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- PIN / authentification renforcée sur le sélecteur de profil
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V2.9 — 1er avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.8*
*Prochaine mise à jour : fin du chantier BackUpFlow Session V1.1*
