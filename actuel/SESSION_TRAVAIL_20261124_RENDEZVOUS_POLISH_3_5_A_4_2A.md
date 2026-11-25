# Session de travail — 21 et 24 novembre 2026
## RENDEZVOUS — Polish : marches 3.5 et 3.6, Mac Bureau remis au propre, lot 4 serveur (marches 4.1, 4.1 bis, 4.2a)

*Session technique · Mac Maison (21/11, soir) puis Mac Bureau (24/11, après-midi)*

---

## Chantiers traités

### Démarrage (Mac Maison, 21/11)
- Quatre dépôts à jour : `tranquility-plan-directeur` `75433e2`, `tranquility-carnet-pieges` `47e503f`, `RENDEZVOUS` `fd8f762`, `rendezvous-proxy` `851d572`.
- Lus : Plan V5.158 et récap du 21/11 sur un clone du dépôt public ; Carnet V100 par la recherche du projet après « Sync now ».
- Postes actifs : CODE, UX ET UI, QUALITÉ, MÉMOIRE, avec NAVIGATION et MISSION CONTROL ; SÉCURITÉ consulté sur la 4.2a. SETI : aucun signal.
- Agent de Cursor vérifié en local avant chaque prompt (D316).

### Marche 3.5 — Champs de secret dans des formulaires (`fc0e995`, D323)
- Les sept champs de secret de `admin.html` sont rangés dans quatre formulaires (`<form class="admin-secret-form" novalidate>`) : connexion, nouveau secret, changement de secret, ajout d'un appareil. Seuls les champs et leurs libellés y entrent, jamais les boutons.
- `display: contents` (style.css) : les formulaires ne créent aucune boîte, la mise en page ne bouge pas. `#admin-passkeys-add-form` reste un `div` masqué par `hidden` (le formulaire est posé à l'intérieur).
- `admin.js` annule l'envoi natif de ces formulaires (un formulaire à un seul champ s'envoie tout seul sur Entrée et rechargerait la page) ; les écouteurs Entrée existants sont inchangés.
- Versions servies : `admin.js?v=18`, `style.css?v=62`.
- Test dans Safari au Mac Bureau (après « Vider les caches » et une nouvelle fenêtre privée) : carte identique, Entrée affiche RDV-401 sans rechargement, Safari ne propose pas d'enregistrer le secret, l'admin s'ouvre avec Entrée. Dans le tiroir SÉCURITÉ, le menu de mots de passe de Safari garde la première pression sur Entrée (Échap puis Entrée : consigne affichée) ; la consigne de l'ajout d'appareil s'affiche en bas du tiroir, hors de vue sans défilement.

### Mac Bureau remis au propre (24/11, D324)
- `RENDEZVOUS` et `rendezvous-proxy` étaient restés sur la branche `auth-admin` (supprimée sur GitHub le 20/11, D313) : `git pull` sans effet (« no tracking information »), dix enregistrements de retard sur RENDEZVOUS. Aucun fichier en attente ; `auth-admin` pointait sur le même enregistrement que `main` : retour sur `main`, mise à jour, `git branch -d auth-admin` dans les deux dépôts.
- Liste noire `.DS_Store` posée (`~/.gitignore_global`, D253). Reste le Mac Studio.
- Connecteurs de Cursor : `~/.cursor/mcp.json` absent ; Computer Use (16 outils) et Origin (36 outils) fournis par Cursor et allumés d'office ; coupés par l'interrupteur de la ligne « User » de chaque fiche (Customize → MCPs), conformément à D316. Reste le Mac Studio.
- Une vieille conversation de Cursor (5 jours, marche 7 de l'étape 5) affiche encore « 1 File · Undo · Keep · Review » : ne pas cliquer Undo (réécrirait un fichier déjà enregistré).

### Marche 3.6 — Noms des appareils Touch ID (`rendezvous-proxy` `8f94ae1`, D325)
- Inspection : l'écran ne choisit jamais le nom, il affiche celui du serveur (`browserName` dans `admin-passkey-register.js`, à partir de l'agent du navigateur). La 3.6 est donc rangée côté serveur.
- Cause : sur iPhone, Chrome (`CriOS/`), Firefox (`FxiOS/`), Edge (`EdgiOS/`) et Opera (`OPT/`, `OPiOS/`) contiennent aussi « Safari/ » et tombaient sur « Safari » ; Firefox (`Firefox/`) n'était reconnu nulle part.
- Option A de PRÉSIDENCE : le nom dit le navigateur ET l'appareil, « Safari sur iPhone · 24/11/2026 15:10 » (iPhone, iPad, Android, Mac, Windows ; sinon forme actuelle). Limite assumée : un iPad récent se présente comme un Mac. Seuls les nouveaux ajouts en profitent. Longueur maximale autorisée : 80 caractères (nom le plus long : 38). L'agent complet n'est toujours jamais stocké.
- Sept agents réels vérifiés par Cursor (Safari Mac et iPhone, Chrome et Firefox iPhone, Opera et Firefox Mac, agent vide). Déploiement Netlify publié (16 h 15, une fonction envoyée).
- Essai réel depuis Chrome sur iPhone : « Cet appareil est déjà enregistré (RDV-203) ». La clé du 20/11 vit dans le trousseau iCloud et l'iPhone la porte déjà : impossible de créer une seconde clé depuis un appareil Apple du même compte. Option A de PRÉSIDENCE : pas de retrait de la clé pour tester ; vérification du nom à la prochaine vraie inscription (recette). À dire dans les modes d'emploi : une clé créée sur un appareil Apple sert sur tous ceux du même compte iCloud, et son nom dit seulement où elle a été créée.

### Lot 4 côté serveur — ordre validé (D326)
4.1 corps `null` → 4.2 messages (coupée en 4.2a messages RDV-601, 602, 901 et 4.2b codes de la fiche profil) → 4.3 traçabilité (journal d'effacement des clés, commentaire de `admin-complete-reset.js`) → 4.4 question Touch ID liée à la connexion qui l'a demandée (revue SÉCURITÉ avant le code) → 4.5 fusion de la sonde du dépôt privé. La 3.6 a été traitée en tête, sur le même dépôt.

### Marches 4.1 et 4.1 bis — Corps `null` (`b03a5ae`, `31040ae`, D327)
- 4.1 : `admin-change-secret.js` acceptait un corps `null` puis plantait (500) en lisant `body.newSecret`. Parade recopiée de `admin-complete-reset.js` : `null`, tableau ou scalaire → 400 SECRET_REQUIRED. Défaut atteignable seulement par un admin connecté.
- Cursor a trouvé le même défaut dans sept autres guichets, dont quatre publics. Option A de PRÉSIDENCE : 4.1 bis, même parade dans `admin-update-profile`, `request-affectation`, `submit-inscription`, `verify-session`, `login`, `change-password`, `request-magic-link`, chacun renvoyant exactement la réponse de son propre `catch` (aucun nouveau message). Les trois guichets Touch ID étaient déjà protégés (`isPlainObject`).
- Contrôle en ligne : `null` envoyé à `verify-session` → 401 `{"valid":false}` ; à `submit-inscription` → 400 « Corps JSON invalide. ». Aucun 500.

### Marche 4.2a — Messages RDV-601, 602 et 901 (`9a6dd71`, catalogue `RENDEZVOUS` `4939923`, D328)
- Enquête de Cursor avant tout changement :
  - RDV-601 : la phrase « Impossible de vérifier le secret admin… » servait aussi dans les trois guichets Touch ID quand la liste des appareils était injoignable. Nouvelle constante `PASSKEYS_READ_UNREACHABLE` dans `_shared/admin-passkeys.js` : « Impossible de lire la liste des appareils Touch ID pour l'instant (GitHub ne répond pas). Réessaie dans quelques minutes. » La phrase du secret est inchangée.
  - RDV-602 : `admin-complete-reset.js` peut bien renvoyer RDV-602 (effacement des clés réussi, écriture du nouveau secret refusée). Nouvelle phrase pour ce guichet : « Le nouveau secret n'a pas pu être enregistré. Ce lien reste valable quelques minutes : réessaie, ou demande un nouveau lien. », suivie de la note existante sur les appareils retirés. Promesse vérifiée : le lien porte une empreinte du secret en service (`computeSecretMark`) et ne s'éteint que si le secret change. Le guichet de changement de secret garde sa phrase.
  - RDV-901 : après l'envoi de l'alerte d'ajout, aucune clé n'est jamais écrite tant que l'écriture n'a pas réussi. Nouvelle phrase : « Erreur inattendue : l'appareil n'a pas été ajouté. Si tu as reçu l'e-mail d'alerte, tu peux l'ignorer. Réessaie dans quelques minutes. »
- Catalogue `docs/RENDEZVOUS_CODES.md` : RDV-601, 602 et 901 complétés ; RDV-605 corrigé (le cas « clés effacées, secret non écrit » renvoie RDV-602, pas RDV-605) ; 28 codes, aucun perdu.

---

## Décisions actées

- **D323** — Marche 3.5 : sept champs de secret dans quatre formulaires invisibles, envoi natif bloqué, touche Entrée inchangée (`fc0e995`).
- **D324** — Mac Bureau remis au propre : `auth-admin` supprimée des deux dépôts (D313 soldée), liste noire `.DS_Store` posée (D253), Computer Use et Origin coupés (D316). Restent `.DS_Store` et connecteurs sur le Mac Studio.
- **D325** — Marche 3.6 : nom d'appareil « navigateur sur appareil · date » (option A) ; vérification réelle reportée à la prochaine inscription (option A), la clé iCloud partagée rendant l'essai impossible sans retirer la clé en service (`8f94ae1`).
- **D326** — Lot 4 côté serveur : ordre 4.1 → 4.2 (a puis b) → 4.3 → 4.4 → 4.5.
- **D327** — Marches 4.1 et 4.1 bis : corps `null`, tableau ou scalaire refusé proprement par huit guichets, réponse existante de chaque guichet (`b03a5ae`, `31040ae`), validé en production.
- **D328** — Marche 4.2a : RDV-601 propre à la liste Touch ID, RDV-602 adapté au lien de réinitialisation, RDV-901 après l'alerte ; catalogue aligné et RDV-605 corrigé (`9a6dd71`, `4939923`).

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `RENDEZVOUS` : `admin.html`, `admin.js`, `style.css` | Marche 3.5 | ✅ `fc0e995` |
| `rendezvous-proxy` : `admin-passkey-register.js` | Marche 3.6 | ✅ `8f94ae1` |
| `rendezvous-proxy` : `admin-change-secret.js` | Marche 4.1 | ✅ `b03a5ae` |
| `rendezvous-proxy` : sept guichets | Marche 4.1 bis | ✅ `31040ae` |
| `rendezvous-proxy` : `_shared/admin-passkeys.js`, `admin-complete-reset.js`, `admin-passkey-login.js`, `admin-passkey-manage.js`, `admin-passkey-register.js` | Marche 4.2a | ✅ `9a6dd71` |
| `RENDEZVOUS` : `docs/RENDEZVOUS_CODES.md` | Catalogue | ✅ `4939923` |
| Mac Bureau : branches, `.DS_Store`, connecteurs de Cursor | Hygiène | ✅ sans enregistrement |
| Plan Directeur V5.159, Carnet V101 (bloc), ce récap | Documentation | ✅ produits en clôture |

État final : `RENDEZVOUS` `4939923` (`admin.js?v=18`, `style.css?v=62`), `rendezvous-proxy` `9a6dd71`, tous deux sur `main`, rien en attente sur le Mac Bureau.

---

## Commandes Terminal produites

```bash
# Reprise sur un Mac : branche active et fichiers en attente avant de tirer
for r in tranquility-plan-directeur tranquility-carnet-pieges RENDEZVOUS rendezvous-proxy; do echo "===== $r"; cd ~/Documents/GitHub/$r || continue; echo "Branche : $(git branch --show-current)"; echo "En attente : $(git status --porcelain | wc -l | tr -d ' ') fichier(s)"; git pull; git log --oneline -1; done
```

```bash
# Contrôle en ligne d'un guichet public avec un corps null (aucun e-mail, aucune écriture)
curl -s -o /dev/stdout -w "\nCode HTTP : %{http_code}\n" -X POST -H 'Content-Type: application/json' -H 'Origin: https://realcoolclint.github.io' --data 'null' "https://rendezvous-proxy-tranquility.netlify.app/.netlify/functions/verify-session"
```

```bash
# Recherche dans un dépôt sous zsh : motifs entre guillemets simples (ni * ni ! interprétés)
grep -rn -i 'motif\|!autre' --include='*.js' .
```

---

## Pièges découverts (Carnet V101, +10)

zsh qui interprète `*.js` non protégé ; zsh qui interprète `!` entre guillemets doubles ; dépôts restés sur une branche supprimée sur GitHub ; clé Touch ID du trousseau iCloud qui empêche un essai d'ajout depuis l'iPhone ; menu de mots de passe de Safari qui garde la première Entrée ; consigne hors de vue prise pour absente ; ancienne conversation de Cursor avec « Undo » ; disjoncteur d'un connecteur de Cursor (ligne « User ») ; attendu de commande à verdict trop gourmand ; catalogue de codes qui décrivait un cas renvoyant un autre code.

---

## Liste de polish RENDEZVOUS (consolidée au 24/11)

**Réglé dans cette session :** sept avis « champ de mot de passe hors formulaire » ; noms d'appareils Firefox et Chrome sur iPhone ; corps `null` du guichet de changement de secret (et de sept autres guichets) ; RDV-601 qui parlait du secret pour la liste des appareils ; RDV-602 inadapté en fin de réinitialisation ; RDV-901 sans consigne après l'alerte ; RDV-605 mal décrit au catalogue ; branche `auth-admin` du Mac Bureau.

**Lot 4, restant (`rendezvous-proxy`) :**
- 4.2b — erreurs de la fiche profil sans code (une vingtaine de messages de `admin-update-profile.js`) : grille des codes à proposer avant tout prompt ;
- 4.3 — ligne de journal pour l'effacement des clés ; commentaire dans `admin-complete-reset.js` rappelant que l'écran s'appuie sur la garantie d'effacement ;
- 4.4 — lier la question Touch ID de connexion à la connexion réseau qui l'a demandée (revue SÉCURITÉ avant le code) ;
- 4.5 — sonde du dépôt privé dupliquée entre `admin-auth.js` et `admin-passkeys.js`.

**Petits restes de l'écran :**
- menu de mots de passe de Safari qui garde la première Entrée dans le tiroir SÉCURITÉ (effet des formulaires ou non, à vérifier) ;
- consigne de l'ajout d'appareil affichée en bas du tiroir, loin du champ ;
- curseur non replacé dans le champ du secret quand l'écran de connexion réapparaît après une réinitialisation ratée ;
- retour sur l'onglet pendant l'ouverture de l'admin : une question Touch ID préparée pour rien ;
- couleurs de la carte de connexion écrites en dur (`rgba`).

**Catalogue :** ligne RDV-601, la phrase « l'accès admin est suspendu » ne vaut que pour le secret (pour la liste des appareils, seul Touch ID est suspendu).

**Pages publiques :** messages d'erreur sans code dans le lobby et l'inscription (`app.js`, `main-screen.js`, `inscription.js`) et messages techniques du serveur public (« Corps JSON invalide. », « Non autorisé. ») ; `index.html` appelle encore `style.css?v=54`.

**À vérifier plus tard (recette) :** nom « navigateur sur appareil » à la prochaine vraie inscription d'appareil ; toast de réinitialisation (D311) et cas 3.3 à la prochaine vraie réinitialisation.

**Modes d'emploi :** une clé Touch ID créée sur un appareil Apple sert sur tous les appareils du même compte iCloud ; son nom dit où elle a été créée.

**Hors RENDEZVOUS :** Mac Studio (liste noire `.DS_Store`, connecteurs de Cursor) ; fichiers égarés à la racine de `~/Documents/GitHub` du Mac Maison ; coffre de Launcher (séance SÉCURITÉ D286) ; règle Impeccable désactivée dans `admin.html` (D186) ; phrase des instructions du projet sur Lato à harmoniser avec la Design Reference ; vieille conversation de Cursor à fermer au Mac Bureau.

---

## Prochaines étapes

1. **Lot 4, suite** : marche 4.2b (grille des codes de la fiche profil, à valider avant tout prompt), puis 4.3, 4.4 (avec SÉCURITÉ), 4.5.
2. **Suite de la séance SÉCURITÉ D211** (D286) : clés du coffre de Launcher, lecture de BackUpFlow au Mac Bureau, décision JURIDIQUE sur le délégué à la protection des données.
3. **Reste du palier 1 de D205.**
4. **Chantier CODEX** (D321) : à placer dans l'ordre des chantiers avec NAVIGATION.
5. **Au prochain passage sur le Mac Studio** : liste noire `.DS_Store`, inventaire et coupure des connecteurs de Cursor (D316).
6. **~20/12/2026** : audit Surveyor complet n°4 avec le nouvel essai TANDEM (D315).

---

*Session des 21 et 24/11/2026 · RENDEZVOUS · Mac Maison puis Mac Bureau*
