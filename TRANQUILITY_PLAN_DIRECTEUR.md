# Plan Directeur Tranquility Suite — V3.0
*Mise à jour le 1er avril 2026 (soir) — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 82%**

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
| 2 | **BackUpFlow** | Desktop | Workflow complet, Session V1.1 ✅, design aligné — build pending | 🟣 En orbite |
| 3 | **Transporter** | Desktop | Workflow valise complet, Session V1.1 ✅, design aligné | 🟣 En orbite |
| 4 | **ARK** | Desktop | Archivage complet, Session V1.1, Monday, design aligné | 🔵 En construction |
| 5 | **Reviewer** | Web | Design aligné, session web à implémenter | 🟣 En orbite |
| 6 | **Manifest** | Web | Design aligné, session web à implémenter | 🟣 En orbite |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | MASTER Équipe ✅, Profil Passeport ✅, Alertes Resend ✅ |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, Design Reference ✅ |
| 3 | **BackUpFlow** | v1.31.03.26 | Session V1.1 ✅, ProfileSelector ✅ — **build V1.01.04.26 pending** |
| 4 | **Reviewer** | GitHub Pages | Mercury Design ✅, tranquility-core.css ✅ |
| 5 | **Manifest** | v1.30.03.26 | Mercury Design ✅, repo renommé ✅ |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 6 | **ARK** | Scaffold + Mercury Opening + App shell ✅ | Session V1.1 à migrer — prochaine étape |

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

| Phase | Chantier | État |
|-------|----------|------|
| 1 | Module unifié `session-profile.js` | ✅ Terminée |
| 2 | Launcher — migration Session V1.1 | En attente |
| 3 | BackUpFlow — migration Session V1.1 | ✅ Terminée — build pending |
| 4 | Transporter — migration Session V1.1 | ✅ Terminée |
| 5 | ARK — construction complète | Prochaine session |
| 6 | Reviewer + Manifest — sessions web | En attente |
| 7 | Tests d'intégration | En attente |
| 8 | Documentation équipe + clôture Mercury | En attente |

> **Ordre prochaines sessions :** BackUpFlow build → ARK Session V1.1 → Launcher Session V1.1 → Reviewer + Manifest web → Mercury exit

---

## Points ouverts — à traiter

### 🔴 Prioritaire
1. **BackUpFlow build `V1.01.04.26`** — `electron-builder --mac dir` + `hdiutil` + release GitHub
2. **Design top bar / welcome bar** — arbitrage BackUpFlow vs Transporter, verrouillage pour toute la suite
3. **ARK — Session V1.1** — migration pattern Transporter/BackUpFlow

### 🟠 À ne pas oublier
4. **BackUpFlow `appSettings` couche `_machine`** — SSD1 machine et NAS machine à charger via `spLoadSettings`
5. **Launcher — Session V1.1** — écriture `session.json` depuis Launcher (actuellement écrit par chaque app)
6. **`session-reader.js`** dans BackUpFlow — peut être supprimé (remplacé par `session-profile.js`)

---

## Patron de migration Session V1.1 — validé

Le patron est documenté dans `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md`.

**Apps migrées :** Transporter ✅ · BackUpFlow ✅
**Apps restantes :** ARK · Launcher

**Spécificités BackUpFlow documentées :**
- Architecture plate (pas de `src/`) — tous les fichiers à la racine
- `window.electronAPI` comme namespace preload
- `forceSelect = true` dans `bootProfileSelector` pour le changement de profil
- `onclick` direct sur `#profileHeaderPhoto` dans `displayProfileHeader`
- Jingle simplifié (try/catch sans guard session)

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
- **3 durées de session** — aujourd'hui / 7 jours / toujours.
- **Profils filtrés par appPermissions** — chaque app n'affiche que les profils autorisés.
- **Pas de PIN en Mercury** — sélection de profil suffit.

### Actées le 1er avril 2026
- **`session-profile.js`** — module unifié copié à l'identique dans chaque app desktop. Ne jamais réécrire, toujours copier depuis Transporter.
- **`bootProfileSelector(forceSelect)`** — pattern validé pour bypass session existante vs changement forcé.
- **Architecture plate** — le patron de migration s'adapte à la structure de chaque app (pas de `src/` dans BackUpFlow).
- **Design top bar** — arbitrage en cours, décision à prendre en prochaine session avant build.

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.31.03.26 | 🟣 — **build V1.01.04.26 pending** |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | — | 🔵 En construction |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` (public) | `profiles.json` | ✅ 8 profils |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V3.0 |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité | V1.1 ✅ |
| `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md` | Patron de migration Session V1.1 | V1.0 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.0 ✅ |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 | V1.0 |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" | V1.0 |
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

*Plan Directeur V3.0 — 1er avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.8*
*Prochaine mise à jour : après build BackUpFlow + session ARK*
