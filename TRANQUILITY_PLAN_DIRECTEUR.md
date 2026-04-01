# Plan Directeur Tranquility Suite — V2.9
*Mise à jour le 1er avril 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 50%** *(réévalué honnêtement le 1er avril — couche session non implémentée)*

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, session V1.1 conforme, utilisable par l'équipe |

---

## Conditions de sortie Mercury

Mercury est terminée quand ces 6 apps sont **parfaitement opérationnelles et alignées** :

| # | App | Type | Condition minimale | État |
|---|-----|------|--------------------|------|
| 1 | **Launcher** | Desktop | MASTER Équipe ✅, session-profile.js V1.1, push profiles.json GitHub | 🔵 Session à migrer |
| 2 | **BackUpFlow** | Desktop | Workflow complet, session-profile.js V1.1, sélecteur profil | 🔵 Session à migrer |
| 3 | **Transporter** | Desktop | Workflow valise complet, session-profile.js V1.1, sélecteur profil | 🔵 Session à migrer |
| 4 | **ARK** | Desktop | Archivage complet, session-profile.js V1.1, Monday, HandBrakeCLI | 🔵 En construction |
| 5 | **Reviewer** | Web | Design aligné, sélecteur profil localStorage V1.1 | 🔵 Session à implémenter |
| 6 | **Manifest** | Web | Design aligné, sélecteur profil localStorage V1.1, zéro alert() natif | 🔵 Session + dettes |

> **Condition transversale :** toutes les apps desktop doivent implémenter `session-profile.js` conforme à `TRANQUILITY_SESSION_PROFILS_SPEC.md` V1.2. Apps web : `localStorage` + 3 durées V1.1.

---

## Feuille de route Mercury — Phases 0 à 8

```
Phase 0 ✅  Décisions architecturales — TERMINÉE (1er avril 2026)
Phase 1     Module session-profile.js — fondation commune
Phase 2     Launcher — reconciliation Session V1.1 + push profiles.json
Phase 3     BackUpFlow — migration session V1.1
Phase 4     Transporter — migration session V1.1
Phase 5     ARK — construction complète + tests
Phase 6     Reviewer + Manifest — sessions web + dettes techniques
Phase 7     Tests d'intégration — protocole complet
Phase 8     Documentation équipe + clôture Mercury
```

**Estimation totale : ~21h · 10 sessions · 4 à 6 semaines**

---

## Inventaire de la flotte — 17 outils

### Design aligné — Session à migrer 🔵

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | MASTER Équipe ✅, session V1.1 ❌ à migrer |
| 2 | **Transporter** | v1.29.03.26 | Mercury Design ✅, session V1.1 ❌ à migrer |
| 3 | **BackUpFlow** | v1.31.03.26 | Mercury Design ✅, session V1.1 ❌ à migrer |
| 4 | **Reviewer** | GitHub Pages | Mercury Design ✅, session localStorage ❌ à implémenter |
| 5 | **Manifest** | v1.30.03.26 | Mercury Design ✅, session localStorage ❌, dettes alert()/emojis |

### En construction 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 6 | **ARK** | Scaffold + Mercury Opening + App shell ✅ | Session hack ⚠️, modules non testés |

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
- **Première app écrit session.json** — Launcher jamais requis (confirme V1.1, invalide Passeport V1.0 §7).
- **profiles.json GitHub = identité + appPermissions uniquement** — léger, sans appSettings.
- **appSettings stockés localement** — `~/Library/Application Support/tranquility-suite/appsettings.json`, indexés par `profileId` + couche `_machine` pour chemins partagés (SSD1, NAS).
- **Mac Studio : 3 destinations BackUpFlow** — SSD1 (machine), NAS (machine), SSD Perso (profil).
- **session-reader.js + profile-loader.js → fusionnés en session-profile.js** — un seul module dans chaque app.
- **Apps web : localStorage + 3 durées V1.1** — même modèle que desktop, mécanisme différent.
- **Design Reference §6 supprimée** — écran "Lance Launcher" obsolète, remplacé par sélecteur profil.
- **HandBrakeCLI manquant = bloquant pour ARK** — écran d'erreur + lien téléchargement, pas de fallback sans compression.

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🔵 Session à migrer |
| Transporter | `RealCoolclint/Transporter` | v1.29.03.26 | 🔵 Session à migrer |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.31.03.26 | 🔵 Session à migrer |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🔵 Session à implémenter |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🔵 Session + dettes |
| ARK | `RealCoolclint/ARK` | — | 🔵 En construction |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | ✅ 6 profils |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V2.9 |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité | V1.1 → V1.2 à rédiger |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.0 → V2.1 à rédiger (§6) |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport — partiellement supersédé | V1.0 → à archiver |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" | V1.0 — à archiver |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole session.json | V1.0 — à archiver |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |
| `TRANQUILITY_SUITE_MISSION_PATCHES_STATUT.md` | État des patches | V1.0 |

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
*Prochaine mise à jour : fin de la Phase 1 (session-profile.js)*
