# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.22 — 6 juin 2026*

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
| 2 | **COVENANT** | Web | 🔵 En lancement — C1/C2/C2b/C4 ✅ |
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
| C5 | Interface formulaire + kiosque | ⚫ Prochain | — |
| C6 | Génération PDF | ⚫ | — |
| C7 | Téléchargement + envoi Resend | ⚫ | — |
| C8 | Mise à jour Monday (sortie) | ⚫ | — |
| C9 | File d'attente offline | ⚫ | — |

### Règles d'architecture COVENANT

**Profil :** mémorisé en `localStorage` (clé `ts_session_covenant`), sans expiration, confirmation au démarrage sur iPad partagé.

**Formats vidéo (liste déroulante, ordre fixe) :** Micro Trottoir · Interview · Reportage · Interro · School Story · C'est Quoi ? · Audrey T'explique

**Date :** pré-remplie avec la date système au chargement du formulaire.

**Monday :** sortie uniquement — mise à jour statut "Autorisation signée" via proxy Netlify après signature. Zéro appel Monday entrant (CORS + IP cloud bloqués).

**Resend :** via proxy Netlify `https://musical-tanuki-a691a5.netlify.app/.netlify/functions/proxy`

**GitHub Pages :** `https://realcoolclint.github.io/COVENANT/` — repo public, branche `master`

**covenant-proxy :** repo privé — branche `master` — déployé sur Netlify

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
| COVENANT | IP Netlify bloquée par Monday (HTTP 403) | Monday bloque tous les clouds publics — appels Monday uniquement depuis Electron ou navigateur avec OAuth |
| COVENANT | CORS bloqué sur appels Monday directs navigateur | Monday ne supporte pas les appels frontend sans OAuth app enregistrée |

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

### ROVER — Pika export path
L'export Pika atterrit dans `~/Downloads/Vidéos/` (sous-dossier), pas directement dans `~/Downloads/`. Toujours vérifier le chemin exact avant le `cp`.

### ROVER — Compression abandonnée
Les fichiers web téléchargés (YouTube, Instagram, TikTok) sont déjà optimisés à la source. Toute recompression produit soit un fichier plus lourd, soit une dégradation sans bénéfice. Compression réservée à BackUpFlow (rushes bruts). Décision actée le 5 juin 2026.

### BackUpFlow — Structure fichiers
`index.html` est à la racine du repo, pas dans `src/renderer/`. Dette technique identifiée — chantier de migration à planifier en Gemini.

### BackUpFlow — Preset HandBrake
`Fast 1080p30` est le preset natif HandBrake correct. `Fast 1080p25` n'existe pas dans HandBrake 1.11.1. Dette annulée.

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
Toujours quoter avec `"..."` en Terminal quand l'URL contient `?` (ex: URLs YouTube).

### managers.json — schema
`id`, `firstName`, `lastName`, `phone`, `role` — deux valeurs de rôle : `"Responsable vidéo"` et `"Responsable projet"`.

### Launcher — Protocole ajout app
Workflow complet en 5 phases documenté dans `LAUNCHER_PROTOCOLE_AJOUT_APP.md`. À appliquer sans exception pour chaque nouvelle intégration.

### COVENANT — Monday
Monday = sortie uniquement. Zéro appel API entrant depuis le navigateur (CORS bloqué). Mise à jour statut via proxy Netlify après signature.

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
| `LAUNCHER_PROTOCOLE_AJOUT_APP.md` | Protocole ajout app Launcher — 5 phases | V1.0 ✅ |
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
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Skill projet — trois automatismes JARVIS | V1.1 ✅ |
| `FICHE_PROFIL_ANTOINE_PALEY.md` | Fiche profil — Antoine Paley | V1.0 ✅ |
| `SKILL.md` (Session Recap) | Skill universel — Session Recap | V1.4 ✅ |
| `SKILL.md` (True Me) | Skill universel — True Me | V1.0 ✅ |
| `TRANQUILITY_SERVICES_TIERS.md` | Inventaire services tiers — à créer | ⚫ À produire |

---

*Plan Directeur V5.22 — 6 juin 2026 — Tranquility Suite · Pôle Vidéo L'Étudiant*
*Remplace V5.21*
*Phase Mercury : ✅ Clôturée — 9 avril 2026*
*Phase Gemini : Ouverte — COVENANT en lancement (C1/C2/C2b/C4 ✅) — I1 ✅ — I2 conditionnel — I3/I5 ✅*
