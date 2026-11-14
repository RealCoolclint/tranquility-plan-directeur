# SESSION DE TRAVAIL — 14/11/2026 — [CAPCOM] Construction de la V2, Lot 3, partie 2 : la régie reçoit, BIP, son actif, catalogue V0.5 — Lot 3 terminé

*Mac Maison · Plan Directeur V5.142 → V5.143 · Carnet V85 → V86 · Décisions D263 révisée, D267 → D270 · version de l'app V2.14.11.26*

---

## 1. Démarrage

- **Mac Maison** (`martinpavloff`), session ouverte le 14/11 vers 11 h 30, close vers 17 h 15.
- Plan lu sur un clone du dépôt public (`5fcb7de`, **V5.142**) avec le récap du 13-14/11 ; aucune session intercalée : numérotation des décisions à partir de **D267**.
- `git pull` des trois dépôts du jour : `tranquility-plan-directeur` (`5fcb7de`), `capcom` (`2f77fc9`), `tranquility-carnet-pieges` (`5c3dca9`, V85), tous propres (seul `.impeccable/config.json` modifié dans `capcom`, attendu).
- **Radar court réel** (31 dépôts, aucune erreur) : aucune alerte nouvelle. Alertes connues inchangées : CAPCOM hors RENDEZVOUS, pointeur LFS de Launcher, dépôt des instructions JARVIS figé depuis le 05/07, deux versions de `patch-transporter.png`, audit complet attendu vers le 20/11. SETI : aucun signal.
- Lecture intégrale de `regie.html` (4 090 lignes) et du bloc « sens retour » de `server.js` avant le premier prompt.

## 2. 3.3 — la régie reçoit

- **Mécanique** (un prompt, `regie.html` seul) : accusé automatique `message-recu` envoyé **après** le rangement du message (en cas de panne, le téléphone affiche CPC-106 : l'erreur tombe du côté sûr) ; carnet des messages par personne **hors** de la liste des fiches, pour survivre à un hoquet du serveur (qui vide et redonne la liste) ; purge quand la personne quitte vraiment le réseau, ou quand un même identifiant revient avec un autre nom (identifiants réattribués après un redémarrage du serveur) ; bandeau URGENT : COUPER orange et fiche en exergue ; voyant ÉQUIPE À VOIR ; tri des fiches pour qu'aucun message ne se cache dans « + N AUTRES ». Trois arbitrages (D267) : cartouche cliquable (clic seul = VU, le reste de la fiche au glisser-déposer), exergue par la taille, file par gravité. Contrôle par comparaison : conforme. Test sur iPhone : fonctions OK. Enregistré pour mise à l'abri (`759223d`).
- **Atelier de présentation** après test (remarques de PRÉSIDENCE : vide au milieu de la fiche, un seul message visible, âge du message absent, bandeau mal placé). Quatre questions, dont une tranchée sur un **dessin comparatif A / B** (JARVIS recommandait A, « dans le vide du milieu » ; le dessin a montré que B, « bande sous la fiche », était plus lisible, recommandation révisée). Première passe : bande sous la fiche, âge par paliers de 30 s, disposition point + prénom + barres à gauche et PARLER seule à droite, CONNECTÉ masqué, bandeau URGENT sous le tableau de bord, centré.
- **Deuxième passe** après test : messages **empilés un par ligne** (la fiche grandit, « plus un technicien est bavard, plus sa fiche est haute »), cartouches de **hauteur égale** (le rubalise dépassait), **plus aucun effacement automatique** (REÇU et RÉPÉTEZ restent jusqu'au clic : révision de D263), **double horodatage** (heure d'arrivée HH:MM à gauche, « IL Y A … » dans le cartouche). Test sur iPhone : tout OK. Enregistré (`8736dba`). Décision D268.

## 3. 3.4 — ALERTE (BIP)

- Conception en trois questions (D269) : touche nommée **BIP** (et non ALERTE) à gauche de PARLER sur toutes les fiches ; sur le téléphone, **trois notes brèves** puis panneau orange **LA RÉGIE VOUS APPELLE** jusqu'au toucher (pas de bip répété) ; toucher le panneau envoie **REÇU automatiquement** (réutilisation d'un chemin existant, serveur intact).
- Deux prompts (régie, puis écoute), chacun contrôlé par comparaison : conforme. Test intermédiaire régie seule par le Terminal (« Alerte envoyée »), puis test complet sur iPhone : bip, panneau, REÇU sur la fiche, **clic fantôme neutralisé** (panneau MESSAGES ouvert dessous, intact), cadre rouge d'antenne visible par-dessus l'orange, et **bip audible même avec le bouton silencieux** de l'iPhone pendant l'écoute. Enregistré (`eb4a2a9`).

## 4. 3.5 — son actif

- Décision complétée (D270, précise D264) : SANS SON allume ÉQUIPE À VOIR et donne le rang 2 (avec PERDU et EN SURSIS).
- Téléphone : mesure une fois par seconde, `pret` (liaison avec piste vivante, lecture autorisée, son non interrompu) et `recu` pendant l'antenne (compteur de paquets audio, grâce de 3 s puis 3 s de silence), envoi au changement et après chaque reconnexion (au message d'antenne qui suit, pour ne pas croire l'antenne fermée). Rien de visible.
- Régie : SANS SON en orange après les barres, seulement pour une personne **déjà connectée** (pas de fausse alerte au branchement). Contrôles par comparaison : conformes.
- Test sur iPhone : **aucune fausse alerte** (repos, ouverture d'antenne, reconnexion) ; les lignes « État du son » du Terminal suivent l'antenne. **Panne réelle non vue à l'écran** (non provoquée) : à faire au test studio. Enregistré (`214de00`, la commande ayant été lancée deux fois, la seconde n'avait rien à faire).

## 5. 3.6 — catalogue, orange, version

- **Repli de `--orange`** : la double déclaration ne fonctionne pas pour une variable CSS (un navigateur sans `color-mix` garde la seconde, invalide) ; remplacée par une valeur ambre de base et un bloc `@supports` dans `regie.html` et `ecoute.html`. Contrôle par `git diff` : conforme.
- **Version V2.14.11.26** sur les deux pages.
- **Catalogue `docs/CAPCOM_CODES.md` V0.5** rédigé par JARVIS à partir des textes exacts du code : cinq corrections du 13/11, CPC-106 et CPC-411, CPC-409 et CPC-410 étendus au BIP, sections sans code (messages du plateau, BIP, états de la fiche et SANS SON, glisser-déposer), vocabulaire du jour, limites connues. Validé par PRÉSIDENCE.
- **Incident** : le premier dépôt (`b0cfa24`) a copié une **ancienne copie du 06/11** trouvée dans `~/Downloads` (le V0.5 n'avait pas été téléchargé ; la commande prenait « le plus récent » sans vérifier le contenu). Détecté au chiffre anormal du commit (22 ajouts, 27 retraits) ; corrigé par `c1c3f4c`, qui retrouve le bon fichier **par son contenu** (« catalogue V0.5 »). Les pages de `b0cfa24` étaient correctes.
- **Lot 3 terminé.**

## 6. Décisions

| N° | Objet |
|---|---|
| **D263 révisée** | Plus aucun effacement automatique : REÇU et RÉPÉTEZ restent jusqu'au clic, comme les autres messages, et comptent dans ÉQUIPE À VOIR et le tri |
| **D267** | La régie reçoit : accusé automatique après rangement, carnet par personne hors des fiches, purge par identifiant et nom, cartouche cliquable (clic seul = VU d'un message), file par gravité, exergue par la taille pour URGENT : COUPER (tête de colonne, grand format, cadre orange), un seul VU pour le bandeau et le cartouche, bandeau maintenu si la personne quitte le réseau |
| **D268** | Présentation : bande de messages sous la fiche, un message par ligne, cartouches de hauteur égale, ordre URGENT, PROBLÈME, LOW BAT, RÉPÉTEZ, REÇU ; heure d'arrivée HH:MM + durée « IL Y A » par paliers de 30 s ; fiche : point, prénom, barres à gauche, PARLER (et BIP) à droite, CONNECTÉ masqué ; bandeau URGENT sous le tableau de bord, centré, MICRO PERDU en haut |
| **D269** | ALERTE : touche BIP (simple clic, pause 3 s par personne, toast BIP ENVOYÉ) ; trois notes Web Audio débloquées au geste ÉCOUTER ; panneau orange LA RÉGIE VOUS APPELLE sous le cadre d'antenne, 500 ms d'insensibilité ; toucher = REÇU automatique |
| **D270** | Son actif (précise D264) : SANS SON seulement pour une personne connectée ; allume ÉQUIPE À VOIR, rang 2 ; grâce de 3 s à l'ouverture d'antenne, 3 s de silence avant « non reçu », état renvoyé à chaque reconnexion ; « inconnu » ne déclenche jamais SANS SON |

## 7. Livré et testé (dépôt `capcom`, Mac Maison)

| Commit | Contenu |
|---|---|
| `759223d` | 3.3 — fonctions de réception (mise à l'abri avant l'atelier) |
| `8736dba` | 3.3 — présentation des messages (bande, horodatage, disposition, bandeau) |
| `eb4a2a9` | 3.4 — BIP (régie et écoute) |
| `214de00` | 3.5 — son actif (écoute et régie) |
| `b0cfa24` | 3.6 — repli de l'orange, version V2.14.11.26 (catalogue erroné, voir 5) |
| `c1c3f4c` | 3.6 — catalogue CPC V0.5 réellement déposé |

**Non vus à l'écran** : SANS SON sur une vraie panne ; CPC-411 (toujours) ; fiches compactes et mini avec la bande de messages et BIP (plusieurs appareils nécessaires) ; bip par le haut-parleur avec oreillette débranchée.

## 8. Commandes Terminal produites

```bash
# Comparer la régie modifiée par Cursor à la version enregistrée (exemple de la 3.6)
cd ~/Documents/GitHub/capcom && git --no-pager diff --stat && git --no-pager diff public/regie.html public/ecoute.html
```

```bash
# Arrêter un serveur resté allumé, puis relancer le nôtre si le port est libre
kill <PID> && sleep 1 && (lsof -nP -iTCP:3000 -sTCP:LISTEN || (cd ~/Documents/GitHub/capcom && npm start))
```

```bash
# Déposer un fichier téléchargé en le reconnaissant à son contenu (jamais au nom ou à la date)
cd ~/Documents/GitHub/capcom && f=$(grep -rl --include='CAPCOM_CODES*.md' 'catalogue V0.5' ~/Downloads 2>/dev/null | head -1) && [ -n "$f" ] && cp "$f" docs/CAPCOM_CODES.md
```

## 9. Liste de polish (cumul V2)

Toutes les entrées des récaps précédents restent valables. **Ajouts du 14/11 (Lot 3, partie 2) :** « BIP ENVOYÉ » affiché avant toute réponse du serveur (en cas de refus, le toast CPC-409 ou CPC-410 suit) ; pause BIP gardée si la personne part et revient en moins de 3 s ; au clavier, focus perdu sur une touche BIP en pause ; sur une fiche très étroite, le mot de liaison (CONNEXION, PERDU) et la fin de « IL Y A 1 MIN 30 » peuvent être rognés ; lecteur d'écran qui lit l'heure deux fois (heure visible et libellé du cartouche) ; hauteur de la bande calculée, pas mesurée (un écart d'un pixel rognerait la dernière ligne) ; colonne plus basse qu'une fiche en exergue : « + N AUTRES » rogné ; une personne reléguée dans « + N AUTRES » garde ses messages sans cartouche visible (voyant allumé) ; second bip qui coupe net le premier ; `--accolade` utilise `color-mix` sans repli (régie seulement, à traiter comme `--orange`).

## 10. Dettes et points ouverts

- **Messages en attente perdus si l'on recharge la page régie** (le serveur ne les garde pas) : limite écrite au catalogue, à trancher plus tard (garde serveur ou non).
- **SANS SON réel à provoquer** au test studio.
- **Fiche « TEST » (c2)** apparue au démarrage du serveur, avant tout essai de Cursor : origine non identifiée, à surveiller.
- **`.impeccable/config.json`** toujours à faire ignorer par Git dans `capcom`.
- **Design Reference** : report de D265 (couleur dérivée = mélange de tokens, avec la règle du repli par `@supports` apprise aujourd'hui) et police des toasts, avec l'audit Surveyor du ~20/11.
- **Placement du lot « options son » (D239)** toujours à confirmer.
- Hors CAPCOM : date de la séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11 ; test ATEM au prochain passage au studio ; retard audio à mesurer au studio, avec et sans Bluetooth.
- **Soldées** : catalogue V0.5 ; dette du repli de l'orange ; touche ALERTE sur les fiches compactes et mini (BIP présente dans les trois densités) ; état du son d'une fiche en sursis ignoré (SANS SON réservé aux personnes connectées).

## 11. Prochaines étapes

1. **Placement des options son (D239)** : trancher où elles vont (avant ou après le Lot 4).
2. **Lot 4 — QR code** (D232).
3. **Test intermédiaire au studio** : plusieurs téléphones, fiches compactes et mini avec bande de messages et BIP, SANS SON provoqué, CPC-411, bip par le haut-parleur, retard audio avec et sans Bluetooth ; test ATEM (bloc 0, D240) dans le même passage.
4. **Lot 5 — Electron**, puis **Lot 6 — PARAMÈTRES et `.capcom`** ; puis fiche produit, patch, intégration à RENDEZVOUS.

## 12. Pièges

Treize entrées ajoutées au Carnet V86 : Cursor qui ouvre des pages de l'app et injecte de faux téléphones malgré la consigne ; affirmation « vérifié en direct » de Cursor ; liste des fiches vidée au hoquet du serveur ; identifiants réattribués après un redémarrage ; choix de disposition tranché sur un dessin plutôt qu'en mots ; motif dessiné en bordure qui grandit l'élément ; repli inefficace d'une variable CSS ; bip Web Audio audible en mode silencieux pendant l'écoute ; faux SANS SON pendant le branchement ; motif zsh sans correspondance qui bloque toute la commande ; fichier téléchargé reconnu à son nom au lieu de son contenu ; commande lancée deux fois (« rien à enregistrer ») ; recherche `grep` sur tout `~/Documents` trop lente.

---

*Récap · Tranquility Suite · CAPCOM · 14 novembre 2026 · Mac Maison*
