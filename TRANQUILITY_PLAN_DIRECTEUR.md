# Plan Directeur Tranquility Suite — V2.7
*Mise à jour le 31 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 85%**

> *5 apps sur 6 en orbite. ARK est la dernière condition de sortie Mercury. Une fois ARK livré, Mercury est terminée.*

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, alignée suite, utilisable par l'équipe |

---

## Conditions de sortie Mercury

Mercury est terminée quand ces 6 apps sont **parfaitement opérationnelles et alignées** :

| # | App | Type | Statut |
|---|-----|------|--------|
| 1 | **Launcher** | Desktop | 🟣 En orbite v1.29.03.26 |
| 2 | **BackUpFlow** | Desktop | 🟣 En orbite v1.31.03.26 |
| 3 | **Transporter** | Desktop | 🟣 En orbite v1.29.03.26 |
| 4 | **ARK** | Desktop | ⚫ Construction à faire |
| 5 | **Reviewer** | Web | 🟣 En orbite GitHub Pages |
| 6 | **Manifest** | Web | 🟣 En orbite v1.30.03.26 |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | Hub central, MASTER Équipe, Profil Passeport complet |
| 2 | **Transporter** | v1.29.03.26 | Workflow valise complet, Design Reference ✅ |
| 3 | **BackUpFlow** | v1.31.03.26 | Mercury Design complet, tranquility-core.css ✅ |
| 4 | **Reviewer** | — | Mercury Design complet, GitHub Pages ✅, tranquility-core.css ✅ |
| 5 | **Manifest** | v1.30.03.26 | Mercury Design complet, GitHub Pages ✅, tranquility-core.css ✅ |

### En projet Mercury ⚫

| # | Outil | Notes |
|---|-------|-------|
| 6 | **ARK** | Dernière condition de sortie Mercury — construction complète à faire |

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

## Ordre d'exécution Mercury

```
1. LAUNCHER     ✅ En orbite v1.29.03.26
2. TRANSPORTER  ✅ En orbite v1.29.03.26
3. BACKUPFLOW   ✅ En orbite v1.31.03.26
4. REVIEWER     ✅ En orbite GitHub Pages
5. MANIFEST     ✅ En orbite v1.30.03.26
6. ARK          ⚫ Construction complète → sortie Mercury
```

---

## ARK — Spec (prochaine priorité absolue)

| Chantier | Priorité |
|----------|----------|
| Spec complète + architecture Electron | 🔴 |
| Mission patch ARK | 🔴 |
| Mercury Opening | 🔴 |
| Session Protocol (lecture session.json) | 🔴 |
| Compression vidéo via HandBrake | 🔴 |
| ZIP dossier projet | 🔴 |
| Gestion destination (remplacement ou double) | 🔴 |
| Confirmation dialog avant écrasement | 🔴 |
| Monday : écriture statut "ARCHIVÉ" | 🔴 |
| Design Reference checklist complète | 🔴 |
| Release GitHub | 🟡 |

---

## Chantiers post-Mercury non bloquants

| Chantier | App | Priorité |
|----------|-----|----------|
| Basculer sur `tranquility-core.css` | Reviewer | 🟡 |
| Supprimer `alert()` / `confirm()` natifs | Manifest | 🟡 |
| Supprimer emojis `.edit-button` | Manifest | 🟡 |
| `profile-loader.js` module partagé desktop | BackUpFlow + Transporter | 🟡 Étape 5 |
| Launcher V2 finalisation | Launcher | 🟡 Étape 6 |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.29.03.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.31.03.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🟣 En orbite |
| ARK | À créer | — | ⚫ En projet |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ En ligne |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | ✅ 6 profils |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ |

---

## Tranquility Cloud — état opérationnel

- **GitHub = cloud**, Launcher = interface, apps = consommateurs
- `session.json` V2 : `profile`, `allProfiles`, `appSettings`, `apiKeys`
- 6 profils réels dans `launcher-profiles` avec format Passeport complet
- Avatars universels : repo public `RealCoolclint/tranquility-avatars`, URL raw GitHub
- Expiration : 8h Mac partagé, 720h Mac perso

## tranquility-core.css — état opérationnel

- Repo : `RealCoolclint/tranquility-core` (public)
- URL : `https://realcoolclint.github.io/tranquility-core/tranquility-core.css`
- Contient : tokens, reset, typo, boutons, badges, modales, toasts, Mercury Opening
- Apps branchées : BackUpFlow ✅, Reviewer ✅, Manifest ✅

---

## Tokens CSS réels Launcher V2 (source de vérité définitive)

```css
--bg-primary:    #0a0f1e
--bg-secondary:  #0f172a
--bg-tertiary:   #1e293b
--bg-elevated:   #283548
--text-primary:  #f0f4ff
--success:       #10b981
--border:        rgba(255,255,255,0.08)
--radius-lg:     16px
```

---

## Format Profil Passeport V1 (définitif Mercury)

```json
{
  "id": "p_...",
  "status": "active",
  "createdAt": "...",
  "updatedAt": "...",
  "identity": {
    "firstName": "", "lastName": "", "email": "",
    "role": "user", "avatar": "https://raw.githubusercontent.com/...",
    "initiales": "MP", "color": "#2563eb", "mondayUserId": ""
  },
  "appSettings": {
    "backupflow": { "ssdPersoPath": "", "ssdStudioPath": "", "mondayMode": "offline", "zipNasEnabled": false },
    "transporter": { "defaultDestination": "", "mondayMode": "offline" }
  }
}
```

---

## Localisation des apps

```
/Volumes/BACKUP PRO/Outils/App Persos/BackUpFlow/
/Volumes/BACKUP PRO/Outils/App Persos/Launcher-v2/
/Volumes/BACKUP PRO/Outils/App Persos/Transporter/
/Volumes/BACKUP PRO/Outils/App Persos/Reviewer/
/Volumes/BACKUP PRO/Outils/App Persos/Manifest/
/Volumes/BACKUP PRO/Outils/App Persos/tranquility-plan-directeur/
```

**Machines :**
- Mac Maison : `martinpavloff` — `/Users/martinpavloff/`
- Mac Bureau : `mpavloff` — `/Users/mpavloff/` — `gh` CLI installé ✅

---

## Règles techniques importantes

- **CSP Electron** : toujours inclure `https://realcoolclint.github.io` dans `style-src`
- **CSP GitHub Pages** : même règle + `media-src 'self'` pour les vidéos MP4
- **Version dynamique** : Electron → IPC `getAppVersion()` · Web → script inline
- **Flash Mercury Opening** : `#mercury-flash` enfant direct de `<body>`, jamais dans `#mercury-opening`
- **app-shell** : démarre `opacity: 0`, passe à `opacity: 1` via classe `.ready`
- **Patch animé** : toujours `<video>` MP4, jamais `<img>`
- **Releases** : `gh release create` (gh CLI installé sur Mac Bureau et Mac Maison)
- **Avatars** : URL complète raw.githubusercontent.com stockée dans Passeport
- **Build apps Electron** : `CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder`
- **BackUpFlow builds** : `electron-builder --mac dir` + `hdiutil create` manuel
- **Git init sécurisé** : toujours vérifier `.git` avant opérations destructives

---

## Décisions produit actées

### 31 mars 2026
- **Manifest** passe en orbite v1.30.03.26 — Mercury Design complet ✅
- **Repo renommé** `EasyCallSheet` → `Manifest` sur GitHub ✅
- **Reconstruction fichiers** depuis documentation session après incident git ✅

### 30 mars 2026
- **Apps web sans profil en Mercury** — décision définitive. Reviewer + Manifest autonomes, sans auth.
- **Plan Gemini** → SSO via token GitHub ou Supabase (`TRANQUILITY_SSO_SPEC.md`)
- **tranquility-core.css** créé et mis en ligne (`RealCoolclint/tranquility-core`)
- **Tokens CSS source de vérité** : code Launcher V2 fait foi, pas le doc Design Reference

### 29 mars 2026
- **Profil Passeport V1** — format définitif Mercury
- **Launcher = seul gestionnaire d'identité** — seul écrivain de `session.json`
- **Avatars universels** — URL GitHub raw, jamais chemin local
- **Condition de sortie Mercury** — checklist Design Reference complète

### 28 mars 2026
- **Retriever** — Launcher = source de vérité des secrets
- **Protocole Session** — couche Mercury : `session.json` local
- **Comparaison versions** — par `published_at` GitHub Releases

---

## Ressources du projet

| Document | Rôle |
|----------|------|
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète — Launcher V2 comme étalon |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Profil Passeport V1 — référence définitive |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen détaillée |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron |
| `TRANQUILITY_MACHINES.md` | Cartographie des trois machines |
| `PLAN_DIRECTEUR_PUSH_WORKFLOW.md` | Workflow push Plan Directeur |

---

## Phase Gemini — Horizon

- SSO cross-machine — token GitHub ou Supabase
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés, extension CEP Premiere
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V2.7 — 31 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.6*
*Prochaine mise à jour : à la fin du chantier ARK*
