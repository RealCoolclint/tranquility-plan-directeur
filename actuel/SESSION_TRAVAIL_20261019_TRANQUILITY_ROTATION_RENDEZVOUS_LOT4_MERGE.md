# [TRANQUILITY] Récap de session — Rotation des documents versionnés, patch CODEX, merge du lot 4 de RENDEZVOUS

**Date :** lundi 19 octobre 2026 (soir, troisième session de la journée, de 17 h 45 à 23 h), Mac Maison
**Postes actifs :** MÉMOIRE · INFRASTRUCTURE · QUALITÉ · NAVIGATION · MISSION CONTROL (rotation), puis STUDIO CREA · CODE · QUALITÉ · SÉCURITÉ (piste 1 de RENDEZVOUS).
**Statut de ce fichier :** à pousser dans `actuel/` de `tranquility-plan-directeur` avec le Plan V5.119, par la commande de rotation (mode C, D177 ; rotation, D179).

---

## 1. Résultat en une phrase

Les documents versionnés ont maintenant deux tiroirs (`actuel/` et `archives/`) qui tournent seuls à chaque clôture, le lot 4 de RENDEZVOUS est en production sur main après correction du patch CODEX et nettoyage de 434 lignes de code mort, et la recette a révélé un défaut d'origine : le lobby (et l'écran principal) sont inutilisables sur iPhone.

## 2. Déroulé

### Rotation du Carnet de pièges
1. Constat de départ : l'Intégration GitHub du projet était abonnée au seul fichier `CARNET_PIEGES_V59.md` ; la V60, nouveau fichier, n'entrait jamais. Le repo contenait 33 versions à la racine.
2. Repo réorganisé : `actuel/` (V60 seule) et `archives/` (V25 à V59, 32 fichiers), par `git mv` (historique conservé, 33 renommages à 100 %). Commit `0200d00`.
3. Le projet est relié au dossier `actuel/` ; Martin a confirmé la présence de la V60 et l'absence de la V59 dans les fichiers du projet.
4. Modèle de commande de clôture validé : `git pull`, recherche du nouveau Carnet dans `~/Downloads/Markdowns` par `find`, arrêt complet s'il est introuvable (`test -n`), ancienne version vers `archives/`, nouvelle dans `actuel/`, commit, push.

### Rotation du Plan Directeur et des récaps
1. Inventaire : 137 éléments à la racine (95 Plans, 13 récaps, 28 documents vivants, `surveyor/`). Seul point dépendant de l'emplacement : `surveyor/radar.sh` ligne 139, qui ne cherchait le Plan qu'à la racine (la recherche du Carnet, elle, parcourt tout le repo).
2. Trois options présentées (rotation complète, rotation douce, statu quo) ; PRÉSIDENCE retient la rotation complète. Récaps : même principe, dans les deux mêmes tiroirs que le Plan.
3. Ordre sécurisé : d'abord le Surveyor (boucle sur `actuel/` puis la racine, jamais `archives/`, compatible bash 3.2), essai à blanc en trois situations, commit `2c5e36d` ; ensuite le déménagement, répété à blanc dans le clone de JARVIS puis exécuté à l'identique (108 renommages, 0 ligne modifiée), commit `296ec9a`.
4. Test réel : le Surveyor trouve `TRANQUILITY_PLAN_DIRECTEUR_V5_118.md` et `CARNET_PIEGES_V60.md`. Racine : 31 éléments au lieu de 137.
5. Modèle de commande de clôture validé : rotation simultanée du Plan et du récap, arrêt complet si l'un des deux nouveaux fichiers manque.

### RENDEZVOUS — patch CODEX
1. Mesures dans le clone de JARVIS : vidéo 900 × 900, 24 i/s, 206 images ; fond uniforme 8, 15, 29 (la même couleur que l'ambiance CODEX de D149 ; la mesure du matin, `060f1b`, est ce même bleu lu avec une autre conversion de couleurs) ; bord du liseré à environ 410 px, centre du patch en 445 × 444 (décalé du centre de l'image) ; halo d'environ 15 px.
2. Option « fondu doux » retenue : image intacte jusqu'au liseré, puis effacement progressif vers le noir sur environ 16 px. Contrôles : coins à 0, 0, 0 ; au-delà du fondu 2/255 au maximum ; écart moyen intérieur d'environ 2/255. Validé à l'œil par Martin.
3. Vérifications préalables : poster `patch-codex.png` déjà propre (coins transparents) ; `ambiance-codex.mp4` toujours bleue et `ambiance-codex-noir.mp4` absente des repos publics ; `PATCH_EDGES` à 95 % rognait la fin du fondu (pixels jusqu'à 21/255), 97 % ne coupe plus rien de visible.
4. Substitution sous le même nom, comme COVENANT et ROVER (D166) : `assets/patch-codex.mp4` remplacé, empreinte md5 contrôlée sur le Mac ; `PATCH_EDGES.codex` 95 → 97 ; `main-screen.js` v=11. Test local validé (carrousel et écran principal). Commit `a45e679`.

### RENDEZVOUS — avant le merge
1. Tri des dettes du lot 4 : deux points seulement avant le merge, tout le reste en polish.
2. `logout()` vide désormais l'adresse e-mail du menu **et** l'initiale de l'avatar (cette dernière, trouvée à la lecture, n'était pas dans la dette) ; `app.js` v=14 ; test en console `['', '']`. Commit `9188f3c`.
3. Notification « Déconnecté. » : bien placée sur le lobby.
4. Nettoyage de l'ancienne grille de cartes, après un inventaire en lecture seule par Cursor en mode agent, relu et contre-vérifié : section masquée de `index.html` (100 lignes), `_renderCard`, boucle des cartes, `_bindCtas` et `initCardAmbianceVideos` dans `app.js` (189 lignes, `R6.init` garde la bascule de vue et `r6:ready`), 138 lignes de `style.css` (règles de l'admin conservées : `.app-grid`, `.app-card`, `.app-card:hover`, `.app-card-name`, `.fleet-card-status`, `.fleet-section-title`, `.status-*`, `#profiles-list .app-card`, et la règle 2x2 du panneau Détails), deux replis morts de `glass-drawer.js`. Caches `style.css` v=51, `app.js` v=15, `glass-drawer.js` v=8. Test local sans erreur. Commit `05c081a` (5 ajouts, 434 suppressions).

### RENDEZVOUS — merge et recette
1. Merge de `lot4-ecran-principal` sur main en avance rapide (`c3f5c70` → `05c081a`, 12 commits, aucun conflit). La branche est conservée.
2. Recette en ligne : écran admin fonctionnel (jugé « pas très beau ») ; `?preview=1` inerte sur le site réel (lobby normal) ; vraie connexion, menu de l'avatar et déconnexion fonctionnels sur ordinateur, identité effacée après la déconnexion (`['', '']`).
3. iPhone : lobby inutilisable (titre coupé en haut, texte sur le patch et les devises, bandeau « Comment on embarque » sur les boutons). Comparaison avec la version d'avant le lot 4 (`c3f5c70`, par `git worktree`, simulation iPhone 12 Pro dans Chrome) : même défaut. Cause : tous les blocs du lobby sont positionnés depuis le bas de la scène (`bottom: 110px`, `bottom: 24px`), et leur pile dépasse la hauteur d'un téléphone. Défaut d'origine du lot 2a, pas une régression du lot 4 : aucun retour arrière.
4. Écran principal sur iPhone : jugé impraticable par Martin ; cause non diagnostiquée ce soir.

## 3. Décisions actées

- **D179 — Rotation des documents versionnés.** Le Carnet de pièges, le Plan Directeur et les récaps de session vivent dans deux dossiers : `actuel/` (la dernière version seule, numéro conservé dans le nom ; pour le repo du Plan, le Plan en vigueur et le récap de la dernière clôture) et `archives/` (toutes les versions précédentes). Le projet Claude est relié au seul dossier `actuel/` du Carnet. La commande de push de chaque clôture fait la rotation et s'arrête entièrement si un nouveau fichier est introuvable. Le Surveyor cherche le Plan dans `actuel/` puis à la racine, jamais dans `archives/`. Geste de Martin en début de session : « Sync now » sur la source du Carnet. Les 28 documents vivants et `surveyor/` restent à la racine.
- **D180 — Refonte mobile du lobby avant tout usage mobile.** RENDEZVOUS n'est pas utilisable sur téléphone tant que le lobby (et l'écran principal sur iPhone) n'ont pas été retravaillés. C'est le premier chantier de la prochaine session RENDEZVOUS.

Application de décisions existantes, sans nouvelle décision : la substitution du patch CODEX sous le même nom suit le précédent de D166 et le principe d'un fichier par patch (D167).

## 4. Livrables produits

| Élément | Nature | État |
|---|---|---|
| `tranquility-carnet-pieges` en `actuel/` + `archives/` (`0200d00`) | Repo | ✅ |
| Projet relié au dossier `actuel/` du Carnet | Projet | ✅ |
| `surveyor/radar.sh` lisant `actuel/` (`2c5e36d`) | Script | ✅ |
| `tranquility-plan-directeur` en `actuel/` + `archives/` (`296ec9a`) | Repo | ✅ |
| Deux modèles de commande de rotation (Carnet ; Plan + récap) | Méthode | ✅ |
| `assets/patch-codex.mp4` sur noir pur, `PATCH_EDGES` codex 97 (`a45e679`) | RENDEZVOUS | ✅ |
| Effacement de l'identité à la déconnexion (`9188f3c`) | RENDEZVOUS | ✅ |
| Nettoyage de l'ancienne grille, 434 lignes (`05c081a`) | RENDEZVOUS | ✅ |
| Merge du lot 4 sur main (`05c081a`) | RENDEZVOUS | ✅ |
| Recette en ligne sur ordinateur | RENDEZVOUS | ✅ |
| Recette sur iPhone | RENDEZVOUS | ⚫ Échec, défaut d'origine (D180) |
| Ce récap | Récap | 🟡 À pousser avec le Plan |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_119.md` | Document fondateur | 🟡 Livrable 2 |
| `CARNET_PIEGES_V61.md` | Document fondateur | 🟡 Livrable 3 |

## 5. Pièges découverts

- Une source de l'Intégration GitHub reliée à un fichier précis ne reçoit jamais la version suivante, qui est un nouveau fichier → relier un dossier qui ne contient que la dernière version (`actuel/`).
- Les fichiers du projet vus par JARVIS sont figés à l'ouverture de la conversation : un « Sync now » fait en cours de route n'apparaît qu'à la conversation suivante → faire le « Sync now » avant d'ouvrir la conversation, ou faire vérifier par Martin dans la liste des fichiers.
- Déplacer un fichier lu par un script le rend muet sans erreur (le Surveyor aurait répondu « aucun trouvé ») → chercher les scripts qui lisent l'emplacement et les corriger avant le déménagement, avec une période de transition (ancien et nouvel emplacement).
- Une même couleur de fond se lit 060f1b ou 080f1d selon la conversion de couleurs employée → comparer des mesures faites avec la même méthode.
- Un fichier livré en téléchargement peut peser plus que la copie de travail (emballage ajouté à la livraison) → annoncer la taille et l'empreinte md5 du fichier livré, jamais celles de la copie.
- `style.css` est partagé par `index.html` et `admin.html` → avant de supprimer une règle, vérifier qu'aucune page ne l'utilise ; un sélecteur complet peut être mort alors que son préfixe est vivant.
- L'écran admin ne se teste pas en local (le proxy n'accepte que le vrai site) → le placer en premier point de la recette en ligne après un merge qui touche au CSS commun.
- Une page conçue sur ordinateur n'avait jamais été vue sur un vrai téléphone en trois semaines → tester sur un vrai téléphone au plus tôt ; pour savoir si un défaut est une régression, servir l'ancienne version par `git worktree add /tmp/... <commit>` sur un autre port, sans toucher au dépôt.

## 6. Dettes (une ligne chacune)

Soldées ce soir : patch CODEX ; recette de `?preview=1` sur le site réel ; e-mail resté dans le menu après la déconnexion ; nettoyage de l'ancienne grille et des références mortes ; merge du lot 4 ; position de la notification sur le lobby.

Nouvelles :
- Écran principal sur iPhone jugé impraticable : cause à diagnostiquer (dans le chantier D180).
- Position de la notification en mode connecté non observée.
- Commentaires de `requirementFor` et `requestAffectation` (`app.js`) et du bloc `.main-` (`style.css` ~3031) qui citent des noms supprimés.
- Lignes vides en double dans `style.css` après le nettoyage (cosmétique).
- `admin.html` charge `style.css?v=48` et `glass-drawer.js?v=7` (la page publique en est à v=51 et v=8).
- Six vidéos `assets/ambiance-*.mp4` orphelines dans RENDEZVOUS, gardées (pipeline D130 possible) ; la substitution D149 de l'ambiance CODEX ne concerne plus que l'app CODEX.
- Refonte visuelle de l'écran admin, à cadrer.
- Champs de mot de passe hors `<form>` (avertissements Chrome, gestionnaires de mots de passe moins efficaces) : à traiter avec la piste 2.
- Versions V32, V33 et V43 absentes du repo du Carnet (numéros sautés, sans conséquence).
- Protocole de clôture : à réécrire avec D177 et D179 (chemins `actuel/` et `archives/`, commandes de rotation) à sa prochaine version.

Les dettes antérieures restent listées dans le prompt de continuation.

## 7. Prochaines étapes

1. Chantier D180 : refonte mobile du lobby, puis diagnostic et correction de l'écran principal sur iPhone, puis recette multi-appareils complète.
2. Polish du lot 4 (dettes D3 et D4).
3. Piste 2 : authentification ADMIN.

---

*Session du 19 octobre 2026 (soir) · Tranquility Suite / RENDEZVOUS · Mac Maison · compte Claude Team L'Étudiant*
