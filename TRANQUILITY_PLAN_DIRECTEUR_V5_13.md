# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.13 — 31 mai 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Philosophie centrale : le workflow captif.**
La suite est conçue pour que les bonnes pratiques de l'équipe soient encodées dans les outils — pas confiées à la mémoire ou à la rigueur individuelle. La conformité est une conséquence de l'usage, pas un effort conscient. Chaque chantier, chaque feature, chaque décision d'architecture est évalué contre cette philosophie avant d'être validé.
*Référence complète : `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` · Grille opérationnelle : `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md`*

**Mode de travail : l'Agence Tranquility.**
Travailler sur la suite, c'est opérer en mode Agence — une réorganisation du cerveau en 23 cellules expertes réparties en 6 familles : Commandement, Création, Réalisation, Garantie, Humain, Rayonnement. Martin Pavloff est le titulaire unique de tous les postes. JARVIS est l'interface opérationnelle de chaque cellule. Depuis mai 2026, chaque poste est un agent IA opérationnel avec sa personnalité, son regard et ses réflexes, consultable via le skill Agence Tranquility Council en trois modes : Solo, Cellule, Conseil.
*Référence complète : `AGENCE_TRANQUILITY_MANIFESTE.md` · Agents : `AGENCE_TRANQUILITY_AGENTS.md` · Protocole : `AGENCE_TRANQUILITY_COUNCIL_SKILL.md`*

**Skills universels JARVIS.**
En parallèle de la suite, un catalogue de skills universels est en construction — des réflexes de travail qui suivent Martin dans toutes ses conversations, pas seulement sur la Tranquility Suite. Principe de gouvernance : si la valeur est universelle → skill Claude. Si la valeur est contextuelle → fichier projet.
*Catalogue complet documenté dans le journal des décisions du 30 mai 2026.*

**Principe technique :** GitHub = cloud de la Tranquility Suite.

**Workflow Git — Mac Switching :** `PROTOCOLE_GIT_MAC_SWITCHING.md` — clone dans `~/Documents/GitHub/` sur chaque Mac, pull au début, push à la fin. Toujours.

**Vision produit complète :** `TRANQUILITY_SUITE_VISION_PRODUIT.md` — document fondateur, à lire avant tout chantier.

---

## Shared Data Layer — Pattern architectural officiel

Le repo `tranquility-core` (GitHub Pages) est le hub de données en lecture seule de la suite. Tout fichier JSON hébergé à sa racine constitue une donnée partagée accessible par toutes les apps, sur tous les navigateurs, sur tous les Mac.

**Règles :**
- **Lecture :** toute app, tout navigateur, tout Mac
- **Écriture :** MASTER uniquement, via push Terminal sur le repo `tranquility-core` (branche `master`)
- **Fetch :** toujours `{ cache: 'no-cache' }`, validation du type de réponse (`Array.isArray()` ou équivalent), fallback gracieux si le fetch échoue
- **Emplacement :** racine du repo (réorganisation en sous-dossier `data/` quand le nombre de fichiers le justifiera — chantier dédié)

**Inventaire :**

| Fichier | URL | Rôle | État |
|---------|-----|------|------|
| `tranquility-core.css` | `https://realcoolclint.github.io/tranquility-core/tranquility-core.css` | Design system — tokens, typographie, couleurs | ✅ En production |
| `profiles-public.json` | `https://realcoolclint.github.io/tranquility-core/profiles-public.json` | Profils allégés (prénoms, avatars) | ✅ En production |
| `managers.json` | `https://realcoolclint.github.io/tranquility-core/managers.json` | Responsables projet/vidéo (noms complets, téléphones) | ⚫ À implémenter (I5) |
| `apps-catalog.json` | `https://realcoolclint.github.io/tranquility-core/apps-catalog.json` | Catalogue des apps de la suite | ⚫ À implémenter (I2) |

*Décision actée le 16 mai 2026 — arbitrage PRESIDENCE.*

---

## Phase Mercury — ✅ Clôturée — 9 avril 2026

**Progression : 100% — Toutes les phases terminées.**

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, alignée suite, utilisable par l'équipe |

---

## Conditions de sortie Mercury — ✅ Toutes remplies

| # | App | Type | Condition minimale | État |
|---|-----|------|--------------------|------|
| 1 | **Launcher** | Desktop | Hub opérationnel, MASTER Équipe, Session V1.1 writer | 🟣 En orbite |
| 2 | **BackUpFlow** | Desktop | Workflow complet, Session V1.1 ✅, build ✅ | 🟣 En orbite |
| 3 | **Transporter** | Desktop | Workflow valise complet, Session V1.1 ✅, design aligné | 🟣 En orbite |
| 4 | **ARK** | Desktop | Session V1.1 ✅, tests ✅, build ✅ | 🟣 En orbite |
| 5 | **Reviewer** | Web | WebProfileSelector ✅, localStorage ✅, profiles-public.json ✅ | 🟣 En orbite |
| 6 | **Manifest** | Web | WebProfileSelector ✅, localStorage ✅, CSP ✅, index.html ✅ | 🟣 En orbite |

---

## Feuille de route Mercury — Phases

| Phase | Chantier | État |
|-------|----------|------|
| 1 | Module unifié `session-profile.js` | ✅ Terminée |
| 2 | Launcher — Session V1.1 | ✅ Terminée |
| 3 | BackUpFlow — Session V1.1 + build | ✅ Terminée |
| 4 | Transporter — Session V1.1 | ✅ Terminée |
| 5 | ARK — Session V1.1 + tests + build | ✅ Terminée |
| 6 | Reviewer + Manifest — sessions web | ✅ Terminée |
| 7 | Tests d'intégration | ✅ Terminée — 9 avril 2026 |
| 8 | Documentation équipe + clôture Mercury | ✅ Terminée — 9 avril 2026 |

---

## Inventaire de la flotte — 20+ outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.18.04.26 | Session V1.1 ✅, MASTER ✅, signature ad-hoc ✅ — ARK intégré APPS_CATALOG ✅ — 31/05/2026 |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, signature valide ✅ |
| 3 | **BackUpFlow** | v1.02.04.26 | Session V1.1 ✅, signature ad-hoc ✅ |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, signature ad-hoc ✅, dans APPS_CATALOG Launcher ✅ — 31/05/2026 |
| 5 | **Reviewer** | commit 57ec8d3 | WebProfileSelector ✅, player adaptatif ✅, modale commentaires ✅, bugs Safari ✅, mémoire de session ✅ |
| 6 | **Manifest** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, CSP ✅, fetch robuste ✅, Safari autocomplete ✅ |

### En projet Gemini/Apollo ⚫

| # | Outil | Notes |
|---|-------|-------|
| 7 | Payload | Desktop + Mobile, Monday DB |
| 8 | **COVENANT** | Web app GitHub Pages · Spec architecturale validée 11/04/2026 |
| 9 | **READBACK** | Desktop Electron · Prompteur caméra · Spec validée 12/04/2026 |
| 10 | **CAPITAL** | Web app GitHub Pages · Phase Apollo |
| 11 | **SCRIPTER** | Plateforme scripts, annotation, versionning · Lien Monday · Session conception à planifier |
| 12 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 13 | Cargo | — |
| 14 | Hatch | — |
| 15 | Guidance | — |
| 16 | Beacon | Web |
| 17 | Debrief | Web |
| 18 | Telemetry | Extension Premiere |
| 19 | CAPCOM | Extension Premiere |
| 20 | DATAPAD | Extension Premiere |
| 21 | BLACKBOX | Extension Premiere |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | commit 153229d | 🟣 En orbite — ARK APPS_CATALOG ✅ — 31/05/2026 |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite — signature valide ✅ |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.02.04.26 | 🟣 En orbite — signature ad-hoc ✅ |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite — dans APPS_CATALOG Launcher ✅ |
| Reviewer | `RealCoolclint/Reviewer` | commit 57ec8d3 | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | GitHub Pages | 🟣 En orbite |
| COVENANT | `RealCoolclint/COVENANT` | *(à créer)* | ⚫ En conception |
| READBACK | `RealCoolclint/READBACK` | *(à créer)* | ⚫ En conception |
| CAPITAL | `RealCoolclint/Capital` | *(à créer — Phase Apollo)* | ⚫ En conception |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ Shared Data Layer — CSS + profiles-public.json |
| tranquility-suite | `RealCoolclint/tranquility-suite` | GitHub Pages | ✅ Vitrine beta |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 9 profils actifs |
| Profiles public | `RealCoolclint/tranquility-core` | `profiles-public.json` | ✅ 9 profils allégés |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V5.13 |
| **True Me** | `RealCoolclint/true-me` | `TRUE_ME.md` V1.0 · `TRUE_ME/SKILL.md` V1.0 | ✅ Privé — skill opérationnel |

---

## Phase Gemini — En cours

### Chantiers infrastructure

| ID | Chantier | État |
|----|----------|------|
| I1 | Profiles sync Python script | ✅ Terminé |
| I2 | `apps-catalog.json` sur tranquility-core | ⚫ À planifier |
| I3 | Launcher bugs (Installer + Resend) | ✅ Terminé — commit d71d4a7 — 30/05/2026 |
| I4 | Agence Tranquility Council skill | ✅ Terminé — mai 2026 |
| I5 | `managers.json` sur tranquility-core | 🟡 Conception ✅ — prêt pour Bloc B |
| I6 | ARK dans APPS_CATALOG Launcher | ✅ Terminé — commit 153229d — 31/05/2026 |

### Skills universels JARVIS

| # | Skill | Tier | État |
|---|-------|------|------|
| 1 | Context Loader | 1 — Fondateur | ✅ Construit |
| 2 | Multi-Perspective Council | 2 — Haute valeur | ✅ Construit |
| 3 | Session Recap | 1 — Fondateur | ✅ Construit — SKILL.md V1.3 — 31/05/2026 |
| 4 | Audit Complétude | 1 — Fondateur | ✅ Construit — SKILL.md V1.0 |
| 5 | **True Me** | 1 — Fondateur | ✅ Construit — SKILL.md V1.0 + TRUE_ME.md V1.0 |

### Autres projets Martin (hors suite)

| Projet | Nature | État |
|--------|--------|------|
| Cookbook formats vidéo | Référentiel interne L'Étudiant | ⚫ À démarrer |
| Studio de tournage | Développement physique | ⚫ À démarrer |
| Réorganisation équipe | Management | ⚫ À démarrer |
| Aura | Vitrine personnelle — levier carrière | ⚫ À démarrer |

---

## Prochaines étapes prioritaires

1. **Chantier I5** — `managers.json` sur tranquility-core — Bloc B
2. **Mac Bureau** — cloner les 7 repos actifs dans `~/Documents/GitHub/`
3. **Automatisation Hazel fin de session** — chantier dédié (déclenchement push Git automatique)
4. **COVENANT** — développement à démarrer

---

## Journal des décisions

### 31 mai 2026 — ARK APPS_CATALOG + Protocole fin de session

**ARK intégré dans APPS_CATALOG Launcher ✅**
Entrée `ark` ajoutée dans `APPS_CATALOG` (src/renderer/app.js). Entrée ARK retirée de `SUGG_EXTRA`. Patch récupéré depuis `raw.githubusercontent.com/RealCoolclint/ARK/main/assets/patch.png`. Ambiance PIKA `nebula` créée et intégrée. Commit `153229d`.

**Protocole fin de session V1.0 formalisé ✅**
Circuit Hazel Mac Maison documenté : `~/Downloads/` → `~/Markdowns/` → `~/Markdowns/Tranquility files/` (~2 sec). Commande Terminal avec `sleep 3` intégrée. SKILL.md Session Recap corrigé V1.3 (chemin source). `PROTOCOLE_FIN_DE_SESSION.md` créé.

**Leçons :**
- Assets Launcher dans `src/renderer/assets/` — pas dans `assets/` racine. Ne pas supposer la structure sans vérifier.
- Récupération asset binaire GitHub : `curl -L -o [dest] "https://raw.githubusercontent.com/[repo]/main/[path]"`
- `gh api` avec `?` dans l'URL : toujours quoter avec `'...'` en zsh
- Idée widget fin de session + automatisation Hazel : notée, chantier dédié à planifier

### 30 mai 2026 (soir) — Chantier I3 — Bugs Launcher

**Bug 1 — Bouton Installer ✅**
`dmgUrl` ajouté dans `APPS_CATALOG` pour BackUpFlow et Transporter. Commit `d71d4a7`.

**Bug 2 — Resend signalement ✅**
Option C actée : clé Resend dans `config.json` comme fallback. Testé et validé en prod.

**Leçons :**
- Claude Desktop bloqué → fix : `sudo codesign --force --deep --sign - /Applications/Claude.app`
- Cowork : sandbox Linux isolé — pas de `gh` CLI ni outils macOS
- `index.html` Launcher dans `src/renderer/`, pas à la racine
- `npm install` requis sur tout nouveau clone Launcher

### 30 mai 2026 (soir) — Skills Session Recap + Audit Complétude + True Me

Session Recap V1.1 ✅ · Audit Complétude V1.0 ✅ · True Me V1.0 ✅
Workflow Git Mac Switching acté. `PROTOCOLE_GIT_MAC_SWITCHING.md` V1.2.

### 16 mai 2026 — Arbitrages I5 + SSD

Chantier I5 (`managers.json`) : conception terminée, prêt pour Bloc B.

### 15 mai 2026 — Agence Tranquility Council

23 agents IA opérationnels. Skill Council installé.

### 14 avril 2026 — Bugs Reviewer + Manifest

Reviewer : 5 bugs corrigés (commit 57ec8d3). Manifest : Chrome + Safari corrigés.

### 13 avril 2026 — Audit signature + builds

Signature ad-hoc validée sur Launcher, BackUpFlow, ARK.

### 12 avril 2026 — Agence Tranquility

23 postes formalisés en 6 familles.

### 11 avril 2026 — Workflow Captif

Philosophie fondatrice formalisée — trois lois, grille opérationnelle.

### 9 avril 2026 — Clôture Mercury

Vitrine beta · Guide équipe V1.0 · Tests intégration validés.

---

## Standard build desktop — Séquence obligatoire

```
CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder --mac dir
codesign --force --deep --sign - "dist/mac-arm64/NomApp.app"
xattr -cr "dist/mac-arm64/NomApp.app"
hdiutil create -volname "NomApp" -srcfolder "dist/mac-arm64/NomApp.app" -ov -format UDZO "dist/NomApp-V1.JJ.MM.AA.dmg"
gh release upload vX.XX.XX.XX "dist/NomApp-V1.JJ.MM.AA.dmg" --repo RealCoolclint/NomRepo --clobber
```

*Référence complète : `WORKFLOW_RELEASE_TRANQUILITY_SUITE.md` V2*

---

## Patron WebProfileSelector — validé sur Reviewer + Manifest

- `show()` appelé AVANT `syncProfiles()` — jamais d'écran blanc
- Badge ADMIN en style inline dans le template JS
- `cloneNode(false)` + déplacement manuel des enfants pour reset les listeners
- `changeProfile()` doit toujours appeler `_syncProfiles()`
- Clé localStorage : `ts_session_[appname]`
- Le champ `avatar` dans `profiles-public.json` contient l'URL complète — ne jamais préfixer
- CSP : `img-src` doit contenir `https://raw.githubusercontent.com`
- CSP : `connect-src` doit contenir `https://realcoolclint.github.io`
- `fetch(PROFILES_URL, { cache: 'no-cache' })` — obligatoire pour éviter le cache Chrome
- Toujours valider `Array.isArray(data) && data.length > 0` après `res.json()`

---

## Leçons clés

### Git — Mac Switching
Pull avant de toucher quoi que ce soit. Push avant de fermer le Mac. Un oubli = une session perdue sur l'autre Mac.

### Hazel — Mac Maison (martinpavloff)
Les fichiers `.md` téléchargés depuis Claude passent par deux étapes (~2 sec total) : `~/Downloads/` → `~/Markdowns/` → `~/Markdowns/Tranquility files/`. Toujours utiliser `sleep 3` dans la commande Terminal de fin de session.

### Assets Launcher
Les assets (patches, ambiances) sont dans `src/renderer/assets/`, pas dans `assets/` à la racine. Pour récupérer un asset depuis un repo GitHub : `curl -L -o [dest] "https://raw.githubusercontent.com/RealCoolclint/[repo]/main/[path]"`.

### Cursor — Mac Maison
`cursor` n'est pas dans le PATH. Utiliser `open -a Cursor chemin/fichier` à la place.

### Repos privés
Tout repo contenant des données personnelles, stratégiques ou sensibles = privé par défaut.

### Signature desktop macOS
La signature ad-hoc est obligatoire dans tout build Tranquility Suite. Toujours appliquer `codesign --force --deep --sign -` après le build.

### Reviewer — z-index stack
top-bar : 1002 · modale liste : 1003 · modale détail : 1020.

### Reviewer — Safari
`-webkit-appearance: none` obligatoire sur tout `<select>` custom.

### Manifest — Safari autocomplete
Safari ignore `autocomplete="off"` si l'attribut `name` contient un mot reconnu comme champ de contact.

### Manifest — fetch Chrome
Toujours passer `{ cache: 'no-cache' }` au fetch de `profiles-public.json`.

### Push GitHub dans Launcher
Un seul push par opération. Géré par `saveConfig()` dans le renderer. `main.js` ne push jamais.

### zsh — URL avec `?`
Toujours quoter avec `'...'` dans `gh api` quand l'URL contient `?recursive=1` ou similaire.

---

## Groupes et rôles Launcher

| Groupe | Valeur | Rôles |
|--------|--------|-------|
| Cellule Vidéo | `cellule` | Directeur.rice, Cadreur.se/Monteur.se (4 niveaux) |
| Rédaction | `redaction` | Journaliste, Rédacteur.rice en chef, Secrétaire rédac, Stagiaire, Pigiste |
| RS | `rs` | Community Manager, Social Media Manager, Alternant.e CM, Stagiaire CM |
| OPS | `ops` | Chef.fe projets OPS, Chargé.e de projet, Prestataire |
| Direction | `direction` | Directeur.rice, Directeur.rice adjoint.e, Responsable de pôle |
| Externe | `externe` | Tous rôles externes |

---

## Standard fenêtre Tranquility Suite

| Paramètre | Valeur |
|---|---|
| `width` | `1440` |
| `height` | `1050` |
| `minWidth` | `1440` |
| `minHeight` | `1050` |
| `center` | `true` |
| `backgroundColor` | `'#0a0f1e'` |
| `resizable` | `true` |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail — 23 postes · 6 familles | V1.0 ✅ |
| `AGENCE_TRANQUILITY_AGENTS.md` | Fiches agents — 23 personnalités, regards, réflexes | V1.0 ✅ |
| `AGENCE_TRANQUILITY_COUNCIL_SKILL.md` | Skill consultation multi-agents — Solo/Cellule/Conseil | V1.0 ✅ |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision UX + décisions fondatrices | V1.0 ✅ |
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité technique | V1.1 ✅ |
| `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md` | Patron de migration Session V1.1 | V1.0 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.1 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport | V1.1 ✅ |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole session Launcher | V1.0 |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |
| `TRANQUILITY_SUITE_MISSION_PATCHES_STATUT.md` | État des patches | V1.0 |
| `WORKFLOW_RELEASE_TRANQUILITY_SUITE.md` | Workflow release — séquence build obligatoire | V2.0 ✅ |
| `WORKFLOW_TRANQUILITY_V1.md` | Cartographie workflow prod/post-prod | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Philosophie fondatrice — trois lois | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille opérationnelle | V1.0 ✅ |
| `PROTOCOLE_RECUPERATION_SSD.md` | Protocole récupération/migration SSD BACKUP PRO | V1.0 ✅ |
| `PROTOCOLE_GIT_MAC_SWITCHING.md` | Workflow Git sans SSD — clone/pull/push · Hazel Mac Maison | V1.2 ✅ |
| `PROTOCOLE_FIN_DE_SESSION.md` | Circuit Hazel · commande Terminal · checklist ressources Claude | V1.0 ✅ |
| `FICHE_PRODUIT_BACKUPFLOW_V1.md` | Fiche produit — BackUpFlow | V1.0 ✅ |
| `FICHE_PRODUIT_LAUNCHER_V1.md` | Fiche produit — Launcher | V1.0 ✅ |
| `FICHE_PRODUIT_TRANSPORTER_V1.md` | Fiche produit — Transporter | V1.0 ✅ |
| `FICHE_PRODUIT_ARK_V1.md` | Fiche produit — ARK | V1.0 ✅ |
| `FICHE_PRODUIT_REVIEWER_V1.md` | Fiche produit — Reviewer | V1.0 ✅ |
| `FICHE_PRODUIT_MANIFEST_V1.md` | Fiche produit — Manifest | V1.0 ✅ |
| `FICHE_PRODUIT_COVENANT_V1.md` | Fiche produit — COVENANT | V1.0 ✅ |
| `FICHE_PRODUIT_READBACK_V1.md` | Fiche produit — READBACK | V1.1 ✅ |
| `FICHE_PRODUIT_CAPITAL_V1.md` | Fiche produit — CAPITAL | V1.0 ✅ |
| `TRANQUILITY_SUITE_COM_MARKETING.md` | Bible de communication — base factuelle COM | V1.1 ✅ |
| `BIBLE_COM_ADDENDUM_MAI_2026.md` | Addendum Bible COM — corrections mai 2026 | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Skill projet — trois automatismes JARVIS | V1.0 ✅ |
| `FICHE_PROFIL_ANTOINE_PALEY.md` | Fiche profil — Antoine Paley | V1.0 ✅ |
| `SKILL.md` (Session Recap) | Skill universel — Session Recap | V1.3 ✅ |
| `SKILL.md` (True Me) | Skill universel — True Me | V1.0 ✅ |

---

*Plan Directeur V5.13 — 31 mai 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V5.12*
*Phase Mercury : ✅ Clôturée — 9 avril 2026*
*Phase Gemini : Ouverte — Bloc A ✅ (A1→A8) · B1 ✅ · B2 ✅ · B3→B5 à venir · I3 ✅ · I5 conception ✅ · I6 ✅ (ARK APPS_CATALOG)*
*Skills universels : True Me ✅ · Session Recap V1.3 ✅ · Audit Complétude ✅*
*Workflow Git Mac Switching : opérationnel sur Mac Maison · Mac Bureau à configurer*
