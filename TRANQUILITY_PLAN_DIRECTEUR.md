# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.16 — 3 juin 2026*

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
| `managers.json` | `https://realcoolclint.github.io/tranquility-core/managers.json` | Responsables projet/vidéo (noms complets, téléphones) | ✅ En production — commit `a622e12` — 02/06/2026 |
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

## Inventaire de la flotte — 21 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.18.04.26 | Session V1.1 ✅, MASTER ✅, signature ad-hoc ✅ — ARK intégré APPS_CATALOG ✅ — 31/05/2026 |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, signature valide ✅ |
| 3 | **BackUpFlow** | v1.02.04.26 | Session V1.1 ✅, signature ad-hoc ✅ — ⚠️ DETTE : defaultPreset 'Fast 1080p30' → corriger en 'Fast 1080p25' |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, signature ad-hoc ✅, dans APPS_CATALOG Launcher ✅ — 31/05/2026 |
| 5 | **Reviewer** | commit 57ec8d3 | WebProfileSelector ✅, player adaptatif ✅, modale commentaires ✅, bugs Safari ✅, mémoire de session ✅ |
| 6 | **Manifest** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, CSP ✅, fetch robuste ✅, Safari autocomplete ✅ |

### En développement Gemini 🟡

| # | Outil | Priorité | Notes |
|---|-------|----------|-------|
| 7 | **ROVER** | 1 — En cours | Commit `8c207e4` — fetchMetadata ✅, startDownload ✅, progression temps réel ✅, onboarding destination ✅, historique SQLite ✅, vue historique dédiée ✅, TikTok sans watermark ✅, YouTube/Instagram/TikTok/Facebook validés ✅ — Prochains chantiers : session/profils, splash, versioning, asarUnpack, build |

### En projet Gemini/Apollo ⚫

| # | Outil | Notes |
|---|-------|-------|
| 8 | **COVENANT** | Web app GitHub Pages · Spec validée · Dépendance juridique résolue par archi · Priorité 2 Gemini |
| 9 | **READBACK** | Desktop Electron · Prompteur caméra · Spec validée · Priorité 3 Gemini |
| 10 | **PAYLOAD** | Desktop + Mobile, Monday DB · Priorité 4 Gemini |
| 11 | **CAPITAL** | Web app GitHub Pages · Phase Apollo |
| 12 | **SCRIPTER** | Plateforme scripts, annotation, versionning · Lien Monday |
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

## Priorisation Gemini — actée le 2 juin 2026

| Priorité | App | Nature | Complexité | Statut |
|----------|-----|--------|------------|--------|
| 1 | **ROVER** | Desktop Electron | ⭐⭐ | 🟡 En développement |
| 2 | **COVENANT** | Web GitHub Pages | ⭐⭐⭐ | ⚫ En projet |
| 3 | **READBACK** | Desktop Electron | ⭐⭐⭐ | ⚫ En projet |
| 4 | **PAYLOAD** | Desktop + Mobile | ⭐⭐⭐⭐⭐ | ⚫ En projet |

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher | `RealCoolclint/launcher` | ✅ | En orbite |
| BackUpFlow | `RealCoolclint/backupflow` | ✅ | En orbite |
| Transporter | `RealCoolclint/transporter` | ✅ | En orbite |
| ARK | `RealCoolclint/ARK` | ✅ | En orbite |
| Reviewer | `RealCoolclint/reviewer` | GitHub Pages | En orbite |
| Manifest | `RealCoolclint/manifest` | GitHub Pages | En orbite |
| ROVER | `RealCoolclint/ROVER` | ⚫ À créer | En développement |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | Shared Data Layer |
| tranquility-plan-directeur | `RealCoolclint/tranquility-plan-directeur` | — | Plan Directeur |
| tranquility-avatars | `RealCoolclint/tranquility-avatars` | — | 28 avatars NASA-style |
| tranquility-quotes | `RealCoolclint/tranquility-quotes` | — | Citations inspirantes |
| launcher-profiles | `RealCoolclint/launcher-profiles` (privé) | — | Profils équipe |

---

## Chantiers infrastructure Gemini ouverts

| ID | Chantier | Priorité | État |
|----|----------|----------|------|
| I1 | Session SSO cross-machine | Haute | ⚫ À démarrer |
| I2 | Externaliser APPS_CATALOG sur tranquility-core | Moyenne | ⚫ À démarrer |
| I3 | Bugs Launcher — DMG + Resend | Haute | ⚫ À démarrer |
| I4 | BackUpFlow dette — defaultPreset 1080p25 | Moyenne | ⚫ À démarrer |
| I5 | managers.json sur tranquility-core | ✅ | ✅ Terminé — 2 juin 2026 |

---

## Standard fenêtre Electron — Tranquility Suite

| Propriété | Valeur par défaut |
|-----------|-------------------|
| `width` | `900` |
| `height` | `700` |
| `titleBarStyle` | `'hiddenInset'` |
| `center` | `true` |
| `backgroundColor` | `'#0a0f1e'` |
| `resizable` | `true` |

*Exception ROVER : 700×680px, resizable: false — app compacte utilitaire.*

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

### tranquility-core.css — Apps Electron
Ne jamais charger tranquility-core.css depuis le CDN dans une app Electron — la CSP en `file://` bloque le chargement. Toujours copier le fichier en local dans `src/renderer/assets/tranquility-core.css`.

### Tokens CSS — tranquility-core.css
Les vrais tokens sont : `--bg-primary`, `--bg-secondary`, `--bg-tertiary`, `--bg-elevated`, `--bg-card`, `--text-primary`, `--text-secondary`, `--text-tertiary`, `--accent`, `--accent-hover`, `--accent-light`, `--border`, `--border-hover`. Ne jamais utiliser `--bg`, `--text`, `--text-muted` — ces variables n'existent pas.

### SQLite — Apps Electron (node v22+)
`better-sqlite3` est incompatible avec node v25+ sur Mac Maison (erreur `climits` / node-gyp). Utiliser `sql.js` à la place (WebAssembly, zéro compilation native).

### ROVER — yt-dlp + ffmpeg
Toujours passer `--ffmpeg-location FFMPEG_PATH` explicitement dans tous les args yt-dlp. Le PATH système n'est pas fiable en Electron packagé.

### ROVER — Instagram
Sélecteur de format : `bestvideo[height<=H]+bestaudio/bestvideo[height<=H]/best`. Ne jamais contraindre le codec (`[ext=mp4]`) sur Instagram — yt-dlp choisit le format progressif natif avec audio intégré.

### ROVER — TikTok watermark
Suppression du watermark TikTok via `--extractor-args "tiktok:api_hostname=api16-normal-c-useast1a.tiktokv.com"`. Fonctionne uniquement depuis Electron (TikTok bloque les IP Terminal hors navigateur).

### ROVER — Migration SQLite
Toujours entourer les `ALTER TABLE` d'un `try/catch` silencieux. Ne jamais recréer la table — les données existantes seraient perdues.

### ROVER — Instagram thumbnail CORS
`ERR_BLOCKED_BY_RESPONSE.NotSameOrigin` sur les CDN Meta en Electron. Pas de solution côté renderer. Prévoir un proxy via main process en V2 si nécessaire.

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

### managers.json — schema
`id`, `firstName`, `lastName`, `phone`, `role` — deux valeurs de rôle : `"Responsable vidéo"` et `"Responsable projet"`.

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
| `FICHE_PRODUIT_ROVER_V1.md` | Fiche produit — ROVER | V1.0 ✅ |
| `TRANQUILITY_SUITE_COM_MARKETING.md` | Bible de communication — base factuelle COM | V1.1 ✅ |
| `BIBLE_COM_ADDENDUM_MAI_2026.md` | Addendum Bible COM — corrections mai 2026 | V1.0 ✅ |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Skill projet — trois automatismes JARVIS | V1.0 ✅ |
| `FICHE_PROFIL_ANTOINE_PALEY.md` | Fiche profil — Antoine Paley | V1.0 ✅ |
| `SKILL.md` (Session Recap) | Skill universel — Session Recap | V1.4 ✅ |
| `SKILL.md` (True Me) | Skill universel — True Me | V1.0 ✅ |

---

*Plan Directeur V5.16 — 3 juin 2026 — Tranquility Suite · Pôle Vidéo L'Étudiant*
*Remplace V5.15*
*Phase Mercury : ✅ Clôturée — 9 avril 2026*
*Phase Gemini : Ouverte — I5 ✅ · ROVER commit `8c207e4` — fetchMetadata/startDownload/historique/vue dédiée validés*
