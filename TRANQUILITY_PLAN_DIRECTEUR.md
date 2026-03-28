# Plan Directeur Tranquility Suite — V2.0
*Mise à jour le 28 mars 2026 — Cellule Vidéo L'Étudiant*

> *"Omnia in ordine."*

---

## Phase Mercury — État du programme

**Progression : 45%**

> *Réévaluation honnête après audit complet du 28 mars 2026. Le scope Mercury a été redéfini : ARK est une condition de sortie, l'alignement design complet s'applique à toutes les apps, le modèle profils est entièrement refondu. La progression réelle est donc inférieure à ce qu'indiquaient les versions précédentes.*

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

### Lancement en cours 🔵

| # | Outil | Avancement | Notes |
|---|-------|-----------|-------|
| 1 | **Launcher V2** | Finalisation — modèle profils à refondre | Hub central, étalon design |
| 2 | **BackUpFlow** | Refonte profils + alignement design | Mercury Opening ✅ |
| 3 | **Transporter** | Refonte profils + alignement design | Mercury Opening ✅ |

### En projet Mercury ⚫

| # | Outil | Notes |
|---|-------|-------|
| 4 | **ARK** | Construction complète — condition de sortie Mercury |
| 5 | **Reviewer** | Alignement design uniquement — fonctionnel primitif conservé |
| 6 | **Manifest** | Alignement design uniquement — fonctionnel primitif conservé |

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
1. LAUNCHER        → finalisation complète (clé de voûte)
2. BACKUPFLOW      → premier cobaye du nouveau modèle
3. TRANSPORTER     → réplication du pattern BackUpFlow
4. REVIEWER        → alignement design (web, indépendant)
   MANIFEST        → alignement design (web, indépendant)
5. ARK             → construction complète sur écosystème validé
6. DOCUMENTATION   → fil rouge tout au long
```

---

## Décisions produit actées — 28 mars 2026

### Modèle "Launcher = Licence" (nouveau)

Calqué sur Adobe Creative Cloud. **Décision définitive.**

- Launcher est le seul gestionnaire d'identité de la suite
- Les apps n'ont plus de profils locaux propres
- Si une app démarre sans session Launcher → elle spawne Launcher automatiquement
- L'app poll `session.json` toutes les 2 secondes → reprise automatique
- Zéro mode standalone dégradé
- Option "Rester connecté" : session 30j (Mac perso) vs 8h (Mac partagé)

**Document de référence :** `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md`

### Centralisation des clés API (nouveau)

- Toutes les clés vivent dans le Retriever de Launcher
- Injectées dans `session.json` au login → lues par les apps
- Les apps ne stockent plus aucune clé localement
- Si clé absente → message vers MASTER → Retriever

### Design Reference — Launcher V2 comme étalon (nouveau)

- Alignement design complet sur toutes les apps en Mercury
- Reviewer et Manifest incluses (design seulement, pas les fonctionnalités)
- Document de référence : `TRANQUILITY_SUITE_DESIGN_REFERENCE.md`
- Remplace `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md` sur les questions de design

### Comparaison de version (nouveau)

- Launcher compare les versions par `published_at` GitHub Releases
- Pas par tag — le format `V1.JJ.MM.AA` n'est pas comparable lexicographiquement

### ARK — premières specs (nouveau)

- Archivage long terme = remplacement du projet d'origine (avec confirmation)
- Compression vidéo HandBrake (seuil à définir)
- ZIP du dossier projet
- Monday : lecture infos + écriture statut ARCHIVÉ
- Option double : conserver original + archive ailleurs
- Stockage centralisé : hors scope Mercury — question stratégique ouverte

---

## Décisions produit actées — Sessions précédentes

- **Retriever** — Launcher = source de vérité des secrets. Chaque app lit depuis session.json.
- **Installation autarcique** — téléchargement + installation 100% dans Launcher.
- **Protocole Session** — couche Mercury : fichier local `session.json`. Couche Gemini : sync cross-machine via GitHub.
- **Build BackUpFlow** — `electron-builder --mac dir` + `hdiutil` (pas `npm run dist`).
- **Plan Directeur public** — repo `tranquility-plan-directeur`, source de vérité unique.

---

## Détail des chantiers Mercury

### LAUNCHER — Finalisation

| Chantier | Priorité |
|----------|----------|
| Refonte logique profils → modèle licence | 🔴 |
| Écran d'attente session dans les apps (standard) | 🔴 |
| Option "Rester connecté" | 🟠 |
| Vérification features MASTER dans le code | 🟠 |
| `author` dans `package.json` | 🟡 |
| Comparaison version par `published_at` | 🟡 |
| Release GitHub à jour | 🟡 |

### BACKUPFLOW — Refonte + Alignement

| Chantier | Priorité |
|----------|----------|
| Suppression profils locaux | 🔴 |
| Écran d'attente session | 🔴 |
| Clés API → session.json uniquement | 🔴 |
| Alignement design complet (Design Reference) | 🟠 |
| Build final + Release GitHub | 🟡 |

### TRANSPORTER — Refonte + Alignement

| Chantier | Priorité |
|----------|----------|
| Suppression profils locaux | 🔴 |
| Écran d'attente session | 🔴 |
| Clés API → session.json uniquement | 🔴 |
| Alignement design complet (Design Reference) | 🟠 |
| Test production complet | 🟠 |
| Release GitHub | 🟡 |

### ARK — Construction complète

| Chantier | Priorité |
|----------|----------|
| Spec fonctionnelle complète | 🔴 |
| Patch + identité visuelle | 🔴 |
| Architecture Electron | 🔴 |
| Mercury Opening | 🔴 |
| Écran d'attente session (natif) | 🔴 |
| Analyse projet Premiere | 🔴 |
| Compression vidéo HandBrake (seuil à définir) | 🔴 |
| ZIP dossier projet | 🔴 |
| Gestion destination (remplacement ou double) | 🔴 |
| Monday : lecture + écriture statut ARCHIVÉ | 🔴 |
| Release GitHub | 🟡 |

### REVIEWER — Alignement design

| Chantier | Priorité |
|----------|----------|
| Dark theme par défaut | 🟠 |
| Tokens CSS Design Reference | 🟠 |
| Patch dans le header | 🟠 |
| Version affichée | 🟠 |

### MANIFEST — Alignement design

| Chantier | Priorité |
|----------|----------|
| Dark theme par défaut | 🟠 |
| Tokens CSS Design Reference | 🟠 |
| Patch dans le header | 🟠 |
| Version affichée | 🟠 |

---

## Infrastructure GitHub

| App | Repo | Release | DMG |
|-----|------|---------|-----|
| BackUpFlow | `RealCoolclint/BackUpFlow` (public) | v1.06.03.26 — Mercury | ✅ (à refaire après refonte) |
| Transporter | `RealCoolclint/Transporter` (public) | v1.19.03.26 — Mercury | ✅ |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | — |
| Manifest | `RealCoolclint/EasyCallSheet` (à renommer) | GitHub Pages | — |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | `profiles.json` | — |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` (public) | `TRANQUILITY_PLAN_DIRECTEUR.md` | — |
| Launcher V2 | `RealCoolclint/Launcher` (public) | v1.0.0 (à mettre à jour) | ✅ |
| ARK | À créer | — | — |

---

## Ressources du projet

| Document | Rôle |
|----------|------|
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" — référence définitive |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète — Launcher V2 comme étalon |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron |
| `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md` | Splash screen + Mercury Opening (Design Reference remplace les règles UI) |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen détaillée |

---

## Phase Gemini — Horizon

- SSO cross-machine — `tranquility-session` GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V2.0 — 28 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V1.9*
*Prochaine mise à jour : à la fin du chantier Launcher*
