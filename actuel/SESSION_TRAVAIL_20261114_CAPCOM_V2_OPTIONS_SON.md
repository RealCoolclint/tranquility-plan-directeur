# SESSION DE TRAVAIL — 14/11/2026 (soir) — [CAPCOM] Construction de la V2, lot « options son » — lot terminé

*Mac Maison · Plan Directeur V5.144 → V5.145 · Carnet V87 → V88 · Décisions D275 → D278 · version de l'app V2.14.11.26 (inchangée, D274) · catalogue CPC V0.7*

---

## 1. Démarrage

- **Mac Maison** (`martinpavloff`), session ouverte le 14/11 vers 18 h 15, close vers 19 h 25, juste après la clôture du Lot 4.
- Plan lu sur un clone du dépôt public (`d166ed2`, **V5.144**) avec le récap du Lot 4 ; aucune session intercalée : numérotation des décisions à partir de **D275**.
- `git pull` de `tranquility-plan-directeur`, `capcom` (`666138f`) et `tranquility-carnet-pieges` (V87) ; **radar court réel** (31 dépôts) : aucune alerte nouvelle. Alertes connues inchangées : CAPCOM hors RENDEZVOUS (assumé en construction), pointeur LFS de `launcher-tray@2x.png`, deux versions de `patch-transporter.png`, dépôt des instructions JARVIS figé depuis le 05/07, date de la séance SÉCURITÉ (D211) à fixer, audit complet attendu vers le 20/11. Verdict : on peut y aller. SETI : aucun signal.
- Lecture de `regie.html` (chemin du micro, jauge, pistes envoyées, surveillance du débranchement, clavier) et du Carnet V87 avant toute conception.

## 2. Conception : le besoin réel (D275)

- **Chemin du micro aujourd'hui** : tuyau direct, sans table de mixage ; le micro est ouvert avec suppression d'écho coupée, réduction de bruit et **réglage automatique du volume** actifs ; la même piste part vers les téléphones (pendant l'antenne) et nourrit la jauge (jamais les haut-parleurs). Conséquence : régler le niveau ou mélanger deux micros demande un passage par Web Audio, et le réglage automatique déjà actif est incompatible avec un réglage manuel superposé.
- **Questions à PRÉSIDENCE, une par une** : le niveau d'entrée est une **précaution pour le studio** (rien constaté) ; réunir deux entrées vise **deux personnes en régie sur le même Mac** ; et ces deux personnes parlent **chacune à son canal, en même temps**.
- **Arrêt de NAVIGATION** : ce n'est plus une option son, c'est deux régies dans une (deux antennes, deux modes, deux voyants, un seul clavier pour deux). Trois chemins : A lot simple et cible multi-régie, B double antenne sur un Mac, C multi-régie tout de suite. **A retenue (D275)**. Le mélange de deux micros dans une seule antenne sort du lot.
- **Contenu du lot** (option 1 sur deux, contre « pas de lot, studio d'abord ») : NIVEAU en AUTO par défaut, MANUEL en secours, avertissement Bluetooth ; un seul passage au studio préservé (D271).
- **Retour en AUTO à chaque ouverture de la régie** (recommandation retenue, D276) ; mini-plan validé.

## 3. Construction

- **Étape 1** (`402bda5`, `regie.html` seul) : le vrai micro (`pisteMicro`, surveillé : micro prêt, MICRO PERDU, débranchement) et la piste envoyée aux téléphones (`pisteEnvoi`, quatre `replaceTrack`) sont séparés ; même piste pour l'instant. Comparaison avant / après : huit changements, rien d'autre. Test sur iPhone : son, changement d'entrée à chaud, silence au relâché, comme avant.
- **Correctif clavier** (`4441373`, D277) : bug trouvé par PRÉSIDENCE pendant le test de l'étape 1 (bug antérieur au lot) : après un choix dans ENTRÉE AUDIO, le menu gardait la main et la régie, le prenant pour une zone de saisie, ignorait 1 à 6, 0 et Option. Le menu déroulant ne suspend plus les raccourcis et rend la main dès qu'une entrée est choisie. Premier test en échec : l'onglet faisait tourner l'ancienne version (indice : le surlignage que le correctif supprime était encore là) ; OK après rechargement.
- **Étape 2** (`012a290`, D276) : bouton **NIVEAU : AUTO / NIVEAU : MANUEL** dans l'en-tête après la jauge (MANUEL en couleur d'avertissement, comme CONTINU) ; en MANUEL, micro rouvert sans réglage automatique, nœud de gain Web Audio, curseur 0 à 200 %, jauge après réglage, piste de sortie créée une fois et jamais arrêtée ; micro prêt = vrai micro vivant et piste à envoyer ; repli automatique en AUTO avec **CPC-208** si la table de mixage reste endormie ; un curseur ne suspend pas les raccourcis (seuls les champs de texte). Cursor a repéré seul que le curseur aurait hérité du cadre des champs de saisie. Test en huit points sur iPhone, OK ; contrôle visuel de l'en-tête sur capture, conforme.
- **Étape 3** (`659d001`, D278) : avertissement **MICRO BLUETOOTH** par toast (option A sur deux, contre un bandeau), CPC-209, deviné sur le nom du micro réellement ouvert (pas le texte du menu), noms contenant USB écartés, une fois par appareil, rien de bloqué. Test avec des AirPods en cinq points, OK.
- **Étape 4** (`a066562`) : catalogue **V0.7** rédigé par JARVIS à partir de la V0.6 du dépôt : CPC-208 et CPC-209, paragraphes sans code « Réglage NIVEAU » et « Raccourcis clavier », trois remèdes de dépannage (niveau trop faible ou trop fort, rechargement forcé après une mise à jour, retour en AUTO au rechargement). Déposé en le reconnaissant à son contenu (copie n° 3 du dossier Markdowns) ; 10 ajouts, 2 retraits, conforme à l'attendu. Version inchangée (D274).
- **Lot options son terminé.**

## 4. Décisions

| N° | Objet |
|---|---|
| **D275** | Lot options son resserré (une seule antenne) ; le besoin « deux voix vers deux canaux en même temps » devient la cible multi-régie (plusieurs régies sur plusieurs Macs), à concevoir après le Lot 5 |
| **D276** | Réglage NIVEAU : AUTO par défaut et à chaque ouverture, MANUEL en couleur d'avertissement avec curseur 0 à 200 % par gain Web Audio, jauge après réglage, repli AUTO avec CPC-208 ; pistes surveillée et envoyée séparées |
| **D277** | Raccourcis 1 à 6, 0 et Option actifs partout, y compris menu ENTRÉE AUDIO et curseur de NIVEAU ; seules exceptions : frappe dans un champ de texte et mode MODIFIER LES CANAUX |
| **D278** | Avertissement MICRO BLUETOOTH en toast (CPC-209), deviné par le nom du micro ouvert, une fois par appareil, sans blocage ; détection fiable avec Electron |

## 5. Livré et testé (dépôt `capcom`, Mac Maison)

| Commit | Contenu |
|---|---|
| `402bda5` | Étape 1 — piste surveillée et piste envoyée séparées |
| `4441373` | Correctif — le menu ENTRÉE AUDIO ne coupe plus les raccourcis |
| `012a290` | Étape 2 — réglage NIVEAU, CPC-208 |
| `659d001` | Étape 3 — avertissement MICRO BLUETOOTH, CPC-209 |
| `a066562` | Étape 4 — catalogue CPC V0.7, lot terminé |

**Non vus à l'écran** : CPC-208 (repli jamais déclenché), NIVEAU MANUEL avec un vrai casque de studio, nom Bluetooth inhabituel.

## 6. Commandes Terminal produites

```bash
# Démarrer CAPCOM seulement si le port 3000 est libre (sinon, affiche qui l'occupe)
cd ~/Documents/GitHub/capcom && (lsof -nP -iTCP:3000 -sTCP:LISTEN || npm start)
```

```bash
# Déposer un fichier téléchargé reconnu à son contenu (et non à son nom), puis voir le bilan
f=$(find ~/Downloads -name 'CAPCOM_CODES*.md' -exec grep -l 'catalogue V0.7' {} + | head -1) && [ -n "$f" ] && echo "Fichier trouvé : $f" && cp "$f" ~/Documents/GitHub/capcom/docs/CAPCOM_CODES.md && cd ~/Documents/GitHub/capcom && git --no-pager diff --stat docs/CAPCOM_CODES.md
```

## 7. Liste de polish (cumul V2)

Toutes les entrées des récaps précédents restent valables. **Ajouts du 14/11 (options son) :** menu ENTRÉE AUDIO ouvert puis refermé sans changement : il garde la main (les flèches peuvent jouer avec lui, les raccourcis marchent) ; MANUEL choisi avant toute activation : si le repli CPC-208 et la réouverture échouent tous deux, l'écran peut dire AUTO alors que le réglage automatique est coupé (son présent) ; double clic rapide sur NIVEAU ou changement d'entrée pendant la réouverture : l'affichage peut avoir un cran de retard ; jauge plafonnée au-delà de 100 % (à juger au studio) ; Bluetooth : AirPods débranchés puis rebranchés non réavertis, noms inhabituels non repérés, casque filaire nommé HEADSET averti à tort.

## 8. Dettes et points ouverts

- **Design Reference** : la charte ne dit rien des curseurs (ici réglage natif habillé à la couleur d'accent) ; à ajouter avec D265 (couleur dérivée, repli `@supports`), D273 (adresse en minuscules) et la police des toasts à l'audit Surveyor du ~20/11.
- **Écart documentaire corrigé** : la ligne du catalogue CPC dans les ressources du Plan était restée sur V0.4 depuis le 13/11 (corrigée en V5.145).
- **Test studio** : ajouter NIVEAU AUTO puis MANUEL avec le vrai casque, et l'avertissement Bluetooth sur le matériel du studio, à la liste du Lot 4.
- **`.impeccable/config.json`** toujours à faire ignorer par Git dans `capcom`.
- Messages en attente perdus au rechargement de la régie ; fiche « TEST » au démarrage du 14/11 : inchangés.
- Hors CAPCOM : séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11.

## 9. Prochaines étapes

1. **Test intermédiaire au studio** : plusieurs téléphones et QR, réseaux du studio (Mac câblé, Wi-Fi invités, isolement, AUTRE ADRESSE), vrai casque avec NIVEAU AUTO puis MANUEL, avertissement Bluetooth, fiches compactes et mini avec bande de messages et BIP, SANS SON provoqué, CPC-411, CPC-107 et CPC-108, bip par le haut-parleur, retard audio avec et sans Bluetooth ; test ATEM (bloc 0, D240) dans le même passage.
2. **Lot 5 — Electron** (avec détection fiable du Bluetooth), puis **Lot 6 — PARAMÈTRES et `.capcom`** ; puis fiche produit, patch, intégration à RENDEZVOUS ; **cible multi-régie** (D275) à concevoir après le Lot 5.

## 10. Pièges

Neuf entrées ajoutées au Carnet V88 : onglet qui fait tourner l'ancienne version ; menu déroulant qui coupe les raccourcis ; curseur qui est aussi un champ ; réglage automatique contre réglage manuel ; piste surveillée et piste envoyée ; table de mixage endormie ; Bluetooth deviné par le nom ; besoin qui change de nature ; diff sans verdict de test.

---

*Récap · Tranquility Suite · CAPCOM · 14 novembre 2026 (soir) · Mac Maison*
