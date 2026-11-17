# Session de travail — 16 et 17 novembre 2026
## RENDEZVOUS — Authentification ADMIN, étape 4 : secret oublié par lien e-mail

*Session technique (Bloc B) · Mac Maison · ouverte le 16/11 en fin d'après-midi, close le 17/11 au matin*

---

## Chantiers traités

### Démarrage
Mise à jour des quatre dépôts (`tranquility-plan-directeur`, `tranquility-carnet-pieges`, `rendezvous-proxy`, `RENDEZVOUS`), branches `auth-admin` alignées sur `main` et `origin/main` (a6cf1a6, 0b18140). Plan en vigueur trouvé en V5.151 et Carnet en V93 (le prompt de reprise annonçait V5.150 et V92 : une session SETI s'était intercalée). Dette repérée dans le récap de l'étape 3 et absente du prompt : un échec de déchiffrement du coffre de Launcher se comporte comme un coffre vide, sans message. Postes actifs : SÉCURITÉ (relecture avant chaque commit, D203), CODE, UX ET UI, QUALITÉ, MÉMOIRE, plus NAVIGATION et MISSION CONTROL.

### Conception (avec PRÉSIDENCE)
Lecture complète des sept fichiers du serveur concernés (transmis par concaténation, dépôt privé). Modèle repris : le lien magique des utilisateurs (D40). Deux différences : l'usage unique passe par la marque du secret au lieu d'un registre des liens consommés ; l'admin n'ayant pas de profil, l'adresse de destination devait être choisie. PRÉSIDENCE a retenu l'option B (boîte personnelle avec double authentification), contre A (boîte professionnelle, accessible à l'IT) et C (adresse du domaine redirigée). Parcours validé tel quel : bouton SECRET OUBLIÉ sans champ d'adresse, lien de 15 minutes, écran NOUVEAU SECRET, session ouverte après l'écriture, autres sessions coupées, messages codés.

### Marche 1 — Boîte à outils commune du secret (`rendezvous-proxy`, `5e3960b`)
Création de `_shared/admin-secret-change.js` : `validateNewSecret`, `writeAdminSecret`, `issueAdminSession` et la durée de 7 jours, déménagés depuis `admin-change-secret.js` sans changement de comportement (tableaux avant / après identiques, relus sur le comparatif complet). `admin-session.js` et `admin-change-secret.js` s'en servent. Le contrôle « identique à l'actuel » (RDV-405) reste dans le guichet de l'étape 3. Polish « durée de 7 jours copiée à deux endroits » réglé. Test en production : connexion neuve, puis changement volontairement raté en RDV-404.

### Marche 2 — Guichet de demande du lien (`285910c`, correction `f06eb1e`)
`admin-request-reset.js` : limite de 3 demandes par 15 minutes et par connexion, 5 par heure au total ; adresse lue dans la variable Netlify `ADMIN_RECOVERY_EMAIL` ; jeton `admin-reset` de 15 minutes portant la marque du secret ; lien `admin.html#reset=<jeton>` (jeton après le dièse, jamais envoyé aux serveurs) ; envoi par Resend ; journaux sans jeton, lien ni adresse. `admin-auth.js` gagne le seul export de `resolveAdminSecretSource`. Cloisonnement vérifié : aucune autre fonction n'accepte un jeton `admin-reset`. Premier test en RDV-407 : la variable n'avait pas été posée ; posée, redéployée, puis 200 et e-mail reçu en boîte de réception Gmail. PRÉSIDENCE a relevé le nom de code RENDEZVOUS dans l'objet : corrigé en « Tranquility Suite · Réinitialisation du secret admin ».

### Marche 3 — Guichet de fin (`c38281e`)
`admin-complete-reset.js` : limite de 10 essais par 15 minutes ; clé de signature vérifiée avant toute écriture ; lien expiré, faux ou d'un autre type → RDV-103 ; marque différente (lien déjà servi ou secret changé) → RDV-104 ; puis règle du secret, écriture GitHub et session par la boîte à outils commune. Deux usages simultanés du même lien ne peuvent pas réussir tous les deux (l'écriture GitHub exige le `sha` lu juste avant). Test en production : sans lien et avec un faux lien, RDV-103 deux fois.

### Marche 4 — Écran (`RENDEZVOUS`, 4a `5fff78b`, 4b `7491d7d`)
4a : bouton SECRET OUBLIÉ sous VALIDER, écran NOUVEAU SECRET (même carte que la connexion), lien lu puis effacé de la barre d'adresse dès l'ouverture, jeton gardé dans la seule mémoire de la page, lien prioritaire sur une session enregistrée, bouton RETOUR À LA CONNEXION. Cursor a modifié hors consigne `.impeccable/config.json` (exceptions du détecteur visuel) : fichier ignoré par Git, sans effet sur la Suite, consigné au Carnet. 4b : bouton VOIR / CACHER sur les six champs de secret (choix A de PRÉSIDENCE), recachage automatique à chaque changement d'écran, aucune action déclenchée au clavier par erreur.

### Marche 5 — Catalogue (`f7970ce`)
`docs/RENDEZVOUS_CODES.md` : RDV-103, 104, 406, 407, 603 ajoutés ; RDV-401 renvoie vers SECRET OUBLIÉ ; RDV-402 couvre aussi les essais répétés avec un lien. Relu sur GitHub après publication.

### Test complet en production (17/11, 9 h 34 → 9 h 44)
Six phases : (1) mise en place, Opera et Safari normal gardent chacun une session admin valide, servant de témoins ; (2) demande du lien depuis une fenêtre privée de Safari, e-mail reçu, lien copié par clic droit puis collé, adresse nettoyée ; (3) faute volontaire en RDV-404 sans perte du lien, puis nouveau secret enregistré et admin ouverte ; (4) **test du témoin réussi dans deux navigateurs** : Opera et Safari normal renvoyés à « Ta session a expiré » ; (5) le nouveau secret étant apparu sur une capture d'écran avec VOIR activé, il a été aussitôt remplacé par le panneau SÉCURITÉ, ce qui a retesté le guichet de l'étape 3 après la marche 1 ; (6) lien rejoué : RDV-104, avant même la lecture des saisies.

---

## Décisions actées

- **D291** — La boîte de secours de l'admin est la boîte personnelle de PRÉSIDENCE, protégée par double authentification, rangée dans la variable Netlify `ADMIN_RECOVERY_EMAIL`, jamais dans le code. L'écran ne demande aucune adresse. Passage possible plus tard à une adresse de rôle du domaine sans toucher au code.
- **D292** — Le lien « secret oublié » vaut 15 minutes et ne sert qu'une fois : il porte la marque du secret et meurt dès que le secret change. Jeton placé après `#`, effacé de l'adresse dès l'ouverture, jamais stocké par le navigateur. Limites : 3 demandes par 15 minutes et par connexion, 5 par heure au total, 10 essais d'enregistrement par 15 minutes.
- **D293** — Toute écriture du secret admin passe par la boîte à outils commune `_shared/admin-secret-change.js` : une seule règle du secret, une seule durée de session.
- **D294** — Tout champ de secret de l'admin porte un bouton VOIR / CACHER ; tout se recache automatiquement à chaque changement d'écran ou connexion réussie.
- **D295** — Le nommage public (D15) s'applique à tout texte qui sort de la Suite, e-mails de l'admin compris : « Tranquility Suite », jamais le nom de code.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `rendezvous-proxy` : `_shared/admin-secret-change.js`, `admin-request-reset.js`, `admin-complete-reset.js` | Code serveur | ✅ `5e3960b`, `285910c`, `f06eb1e`, `c38281e` |
| `RENDEZVOUS` : `admin.html`, `admin.js`, `style.css` | Écran | ✅ `5fff78b`, `7491d7d` |
| `RENDEZVOUS` : `docs/RENDEZVOUS_CODES.md` | Catalogue | ✅ `f7970ce` |
| Variable Netlify `ADMIN_RECOVERY_EMAIL` | Réglage | ✅ posée et redéployée |
| Secret admin | Sécurité | ✅ remplacé deux fois, version en vigueur jamais montrée |
| Plan Directeur V5.152, Carnet V94, ce récap | Documentation | ✅ produits en clôture |

---

## Commandes Terminal produites

```bash
# Publier une marche : enregistrer sur auth-admin, avancer main, pousser, revenir, verdict affiché
cd ~/Documents/GitHub/rendezvous-proxy && git add <fichiers> && git commit -q -m "<message>" && git checkout -q main && git merge -q --ff-only auth-admin && git push -q origin main && git checkout -q auth-admin && echo "auth-admin $(git rev-parse --short auth-admin) · main $(git rev-parse --short main) · origin/main $(git rev-parse --short origin/main)" && echo "VERDICT : PUBLIÉ" || echo "VERDICT : ÉCHEC"
```

```bash
# Comparatif d'un dépôt privé pour relecture, nouveau fichier compris, dans le presse-papiers
cd ~/Documents/GitHub/rendezvous-proxy && git add -N <nouveau fichier> && git status --short && git diff | pbcopy && echo "COPIÉ : $(git diff | wc -l | tr -d ' ') lignes"
```

```bash
# Tester le guichet de demande du lien sans écran
curl -s -X POST -w "\nSTATUT HTTP : %{http_code}\n" https://rendezvous-proxy-tranquility.netlify.app/.netlify/functions/admin-request-reset
```

---

## Pièges découverts

- Capture d'écran prise avec VOIR activé → le secret est brûlé ; le remplacer aussitôt par SÉCURITÉ, et ne jamais demander de capture d'un champ de secret affiché.
- Cursor modifie un fichier ignoré par Git (`.impeccable/config.json`) → invisible dans `git status` ; exiger dans le prompt la déclaration de tout fichier touché hors liste, et vérifier l'heure de modification avec `stat`.
- « On peut y aller » pris pour « variable posée et redéployée » → test en RDV-407 ; vérifier le décor par une capture de la liste des variables avant de tester.
- Fichier du Bureau annoncé mais pas joint, trois fois → passer par `pbcopy` puis Cmd+V dans la conversation.
- Lien d'un e-mail cliqué → il s'ouvre dans le navigateur par défaut, chez le témoin ; clic droit, « Copier l'adresse du lien », puis coller dans le navigateur de test.
- Navigateur supposé vierge qui avait gardé une session admin → prendre une fenêtre privée d'un autre navigateur que le témoin.
- Objet d'e-mail dicté par JARVIS avec le nom de code RENDEZVOUS → contrôle du nommage public sur tout texte sortant (D295).
- `realcoolclint.github.io` injoignable depuis l'environnement de JARVIS → lire la charte en clonant `tranquility-core` depuis github.com.

---

## Liste de polish RENDEZVOUS (consolidée)

Police Open Sans dans les champs ; transition des toasts écrite en dur ; anciens messages sans code RDV ; `.DS_Store` dans `rendezvous-proxy` ; fichiers égarés à la racine de `~/Documents/GitHub` du Mac Maison ; coffre de Launcher dont l'échec de déchiffrement ressemble à un coffre vide ; bouton SECRET OUBLIÉ sans effet au survol ; libellé « Secret administrateur » en minuscules ; icône de clé de Safari serrée contre VOIR ; texte de RDV-602 inadapté dans le guichet de fin ; corps de requête `null` qui fait planter les deux guichets d'écriture au lieu de RDV-403 ; carte non défilable sous 524 px de haut ; fond flou sans message si la liste échoue juste après une réinitialisation ; question ouverte au regard de D15 : titre de page « ADMIN — RENDEZVOUS ». Réglé cette session : durée de 7 jours copiée à deux endroits (D293).

---

## Prochaines étapes

1. Audit Surveyor complet vers le 20/11, avec l'essai TANDEM (D285).
2. Étape 5 de l'authentification ADMIN : Touch ID, à concevoir d'abord avec SÉCURITÉ (clé d'accès WebAuthn, Mac de PRÉSIDENCE seulement, secret en voie de secours).
3. Suite de la séance SÉCURITÉ D211 (D286) : renouvellement des clés du coffre de Launcher, lecture de BackUpFlow sur le Mac Bureau, décision JURIDIQUE sur le délégué à la protection des données.
4. Polish RENDEZVOUS, puis reste du palier 1 de D205.

---

*Session 16-17/11/2026 · RENDEZVOUS · Mac Maison*
