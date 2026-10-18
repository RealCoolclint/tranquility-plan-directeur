# [RENDEZVOUS] Récap de session — R8 lot 4, étape D4 (en-tête) + clôture resserrée

**Date :** dimanche 18 octobre 2026 (soir et nuit), Mac Maison
**Postes actifs :** CODE · UX ET UI · QUALITÉ · NAVIGATION · MÉMOIRE (+ SÉCURITÉ en vigie)
**Statut de ce fichier :** poussé sur GitHub avec le Plan Directeur (protocole de fin de session V2.1, D165).

---

## 1. Résultat en une phrase

Le protocole de clôture est resserré (V2.1), le trou de consignation des lots 3 et 4 est comblé (D166 à D173), les deux entrées de Carnet manquantes sont inscrites, et D4 est clos : l'avatar ouvre un menu et le décalage de 40 px de la page a disparu.

## 2. Commits et versions

| Dépôt | Commit | Contenu |
|---|---|---|
| tranquility-plan-directeur | `528bc20` | `PROTOCOLE_FIN_DE_SESSION.md` V2.1 (cadre de clôture fermé, récap poussé, `.md` écrits par JARVIS) |
| tranquility-plan-directeur | `4ec623d` | `TRANQUILITY_PLAN_DIRECTEUR.md` renommé en `TRANQUILITY_PLAN_DIRECTEUR_V5_19.md` (archive) |
| tranquility-plan-directeur | `9d26dea` | Plan V5.114 (D165, phrases périmées corrigées) |
| tranquility-plan-directeur | `05e410e` | Plan V5.115 (D166 à D173, correction du fond blanc) |
| tranquility-carnet-pieges | `196ab60` | Carnet V57 (+2 pièges RENDEZVOUS) |
| RENDEZVOUS (`lot4-ecran-principal`) | `9ba9dcb` | D4-a et D4-b : menu de l'avatar (`index.html`, `app.js` ?v=13, `style.css` ?v=49) |
| RENDEZVOUS (`lot4-ecran-principal`) | `bfc4e83` | D4-c : fin du décalage de 40 px (`style.css`, `index.html` ?v=50) |
| tranquility-plan-directeur | à la clôture | Plan V5.116 (D174, D175) et ce récap, dans le même commit |
| tranquility-carnet-pieges | à la clôture | Carnet V58 |

`main` de RENDEZVOUS reste sans les étapes B à D4 (merge à la fin du lot). Versions de cache en fin de session : `style.css` v=50, `app.js` v=13, `carousel-data.js` v=3, `main-screen.js` v=10.

## 3. Déroulé

1. **Protocole de clôture resserré (D165).** Cadre fermé : 4 livrables, une seule passe de correction, le reste en dette. Le récap est désormais poussé sur GitHub. Les documents `.md` sont écrits par JARVIS directement dans le repo (Cursor reste pour le code des apps). Les documents fondateurs restent des réécritures complètes, jamais des patchs (rappel de PRÉSIDENCE).
2. **Dettes en un seul passage :** quatre phrases périmées du Plan corrigées ; fichier sans numéro archivé en V5_19 ; cellule R8 corrigée.
3. **Trou de consignation comblé** : D166 à D173 reconstituées depuis l'historique Git et les conversations (lot 3 et étapes A à D2b du lot 4). Une erreur de la V5.114 (fond blanc de COVENANT et ROVER « à traiter » alors qu'il était réglé le 06/10) a été corrigée en V5.115.
4. **Carnet V57** : deux entrées relues dans le code avant inscription (trace « demande envoyée » rangée par profil ; mode aperçu qui ne teste pas la connexion).
5. **D4-a** : le clic sur l'avatar ouvre un menu (ligne d'identité, Réglages de profil « Bientôt disponible », Déconnexion). Testé sans réseau avec une session factice.
6. **D4-b** : style du menu dans l'esprit du tiroir de connexion ; mesuré visible aux 4 tailles ; validé à l'œil.
7. **D4-c** : cause du décalage trouvée (sélecteur descendant qui ne s'appliquait jamais), correction en deux retouches liées (sélecteur et `--main-offset-top` 120 px vers 80 px) ; mesures avant et après aux 4 tailles ; validé à l'œil (lobby, tiroir, notification).

## 4. Décisions actées (dans le Plan V5.116)

- **D165** : cadre de clôture fermé (V5.114).
- **D166 à D173** : consignation a posteriori des lots 3 et 4 (V5.115).
- **D174** : le clic sur l'avatar ouvre un menu (choix de PRÉSIDENCE : menu plutôt que déconnexion en un clic, avec ligne d'identité).
- **D175** : fin du décalage de 40 px ; le lobby monte de 40 px dans la fenêtre (validé).

## 5. Dettes (une ligne chacune, non traitées en séance)

**D4**
- Échap partagé : quand le menu et le tiroir de connexion sont ouverts ensemble, un seul Échap ferme les deux (rare, surtout clavier).
- L'adresse e-mail reste dans le menu masqué après la déconnexion (ni stockage ni URL) : à vider.
- Un clic sur la ligne d'e-mail (non focusable) ferme le menu.
- « Réglages de profil » : `aria-disabled` mais clic actif pour la notification (voulu).
- Sous environ 272 px de large, `min-width: 240px` l'emporterait sur `max-width` : hors appareils réels.
- Le fond de verre du menu reprend des valeurs en dur du tiroir (qui s'écarte déjà de la règle « variables ») : créer des variables de verre pour les deux.
- « Bientôt disponible » atténué avec `opacity: 0.75` en plus de `var(--text-secondary)`.
- Les blocs `.profile-avatar-btn` / `.header-profile-avatar` / `.header-profile-fallback` sont dupliqués dans `style.css` (lignes ~739 et ~1525) : fusionner au nettoyage.
- `.notification { top: 120px }` venait de l'ancien bas de barre (40 + 80) : position jugée acceptable, à revérifier au polish.
- Bande 761–900 px et ordre des règles CSS (hérité de D3, inchangé).

**Dettes de D3 encore ouvertes (la dette « document 40 px plus haut que la fenêtre » est soldée par D175)**
- Saut visible entre 900 et 901 px (emblème 360 vers 240 px) ; gouttière 12 px jusqu'à 768 px puis 24 px de 769 à 900 px ; ordre des règles CSS (le bloc mobile doit rester après la règle des fenêtres basses) ; 540 px dépendants des libellés des boutons ; BackUpFlow 1260–1262 px à 720 px de haut (à remesurer : les 40 px récupérés par D175 devraient aider) ; marge de 12 px pile à 1280x720 (idem) ; panneau fermé occupant un rectangle invisible ; Reviewer dépendant des données (re-mesurer au lot 6) ; tests multi-appareils à refaire après la refonte du design.

**Héritées du lot 4 (inchangées, hors l'avatar et l'infobulle soldés par D174)**
- Focus perdu après clic sur le bouton de demande ; focus perdu si re-rendu (`r6:ready`) pendant que Détails a le focus ; libellé « Replier les détails » plus large qui écrase le message desktop ; effet de seuil à 800 px de haut (mesurer 1440x800 / 1440x810) ; repli de la fiche limité à `max-height: 12em` ; mobile : la fiche replie devise/mission alors que le panneau est dessous ; sous-titre N4 « 0 app pour toi » (proposé : « Accès en lecture · découvre la flotte », jamais tranché) ; alignement calibré pour Lato 900 ; `--main-gutter` / `--main-text-offset` à faire lire par l'en-tête ; hover/focus non vérifiés visuellement ; READBACK atteignable au clavier sans explication.

**Au nettoyage du lot 4 :** ancienne grille, refs mortes `app.js` ~851/862/872, `glass-drawer.js` 129/133. Ne pas supprimer la règle 2x2.

**Documentation et méthode**
- `TRANQUILITY_SERVICES_TIERS.md` ligne 81 et les instructions du projet citent encore le Plan par son nom générique sans numéro.
- `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` : résidu RTF autour des lignes 323 à 343.
- Vision Produit : écart de version (V1.0 dans les ressources du projet, « V2 » dans le Plan) à arbitrer ; le fichier n'est pas dans le repo du Plan.
- Récap du 18/10 matin (`SESSION_TRAVAIL_20261018_RENDEZVOUS_R8_LOT4_D3.md`) : l'en-tête dit encore « jamais poussé » alors qu'il l'est (`68515ae`).
- Ajouter aux instructions du projet la règle « les documents fondateurs sont des réécritures complètes ».
- Collision de numéro : D154 (une conversation du 08/10 l'utilisait pour le patch d'accueil ; D154 est le labo R&D) ; la décision est consignée sous D168.
- `?preview=1` : contrôle SÉCURITÉ à faire (le mode aperçu est-il inactif en production ?).
- `main` de RENDEZVOUS contient déjà l'étape A du lot 4.
- Lecture partielle du Plan V5.113 à V5.116 (ouverture, D1 à D10, recherches ciblées) : un audit de lecture complète reste à faire.
- Faux positif du hook d'arrêt sur un clone en lecture seule de RENDEZVOUS (fichiers « supprimés » d'un clone partiel) : voir Carnet V58.

## 6. Chantiers ultérieurs

D164 Authentification ADMIN avant la V1 (deux questions de cadrage à poser avant toute conception : le flux de réinitialisation D40 a-t-il encore un lien d'entrée dans le formulaire ; « mot de passe ADMIN » = mot de passe de profil ou secret `x-admin-secret`) · SSO RENDEZVOUS vers les apps web (session dédiée avec SÉCURITÉ, UX ET UI, TERRAIN, NAVIGATION ; jamais de token dans l'URL) · refus de doublon côté proxy pour `request-affectation` · le proxy ajoute prénom et affectation au JWT (avant le lot 6) · CORS dupliqué dans 9 fonctions · lots 5 et 6 (son D144, séquence D145) · 7 patches d'affectation (D146, moodboard Flow requis) · « Revue IA du mois » lundi 2 novembre.

## 7. Ce qui a bien marché

- Cadre de clôture fermé appliqué pour la première fois : 4 livrables, un seul passage de correction, le reste en dette.
- Méthode « relevé avant, correction, relevé après » pour D4-c : elle a révélé que la correction du sélecteur seule aurait laissé 40 px vides sous l'écran principal.
- Contenu des deux entrées de Carnet relu dans le code avant inscription, plutôt que reconstitué de mémoire.

## 8. Prochaine session

Au choix, dans l'ordre logique, constructif, sécurisé : (1) fin du lot 4 : polish, merge sur `main`, nettoyage, recette en session réelle ; (2) chantier Authentification ADMIN (D164), en posant d'abord les deux questions de cadrage ; (3) un audit de lecture complète du Plan.

*Récap rédigé par JARVIS — poste MÉMOIRE.*
