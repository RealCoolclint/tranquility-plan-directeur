# Plan Directeur Tranquility Suite — V2.5
*Mise à jour le 30 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 65%**

> *Reviewer et Manifest sont en orbite. tranquility-core.css créé et déployé. BackUpFlow reste le seul chantier design actif avant ARK.*

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, alignée suite, utilisable par l'équipe |

---

## Conditions de sortie Mercury

Mercury est terminée quand ces 6 apps sont **parfaitement opérationnelles et alignées** :

| # | App | Type | Condition minimale |
|---|-----|------|--------------------|
| 1 | **Launcher** | Desktop | Hub opérationnel, modèle licence, équipe peut se connecter |
| 2 | **BackUpFlow** | Desktop | Workflow complet, modèle profils Launcher, design aligné |
| 3 | **Transporter** | Desktop | Workflow valise complet, modèle profils Launcher, design aligné |
| 4 | **ARK** | Desktop | Archivage complet, Monday, design aligné |
| 5 | **Reviewer** | Web | Design aligné (fonctionnel primitif conservé) |
| 6 | **Manifest** | Web | Design aligné (fonctionnel primitif conservé) |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.29.03.26 | Hub central, MASTER Équipe ✅, Profil Passeport ✅ |
| 2 | **Transporter** | v1.29.03.26 | Mercury complet ✅, Session V2 ✅ |
| 3 | **Reviewer** | GitHub Pages | Mercury Design ✅, tranquility-core.css ✅ |
| 4 | **Manifest** | v1.30.03.26 | Mercury Design ✅, tranquility-core.css ✅, push GitHub à faire |

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 5 | **BackUpFlow** | Session V2 ✅ — audit design à faire | Étape 4bis |

### En projet Mercury ⚫

| # | Outil | Notes |
|---|-------|-------|
| 6 | **ARK** | Construction complète — condition de sortie Mercury |

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
1. LAUNCHER        ✅ En orbite v1.29.03.26
2. TRANSPORTER     ✅ En orbite v1.29.03.26
3. REVIEWER        ✅ En orbite (GitHub Pages)
4. MANIFEST        ✅ En orbite v1.30.03.26 (push GitHub à faire)
5. BACKUPFLOW      🔵 Audit design (Étape 4bis)
6. ARK             ⚫ Construction complète sur écosystème validé
7. DOCUMENTATION   Fil rouge tout au long
```

---

## Décisions produit actées — 30 mars 2026

### tranquility-core.css — Source unique de vérité design

**Décision définitive.**

- Fichier CSS source unique pour toute la Tranquility Suite
- Hébergé sur GitHub Pages : `https://realcoolclint.github.io/tranquility-core/tranquility-core.css`
- Repo : `RealCoolclint/tranquility-core` (public)
- Chaque app importe ce fichier **en premier**, avant son CSS spécifique
- Apps web (Reviewer, Manifest) : import URL directe
- Apps Electron (Launcher, BackUpFlow, Transporter) : copie locale synchronisée
- Versioning : `v1.x` Mercury, `v2.x` Gemini, `v3.x` Apollo
- Toute modification = répercutée sur toute la suite instantanément

### Tokens CSS réels Launcher V2 (valeurs corrigées)

Ces valeurs sont issues du **vrai code** Launcher V2 — elles font foi sur le doc Design Reference :

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

### Manifest — Preview dark vs PDF blanc

- **Aperçu dans l'app** : suit la charte Mercury dark (fond `--bg-secondary`)
- **PDF généré** : conserve ses styles d'impression dédiés (fond blanc, typographie lisible)
- Les deux coexistent sans conflit

### Documents de référence visuels

- `TRANQUILITY_CORE_REFERENCE.html` — charte visuelle complète navigable
- `TRANQUILITY_CORE_COMPOSITION.html` — composition exemple d'app complète
- Ces fichiers servent d'étalon pour valider la conformité de toute nouvelle app

---

## Décisions produit actées — Sessions précédentes

- **Launcher = Licence** (Adobe CC model) — Launcher est le seul gestionnaire d'identité
- **Profil Passeport** — format unifié `identity` / `appSettings` / `status`
- **Session JSON** — 8h Mac partagé, 720h Mac perso, écrit par Launcher seul
- **Retriever** — clés API centralisées dans Launcher, injectées dans session.json
- **Build BackUpFlow** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist`)
- **Apps web Mercury** — sans profil (pas de grille de sélection). SSO reporté à Gemini.
- **Comparaison version** — par `published_at` GitHub Releases (pas le tag)

---

## Prochains chantiers

### Étape 4bis — BackUpFlow : Audit Design Reference
- [ ] Basculer sur `tranquility-core.css`
- [ ] Tokens CSS corrects (valeurs Launcher V2 réelles)
- [ ] Suppression polices monospace dans l'UI
- [ ] Version dynamique `V1.JJ.MM.AA`
- [ ] Flash home fix
- [ ] Build final + Release GitHub

### Étape 5 — profile-loader.js : module partagé desktop
- Module commun Launcher / BackUpFlow / Transporter
- Lecture session.json, gestion expiration, poll toutes les 2s

### Étape 6 — Launcher V2 : finalisation
- Vérification features MASTER dans le code
- `author` dans package.json
- Release GitHub à jour

### Étape 7 — ARK : spec + patch + construction

### À faire en parallèle (non bloquant)
- Push Manifest sur GitHub + release v1.30.03.26
- Rename repo `EasyCallSheet` → `Manifest`
- Basculer Reviewer sur `tranquility-core.css` + nettoyage CSS résiduel
- Ajouter docs de référence au repo `tranquility-core`
- Mettre à jour `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` section 2 (tokens corrigés)

---

## Infrastructure GitHub

| App | Repo | Release | Notes |
|-----|------|---------|-------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.29.03.26 | 🟣 |
| Transporter | `RealCoolclint/Transporter` | v1.29.03.26 | 🟣 |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 |
| Manifest | `RealCoolclint/EasyCallSheet` → `Manifest` | v1.30.03.26 à pusher | 🟣 |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.29.03.26 | 🔵 |
| ARK | À créer | — | ⚫ |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages ✅ | Nouveau |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | 6 profils ✅ | — |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars ✅ | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | V2.5 | — |

---

## Ressources du projet

| Document | Rôle |
|----------|------|
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design — Launcher V2 étalon (tokens à corriger) |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen détaillée |
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Profil Passeport V1 |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron |
| `TRANQUILITY_MACHINES.md` | Configuration des 3 machines |
| `TRANQUILITY_CORE_REFERENCE.html` | Charte visuelle navigable (nouveau) |
| `TRANQUILITY_CORE_COMPOSITION.html` | Composition exemple d'app (nouveau) |

---

## Phase Gemini — Horizon

- SSO cross-machine — `tranquility-session` GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- Manifest V2 — API Monday directe, historique, templates par format
- tranquility-core v2.x — tokens Gemini, nouveaux composants

---

*Plan Directeur V2.5 — 30 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.4*
*Prochaine mise à jour : fin du chantier BackUpFlow (Étape 4bis)*
