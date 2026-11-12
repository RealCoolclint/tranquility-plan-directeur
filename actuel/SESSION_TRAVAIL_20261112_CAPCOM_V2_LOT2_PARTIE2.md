# SESSION DE TRAVAIL — 12/11/2026 — [CAPCOM] Construction de la V2, Lot 2, partie 2

*Mac Bureau · Plan Directeur V5.136 → V5.137 · Carnet V79 → V80 · Décisions D248 → D250*

---

## 1. Démarrage

- **Mac Bureau**, resté inutilisé depuis fin août : le radar était introuvable (`surveyor/radar.sh` absent), car le dépôt `tranquility-plan-directeur` n'avait pas été tiré depuis environ deux mois et demi. Un `git pull` l'a amené de `fbad054` à `c1620a6` (157 fichiers). `capcom` et `tranquility-rd` n'étaient pas clonés sur ce Mac : clonés par une boucle « tirer ou cloner » (`gh repo clone`). Le Carnet a été tiré de `db4289f` à `828f7af`. Les trois dépôts du jour ont été vérifiés au commit annoncé par le prompt de continuation (`a3752e1`, `828f7af`, `a1e826e`).
- **Radar court réel** (`radar.sh court`, 13 h 31) : rien de poussé depuis la clôture du 11/11, flotte conforme au prompt. Absence de CAPCOM dans RENDEZVOUS assumée et tracée. Toujours ouverts et déjà connus : dépôt `tranquility-jarvis-instructions` figé depuis le 05/07 (niveau 4), pointeur Git LFS suspect dans Launcher en pause (niveau 7), pour l'audit complet du 20/11.
- Plan V5.136 et récap du 11/11 lus sur GitHub (clone du dépôt public). Carnet V79 fourni par Martin à la clôture.
- `npm install` lancé une fois sur le clone neuf de `capcom` avant le premier test.
- Postes actifs : STUDIO CRÉA, UX ET UI, CODE, QUALITÉ, MÉMOIRE ; NAVIGATION et MISSION CONTROL en veille active.

## 2. Atelier du module canal (clos)

- Planches **EtudeCanalA** (coins vifs) et **EtudeCanalB** (coins adoucis) réécrites dans l'Artifact « CAPCOM — Console de régie », d'un seul fichier dont seul le jeu de rayons diffère : module canal réduit à une ligne fine de 22 px (« À L'ÉCOUTE » + compteur à deux tambours), voyants ÉCOUTE / ANTENNE / ALERTE retirés, tableau de bord sur sa propre bande, rainure de 10 px, titre PUPITRE DES CANAUX.
- PRÉSIDENCE valide le module et la séparation, puis retient la **variante B** (recommandation de JARVIS : rayons officiels de la Suite, aucune exception à tracer).
- **D248** consigne l'ensemble.

## 3. 2.4 — édition des canaux depuis la régie

- Lecture de `server.js` et de `regie.html` : le serveur savait déjà ajouter, renommer, supprimer et déplacer, et refusait proprement, mais la régie ne reconnaissait pas ses refus et les affichait en « ERREUR IMPRÉVUE — CPC-999 ». Sept raisons de refus, et non six : `canal-inconnu` s'ajoute à la liste du prompt de continuation.
- **D249** : mode MODIFIER LES CANAUX (option A sur trois, contre des commandes permanentes par colonne et un clic droit).
- **D250** : codes CPC-404 à CPC-410 en famille 4xx, catalogue V0.3. Les sept textes sont validés tels quels par PRÉSIDENCE.

## 4. Décisions

| D | Décision |
|---|----------|
| D248 | Module canal tranché (clôt l'atelier de D247) : une seule règle de coins, variante B, rayons officiels (`--radius-md` cadres et colonnes, `--radius` touches, voyants, chrono, fiches, cadre du compteur ; tambours sans arrondi) ; module canal = ligne fine de 22 px, compteur à deux tambours, sans voyants ; tableau de bord sur sa bande, rainure, titre PUPITRE DES CANAUX. Abandonne les coins vifs des voyants de D230. |
| D249 | Mode MODIFIER LES CANAUX : bouton au bout du titre du pupitre, grisé tant que l'antenne est ouverte ; pendant l'édition, touches remplacées par numéro + nom modifiable + SUPPRIMER, tuile + CANAL, raccourcis d'antenne (1 à 6, 0, Option) coupés, fiches toujours visibles ; noms envoyés en majuscules ; suppression sans confirmation (le serveur ne supprime qu'un canal vide) ; sortie par TERMINÉ ou Échap. |
| D250 | Codes CPC-404 à CPC-410 (famille 4xx étendue à la modification des canaux par la régie) ; un refus du serveur n'est plus jamais affiché comme CPC-999 ; catalogue `docs/CAPCOM_CODES.md` V0.3. |

## 5. Livré et testé (dépôt `capcom`, Mac Bureau)

| Commit | Contenu |
|--------|---------|
| `95400ed` | Coins B (six rayons passés aux variables officielles), tableau de bord sur sa bande `--bg-secondary`, rainure, titre PUPITRE DES CANAUX |
| `68c1e3a` | Module canal en ligne fine, compteur à deux tambours ; pose directe de la valeur à la reconstruction (sans défilement depuis 00) ; libellé pour lecteur d'écran « N PERSONNE(S) » |
| `97068ce` | 2.4a — refus du serveur traduits en messages clairs codés CPC-404 à CPC-410 |
| `628bbf8` | 2.4b — mode MODIFIER LES CANAUX (ajout, renommage, suppression d'un canal vide) |
| `0640947` | 2.4c — catalogue CPC V0.3 (codes 404 à 410, colonne « Où », note 403/408, ligne du mode édition, « CANAL 1 » au lieu de « CANAL A ») |

Tests à l'écran sur le Mac Bureau, avec des onglets d'écoute comme auditeurs : bande, rainure, titre et coins ; tambours (arrivée, départ, changement de canal) ; mode édition (bouton grisé à l'antenne, raccourcis coupés, renommage visible sur l'onglet d'écoute, ajout jusqu'à six canaux, CPC-406 et CPC-407, sortie). **Pas encore testés sur iPhone** : canaux renommés à chaud (testés sur un onglet du Mac seulement), déplacement par la régie, parole individuelle (« À VOUS SEUL »).

## 6. Liste de polish (cumul V2)

Du 07/11 : titre ANTENNE sur le trait de CONTINU en fenêtre étroite ; ombre intérieure du tableau de bord ; affichage sous 860 px ; Commande puis Option ; bouton de mode muet sans micro ; libellé d'antenne tronqué. Du 11/11 : fenêtre micro par-dessus un clic très rapide pendant le chargement ; avec un seul canal, sa touche et TOUS s'allument ensemble ; message « VOUS ÉCOUTEZ LE … » en trop si la régie déplace pendant un changement en vol ; question de confirmation figée si le canal est renommé pendant l'affichage ; règle CSS orpheline `.equipe-vide`. **Ajouts du 12/11 :** tambour des unités qui recule de 9 à 0 (bande unique 0–9) ; tambours plafonnés à 99 (sans objet en pratique) ; en mode édition, un renommage tapé pendant une coupure de liaison n'est pas envoyé et rien ne le signale (griser les champs quand la liaison tombe) ; un refus de nom arrivé pendant qu'on a repris le champ ne remet pas l'ancien nom ; pupitre plus serré d'environ 46 px sur une fenêtre basse (bande, rainure et titre).

## 7. Dettes et points ouverts

- **Soldées** : piège de l'outil de recherche Hazel versé au Carnet V80 ; codes CPC des refus attribués (D250) ; `.DS_Store` retiré du suivi du Carnet et ajouté à son `.gitignore` (dans la commande de push de cette clôture).
- **Police des toasts** : Open Sans dans `tranquility-core.css`, contraire à la Design Reference — audit Surveyor du 20/11, pas localement.
- **Ressources du Plan** : la ligne `tranquility-rd` affiche encore 58 fiches au 01/11 (70 depuis le 11/11).
- Placement du lot « options son » (D239) toujours à confirmer.
- Hors CAPCOM : date de la séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11 ; test ATEM au prochain passage au studio ; retard audio à mesurer au studio, avec et sans Bluetooth.

## 8. Prochaines étapes

1. 2.5 — PARLER sur chaque fiche (parole individuelle) ; tester « À VOUS SEUL » sur iPhone.
2. 2.6 — glisser-déposer (CPC-409 et CPC-410 deviennent atteignables) ; tester le déplacement et les canaux renommés à chaud sur iPhone.
3. 2.7 — statistiques (D243).
4. Lot 3, puis options son (à placer), Lot 4, test au studio, Lot 5, Lot 6.
5. Hors calendrier : test ATEM au prochain passage au studio.

## 9. Pièges

Huit entrées ajoutées au Carnet V80 (recherche Hazel, Mac peu utilisé, rayons hors charte, variantes d'une planche, tambours à la reconstruction, aria répété, refus non traduits, raccourcis pendant une saisie).

---

*Récap · Tranquility Suite · CAPCOM · 12 novembre 2026*
