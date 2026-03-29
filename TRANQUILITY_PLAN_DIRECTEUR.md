# Plan Directeur Tranquility Suite — V2.2
*Mise à jour le 29 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : ~60%**

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, Design Reference validée, utilisable par l'équipe |

> *Réévaluation du 29 mars 2026 : la condition "En orbite" inclut désormais la checklist complète de la Design Reference, pas seulement le Mercury Opening. BackUpFlow est rétrogradé en "Lancement" — audit Design Reference à faire.*

---

## Conditions de sortie Mercury

Mercury est terminée quand ces 6 apps sont **parfaitement opérationnelles, alignées Design Reference, et testées** :

| # | App | Type | Condition minimale |
|---|-----|------|--------------------|
| 1 | **Launcher** | Desktop | Hub opérationnel, modèle licence, Profil Passeport, équipe peut se connecter |
| 2 | **BackUpFlow** | Desktop | Workflow complet, session Launcher, Design Reference ✅ |
| 3 | **Transporter** | Desktop | Workflow valise complet, session Launcher, Design Reference ✅ |
| 4 | **ARK** | Desktop | Archivage complet, Monday, design aligné |
| 5 | **Reviewer** | Web | Design Reference aligné (fonctionnel primitif conservé) |
| 6 | **Manifest** | Web | Design Reference aligné (fonctionnel primitif conservé) |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Transporter** | V1.29.03.26 — Mercury | Session V2 ✅, Design Reference ✅, Monday ✅, GIFs ✅ |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 2 | **Launcher V2** | Finalisation — Profil Passeport à implémenter | Session writer ✅, Avatars ✅, Retriever ✅ |
| 3 | **BackUpFlow** | Design Reference audit à faire | Session V2 ✅, Mercury Opening ✅ — dette design identifiée |

### En projet Mercury ⚫

| # | Outil | Notes |
|---|-------|-------|
| 4 | **ARK** | Construction complète — condition de sortie Mercury |
| 5 | **Reviewer** | Alignement Design Reference — fonctionnel primitif conservé |
| 6 | **Manifest** | Alignement Design Reference — fonctionnel primitif conservé |

### En projet Gemini/Apollo ⚫

| # | Outil | Notes |
|---|-------|-------|
| 7 | Payload | Desktop + Mobile, Monday DB — Phase Gemini |
| 8 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 9 | Cargo | — |
| 10 | Hatch | — |
| 11 | Guidance | — |
| 12 | Beacon | Web — Phase Gemini |
| 13 | Debrief | Web — Phase Gemini |
| 14 | Telemetry | Extension Premiere — Phase Gemini |
| 15 | CAPCOM | Extension Premiere — Phase Gemini |
| 16 | DATAPAD | Extension Premiere — Phase Gemini |
| 17 | BLACKBOX | Extension Premiere — Phase Gemini |

---

## Protocole Session Launcher — Mercury

**Implémenté et validé. Architecture stable.**

Modèle Adobe CC — couplage faible par fichier local :
- Launcher écrit `~/Library/Application Support/tranquility-suite/session.json` au login profil
- Apps lisent le fichier au démarrage — aucune communication temps réel
- Expiration `expiresAfterHours` : 8h Mac partagé, 720h Mon Mac (lu depuis le JSON)
- Suppression au quit uniquement si session courte (8h)
- Mode standalone : chaque app reste pleinement fonctionnelle sans Launcher

| App | session-writer | session-reader | Écran connecté | Expiration dynamique |
|-----|---------------|----------------|----------------|----------------------|
| Launcher V2 | ✅ | ✅ | ✅ | ✅ |
| BackUpFlow | — | ✅ | ✅ | ✅ |
| Transporter | — | ✅ | ✅ | ✅ |
| Reviewer | — | Phase Gemini | — | — |
| Manifest | — | Phase Gemini | — | — |

---

## Mercury Design — État de la normalisation

Référentiel : `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` — Launcher V2 = étalon.

| App | Mercury Opening | Design Reference | CSP | Version dynamique | Session |
|-----|----------------|-----------------|-----|-------------------|---------|
| Transporter | ✅ | ✅ | ✅ | ✅ | ✅ |
| BackUpFlow | ✅ | ⚠️ À auditer | ❓ | ❓ | ✅ |
| Reviewer | À faire | À faire | — | — | — |
| Manifest | À faire | À faire | — | — | — |

**Dette BackUpFlow identifiée le 29 mars :** même audit que Transporter à effectuer — tokens CSS success/warning, monospace UI, version dynamique, CSP, flash écran home.

---

## Machines de travail

| Machine | Username | Home | gh CLI |
|---------|----------|------|--------|
| Mac Maison | `martinpavloff` | `/Users/martinpavloff/` | ✅ installé |
| Mac Bureau Perso | `mpavloff` | `/Users/mpavloff/` | ⬜ à installer |
| Mac Studio | `studiovideo` | `/Users/studiovideo/` | ⬜ à installer |

Disque commun : `/Volumes/BACKUP PRO/Outils/App Persos/`

---

## Infrastructure GitHub

| App | Repo | Release | DMG |
|-----|------|---------|-----|
| BackUpFlow | `RealCoolclint/BackUpFlow` (public) | v1.06.03.26 — Mercury | ✅ (à refaire après audit Design Reference) |
| Transporter | `RealCoolclint/Transporter` (public) | v1.29.03.26 — Mercury | ✅ |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | — |
| Manifest | `RealCoolclint/EasyCallSheet` (à renommer) | GitHub Pages | — |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | `TRANQUILITY_PLAN_DIRECTEUR.md` | — |
| Launcher V2 | `RealCoolclint/Launcher` (public) | v1.29.03.26 | ✅ |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | — |

---

## Décisions produit actées — Phase Mercury

- **Modèle "Launcher = Licence"** — calqué sur Adobe CC. Actée le 28 mars 2026.
- **Retriever** — Launcher = source de vérité des secrets. Apps lisent depuis `session.json`.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher, zéro Finder.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub.
- **Build apps Electron** — `CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder`.
- **Comparaison versions** — par `published_at` GitHub Releases (pas par tag).
- **Design Reference** — condition de sortie Mercury = checklist complète `TRANQUILITY_SUITE_DESIGN_REFERENCE.md`.
- **Avatar header** — standardisé via `profile-loader.js` (Étape 5) — pas d'implémentation ad hoc par app.
- **CSP Electron** — `<meta http-equiv="Content-Security-Policy">` dans chaque app avec `img-src raw.githubusercontent.com`.
- **GIFs dans le build** — dossiers assets à déclarer dans `asarUnpack` + pattern `app.asar.unpacked` dans les handlers.
- **Profil Passeport** — spécifié le 29 mars. Trois statuts : `pending` → `active` → `archived`. Implémentation : Étape 2.
- **gh CLI** — installé sur Mac Maison. Standard pour toutes les releases.

---

## Ordre d'exécution Mercury — programme actuel

### 🔴 Étape 1 — Transporter test production ✅ TERMINÉ

### 🟠 Étape 2 — Launcher MASTER Équipe + Profil Passeport
Création / modification / archivage / suppression profil · alertes Resend · statuts pending/active/archived · protection profil admin

### 🟠 Étape 3 — Mercury Design : Reviewer
Dark theme · Mercury Opening · patch header · grille profil GitHub · CSP · Design Reference checklist

### 🟠 Étape 4 — Mercury Design : Manifest
Audit complet · même chantier que Reviewer

### 🟠 Étape 4bis — Design Reference : BackUpFlow
Tokens CSS success/warning · suppression monospace UI · version dynamique · CSP · flash home fix

### 🟡 Étape 5 — profile-loader.js : module partagé desktop
Lecture `session.json` · validation · avatar header · écriture `appSettings` GitHub · déploiement BackUpFlow + Transporter

### 🟡 Étape 6 — Launcher V2 : finalisation
`author` package.json · bouton Plan Directeur · MASTER Retriever · MASTER Équipe · paramètres profil · modale PlayStation · release

### 🟡 Étape 7 — ARK : spec + patch + construction complète
HandBrake · ZIP · Monday statut ARCHIVÉ · Fleet HTML dans Launcher

### 🟡 Étape 8 — Skill Mercury
Réécriture `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md` avec toutes les normes validées

---

## Phase Gemini — horizon

- SSO cross-machine (`tranquility-session`)
- Auth renforcée apps web (token GitHub ou Supabase)
- Accès profil depuis extensions CEP
- Payload — UX documentation, Mode 2 et Mode 3
- Reviewer V2 — Supabase + CEP Premiere + commentaires timestampés
- Teleport — PAD → SharePoint · WebDAV + Playwright fallback

---

*Plan Directeur V2.2 — 29 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.1*
