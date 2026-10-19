# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.29 — 8 juin 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Philosophie centrale : le workflow captif.**
La suite est conçue pour que les bonnes pratiques de l'équipe soient encodées dans les outils — pas confiées à la mémoire ou à la rigueur individuelle. La conformité est une conséquence de l'usage, pas un effort conscient. Chaque chantier, chaque feature, chaque décision d'architecture est évalué contre cette philosophie avant d'être validé.
*Référence complète : `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` · Grille opérationnelle : `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md`*

**Mode de travail : l'Agence Tranquility.**
Travailler sur la suite, c'est opérer en mode Agence — une réorganisation du cerveau en 23 cellules expertes réparties en 6 familles : Commandement, Création, Réalisation, Garantie, Humain, Rayonnement. Martin Pavloff est le titulaire unique de tous les postes. JARVIS est l'interface opérationnelle de chaque cellule.
*Référence complète : `AGENCE_TRANQUILITY_MANIFESTE.md` · Agents : `AGENCE_TRANQUILITY_AGENTS.md` · Protocole : `AGENCE_TRANQUILITY_COUNCIL_SKILL.md`*

**Points Présidence — sessions régulières.**
Des sessions de bilan d'alignement et de pilotage général sont institutionnalisées. Elles ne sont pas greffées sur des sessions techniques — elles ont leur propre espace. Fréquence cible : trimestrielle minimum. Première session réalisée le 7 juin 2026.

**Principe technique :** GitHub = cloud de la Tranquility Suite.

**Workflow Git — Mac Switching :** `PROTOCOLE_GIT_MAC_SWITCHING.md` — clone dans `~/Documents/GitHub/` sur chaque Mac, pull au début, push à la fin. Toujours.

**Vision produit complète :** `TRANQUILITY_SUITE_VISION_PRODUIT.md` — document fondateur, à lire avant tout chantier. ⚠️ Révision nécessaire — potentiellement obsolète sur plusieurs points depuis avril 2026.

---

## Shared Data Layer — Pattern architectural officiel

Le repo `tranquility-core` (GitHub Pages) est le hub de données en lecture seule de la suite. Tout fichier JSON hébergé à sa racine constitue une donnée partagée accessible par toutes les apps, sur tous les navigateurs, sur tous les Mac.

**Règles :**
- **Lecture :** toute app, tout navigateur, tout Mac
- **Écriture :** MASTER uniquement, via push Terminal sur le repo `tranquility-core` (branche `master`)
- **Fetch :** toujours `{ cache: 'no-cache' }`, validation du type de réponse (`Array.isArray()` ou équivalent), fallback gracieux si le fetch échoue

**Inventaire :**

| Fichier | URL | Rôle | État |
|---------|-----|------|------|
| `tranquility-core.css` | `https://realcoolclint.github.io/tranquility-core/tranquility-core.css` | Design system | ✅ En production |
| `profiles-public.json` | `https://realcoolclint.github.io/tranquility-core/profiles-public.json` | Profils allégés + emailPrefix | ✅ En production — emailPrefix ajouté 08/06/2026 |
| `managers.json` | `https://realcoolclint.github.io/tranquility-core/managers.json` | Responsables projet/vidéo | ✅ En production — `a622e12` |
| `apps-catalog.json` | — | Catalogue apps | ⚫ Conditionnel — 10+ apps en orbite |

---

## Phase Mercury — ✅ Clôturée — 9 avril 2026

**Progression : 100%**

---

## Phase Gemini — Active

### Inventaire de flotte Gemini

| # | App | Type | État |
|---|-----|------|------|
| 1 | **ROVER** | Desktop | 🟣 En orbite — V1.04.06.26 |
| 2 | **COVENANT** | Web | 🔵 En lancement — C1→C7 ✅ · C9 ⚫ |
| 3 | **READBACK** | Desktop | ⚫ En projet |
| 4 | **PAYLOAD** | Desktop + Mobile | ⚫ En projet |

### Chantiers d'infrastructure Gemini

| # | Chantier | Type | État |
|---|----------|------|------|
| I1 | **Launcher bugs** — DMG + Resend | Infrastructure | ✅ Terminé — 06/06/2026 |
| I2 | **APPS_CATALOG externalisé** | Infrastructure | ⚫ Conditionnel — 10+ apps en orbite |
| I3 | **managers.json** — Shared Data Layer | Infrastructure | ✅ Terminé — 02/06/2026 |
| I4 | **SSD recovery** — protocole migration | Infrastructure | ⚫ À faire |
| I5 | **managers.json** — arbitrages + schema | Infrastructure | ✅ Terminé — 02/06/2026 |
| I6 | **tranquility-web-template** | Infrastructure | 🔵 En cours — Reviewer-Assainissement ✅ 08/06/2026 · tranquility-web-template ⚫ |

---

## I6 — tranquility-web-template — Décisions actées (9 juin 2026)

**Décision PRESIDENCE :** I6 = Phase Gemini. On ne laisse pas la dette traîner.

**Référence absolue :** Reviewer — splash Mercury, sélecteur de profil, top bar, layout général.

**Références complémentaires :**
- Manifest = référence visuelle pour le splash Mercury avec patch
- Reviewer = référence absolue pour le sélecteur de profil (card modale, durée de session, bouton SE CONNECTER)

**Deux patterns de layout documentés :**
- Pattern A — sidebar gauche + zone droite (Manifest)
- Pattern B — top bar + main + sidebar droite (Reviewer)

**Chantier préalable obligatoire : I6-Reviewer-Assainissement**
Reviewer/styles.css contient une couche CSS legacy (2235 lignes, ancienne feuille inline) qui coexiste avec la couche moderne. La couche legacy contient du CSS de layout player non migré. Le template ne peut pas être créé depuis un Reviewer non assaini.

**État du chantier assainissement :**
- ✅ Audit CSS complet réalisé — 14 classes legacy-only identifiées, 9 classes fantômes documentées
- ✅ Phase 1 — Suppression CSS abandonné (dessin, catégories, sort-dialog) — 365 lignes — `7e6014b`
- ✅ Phase 2 — Migration CSS actif legacy → couche moderne — 380 lignes — `d00a0a6`
- ✅ Phase 2b — Migration classes manquantes (overlay, capture, notes, inputs) — 452 lignes — `8d67242`
- ✅ Phase 3 — Suppression couche legacy (1870 lignes) — `060bff0`
- **Résultat :** styles.css passe de 5765 à 4346 lignes. −1419 lignes. Zéro régression.
- **Prochaine étape I6 :** corrections UI Reviewer (top bar, raccourcis, toast, preview) → puis tranquility-web-template

---

## COVENANT — État des chantiers

| # | Chantier | État | Commit |
|---|----------|------|--------|
| C1 | Scaffolding HTML + CSP | ✅ | `b33194c` → `59c6545` |
| C2 | WebProfileSelector | ✅ | `c533925` |
| C2b | Proxy Netlify (Resend) | ✅ | `musical-tanuki-a691a5` |
| C3 | Projets Monday | ✅ Supprimé | — |
| C4 | Templates JSON majeur/mineur | ✅ | `b9d4f66` |
| C5 | Interface wizard + splash Mercury | ✅ | `dedd751` |
| C6 | Génération PDF | ✅ | `e7c8e6b` → `6a6de03` |
| C7 | Envoi Resend + triple sécurité + UX refonte | ✅ | `64e4b3b` → `3b2fddc` |
| C8 | Mise à jour Monday | ✅ Supprimé | — |
| C9 | File d'attente offline | ⚫ | — |

---

## Plan d'alignement — Chantiers issus du Point Présidence du 7 juin 2026

Ces chantiers sont distincts des chantiers de développement produit. Ils concernent la méthode, l'architecture documentaire, les specs et la communication.

### Famille A — Méthode et outillage JARVIS

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| A1 | **TRANQUILITY COMPASS** — document d'orientation JARVIS permanent | 🔴 Critique | ✅ Terminé — 07/06/2026 |
| A2 | **Workflow Assist** — blocs contexte ROVER + COVENANT | 🔴 Critique | ✅ Terminé — 07/06/2026 |
| A3 | **Grille Workflow Captif** — format verdict 6 lignes | 🟠 Haute | ✅ Terminé — 08/06/2026 |
| A4 | **Poste TERRAIN** — institutionnalisé, collecte mensuelle | 🟡 Moyenne | ⚫ À faire |
| A5 | **Automatisme COM post-chantier** — 3 questions en fin de livraison | 🟡 Moyenne | ⚫ À faire |

### Famille B — Architecture et specs

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| B1 | **TRANQUILITY_SERVICES_TIERS.md** — inventaire services critiques | 🔴 Critique | ⚫ À faire — structure définie 09/06/2026 |
| B2 | **Arbitrage I6** — web template Gemini ou Apollo | 🔴 Critique | ✅ Décision actée — Gemini — 09/06/2026 |
| B3 | **`appPermissions`** — documenté dans spec Profil Passeport | 🟠 Haute | ⚫ À faire |
| B4 | **Mode dégradé** — documentation résilience GitHub down | 🟡 Moyenne | ⚫ À faire |
| B5 | **Migration identité Manifest** — repo + URL + fichier vers "Manifest" | 🟡 Moyenne | ⚫ À faire |
| B6 | **Politique mise à jour yt-dlp** — fréquence, signal, procédure | 🟡 Moyenne | ⚫ À faire |

### Famille C — Profils et utilisateurs

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| C1 | **Spec Profil Passeport V1.2** — 7 familles, 5 rôles, appPermissions | 🔴 Critique | ⚫ À faire |
| C2 | **Groupe utilisateur dans COMPASS** — question systématique avant tout chantier | 🟠 Haute | ⚫ À faire (lié A1) |
| C3 | **Durée de vie profils temporaires** — champ `expiresAt` ou archivage manuel | 🟡 Moyenne | ⚫ Décision requise |
| C4 | **Session présentation collective équipe** — onboarding de la suite | 🟡 Moyenne | ⚫ À planifier |
| C5 | **emailPrefix → solution profils complète** — migration emailPrefix vers champ email sécurisé | 🟡 Moyenne | ⚫ Dette — lié brainstorm profils |

### Famille D — Communication et marketing

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| D1 | **Bible COM V2** — mise à jour complète, pas en addendum | 🟠 Haute | ⚫ À faire |
| D2 | **Calendrier com livraisons** — signal formalisé à chaque mise en orbite | 🟡 Moyenne | ⚫ À faire |
| D3 | **Récit par phase** — Mercury / Gemini / Apollo dans Bible COM V2 | 🟡 Moyenne | ⚫ À faire (lié D1) |
| D4 | **Guide de passation** — 3 pages, niveau "directeur entrant" | 🟡 Moyenne | ⚫ À faire |

### Famille E — Apps et flotte

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| E1 | **Dette BackUpFlow** — `Fast 1080p25` | 🔴 Critique | ⚫ À faire |
| E2 | **COVENANT C7 + C9** — mise en orbite V1 | 🔴 Critique | 🔵 C7 ✅ · C9 ⚫ |
| E3 | **Politique maintenance flotte** — revue trimestrielle | 🟠 Haute | ⚫ À faire |
| E4 | **Écran politique d'usage ROVER** — onboarding premier lancement | 🟡 Moyenne | ⚫ À faire |
| E5 | **Sound design référentiel** — section Design Reference V2.1 | 🟡 Moyenne | ⚫ À faire |
| E6 | **Versioning V1 vs V2 Gemini** — décision + Design Reference | 🟡 Moyenne | ⚫ Décision requise |
| E7 | **Historique SQLite ROVER** — limitation portable documentée | 🟡 Moyenne | ⚫ À faire |

### Session brainstorm dédiée

| # | Chantier | État |
|---|----------|------|
| BR | **Session brainstorm** — 8 idées capturées le 7 juin | ⚫ À planifier après COVENANT V1 |

**Idées à traiter :** App fil conducteur Premiere · Protocole Beta testing · Inventaire documents · Points Présidence (institutionnalisé) · Inscription en ligne · Évolution grille profils · Back office profils · Outil admin dédié en ligne

---

## Séquencement acté — Plan d'alignement

**Immédiatement (avant de reprendre COVENANT) :**
A1 (COMPASS) → A2 (Workflow Assist ROVER+COVENANT) → A3 (Verdict Workflow Captif) ✅ Terminé

**Dans la foulée de COVENANT V1 :**
E2 (C9) → B1 → C1 → B2 ✅ B2 acté

**I6 — Séquence :**
I6-Reviewer-Assainissement → tranquility-web-template → audit conformité COVENANT + Manifest

**Avant READBACK :**
B3 · C2 · E3 · D1

**Chantiers courts en parallèle :**
E1 · E6 · E7 · B6

**À planifier :**
A4 · C4 · D4 · B5 · Session brainstorm

---

## COVENANT — Règles d'architecture

**Profil :** mémorisé en `localStorage` (clé `ts_session_covenant`), sans expiration, confirmation au démarrage sur iPad partagé.

**Lieu de tournage :** champ obligatoire saisi à l'étape PROJET — injecté comme "FAIT À" dans la zone signature du PDF.

**PDF :** généré côté client avec `pdf-lib` — logo L'Étudiant centré, textes légaux majeur/mineur, format injecté dans "Vidéo « [format] »", signature embarquée (encre blanche), horodatage. Téléchargement via bouton manuel sur écran confirmation. `window.print()` et `jsPDF` = exclus (incompatibles iPad/Safari).

**Triple sécurité :**
1. PDF local — bouton TÉLÉCHARGER sur écran confirmation (jamais automatique)
2. Email studio `mpavloff@letudiant.fr` — Resend premier appel
3. Copie email responsable signature — Resend second appel, conditionné à `responsableEmail !== mpavloff@letudiant.fr`

**emailPrefix :** champ dans `profiles-public.json` — préfixe seul, domaine `@letudiant.fr` hard-codé dans `send-email.js`. Dette vers solution profils complète (C5).

**`app.js` chargé une seule fois** via `document.write` avec cache-bust.

**Monday :** supprimé. Archivage via Resend → boîte mail studio + copie responsable.

**Proxy Netlify :** `musical-tanuki-a691a5` — variables secrètes via CLI uniquement (`npx netlify env:set --force`).

**On ne signe jamais à l'aveugle :** texte juridique intégral affiché dans l'accordéon avant la zone de signature. Règle non négociable.

**RESPONSABLE SIGNATURE :** métadonnée et nomenclature fichier uniquement — jamais dans le corps du PDF.

---

## Carnet de pièges Gemini — actifs

| App | Piège | Solution |
|-----|-------|----------|
| ROVER | Fichier source YouTube déjà optimisé → recompression produit fichier plus lourd | Ne pas compresser les fichiers web — compression réservée aux rushes bruts |
| ROVER | HandBrake — preset `Fast 1080p25` inexistant dans HB 1.11.1 | Preset disponible : `Fast 1080p30` |
| ROVER | HandBrake — stderr bufferisée en mode non-TTY | Timer filesystem sur taille du fichier tmp |
| ROVER | ffmpeg probe trop lente sur gros fichiers | Utiliser `-show_entries format=duration` sur les métadonnées |
| ROVER | ffmpeg — bitrate cible supérieur au bitrate source → fichier plus lourd | Ne jamais cibler bitrate > source |
| ROVER | `[Merger]` dans stdout yt-dlp | `proc.on('close')` peut arriver avant flush — fallback fichier .mp4 le plus récent |
| Launcher | `openInstallModal` — IDs fantômes | Guards défensifs `if (el)` sur tout `getElementById` |
| Launcher | Resend hors mode Master | Clé accessible via `getKeys()` uniquement |
| Launcher | Assets dans `src/renderer/assets/` — pas à la racine | Utiliser `find` pour localiser |
| Launcher | Triple mise à jour obligatoire par app | `APPS_CATALOG` + `AMBIANCE_VIDEOS` + `TRANQUILITY_TOOLS` |
| COVENANT | `gh repo create --clone` ne clone pas toujours | Vérifier `ls -la`, cloner manuellement si nécessaire |
| COVENANT | GitHub Pages nécessite repo public | Repos privés = Pages bloquées sans GitHub Enterprise |
| COVENANT | Branche `master` — pas `main` | Toujours `git push origin master` |
| COVENANT | Interface Netlify tronque les longues clés | Toujours `npx netlify env:set "valeur" --force` |
| COVENANT | IP Netlify bloquée par Monday (HTTP 403) | Monday bloque tous les clouds publics |
| COVENANT | CORS bloqué sur appels Monday directs | Monday supprimé de COVENANT |
| COVENANT | `app.js` chargé deux fois → SyntaxError | Vérifier absence de `<script src="app.js">` en doublon |
| COVENANT | `window.print()` / `jsPDF` incompatibles iPad Safari | Utiliser `pdf-lib` + blob download uniquement |
| COVENANT | Classe CSS utilisée dans app.js inexistante → texte invisible | Toujours vérifier qu'une classe JS existe dans style.css avant de pousser |
| COVENANT | `window._covenantEmailResult` undefined si envoi fire-and-forget | Toujours await le fetch dans la fonction async parente |
| COVENANT | `window._covenantPdfBlob` perdu si refresh avant téléchargement | Comportement normal — non corrigeable sans localStorage |
| COVENANT | On ne signe jamais à l'aveugle | Texte juridique intégral obligatoire dans l'accordéon avant signature |
| REVIEWER | Branche = `main` pas `master` | Toujours `git push origin main` |
| REVIEWER | Audit "classes legacy-only" ≠ audit exhaustif | Phase 3 requiert migration complète incluant overlay, capture, inputs, notifications |
| REVIEWER | Legacy redéfinissait `body` + `title-bar` + `:root` avec fond clair | Écrasait tout le dark theme — cause des régressions lors des tentatives de suppression |
| Apps web | Cache GitHub Pages masque les corrections | Toujours tester en navigation privée après push |
| METHODE | Grille Workflow Captif consultée comme document, pas appliquée comme filtre | Format verdict 6 lignes avant tout chantier de conception |
| METHODE | Règles rappelées en session non rétro-injectées immédiatement | Ajout au carnet de pièges en temps réel |
| METHODE | Cowork = accès direct aux fichiers locaux sans `cat` Terminal | Utiliser Cowork systématiquement pour lire du code source en local |
| PROFILS | `appPermissions` existe dans le code mais pas dans la spec | Spec V1.2 à créer — toute app qui implémente des permissions improvise |
| PROFILS | Profil "Invité" disparu de la spec V2 sans décision | Régression silencieuse — à corriger dans V1.2 |

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

### Les 4 contrats architecturaux (formalisés le 7 juin 2026)
À vérifier sur chaque app, sans exception :
- **Design** : `tranquility-core.css` first, zéro token local, dark theme, uppercase, zéro emoji
- **Identité** : `session.json` V2, Launcher optionnel, n'importe quelle app peut écrire la session
- **Portabilité** : settings dans profil GitHub, couche `_machines` pour chemins locaux, clés API dans Keychain global
- **Vérité** : shared data layer `tranquility-core`, fetch `no-cache`, MASTER only pour écriture

### Apps web — Reviewer = référence absolue
Pour toute nouvelle app web Tranquility : copier la structure de Reviewer. Ne jamais improviser.

### Apps web — Splash Mercury
`window.onMercuryComplete` = seul point d'entrée. Jamais `DOMContentLoaded`, jamais `window.load`.

### Apps web — Cache-bust
Toujours versionner `style.css` et `app.js` avec `?v=APP_VERSION`.

### Apps web — tranquility-core.css
⚠️ Décision PRESIDENCE requise (I6) — les apps web redéfinissent actuellement les variables localement.

### Apps web — Sélecteur de profil
Reviewer = référence absolue. Card modale centrée, durée de session (AUJOURD'HUI / 7 JOURS / TOUJOURS), bouton SE CONNECTER. Ne jamais improviser une variante.

### ROVER — Sélecteur de format yt-dlp
`bestvideo[height<=H]+bestaudio/bestvideo[height<=H]/best`. Ne jamais contraindre le codec sur Instagram.

### ROVER — TikTok watermark
`--extractor-args "tiktok:api_hostname=api16-normal-c-useast1a.tiktokv.com"`. Fonctionne uniquement depuis Electron.

### ROVER — Migration SQLite
Toujours entourer les `ALTER TABLE` d'un `try/catch` silencieux.

### managers.json — schema
`id`, `firstName`, `lastName`, `phone`, `role` — deux valeurs : `"Responsable vidéo"` et `"Responsable projet"`.

### Launcher — Protocole ajout app
Workflow complet en 5 phases dans `LAUNCHER_PROTOCOLE_AJOUT_APP.md`. Sans exception.

### COVENANT — Monday
Monday = supprimé. Archivage via Resend → boîte mail studio + copie email responsable signature.

---

## Flotte complète — 21 outils

| # | Nom | Catégorie | État |
|---|-----|-----------|------|
| 1 | BackUpFlow | Desktop | 🟣 En orbite — dette `Fast 1080p25` ouverte |
| 2 | Transporter | Desktop | 🟣 En orbite |
| 3 | Reviewer | Web | 🟣 En orbite — assainissement CSS ✅ 08/06/2026 · corrections UI ⚫ |
| 4 | Manifest | Web | 🟣 En orbite — identity crisis (repo EasyCallSheet) |
| 5 | Launcher V2 | Desktop | 🟣 En orbite |
| 6 | ARK | Desktop | 🟣 En orbite |
| 7 | ROVER | Desktop | 🟣 En orbite — V1.04.06.26 |
| 8 | COVENANT | Web | 🔵 En lancement — C9 restant |
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

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail Agence | V1 |
| `AGENCE_TRANQUILITY_AGENTS.md` | 23 postes — personnalités et réflexes | V1 |
| `AGENCE_TRANQUILITY_COUNCIL_SKILL.md` | Protocole consultation multi-agents | V1 |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision produit — 5 décisions fondatrices | V2 ⚠️ Révision nécessaire |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design — règles UI non négociables | V2 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format profils — architecture settings | V1.1 ⚠️ V1.2 à produire |
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Protocole session — sync GitHub — 12 règles | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Les trois lois du workflow captif | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille d'évaluation opérationnelle | V1 |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Trois automatismes JARVIS | V3 — 08/06/2026 |
| `TRANQUILITY_INSTRUCTION_VISION_ANCRAGE.md` | Checklist avant tout prompt Cursor | V1 |
| `PROTOCOLE_GIT_MAC_SWITCHING.md` | Workflow Git inter-Mac | V1 |
| `LAUNCHER_PROTOCOLE_AJOUT_APP.md` | Workflow ajout app au Launcher — 5 phases | V1 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Skill développement Electron | V1 |
| `TRANQUILITY_SUITE_UX_DESIGN_SKILL.md` | Skill UX/Design | V1 |
| `TRANQUILITY_COMPASS.md` | Document d'orientation JARVIS permanent | ✅ Créé — 07/06/2026 |
| `CARNET_PIEGES_V2.md` | Carnet de pièges — 2 nouveaux pièges ajoutés | ✅ À créer — 09/06/2026 |
| `TRANQUILITY_SERVICES_TIERS.md` | Inventaire services tiers critiques | ⚫ À créer — B1 |
| `TRANQUILITY_SUITE_COM_MARKETING_V2.md` | Bible COM mise à jour | ⚫ À créer — D1 |

---

*Plan Directeur V5.29 · Tranquility Suite · Cellule Vidéo L'Étudiant · 8 juin 2026*
*Mise à jour — I6 Reviewer-Assainissement ✅ terminé (4 phases, −1419 lignes CSS) · corrections UI Reviewer ⚫ · tranquility-web-template ⚫*
