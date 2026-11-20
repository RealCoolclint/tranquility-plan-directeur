# Session de travail — 18 au 20 novembre 2026
## RENDEZVOUS — Authentification ADMIN, étape 5 (Touch ID), partie 2 : bouton TOUCH ID de connexion, catalogue des codes, recette complète

*Session technique (Bloc B) · Mac Bureau puis Mac Maison (18/11, soir) · Mac Bureau (19/11) · Mac Maison (20/11, matinée)*

---

## Chantiers traités

### Démarrage (18/11, Mac Bureau)
Quatre dépôts mis à jour. Le Mac Bureau avait deux jours de retard : `rendezvous-proxy` et `RENDEZVOUS` avancés jusqu'à `851d572` et `dd21cc2`, branches `auth-admin` créées ou avancées et alignées sur `main` et `origin/main`. Documents plus récents que ceux annoncés par le prompt de reprise : Plan V5.154 et Carnet V96, issus de la session SETI du 18/11 au matin, sans incidence sur RENDEZVOUS. Récap E5 partie 1 lu sur raw.githubusercontent.com, Carnet V96 lu après « Sync now ». Postes actifs : CODE, UX ET UI, SÉCURITÉ, QUALITÉ, MÉMOIRE, avec NAVIGATION et MISSION CONTROL. SETI : aucun signal. Le guichet `admin-passkey-login.js` (dépôt privé) a été lu par copie dans le presse-papiers : contrat en deux temps (question, puis vérification), codes déjà en place côté serveur, aucune modification serveur nécessaire.

### Marche 6 — Bouton TOUCH ID sur l'écran de connexion (`RENDEZVOUS`, `3781178`)
Arbitrage de PRÉSIDENCE : option A (grand bouton bleu TOUCH ID en haut, mention « OU AVEC LE SECRET », phrase d'accueil « Connecte-toi avec Touch ID ou avec le secret administrateur. »), contre un bouton discret. Deux prompts Cursor :
- **Structure et allure** (`admin.html`, `style.css`) : bouton `admin-passkey-login-btn` grisé au chargement, classe `admin-auth-or` en Lato, majuscules, `var(--text-secondary)` ; `style.css?v=58`, `admin.js?v=10`.
- **Comportement** (`admin.js`) : question préparée dès l'affichage de l'écran, renouvelée toutes les 100 secondes tant que l'onglet est visible, arrêtée quand l'onglet est caché, à l'ouverture de l'admin et sur l'écran NOUVEAU SECRET ; clic sans question en mémoire : nouvelle préparation, avec message codé en cas d'échec ; `navigator.credentials.get` appelé sans aucune attente avant lui dans le clic (D306), vérifié ligne par ligne ; une question ne sert qu'une fois ; session rangée exactement comme après le secret ; messages RDV-201, 202, 204 (renvoi vers Safari ou le secret), RDV-102, et ceux du serveur. Test local : enchaînement PRÉPARATION…, bouton actif, RDV-102 au clic (le serveur refuse toute autre adresse que celle du site), chemin du secret intact.
Les deux prompts sont partis dans un seul commit, publié le 18/11 au soir depuis le Mac Maison.

### Incident de changement de Mac (19/11, Mac Bureau)
Le prompt 1 avait aussi été lancé sur le Mac Bureau le 18/11 avant le départ, sans commit ; JARVIS avait pris le silence de Martin pour un « non ». Le 19/11, la mise à jour s'est arrêtée sur `admin.html` et `style.css` modifiés. Vérification par comparaison avec la version publiée (`git diff --quiet origin/main`) : identiques ; copie locale jetée, mise à jour terminée. Aucune perte.

### Marche 7 — Catalogue des codes (`RENDEZVOUS`, `fbae7e6`)
Textes réels du serveur extraits du dépôt privé par une commande ciblée (`grep` des codes, copie dans le presse-papiers). `docs/RENDEZVOUS_CODES.md` : nouvelle famille 2xx (RDV-201 à 204), RDV-408 à 412, RDV-502, RDV-604, RDV-605 (avec le remède de dernier recours), et deux lignes complétées (RDV-402 : échecs Touch ID répétés ; RDV-601 : liste des appareils). Le texte exact de la seconde variante de RDV-605 (effacement réussi, écriture du secret ratée) n'a pas été cité : le cas est décrit sans la phrase.

### Recette (19 et 20/11)
| Essai | Résultat |
|---|---|
| Safari sur le Mac Bureau, sans clé locale | Réussi : macOS propose l'iPhone par code QR (Bluetooth), Face ID sur le téléphone, admin ouvert |
| Safari sur le Mac Maison, fenêtre privée | Réussi : Touch ID sur le Mac, admin ouvert |
| Opera sur le Mac Maison, fenêtre privée | Réussi : Touch ID sur le Mac, admin ouvert (contredit la prudence de D303) |
| Safari sur iPhone, onglet privé | Réussi : l'iPhone a demandé son code au lieu de Face ID (choix d'Apple, réglage Face ID pour les mots de passe) |
| Retrait de l'appareil | Réussi : confirmation sur la ligne, notification avec rappel, compteur à 0, session conservée |
| Connexion avec la clé retirée | Réussi : RDV-411, message clair |
| Réajout de l'appareil | Réussi : « Safari · 20/11/2026 10:26 », e-mail d'alerte reçu, signé Tranquility Suite |
| Effacement par une vraie réinitialisation par lien e-mail | Réussi : nouveau secret en service, autres sessions coupées (Mac Bureau compris), 0 appareil ; **mais le message d'effacement envoyé par le serveur n'est pas affiché par l'écran** (polish n° 1) |
| Remise en service | « Safari · 20/11/2026 11:02 », 1 appareil sur 5, e-mail d'alerte reçu |

Le secret admin a changé le 20/11 par ce test ; Bitwarden est à jour (note « secret actuel »), la note d'attente supprimée.

**Constat SÉCURITÉ, sans décision nouvelle :** grâce au passage par l'iPhone, n'importe quel ordinateur peut ouvrir l'admin si l'iPhone de PRÉSIDENCE est à proximité (Bluetooth) et déverrouillé par Face ID ou son code. C'est le fonctionnement normal des clés d'accès, plus solide que le secret tapé sur le même ordinateur. La session de 7 jours ouverte ainsi sur le Mac Bureau le 19/11 a été coupée par la réinitialisation du 20/11.

---

## Décisions actées

- **D308** — Marche 6 livrée : bouton TOUCH ID en tête de l'écran de connexion (option A de PRÉSIDENCE), mention « OU AVEC LE SECRET », question préparée dès l'affichage et renouvelée toutes les 100 secondes onglet visible, Touch ID ouvert sans attente dans le clic, session rangée comme après le secret (`3781178`).
- **D309** — D303 révisée par la recette : Touch ID fonctionne dans Safari **et dans Opera** sur le Mac Maison, depuis un Mac sans clé par l'iPhone (code QR), et directement sur iPhone (Face ID ou code du téléphone). Les textes qui renvoient vers Safari (phrase du panneau, RDV-201, 202, 204) restent justes pour les autres navigateurs mais deviennent trop prudents : à revoir en polish.
- **D310** — Marche 7 livrée : catalogue des codes Touch ID (`fbae7e6`) et recette complète le 20/11. **L'étape 5 est close, l'Authentification ADMIN (D164, D212) est livrée dans ses cinq étapes**, hors polish. Le sort de la branche `auth-admin` (garder pour le polish ou supprimer) reste à trancher.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `RENDEZVOUS` : `admin.html`, `admin.js`, `style.css` | Écran | ✅ `3781178` |
| `RENDEZVOUS` : `docs/RENDEZVOUS_CODES.md` | Catalogue | ✅ `fbae7e6` |
| Appareil Touch ID | Production | ✅ « Safari · 20/11/2026 11:02 » (clé du trousseau iCloud) |
| Secret admin | Production | ✅ changé le 20/11, Bitwarden à jour |
| Plan Directeur V5.155, Carnet V97, ce récap | Documentation | ✅ produits en clôture |

`rendezvous-proxy` n'a pas changé (`851d572`).

---

## Commandes Terminal produites

```bash
# Avant de jeter des fichiers modifiés localement : vérifier qu'ils sont identiques à la version publiée
cd ~/Documents/GitHub/RENDEZVOUS && if git diff --quiet origin/main -- admin.html style.css; then echo "RÉSULTAT : IDENTIQUES À LA VERSION PUBLIÉE"; else echo "RÉSULTAT : DIFFÉRENCES TROUVÉES :"; git diff --stat origin/main -- admin.html style.css; fi
```

```bash
# Extraire les textes de codes d'un dépôt privé sans copier les fichiers entiers
cd ~/Documents/GitHub/rendezvous-proxy/netlify/functions && grep -n -B1 -A3 'RDV-40[89]\|RDV-41[0-2]\|RDV-502\|RDV-60[45]' admin-passkey-*.js admin-complete-reset.js _shared/admin-passkeys.js | pbcopy
```

```bash
# Enregistrer et publier depuis auth-admin, puis vérifier
cd ~/Documents/GitHub/RENDEZVOUS && git add <fichiers> && git commit -m "<message>" && git checkout -q main && git merge --ff-only auth-admin && git push origin main && git checkout -q auth-admin && git status --short && for b in auth-admin main origin/main; do echo "$b $(git rev-parse --short $b)"; done
```

---

## Pièges découverts (Carnet V97, +10)

Silence pris pour un « non » au changement de Mac ; passage par l'iPhone depuis un Mac sans clé ; Opera qui contredit un témoignage de forum ; iPhone qui demande son code au lieu de Face ID ; fenêtres privées de Safari isolées, celles d'Opera partagées ; message complémentaire du serveur ignoré par l'écran ; version de cache « déjà servie » sans conséquence avant publication ; extraction ciblée de textes d'un dépôt privé ; clé retirée côté serveur mais toujours proposée par macOS ; état de survol confondu avec un état après action.

---

## Liste de polish RENDEZVOUS (consolidée)

**Priorités :**
1. Après une réinitialisation par lien e-mail, l'écran n'affiche pas la phrase du serveur qui annonce l'effacement des appareils Touch ID (Loi 3). Correction dans `admin.js` (fonction `submitAdminReset`) ; lire d'abord dans `admin-complete-reset.js` le nom du champ qui porte cette phrase.
2. État de survol de AJOUTER CET APPAREIL : fond bleu, texte presque illisible (contraste).

**Ajouts de cette session :**
- Textes trop prudents depuis D309 : « Touch ID fonctionne dans Safari », RDV-201, 202, 204.
- Ponctuation : « … avec le secret. (code RDV-411) » ; l'écran colle le code après la phrase du serveur, qui finit déjà par un point.
- Une question Touch ID est demandée au chargement même quand une session est ouverte (une demande sur 20 par quart d'heure).
- Bouton TOUCH ID resté grisé si la liste des profils échoue juste après une connexion Touch ID réussie (un rechargement règle le cas).
- Console : sept avis « champ de mot de passe hors formulaire ».
- Catalogue : RDV-201 et 204 ne citent que la phrase de l'écran d'ajout.

**Reprise du 17/11 :** police Open Sans dans les champs ; transition des toasts écrite en dur ; anciens messages sans code RDV ; `.DS_Store` dans `rendezvous-proxy` ; fichiers égarés à la racine de `~/Documents/GitHub` du Mac Maison ; coffre de Launcher dont l'échec de déchiffrement ressemble à un coffre vide ; bouton SECRET OUBLIÉ sans effet au survol ; libellé « Secret administrateur » en minuscules ; icône de clé de Safari serrée contre VOIR ; texte de RDV-602 inadapté dans le guichet de fin ; corps `null` qui fait planter le guichet de changement de secret (étape 3) ; carte non défilable sous 524 px de haut ; fond flou sans message si la liste échoue juste après une réinitialisation ; question D15 : titre de page « ADMIN — RENDEZVOUS » ; lier la question Touch ID de connexion à la connexion réseau qui l'a demandée (rejeu de 2 minutes) ; RDV-601 qui parle du « secret » quand c'est le fichier des appareils qui est injoignable ; RDV-901 sans consigne d'ignorer l'alerte dans le cas rarissime d'une clé refusée après l'e-mail ; noms d'appareils Firefox et Chrome sur iPhone non reconnus ; sonde du dépôt privé dupliquée entre `admin-auth.js` et `admin-passkeys.js` ; pas de ligne de journal pour l'effacement des clés ; arrêter le minuteur de 100 s dès l'envoi final de l'ajout ; notification qui recouvre la phrase « Touch ID fonctionne dans Safari… » (revu le 20/11) ; date affichée deux fois sur la ligne d'un appareil (revu le 20/11) ; règle `flat-type-hierarchy` désactivée pour tout `admin.html` ; classe `btn` qui impose Open Sans ailleurs dans la feuille.

Retiré de la liste : « RDV-202 dans Opera ne renvoie pas vers Safari » (réglé par la marche 6, puis dépassé par D309).

---

## Prochaines étapes

1. Audit Surveyor complet, prévu vers le 20/11, avec l'essai TANDEM (D285).
2. Polish RENDEZVOUS, en commençant par les priorités 1 et 2.
3. Trancher le sort de la branche `auth-admin` (garder pour le polish, ou supprimer et travailler sur `main`).
4. Suite de la séance SÉCURITÉ D211 (D286) : clés du coffre de Launcher, BackUpFlow sur le Mac Bureau, décision JURIDIQUE sur le délégué à la protection des données.
5. Reste du palier 1 de D205 (R8 restant, carte CAPITAL retirée, hub niveau zéro, modes d'emploi courts, recette, lancement).

---

*Session du 18 au 20/11/2026 · RENDEZVOUS · Mac Bureau et Mac Maison*
