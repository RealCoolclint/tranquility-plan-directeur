# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.23 — 6 juin 2026*

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
| `apps-catalog.json` | — | Catalogue des apps de la suite | ⚫ Conditionnel — à implémenter quand 10+ apps en orbite + assets CDN |

*Décision actée le 16 mai 2026 — arbitrage PRESIDENCE.*
*I2 clos le 6 juin 2026 — chantier conditionnel (critère : 10+ apps en orbite).*

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

## Phase Gemini — Active

### Inventaire de flotte Gemini

| # | App | Type | État |
|---|-----|------|------|
| 1 | **ROVER** | Desktop | 🟣 En orbite — V1.04.06.26 |
| 2 | **COVENANT** | Web | 🔵 En lancement — C1→C5 ✅ |
| 3 | **READBACK** | Desktop | ⚫ En projet |
| 4 | **PAYLOAD** | Desktop + Mobile | ⚫ En projet |

### Chantiers d'infrastructure Gemini

| # | Chantier | Type | État |
|---|----------|------|------|
| I1 | **Launcher bugs** — DMG + Resend | Infrastructure | ✅ Terminé — 06/06/2026 |
| I2 | **APPS_CATALOG externalisé** — JSON tranquility-core | Infrastructure | ⚫ Conditionnel — 10+ apps en orbite |
| I3 | **managers.json** — Shared Data Layer | Infrastructure | ✅ Terminé — 02/06/2026 |
| I4 | **SSD recovery** — protocole migration | Infrastructure | ⚫ À faire |
| I5 | **managers.json** — arbitrages + schema | Infrastructure | ✅ Terminé — 02/06/2026 |
| I6 | **tranquility-web-template** — template de base apps web | Infrastructure | ⚫ À planifier — session dédiée |

### Priorisation Gemini — actée le 2 juin 2026, mise à jour le 6 juin 2026

| Priorité | Chantier | État |
|----------|----------|------|
| 1 | **ROVER** | ✅ En orbite |
| 2 | **COVENANT** | 🔵 En lancement |
| 3 | **READBACK** | ⚫ En projet |
| 4 | **PAYLOAD** | ⚫ En projet |

---

## COVENANT — État des chantiers

| # | Chantier | État | Commit |
|---|----------|------|--------|
| C1 | Scaffolding HTML + CSP | ✅ | `b33194c` → `59c6545` |
| C2 | WebProfileSelector | ✅ | `c533925` |
| C2b | Proxy Netlify (Resend) | ✅ | `musical-tanuki-a691a5` |
| C3 | Projets Monday | ✅ Supprimé — saisie manuelle + liste formats | — |
| C4 | Templates JSON majeur/mineur | ✅ | `b9d4f66` |
| C5 | Interface wizard + splash Mercury | ✅ | `dedd751` |
| C6 | Génération PDF | ⚫ Prochain | — |
| C7 | Téléchargement + envoi Resend | ⚫ | — |
| C8 | Mise à jour Monday | ✅ Supprimé — Monday hors COVENANT | — |
| C9 | File d'attente offline | ⚫ | — |

### Règles d'architecture COVENANT

**Profil :** mémorisé en `localStorage` (clé `ts_session_covenant`), sans expiration, confirmation au démarrage sur iPad partagé.

**Formats vidéo (liste déroulante, ordre fixe) :** Micro Trottoir · Interview · Reportage · Interro · School Story · C'est Quoi ? · Audrey T'explique

**Date :** pré-remplie avec la date système au chargement du formulaire.

**Monday :** supprimé — ni en entrée ni en sortie. Archivage exclusivement via Resend → boîte mail studio.

**Archivage :** Resend → boîte mail studio (mpavloff@letudiant.fr ou alias studio) · objet `[COVENANT] YYMMDD — FORMAT — NomPrenom` · classement SharePoint via règle Outlook personnelle.

**Resend :** via proxy Netlify `https://musical-tanuki-a691a5.netlify.app/.netlify/functions/proxy`

**GitHub Pages :** `https://realcoolclint.github.io/COVENANT/` — repo public, branche `master`

**covenant-proxy :** repo privé — branche `master` — déployé sur Netlify

**Splash :** Mercury Opening — copie exacte Reviewer — `window.onMercuryComplete` comme point d'entrée.

**Cache-bust :** `style.css?v=APP_VERSION` et `app.js?v=APP_VERSION` — obligatoire sur toute app GitHub Pages.

---

## Carnet de pièges Gemini — actifs

| App | Piège | Solution |
|-----|-------|----------|
| ROVER | Fichier source YouTube déjà optimisé (700 kbps) → toute recompression produit un fichier plus lourd | Ne pas compresser les fichiers web — compression réservée aux rushes bruts (BackUpFlow) |
| ROVER | HandBrake — preset `Fast 1080p25` inexistant dans HB 1.11.1 | Preset disponible : `Fast 1080p30` |
| ROVER | HandBrake — stderr bufferisée en mode non-TTY | Timer filesystem sur taille du fichier tmp pour progression approximative |
| ROVER | ffmpeg — probe `ffmpeg -f null -` trop lente sur gros fichiers | Utiliser `-show_entries format=duration` sur les métadonnées |
| ROVER | ffmpeg — bitrate cible 2000k sur contenu web (700 kbps source) | Fichier plus lourd — ne jamais cibler un bitrate supérieur au bitrate source |
| ROVER | HandBrake DMG — nom du fichier macOS | Le DMG universel s'appelle `HandBrakeCLI-X.X.X.dmg` sans suffixe architecture |
| ROVER | `[Merger]` dans stdout yt-dlp | Capturé correctement mais `proc.on('close')` peut arriver avant le flush complet — fallback par fichier .mp4 le plus récent |
| Launcher | `openInstallModal` — IDs fantômes (`installAppName2`, `installDragIcon`) | Guards défensifs `if (el)` sur tout `getElementById` dans les fonctions critiques |
| Launcher | Resend hors mode Master | Clé accessible via `getKeys()` uniquement — pas via `retrieverLoad` ni `getResendKey` seuls |
| Launcher | Assets dans `src/renderer/assets/` — pas à la racine | Utiliser `find` pour localiser si chemin standard introuvable |
| Launcher | Triple mise à jour obligatoire par app | `APPS_CATALOG` + `AMBIANCE_VIDEOS` + `TRANQUILITY_TOOLS` — un oubli ne génère pas d'erreur visible |
| COVENANT | `gh repo create --clone` ne clone pas toujours | Dossier `.git` créé silencieusement — vérifier avec `ls -la`, cloner manuellement si nécessaire |
| COVENANT | GitHub Pages nécessite repo public | Repos privés = Pages bloquées sans GitHub Enterprise |
| COVENANT | Branche `master` — pas `main` | Toujours `git push origin master` sur COVENANT et covenant-proxy |
| COVENANT | Interface Netlify tronque les longues clés | Toujours utiliser `npx netlify env:set "valeur" --force` pour les clés API longues |
| COVENANT | IP Netlify bloquée par Monday (HTTP 403) | Monday bloque tous les clouds publics — Monday supprimé de COVENANT |
| COVENANT | CORS bloqué sur appels Monday directs navigateur | Monday ne supporte pas les appels frontend sans OAuth app enregistrée |
| COVENANT | `tranquility-core.css` écrase tout le layout web | Ne pas importer `tranquility-core.css` dans les apps web — redéfinir les variables localement |
| COVENANT | Avatar sans contrainte CSS → plein écran | Toujours définir `width/height` sur `.ps-avatar-wrap` dès le scaffolding |
| COVENANT | `#screen-profile:not(.hidden)` masque le splash | Ne jamais forcer `display:flex` en CSS sur un écran — laisser `onMercuryComplete` gérer |
| COVENANT | Ordre d'exécution JS — IIFE Wizard avant WebProfileSelector | Exports globaux (`showScreen`, etc.) doivent être disponibles avant `_notifyReady` |
| COVENANT | `DOMContentLoaded` ne se déclenche pas sur GitHub Pages | Toujours utiliser `window.onMercuryComplete` comme point d'entrée |
| Apps web | Cache GitHub Pages persistant | Versionner CSS et JS avec `?v=APP_VERSION` en query string — obligatoire |

---

## Règles d'architecture — non négociables

### GitHub = seul cloud
Tout fichier de configuration, profil, catalogue est versionné sur GitHub. Aucun cloud tiers.

### Signature desktop macOS
`CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder --mac dir` → codesign ad-hoc → hdiutil. Dans cet ordre, sans exception.

### Session JSON
Format V2 — champs plats, `expiresAt` ISO, `writtenBy` = nom de l'app. N'importe quelle app peut écrire `session.json`. Launcher n'est jamais requis.

### Settings par app
Chaque app lit son propre bloc `appSettings.<appname>`. La couche `_machines` gère les chemins locaux. Clés API dans le Keychain global via `keytar`.

### Portabilité
Aucun chemin en dur. Tout fichier local doit fonctionner sur Mac Maison, Mac Bureau, Mac Studio sans modification.

### Apps web — Reviewer = référence absolue
Pour toute nouvelle app web Tranquility : copier la structure de Reviewer (HTML, splash Mercury, WebProfileSelector, styles). Ne jamais improviser. Adapter, pas réinventer.

### Apps web — Splash Mercury
`window.onMercuryComplete` = seul point d'entrée de l'app après le splash. Jamais `DOMContentLoaded`, jamais `window.load`. Script inline dans `index.html`.

### Apps web — Cache-bust
Toujours versionner `style.css` et `app.js` avec `?v=APP_VERSION` en query string. Obligatoire sur toute app GitHub Pages.

### Apps web — tranquility-core.css
**⚠️ Arbitrage PRESIDENCE requis** — les apps web (COVENANT) redéfinissent actuellement les variables localement sans importer `tranquility-core.css`. Décision pragmatique actée le 6 juin 2026. La règle générale reste à arbitrer en session dédiée (chantier I6 — tranquility-web-template).

### ROVER — Sélecteur de format yt-dlp
Sélecteur de format : `bestvideo[height<=H]+bestaudio/bestvideo[height<=H]/best`. Ne jamais contraindre le codec (`[ext=mp4]`) sur Instagram — yt-dlp choisit le format progressif natif avec audio intégré.

### ROVER — TikTok watermark
Suppression du watermark TikTok via `--extractor-args "tiktok:api_hostname=api16-normal-c-useast1a.tiktokv.com"`. Fonctionne uniquement depuis Electron (TikTok bloque les IP Terminal hors navigateur).

### ROVER — Migration SQLite
Toujours entourer les `ALTER TABLE` d'un `try/catch` silencieux. Ne jamais recréer la table — les données existantes seraient perdues.

### ROVER — Instagram thumbnail CORS
`ERR_BLOCKED_BY_RESPONSE.NotSameOrigin` sur les CDN Meta en Electron. Pas de solution côté renderer. Prévoir un proxy via main process en V2 si nécessaire.

### ROVER — Splash timer
Phase 5 (flash + disparition) : `2900ms` — légèrement plus long que le standard BackUpFlow (`2400ms`). Décision Martin.

### Push GitHub dans Launcher
Un seul push par opération. Géré par `saveConfig()` dans le renderer. `main.js` ne push jamais.

### zsh — URL avec `?`
Toujours quoter avec `"..."` en Terminal quand l'URL contient `?` (ex: URLs YouTube).

### managers.json — schema
`id`, `firstName`, `lastName`, `phone`, `role` — deux valeurs de rôle : `"Responsable vidéo"` et `"Responsable projet"`.

### Launcher — Protocole ajout app
Workflow complet en 5 phases documenté dans `LAUNCHER_PROTOCOLE_AJOUT_APP.md`. À appliquer sans exception pour chaque nouvelle intégration.

### COVENANT — Monday
Monday = supprimé. Ni en entrée ni en sortie. Archivage via Resend → boîte mail studio uniquement.

### COVENANT — Proxy Netlify
`covenant-proxy` sur Netlify (`musical-tanuki-a691a5`) gère uniquement Resend. Variables secrètes configurées via CLI Netlify (`npx netlify env:set`). Jamais via interface web (troncature des longues clés).

### COVENANT — Formats vidéo
Liste fixe dans l'ordre : Micro Trottoir · Interview · Reportage · Interro · School Story · C'est Quoi ? · Audrey T'explique. Extensible uniquement via modification du code.

---

## Flotte complète — 21 outils

| # | Nom | Catégorie | État |
|---|-----|-----------|------|
| 1 | BackUpFlow | Desktop | 🟣 En orbite |
| 2 | Transporter | Desktop | 🟣 En orbite |
| 3 | Reviewer | Web | 🟣 En orbite |
| 4 | Manifest | Web | 🟣 En orbite |
| 5 | Launcher V2 | Desktop | 🟣 En orbite |
| 6 | ARK | Desktop | 🟣 En orbite |
| 7 | ROVER | Desktop | 🟣 En orbite |
| 8 | COVENANT | Web | 🔵 En lancement |
| 9 | READBACK | Desktop | ⚫ En projet |
| 10 | CAPITAL | Desktop | ⚫ En projet |
| 11 | PAYLOAD | Desktop + Mobile | ⚫ En projet |
| 12 | Cargo | Desktop | ⚫ En projet |
| 13 | Hatch | Web | ⚫ En projet |
| 14 | Guidance | Web | ⚫ En projet |
| 15 | Beacon | Desktop | ⚫ En projet |
| 16 | Debrief | Web | ⚫ En projet |
| 17 | Telemetry | Web | ⚫ En projet |
| 18 | CAPCOM | Extension | ⚫ En projet |
| 19 | DATAPAD | Extension | ⚫ En projet |
| 20 | BLACKBOX | Extension | ⚫ En projet |
| 21 | Scripter | À définir | ⚫ En idée |

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
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail Agence | V1 |
| `AGENCE_TRANQUILITY_AGENTS.md` | 23 postes — personnalités et réflexes | V1 |
| `AGENCE_TRANQUILITY_COUNCIL_SKILL.md` | Protocole consultation multi-agents | V1 |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision produit — 5 décisions fondatrices | V2 |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design — règles UI non négociables | V2 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format profils — architecture settings | V1.1 |
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Protocole session — sync GitHub — 12 règles | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Les trois lois du workflow captif | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille d'évaluation opérationnelle | V1 |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Trois automatismes JARVIS | V1 |
| `TRANQUILITY_INSTRUCTION_VISION_ANCRAGE.md` | Checklist avant tout prompt Cursor | V1 |
| `PROTOCOLE_GIT_MAC_SWITCHING.md` | Workflow Git inter-Mac | V1 |
| `LAUNCHER_PROTOCOLE_AJOUT_APP.md` | Workflow ajout app au Launcher — 5 phases | V1 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Skill développement Electron | V1 |
| `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md` | Skill UX/Design | V1 |

---

*Plan Directeur V5.23 · Tranquility Suite · Cellule Vidéo L'Étudiant · 6 juin 2026*
