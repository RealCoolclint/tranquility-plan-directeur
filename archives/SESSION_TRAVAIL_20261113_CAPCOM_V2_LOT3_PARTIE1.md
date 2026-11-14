# SESSION DE TRAVAIL — 13-14/11/2026 — [CAPCOM] Construction de la V2, Lot 3, partie 1 : conception, serveur et téléphone

*Mac Maison · Plan Directeur V5.141 → V5.142 · Carnet V84 → V85 · Décisions D260 → D266*

---

## 1. Démarrage

- **Mac Maison** (`martinpavloff`), session ouverte le 13/11 en début d'après-midi, close le 14/11 peu après minuit.
- Plan lu sur un clone du dépôt public (`e1b5274`, **V5.141**) avec le récap du 13/11 ; aucune session intercalée : numérotation des décisions à partir de **D260**.
- `git pull` des trois dépôts du jour : `tranquility-plan-directeur` (`e1b5274`), `capcom` (`379a2fd`), `tranquility-carnet-pieges` (`a62a744`, V84), tous propres.
- **Radar court réel** (31 dépôts, aucune erreur) : aucune alerte nouvelle. Alertes connues inchangées : CAPCOM hors RENDEZVOUS, pointeur LFS de Launcher, dépôt des instructions JARVIS figé depuis le 05/07, deux versions de `patch-transporter.png`, audit complet attendu vers le 20/11. MOCKUP sans dépôt (attendu). SETI : aucun signal.
- **Catalogue `docs/CAPCOM_CODES.md` (V0.4) relu** et croisé avec le code : tous les codes affichés sont catalogués, aucun code inutilisé. Cinq corrections relevées, versées à la V0.5 (décision de PRÉSIDENCE : un seul passage avec les codes du Lot 3) : phrase « CPC-409 et CPC-410 serviront au déplacement (lot 2.6) » au futur ; « QR code prévu en V1 » (c'est le Lot 4 de la V2, D234) ; glisser-déposer (D258) absent ; barres de liaison et « VU IL Y A N S » (D259) absents ; toast « MODIFIÉ PAR LA RÉGIE » (2.2) jamais catalogué ; en-tête daté du 12/11 au lieu du 13/11.

## 2. Conception du Lot 3

- **Lecture du code** (`server.js` en entier, structure de `ecoute.html` et `regie.html`) : le serveur ne connaissait aucun sens retour du téléphone vers la régie ; le bandeau d'alerte existe déjà dans la régie (celui de MICRO PERDU, avec VU) ; hors antenne, la régie n'envoie **aucun** son (`replaceTrack(null)`), ce qui change la définition de « son actif ».
- **Mini-plan et découpage validés** (ordre logique, constructif, sécurisé) : 3.1 serveur ; 3.2 téléphone ; 3.3 régie qui reçoit ; 3.4 ALERTE (bip) ; 3.5 « son actif » ; 3.6 catalogue V0.5 et version.
- **Cinq arbitrages de PRÉSIDENCE** (D260 → D264) : bouton MESSAGES et panneau (B sur trois) ; accusé automatique de la page régie, sans retour humain (B sur trois) ; URGENT : COUPER maintenu 1 s avec jauge (B sur trois, contre la recommandation de JARVIS d'une confirmation en deux temps) ; durée d'affichage sur la fiche en deux familles (C) ; « son actif » = prêt à jouer en permanence et son reçu pendant l'antenne (C).
- **Trois précisions techniques validées pour le serveur** : anti-rafale d'un message toutes les 2 s par téléphone, refus visible ; régie absente signalée tout de suite ; état du son gardé par le serveur (une régie rechargée le retrouve).

## 3. 3.1 — le serveur apprend le sens retour

- Un prompt Cursor, `server.js` seul : messages `message-plateau` (liste fermée de six codes, référence validée, refus `code-inconnu`, `pas-de-regie`, `trop-rapide`), `message-recu` (accusé de la régie relayé au téléphone), `alerte` (régie vers un téléphone, refus `auditeur-inconnu` ou `auditeur-absent`, déjà traduits par la régie en CPC-409 et CPC-410), `etat-son` (stocké par auditeur, relayé à la régie par un message dédié `auditeur-son`, jamais par `listener-updated`, qui redessine toutes les fiches et casserait un glisser-déposer en cours).
- **Contrôle par comparaison avant / après** : conforme, aucune ligne existante supprimée ni réécrite. Analyse de Cursor triée : rien de bloquant ; son point « le serveur lancé n'a pas chargé le nouveau fichier » était faux (le serveur avait été lancé après la modification).
- **Test de non-régression** sur iPhone (port 3000 vérifié libre avant `npm start`) : parole sur le canal, touche PARLER, glisser-déposer avec « MODIFIÉ PAR LA RÉGIE », Terminal sans erreur.
- Commit **`e5362d6`**.

## 4. 3.2 — le panneau MESSAGES du téléphone

- **Premier prompt** (`ecoute.html` seul) : bouton MESSAGES au-dessus de CHANGER, panneau calqué sur CHANGER, six messages, envoi avec référence, accusé attendu 3 s, codes **CPC-106** (MESSAGE NON TRANSMIS — PRÉVENEZ LA RÉGIE DE VIVE VOIX) et **CPC-411** (ATTENDEZ 2 SECONDES ENTRE DEUX MESSAGES), URGENT : COUPER maintenu 1 s avec parades iPhone.
- **Défaut trouvé au test** : la touche REÇU invisible. Le panneau (environ 770 px) dépassait l'écran et le focus posé sur FERMER le faisait défiler vers le bas. **Règle de PRÉSIDENCE : tout s'affiche sans défilement obligatoire.** Deux colonnes, touches de 64 px, défilement remis en haut à l'ouverture (`focus({ preventScroll: true })`).
- **Refonte visuelle demandée par PRÉSIDENCE** (D265) : ordre REÇU, RÉPÉTEZ / LOW BAT CAM, LOW BAT TEL / PROBLÈME EN PLATEAU / URGENT : COUPER ; cadres par gravité (vert, ambre, orange) ; typographie homogène (0,95 rem pour les six libellés, 0,75 rem pour la consigne) ; URGENT : COUPER en **rubalise** rouge et blanc, jauge qui découvre les rayures sur tout le cartouche (`clip-path`, pas d'étirement). Deux conflits de charte tranchés : le rouge (D222) contourné par un motif plutôt qu'une exception ; le jaune absent de la charte, remplacé par un **orange mélangé à partir des tokens** (`color-mix` de `--warning` et `--danger`, avec repli sur l'ambre). Libellé URGENT : COUPER confirmé (D229).
- **Clic fantôme** : à la fin de la jauge, le panneau se fermait sous le doigt et le relâchement ouvrait PARAMÈTRES. Correction : le message part à 1 s, mais le panneau attend le relâchement puis 350 ms (filet de fermeture à 3 s). Le risque restant (appui de plus de 3 s) a conduit PRÉSIDENCE à **sortir PARAMÈTRES du bas de l'écran** : bouton burger SVG dans la barre du haut, qui ouvre directement le panneau (D266, A sur deux).
- **Deux retouches de PRÉSIDENCE** (D266) : CHANGER devient **CHOISIR LE CANAL** (bouton et titre du panneau) ; PARAMÈTRES s'ouvre **sans clavier** (curseur dans un champ seulement après un refus CPC-401 ou CPC-402).
- Chaque passage de Cursor contrôlé par comparaison avant / après ; tests sur iPhone à chaque étape. Le Terminal a confirmé que tous les messages arrivent au serveur ; CPC-411 n'a pas été déclenché à la main (aucune ligne « refusé, trop rapide ») ; CPC-106 au bout de 3 s est le résultat attendu tant que la régie ne sait pas accuser réception (3.3).
- Commit **`2f77fc9`**.

## 5. Décisions

- **D260** — Bouton MESSAGES (au-dessus de CHOISIR LE CANAL, visible seulement pendant l'écoute) qui ouvre un panneau ; un toucher envoie et referme ; jamais de messages toujours visibles (risque de la poche). Le panneau tient entièrement dans l'écran d'un iPhone SE (environ 550 px) sans défilement.
- **D261** — Accusé de bout en bout : c'est la page régie, sans geste de l'opérateur, qui confirme (TRANSMIS À LA RÉGIE). Sans accusé en 3 s, ou régie absente : CPC-106. Anti-rafale serveur de 2 s par téléphone : CPC-411. Pas de retour humain « LA RÉGIE A VU ».
- **D262** — URGENT : COUPER protégé par un appui maintenu 1 s avec jauge ; le message part à 1 s, le panneau se ferme après le relâchement (350 ms), filet de fermeture à 3 s.
- **D263** — Sur la fiche de la régie : REÇU et RÉPÉTEZ s'effacent au bout de 30 s ; PROBLÈME EN PLATEAU, LOW BAT TEL et LOW BAT CAM restent jusqu'au clic de l'opérateur et allument ÉQUIPE À VOIR ; URGENT : COUPER ouvre le bandeau et met la fiche en exergue, remontée en tête de colonne, jusqu'à VU.
- **D264** — « Son actif » = « prêt à jouer » en permanence, plus « son reçu » pendant l'antenne ; la fiche n'affiche rien quand tout va bien et SANS SON en orange si l'une des vérifications échoue ; volume et oreillette restent invisibles (limite assumée).
- **D265** — Code couleur par gravité du panneau MESSAGES : vert (`--success`) pour REÇU et RÉPÉTEZ, ambre (`--warning`) pour les LOW BAT, orange dérivé pour PROBLÈME EN PLATEAU, rubalise pour URGENT : COUPER. Règle de charte : **une couleur dérivée est un mélange de tokens, jamais une valeur en dur**, avec une ligne de repli. Le rouge uni reste réservé à l'antenne (D222) ; le rubalise est un motif, pas un aplat.
- **D266** — Page d'écoute : PARAMÈTRES devient un bouton burger SVG dans la barre du haut (zone `.header-actions`), qui ouvre directement le panneau, sans clavier ; en bas ne restent que MESSAGES et CHOISIR LE CANAL (ex-CHANGER, précise D244).

## 6. Livré et testé (dépôt `capcom`, Mac Maison)

| Commit | Contenu |
|--------|---------|
| `e5362d6` | 3.1 — serveur : sens retour, accusé relayé, anti-rafale, alerte, état du son |
| `2f77fc9` | 3.2 — écoute : panneau MESSAGES, couleurs par gravité, rubalise, clic fantôme, burger PARAMÈTRES, CHOISIR LE CANAL |

**Non vus à l'écran** : CPC-411 (anti-rafale) ; l'accusé positif TRANSMIS À LA RÉGIE (arrive avec la 3.3) ; le repli ambre de l'orange sur un téléphone ancien.

## 7. Liste de polish (cumul V2)

Toutes les entrées du récap du 13/11 (Lot 2) restent valables. **Ajouts du 13-14/11 (Lot 3) :** commentaire de type de la liste des auditeurs dans `server.js` qui ne cite pas `dernierMessage` ni `son` ; libellés des messages écrits deux fois dans `ecoute.html` (boutons et table `LIBELLES_MESSAGES` : construire les boutons à partir de la table) ; au clavier du Mac, si le focus quitte URGENT avant le relâchement, la charge va au bout ; appui de plus de 3 s sur URGENT : le filet ferme le panneau sous le doigt, clic fantôme possible sur MESSAGES ou CHOISIR LE CANAL (sans gravité) ; panneau CHOISIR LE CANAL qui déborderait avec 6 canaux (même règle « sans défilement » à appliquer).

## 8. Dettes et points ouverts

- **`.impeccable/config.json`** modifié par le détecteur de design de Cursor dans `capcom`, non enregistré : à faire ignorer par Git comme sur RENDEZVOUS (20/10), à froid.
- **Design Reference** : la règle « couleur dérivée = mélange de tokens » (D265) est actée dans le Plan ; son report dans `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` est à faire avec l'audit Surveyor du 20/11 (avec la police des toasts).
- **Catalogue V0.5** (étape 3.6) : les cinq corrections du démarrage, CPC-106 et CPC-411, les messages et leurs familles (sans code), SANS SON (sans code), le burger PARAMÈTRES, CHANGER devenu CHOISIR LE CANAL partout.
- **Étape 3.5** : la régie ignore l'état du son d'une fiche en sursis (le serveur ne l'efface qu'à la reprise).
- **Étape 3.4** : emplacement de la touche ALERTE sur les fiches compactes et mini, et son du bip, à concevoir.
- **Placement du lot « options son » (D239)** toujours à confirmer.
- Hors CAPCOM : date de la séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11 (instructions JARVIS figées depuis le 05/07, pointeur LFS de Launcher, police des toasts, `.DS_Store`) ; test ATEM au prochain passage au studio ; retard audio à mesurer au studio, avec et sans Bluetooth.
- **Soldées** : relecture du catalogue en ouverture du Lot 3 (corrections versées à la V0.5).

## 9. Prochaines étapes

1. **3.3 — la régie reçoit** (`regie.html` seul) : accusé automatique, dernier message sur la fiche en deux familles, voyant ÉQUIPE À VOIR, bandeau d'urgence (orange, jamais rouge) et fiche en exergue remontée en tête de colonne jusqu'à VU (D263).
2. **3.4 — ALERTE** : conception de la touche sur les fiches (densités compacte et mini) et du bip, puis régie et écoute.
3. **3.5 — son actif** (D264), écoute puis régie.
4. **3.6 — catalogue V0.5** et numéro de version.
5. Puis : placement des options son (D239), Lot 4 (QR code), test au studio, Lot 5 (Electron), Lot 6.

## 10. Pièges

Treize entrées ajoutées au Carnet V85 : panneau trop haut et focus qui le fait défiler ; clic fantôme iOS après une fermeture sous le doigt ; focus automatique dans un champ qui sort le clavier ; analyse de Cursor fausse sur l'état du serveur ; « envoyé au serveur » n'est pas « reçu par la régie » ; anti-rafale impossible à vérifier à la main (le Terminal tranche) ; jauge en `scaleX` qui étire un motif ; couleur intermédiaire absente de la charte ; signal de danger sans rouge uni ; « son actif » non mesurable hors antenne ; état transmis par la mise à jour générale qui redessine tout ; fichier de réglages de Cursor qui apparaît dans `git status` ; troisième récidive de `cut -c` par JARVIS, à la clôture.

---

*Récap · Tranquility Suite · CAPCOM · 13-14 novembre 2026 · Mac Maison*
