# Session de travail — 17 novembre 2026
## RENDEZVOUS — Authentification ADMIN, étape 5 (Touch ID), partie 1 : conception, serveur complet, panneau SÉCURITÉ

*Session technique (Bloc B) · Mac Maison · 17/11, de la fin d'après-midi à 23 h 40*

---

## Chantiers traités

### Démarrage
Quatre dépôts mis à jour : `tranquility-plan-directeur` et `tranquility-carnet-pieges` déjà à jour ; `rendezvous-proxy` et `RENDEZVOUS` sur `auth-admin`, alignées sur `main` et `origin/main` (`c38281e`, `f7970ce`). Première commande de vérification fausse (`git rev-parse --short` refuse plusieurs révisions), remplacée par une boucle. Plan V5.152 et récap E4 lus sur raw.githubusercontent.com (dépôt public) ; Carnet V94 lu après « Sync now ». Aucun écart avec le prompt de reprise. Postes actifs : SÉCURITÉ (qui mène la conception), CONCEPTUALISATION, UX ET UI, CODE, QUALITÉ, MÉMOIRE, plus NAVIGATION et MISSION CONTROL. SETI : aucun signal.

### Conception avec SÉCURITÉ (dix arbitrages de PRÉSIDENCE, tous en option recommandée sauf mention)
Périmètre de la clé (compte Apple personnel), fichier à part dans le dépôt privé, bibliothèque de vérification, conditions d'ajout (session, secret retapé, e-mail d'alerte), bouton TOUCH ID au-dessus du secret, sort des clés au changement de secret, réglages de fond, navigateur (Safari), connexion sans écriture, retrait par la session seule, puis, en cours de construction : compteur d'échecs propre au guichet (le « même compteur » validé s'est révélé infaisable, chaque fonction Netlify ayant sa propre mémoire), ordre « pas d'e-mail, pas d'appareil », titre du panneau, confirmation du retrait sur la ligne, ajout en deux clics. Vérifications faites par JARVIS : registre npm (`@simplewebauthn/server` 14.1.0 publiée le 06/11, écartée par la règle des deux semaines ; 14.0.3 du 25/09 retenue, Node 20 minimum) ; version de Node du site Netlify lue dans le journal de déploiement (22.23.5) ; Opera : aucune annonce officielle, un témoignage de forum indique qu'il n'utilise pas les clés d'accès natives de macOS, alors que Chrome le fait depuis sa version 118.

### Marche 1 — Boîte à outils des clés (`rendezvous-proxy`, `718ec79`)
`_shared/admin-passkeys.js` : constantes (domaine `realcoolclint.github.io`, nom public « Tranquility Suite », 5 appareils, question de 120 s), lecture et écriture de `admin-passkeys.json` dans le dépôt privé avec la prudence de D287 (absent seulement si la sonde du dépôt répond, illisible = refus, aucune entrée invalide filtrée en silence, écriture refusée si quelqu'un a écrit entre-temps), effacement qui passe même sur un fichier abîmé, questions signées de type `admin-webauthn` cloisonnées des sessions. Dépendance figée sans chapeau. Huit contrôles locaux sans réseau. Déployé (25 paquets) ; admin retestée par secret.

### Marche 2 — Guichet d'enregistrement (`1063c70`)
`admin-passkey-register.js`, deux temps (question, puis vérification), session et secret retapé aux deux temps, plafond de 5, vérification par la bibliothèque (domaine, adresse, question, doigt obligatoire), relecture fraîche, refus des doublons, **e-mail d'alerte avant toute écriture**. Cursor a confirmé dans la version installée que la question doit être passée en octets (une chaîne serait relue comme du texte). Test en production : 401 RDV-101 sans session, ce qui prouvait aussi que la bibliothèque se charge chez Netlify.

### Marche 3 — Guichet de connexion (`01ab5c9`)
`admin-passkey-login.js`, porte sans session : question préparée sans lecture de fichier (20 demandes / 15 min), puis vérification en quatre verrous (question valide, appareil connu, identifiant d'admin `tranquility-suite-admin`, signature vérifiée avec la clé publique enregistrée chez nous), compteur d'échecs propre (5 / 15 min, en mémoire), aucune écriture, même session de 7 jours par la fabrique commune (D293). Paramètre `credential` (et non `authenticator`) vérifié dans la version installée. Test en production : 200, question rattachée au bon domaine, doigt obligatoire.

### Marche 4a — Guichet de gestion (`b323248`)
`admin-passkey-manage.js` : liste et retrait par la session seule ; l'écran ne reçoit que l'identifiant, le nom et la date, jamais la clé publique (vérifié sur la réponse brute, avec une doublure de GitHub). Test en production : 401 RDV-101.

### Marche 4b — Effacement en cas de crise (`851d572`)
`admin-complete-reset.js` : effacement de toutes les clés après tous les contrôles du lien et du nouveau secret, juste avant l'écriture du secret ; effacement raté → RDV-605, secret inchangé ; écriture du secret ratée après effacement → même code, texte complété. Correctif glissé dans ce seul fichier : corps `null` refusé en RDV-403 au lieu de planter (le même défaut reste dans le guichet de l'étape 3). Ordre des appels prouvé sur sept cas avec une doublure. Test en production : RDV-103 inchangé.

### Marche 5 — Panneau SÉCURITÉ (`RENDEZVOUS`, `dd21cc2`)
5a (structure et style) : panneau renommé SECRET ET TOUCH ID, sous-titres CHANGER LE SECRET et APPAREILS TOUCH ID, compteur, liste, ajout, champ SECRET ACTUEL dédié, texte Safari, panneau désormais défilable sur écran court. Correction de charte avant enregistrement : la classe existante `btn` imposait Open Sans ; les deux boutons secondaires ont reçu une classe propre en Lato (police calculée vérifiée par Cursor). 5b (comportement) : liste rechargée à chaque ouverture, texte simple uniquement, retrait confirmé sur la ligne avec rappel « change le secret pour couper les sessions », ajout en deux clics (VALIDER puis POSER LE DOIGT, Touch ID ouvert sans attente dans le clic), secret gardé en mémoire le temps de l'ajout puis effacé dans tous les cas, codes écran RDV-201 à 204.

### Test en production (17/11, 23 h 34)
Safari a d'abord servi l'ancienne page malgré un rechargement sans cache et un redémarrage (Opera montrait déjà la nouvelle) ; contourné avec `admin.html?maj=1`. Ajout réussi du premier coup : « Safari · 17/11/2026 23:34 », 1 APPAREIL SUR 5, notification de succès, e-mail d'alerte reçu à 23 h 34 avec le nom public et les conseils dans le bon ordre.

---

## Décisions actées

- **D296** — La clé d'accès admin suit le compte Apple personnel de PRÉSIDENCE (trousseau iCloud : Mac Maison, iPhone). Le serveur ne peut pas exiger un seul appareil sans refuser les clés de Safari. Chaque clé est listée dans SÉCURITÉ et peut être retirée.
- **D297** — Les clés publiques vivent dans `admin-passkeys.json`, fichier à part du dépôt privé, écrit par le serveur seul, sans repli silencieux (même mécanique que D287). Limite connue : une clé est liée à l'adresse `realcoolclint.github.io` ; si l'admin déménage, on repasse par le secret et on réenregistre.
- **D298** — La vérification passe par `@simplewebauthn/server` en version figée 14.0.3 (règle des deux semaines ; 14.1.0 écartée). Aucune bibliothèque côté écran.
- **D299** — Ajouter un appareil exige la session **et** le secret retapé, et envoie un e-mail d'alerte vers la boîte de secours **avant** l'écriture : pas d'e-mail, pas d'appareil (RDV-603).
- **D300** — Réglages de fond : doigt obligatoire ; session de 7 jours délivrée par la fabrique commune (un changement de secret la coupe) ; question signée valable 2 minutes (réponse rejouable dans ce délai, risque très faible, parade notée en polish) ; 5 appareils au plus, nommés automatiquement (navigateur et date) ; codes pour chaque cas prévu.
- **D301** — Chaque guichet Touch ID a son propre compteur d'échecs (5 en 15 minutes par connexion, en mémoire), comme les guichets existants. Le compteur partagé et durable reste un polish commun à tous les guichets.
- **D302** — Un changement de secret par SÉCURITÉ garde les clés ; une réinitialisation par lien e-mail les efface toutes, avant d'écrire le secret. Si l'effacement échoue, le secret ne change pas (RDV-605).
- **D303** — Touch ID est prévu pour Safari. Opera garde le secret ; il sera essayé en recette, avec un message codé en cas d'échec.
- **D304** — La connexion par Touch ID n'écrit jamais rien : le compteur de passages n'est pas mis à jour, la détection de clé clonée est inactive (sans objet avec les clés d'Apple, qui affichent toujours 0).
- **D305** — Voir et retirer un appareil : la session suffit, sans secret ni e-mail. Confirmation sur la ligne même (aucune fenêtre ni boîte native), puis rappel : changer le secret pour couper les sessions déjà ouvertes.
- **D306** — Safari n'ouvre Touch ID que dans la foulée immédiate d'un clic. Ajout en deux clics (VALIDER, puis POSER LE DOIGT) ; à la connexion, la question sera préparée dès l'affichage de l'écran pour que le clic sur TOUCH ID ouvre la fenêtre aussitôt.
- **D307** — Le panneau s'intitule SECRET ET TOUCH ID ; codes propres à l'écran dans la famille 2xx : RDV-201 (navigateur sans clés d'accès), 202 (annulé ou délai), 203 (appareil déjà enregistré), 204 (autre échec). Codes serveur ajoutés : RDV-408, 409, 410, 411, 412, 502, 604, 605. Catalogue à mettre à jour à la marche 7.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `rendezvous-proxy` : `_shared/admin-passkeys.js`, `package.json`, `package-lock.json` | Code serveur | ✅ `718ec79` |
| `rendezvous-proxy` : `admin-passkey-register.js` | Code serveur | ✅ `1063c70` |
| `rendezvous-proxy` : `admin-passkey-login.js` | Code serveur | ✅ `01ab5c9` (pas encore appelé par l'écran) |
| `rendezvous-proxy` : `admin-passkey-manage.js` | Code serveur | ✅ `b323248` |
| `rendezvous-proxy` : `admin-complete-reset.js` | Code serveur | ✅ `851d572` |
| `RENDEZVOUS` : `admin.html`, `admin.js`, `style.css` | Écran | ✅ `dd21cc2` |
| Mac Maison (Safari) | Appareil Touch ID | ✅ enregistré le 17/11 à 23 h 34 |
| `docs/RENDEZVOUS_CODES.md` | Catalogue | 🟡 à compléter (marche 7) |
| Plan Directeur V5.153, Carnet V95, ce récap | Documentation | ✅ produits en clôture |

---

## Commandes Terminal produites

```bash
# Vérifier qu'une branche locale sans suivi est alignée (les trois empreintes doivent être identiques)
for repo in rendezvous-proxy RENDEZVOUS; do echo "== $repo"; cd ~/Documents/GitHub/$repo; for b in auth-admin main origin/main; do echo "$b : $(git rev-parse --short $b)"; done; done
```

```bash
# Tester le guichet de connexion Touch ID sans écran (attendu : 200 et une question signée)
curl -s -X POST -H "Content-Type: application/json" -d '{"step":"options"}' -w "\nSTATUT HTTP : %{http_code}\n" https://rendezvous-proxy-tranquility.netlify.app/.netlify/functions/admin-passkey-login
```

```bash
# Forcer Safari à charger la dernière version de l'admin
open -a Safari "https://realcoolclint.github.io/RENDEZVOUS/admin.html?maj=1"
```

---

## Pièges découverts (Carnet V95, +12)

`git rev-parse --short` à plusieurs révisions ; menus Netlify renommés et version de Node lue dans le journal ; dernière version d'une dépendance trop récente ; question WebAuthn passée en texte ; paramètre de bibliothèque renommé d'une version à l'autre ; Touch ID qui doit suivre immédiatement un clic dans Safari ; Safari qui garde l'ancienne page ; Opera et les clés d'accès ; compteur « partagé » impossible entre fonctions Netlify ; classe CSS existante qui impose une autre police ; sortie du Terminal collée à la place du presse-papiers ; règle de l'outil d'audit de design désactivée par Cursor.

---

## Liste de polish RENDEZVOUS (consolidée)

Reprise du 17/11 au matin : police Open Sans dans les champs ; transition des toasts écrite en dur ; anciens messages sans code RDV ; `.DS_Store` dans `rendezvous-proxy` ; fichiers égarés à la racine de `~/Documents/GitHub` du Mac Maison ; coffre de Launcher dont l'échec de déchiffrement ressemble à un coffre vide ; bouton SECRET OUBLIÉ sans effet au survol ; libellé « Secret administrateur » en minuscules ; icône de clé de Safari serrée contre VOIR ; texte de RDV-602 inadapté dans le guichet de fin ; corps `null` qui fait planter le guichet de changement de secret (étape 3) ; carte non défilable sous 524 px de haut ; fond flou sans message si la liste échoue juste après une réinitialisation ; question D15 : titre de page « ADMIN — RENDEZVOUS ».

Ajouts de cette session : lier la question Touch ID de connexion à la connexion réseau qui l'a demandée (parade au rejeu de 2 minutes) ; message RDV-601 qui parle du « secret » quand c'est le fichier des appareils qui est injoignable ; RDV-901 sans consigne d'ignorer l'alerte dans le cas rarissime d'une clé refusée après l'e-mail ; noms d'appareils Firefox et Chrome sur iPhone non reconnus ; sonde du dépôt privé dupliquée entre `admin-auth.js` et `admin-passkeys.js` ; pas de ligne de journal pour l'effacement des clés ; arrêter le minuteur de 100 s dès l'envoi final de l'ajout (sinon la notification de succès peut se perdre) ; message RDV-202 dans Opera qui ne renvoie pas vers Safari ; notification qui recouvre la phrase « Touch ID fonctionne dans Safari… » ; date affichée deux fois sur la ligne d'un appareil ; règle `flat-type-hierarchy` de l'outil d'audit de design désactivée pour tout `admin.html` (hiérarchie des titres de l'admin à revoir) ; classe `btn` existante qui impose Open Sans ailleurs dans la feuille (pour l'audit Surveyor).

Réglé cette session : corps `null` du guichet de fin du lien e-mail (RDV-403).

---

## Prochaines étapes

1. **Étape 5, marche 6** : bouton TOUCH ID sur l'écran de connexion (texte, au-dessus du champ du secret), question préparée dès l'affichage de l'écran et renouvelée avant son expiration, appel direct dans le clic, session stockée comme après le secret, messages codés (RDV-201 à 204, 402, 409 à 411).
2. **Étape 5, marche 7** : catalogue `docs/RENDEZVOUS_CODES.md` (RDV-201 à 204, 408 à 412, 502, 604, 605 ; remède de dernier recours de RDV-605 : supprimer à la main `admin-passkeys.json` du dépôt privé sur github.com, puis recliquer sur le lien), puis recette : connexion Touch ID dans Safari, essai dans Opera, essai sur iPhone, retrait d'un appareil, effacement par une vraie réinitialisation par lien e-mail.
3. Audit Surveyor complet vers le 20/11, avec l'essai TANDEM (D285).
4. Suite de la séance SÉCURITÉ D211 (D286) : clés du coffre de Launcher, BackUpFlow sur le Mac Bureau, décision JURIDIQUE sur le délégué à la protection des données.
5. Polish RENDEZVOUS, puis reste du palier 1 de D205.

---

*Session 17/11/2026 · RENDEZVOUS · Mac Maison*
