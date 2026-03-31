# Plan Directeur Tranquility Suite — V2.6
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
| 1 | **Launcher V2** | V1.29.03.26 | MASTER Équipe ✅, Profil Passeport ✅, Alertes Resend ✅ |
| 2 | **Transporter** | V1.29.03.26 | Mercury complet ✅, test production ✅ |
| 3 | **BackUpFlow** | V1.31.03.26 | Mercury Design ✅, Session V2 ✅, tranquility-core.css ✅ |
| 4 | **Reviewer** | — | Mercury Design ✅, GitHub Pages live, tranquility-core.css ✅ |
| 5 | **Manifest** | V1.30.03.26 | Mercury Design ✅, tranquility-core.css ✅ — push GitHub à faire |

### En projet Mercury ⚫

| # | Outil | Notes |
|---|-------|-------|
| 6 | **ARK** | Construction complète — dernière condition de sortie Mercury |

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
1. LAUNCHER        ✅ En orbite V1.29.03.26
2. BACKUPFLOW      ✅ En orbite V1.31.03.26
3. TRANSPORTER     ✅ En orbite V1.29.03.26
4. REVIEWER        ✅ En orbite (GitHub Pages)
   MANIFEST        🟠 En orbite (push GitHub + release à faire)
5. ARK             ⚫ Construction complète — prochain chantier majeur
6. DOCUMENTATION   Fil rouge tout au long
```

---

## Prochaines actions immédiates

| Priorité | Action |
|----------|--------|
| 🟠 | Push Manifest sur GitHub + release V1.30.03.26 |
| 🟠 | Rename repo `EasyCallSheet` → `Manifest` sur GitHub |
| 🟠 | Basculer Reviewer sur tranquility-core.css + nettoyage CSS résiduel |
| 🟡 | Étape 5 — `profile-loader.js` module partagé desktop |
| 🟡 | Étape 6 — Launcher V2 finalisation |
| 🟡 | Étape 7 — ARK : spec + patch + construction |

---

## Décisions produit actées — 31 mars 2026

### tranquility-core.css — Source unique de vérité design

- Repo public : `RealCoolclint/tranquility-core`
- URL : `https://realcoolclint.github.io/tranquility-core/tranquility-core.css`
- Contient : tokens, reset, typo, boutons, badges, modales, toasts, Mercury Opening
- Pattern d'import : `<link href="...tranquility-core.css">` puis CSS spécifique de l'app
- **Toutes les apps web et Electron doivent le brancher**
- CSP Electron : toujours inclure `https://realcoolclint.github.io` dans `style-src`

### Tokens CSS réels Launcher V2 (valeurs corrigées — code > doc)

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

### Avatars — URL GitHub universelle

- Base URL : `https://raw.githubusercontent.com/RealCoolclint/tranquility-avatars/main/`
- Format stocké dans Passeport : URL complète `.jpeg`
- Fallback `onerror` vers `assets/avatars/` pour les apps Electron

---

## Décisions produit actées — Sessions précédentes

### Modèle "Launcher = Licence" (28 mars 2026)

Calqué sur Adobe Creative Cloud. **Décision définitive.**

- Launcher est le seul gestionnaire d'identité de la suite
- Les apps n'ont plus de profils locaux propres
- Si une app démarre sans session Launcher → elle spawne Launcher automatiquement
- L'app poll `session.json` toutes les 2 secondes → reprise automatique
- Zéro mode standalone dégradé
- Option "Rester connecté" : session 30j (Mac perso) vs 8h (Mac partagé)

**Document de référence :** `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md`

### Centralisation des clés API

- Toutes les clés vivent dans le Retriever de Launcher
- Injectées dans `session.json` au login → lues par les apps
- Les apps ne stockent plus aucune clé localement

### Design Reference — Launcher V2 comme étalon

- Alignement design complet sur toutes les apps en Mercury
- Document de référence : `TRANQUILITY_SUITE_DESIGN_REFERENCE.md`

### Comparaison de version

- Launcher compare les versions par `published_at` GitHub Releases
- Format version : `V1.JJ.MM.AA`

### ARK — premières specs

- Archivage long terme = remplacement du projet d'origine (avec confirmation)
- Compression vidéo HandBrake (seuil à définir)
- ZIP du dossier projet
- Monday : lecture infos + écriture statut ARCHIVÉ
- Option double : conserver original + archive ailleurs

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | V1.29.03.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | V1.31.03.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | V1.29.03.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/EasyCallSheet` → `Manifest` | V1.30.03.26 (à pusher) | 🟠 |
| ARK | À créer | — | ⚫ |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ |
| Profiles | `RealCoolclint/launcher-profiles` (privé) | 6 profils | ✅ |
| Avatars | `RealCoolclint/tranquility-avatars` (public) | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | V2.6 | ✅ |

---

## Ressources du projet

| Document | Rôle |
|----------|------|
| `TRANQUILITY_LAUNCHER_PROFILS_SPEC.md` | Modèle "Launcher = Licence" — référence définitive |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète — Launcher V2 comme étalon |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 — référence définitive |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole technique session.json |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen détaillée |
| `TRANQUILITY_CORE_REFERENCE.html` | Charte visuelle navigable |
| `TRANQUILITY_CORE_COMPOSITION.html` | Mock app complète |

---

## Phase Gemini — Horizon

- SSO cross-machine — `tranquility-session` GitHub
- Reviewer V2 — Supabase, proxy 720p HandBrake, commentaires timestampés
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- Manifest — API Monday directe, historique, templates par format

---

*Plan Directeur V2.6 — 31 mars 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V2.5*
*Prochaine mise à jour : à la fin du chantier Manifest push + ARK*
