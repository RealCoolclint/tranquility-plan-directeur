# [RENDEZVOUS] Récap de session — R8 lot 4, étape D3 (panneau Détails) + clôture V5.113

**Date :** dimanche 18 octobre 2026
**Postes actifs :** CODE · UX ET UI · QUALITÉ · MÉMOIRE · NAVIGATION · MISSION CONTROL (+ SÉCURITÉ pour cadrer le chantier Authentification ADMIN)
**Statut de ce fichier :** ressources du projet Claude uniquement, jamais poussé sur GitHub (protocole de fin de session V2.0).

---

## 1. Résultat en une phrase

D3 est clos, validé à l'œil par PRÉSIDENCE, commité et poussé ; le Plan Directeur V5.113 et le Carnet de Pièges V56 sont poussés ; un nouveau chantier (Authentification ADMIN) est ouvert et placé avant la V1.

## 2. Commits

| Dépôt | Commit | Contenu |
|---|---|---|
| RENDEZVOUS (branche `lot4-ecran-principal`) | `864c269` | D3 : panneau Détails 4 colonnes, 5 fichiers (`admin.html`, `carousel-data.js`, `index.html`, `main-screen.js`, `style.css`) ; `main` inchangé |
| tranquility-plan-directeur (`main`) | `100b1cc` | `TRANQUILITY_PLAN_DIRECTEUR_V5_113.md` (D163, D164, cellule R8 corrigée, lignes 466/478/555/624 mises à jour, paragraphe V5.113) |
| tranquility-carnet-pieges (`main`) | `d5aef76` | `CARNET_PIEGES_V56.md` (+12 pièges) |

Chaîne du lot 4 : A `c3f5c70` · B `ae4eaa9` · C `9d71eee` · C2+C3 `b364ff9` · D1+C4+C5 `6b6321c` · C6 `4605705` · D2+D2b `8fc36ed` · **D3 `864c269`**.
Versions de cache : `style.css` v=48, `carousel-data.js` v=3, `main-screen.js` v=10.

## 3. Déroulé de D3

1. Piste B validée (colonnes `0.85fr 1fr 1.4fr 0.85fr`) : Reviewer passe de 22 px coupés à 38 px de marge à 1024x768.
2. La mesure de l'angle mort 900–1024 px révèle un vrai bug : le message desktop de BackUpFlow (N1) était écrasé à 0 px et passait sous le panneau, jamais mesuré à ces tailles.
3. Décision : le message passe sous les boutons quand la place manque.
4. v45 (`flex-wrap` sur toute la rangée) : règle le message mais les boutons passent à la ligne et le panneau recouvre DÉTAILS de Transporter et COVENANT. Écartée.
5. v46/v47 : réserve de 540 px pour la fiche + `.main-actions-note:empty { display: none }`, bornées à `@media (min-width: 901px)`. L'emblème rétrécit entre 901 et environ 1178 px (accepté).
6. Bande 761–900 px : aucune version ne tenait. Décision PRÉSIDENCE : affichage mobile (seuil du bloc `.main-` de 760 à 900 px, v48). La règle 2x2 est conservée : elle donne aussi ses deux colonnes au panneau en mobile.
7. Validation à l'œil par Martin, commit D3.

## 4. Décisions actées (consignées dans le Plan V5.113)

- **D163** : D3 livré, bande 761–900 px en mobile, réserve de 540 px à partir de 901 px, message desktop sous les boutons.
- **D164** : chantier Authentification ADMIN ouvert (changer le mot de passe ADMIN · « mot de passe perdu » sur la page de connexion · Touch ID ADMIN / passkey WebAuthn), branche à part, repos `rendezvous-proxy` + `RENDEZVOUS`, **livré entier AVANT la V1, le lancement est repoussé d'autant** (décision PRÉSIDENCE).
- Deux points non tranchés sur D164 : (a) le flow de réinitialisation existe déjà côté serveur (D40) mais le formulaire de connexion de D43 n'a probablement plus de lien d'entrée ; (b) « mot de passe ADMIN » peut désigner le mot de passe de profil (`login.js`) ou le secret `x-admin-secret` de l'écran admin (variable Netlify, mémorisé 30 jours, D81). À trancher avec PRÉSIDENCE avant toute conception.
- Constat : le lot 3 (carrousel DÉCOUVRIR LA FLOTTE) est clos (récap de session précédent) mais n'a ni décision D-xx ni commits consignés dans le Plan.

## 5. Dettes et points ouverts

**À traiter en premier à la prochaine session (clôture de ce soir)**
1. **Resserrer le protocole de clôture.** La clôture a dérivé en chaîne de prompts Cursor, chaque rapport rouvrant une correction. Cause identifiée : rien ne fige le périmètre. À proposer : un cadre court et fermé (liste fixe de livrables, une seule passe de correction, le reste en dette), à valider par Martin.
2. **Quatre phrases périmées dans le Plan V5.113** (« dernier chantier avant V1 », « reste uniquement R8 ») : lignes 294, 466, 478, 555 (à recontrôler avant de corriger). Elles contredisent le placement de D164.
3. **Trou de consignation (Loi 3)** : le lot 3 et les étapes A, B, C, C2+C3, D1+C4+C5, C6, D2+D2b du lot 4 n'ont aucune décision D-xx ; seuls les hashes du lot 4 figurent dans la cellule R8. À reconstituer depuis les récaps du 29/09 au 18/10.
4. **Cellule R8** : mentionne encore « COVENANT/ROVER en AVIF sur noir (D151) » alors que D152 fixe les patches en mp4 H.264 (statut réel à vérifier).
5. **Fichier sans numéro** `TRANQUILITY_PLAN_DIRECTEUR.md` (V5.19, 5 juin) : périmé, à renommer en archive ou retirer.
6. **Question de cadrage D164** : « mot de passe ADMIN » = mot de passe de profil ou secret admin ?

**Dettes de D3**
- Saut visible entre 900 et 901 px (emblème 360 → 240 px, jugé acceptable) ; gouttière 12 px jusqu'à 768 px puis 24 px de 769 à 900 px ; ordre des règles CSS (le bloc mobile doit rester après la règle des fenêtres basses) ; 540 px dépendants des libellés des boutons ; BackUpFlow 1260–1262 px à 720 px de haut (−5 px sous le panneau) ; marge de 12 px pile à 1280x720 ; document 40 px plus haut que la fenêtre (marge de `.app-container`) ; panneau fermé occupant un rectangle invisible ; Reviewer dépendant des données (à re-mesurer au lot 6) ; nouveaux tests multi-appareils à prévoir après la refonte du design.

**Héritées (lot 4, inchangées)**
- Focus perdu après clic sur le bouton de demande ; focus perdu si re-rendu (`r6:ready`) pendant que Détails a le focus ; Échap possiblement partagé avec le tiroir de connexion ; libellé « Replier les détails » plus large qui écrase le message desktop ; effet de seuil à 800 px de haut (mesurer 1440x800 / 1440x810) ; repli de la fiche limité à `max-height: 12em` ; mobile : la fiche replie devise/mission alors que le panneau est dessous ; sous-titre N4 « 0 app pour toi » (proposé : « Accès en lecture · découvre la flotte », jamais tranché) ; alignement calibré pour Lato 900 ; `--main-gutter` / `--main-text-offset` à faire lire par l'en-tête ; avatar = déconnexion avec infobulle trompeuse « Changer de profil » ; hover/focus non vérifiés visuellement ; READBACK atteignable au clavier sans explication.

**Au nettoyage du lot 4** : ancienne grille, refs mortes `app.js` ~851/862/872, `glass-drawer.js` 129/133. **Ne pas supprimer la règle 2x2.**

## 6. Carnet de Pièges V56 (`d5aef76`) : 12 entrées

6 RENDEZVOUS (réserve de largeur des boutons, règles valables dans toutes les bandes, bande 761–900 px passée en mobile, ordre des règles CSS, panneau fermé invisible, alignement Lato 900) · 5 Méthode (cas le plus chargé à mesurer, transitions coupées, copies multiples de l'état dans le Plan, fichier sans numéro périmé, prompt tronqué) · 1 Système (RENDEZVOUS sans `package.json`, test local par `python3 -m http.server 8080 --bind 127.0.0.1`, jamais `npm start`).
Deux entrées annoncées dans une liste antérieure (« trace localStorage par `sub` », « CORS / mode preview ») n'ont PAS été inscrites : leur contenu n'était pas vérifié. À réintégrer seulement si Martin les redicte.

## 7. Ce qui a mal marché pendant cette session (pour le resserrage du protocole)

- Questions posées sur l'état d'un chantier (lot 3) sans avoir cherché d'abord dans la mémoire et les conversations.
- Plusieurs prompts Cursor empilés dans un seul message, contre la méthode pas à pas.
- `npm start` proposé sans vérifier que le projet en avait un.
- Commande git donnée sans changer de dossier (Terminal sur `~`).
- Bloc de mise à jour du Plan livré « pour la prochaine session » au lieu de suivre le protocole V2.0 (patch appliqué par Cursor, diff montré avant écriture).
- Clôture du Plan transformée en chasse aux copies périmées : chaque rapport de Cursor ouvrait une nouvelle correction.

## 8. Prochaine session : deux pistes au choix

1. **D4 (en-tête)** : avatar, Réglages de profil « Bientôt disponible », Déconnexion, infobulle trompeuse de l'avatar, décalage de 40 px.
2. **Chantier Authentification ADMIN** : commencer par trancher la question de cadrage, puis inspection du proxy en lecture seule.

*Récap rédigé par JARVIS — poste MÉMOIRE.*
