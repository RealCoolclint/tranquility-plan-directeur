# SESSION DE TRAVAIL — 11/11/2026 — [CAPCOM] Construction de la V2, Lot 2, partie 1

*Mac Maison · Plan Directeur V5.135 → V5.136 · Carnet V78 → V79 · Décisions D240 → D247*

---

## 1. Démarrage

- Mac Maison. Dépôts `capcom` (`a814bb4`), `tranquility-plan-directeur` et `tranquility-carnet-pieges` à jour ; Plan V5.135 et récap du Lot 1 lus dans `actuel/` (le dépôt public a été lu directement en ligne) ; Carnet V78 fourni par Martin.
- Radar court réel (`radar.sh court`) : flotte stable depuis le 26/10. **Un écart** : séance SETI du 08/11 au matin, cinq fiches poussées (`0602bf6` : Bang Motion, AnythingLLM, reanimate, LivLiv Player, xtool ; 69 fiches) sans clôture. Rattrapé au Plan V5.136.
- Rappels : date de la séance SÉCURITÉ (D211) à fixer ; audit Surveyor complet vers le 20/11.
- Postes actifs : CONCEPTUALISATION, UX ET UI, CODE, QUALITÉ, MÉMOIRE, R&D (fiche ATEM), puis STUDIO CRÉA en fin de session ; NAVIGATION et MISSION CONTROL en veille active.

## 2. Évolutions CAPCOM et fiche ATEM

- **D240** — Le carnet des évolutions du 08/11 est versé au Plan (section « Évolutions CAPCOM », blocs 0 à 3, attentes, écartés, à trancher). Méthode : une seule version du Plan par session, texte validé en séance puis intégré à la clôture.
- Fiche R&D `fiches/RD_ATEM_ECOUTE_V1.md` (statut À TESTER) dans `tranquility-rd`, sommaire régénéré (70 fiches, 0 alerte, `3e32897`). Sources vérifiées le 11/11 : atem-connection 3.10.3 (MIT, connaît l'ATEM Mini Extreme ISO G2, lit tally, enregistrement et heure, **réseau seulement, jamais USB**, firmware 8.0+ conseillé) ; Companion 5.2.0 et son module ATEM 4.5.0 (MIT).
- **Test ATEM détaché du calendrier de la V2** (option 2) : à faire au prochain passage de Martin au studio, hors tournage. Premier contrôle : un câble réseau à l'arrière de l'ATEM. Déclencheur de la fiche mis à jour à la clôture.

## 3. Lot 2 — arbitrages

| D | Décision |
|---|----------|
| D241 | Canaux libres dès le Lot 2 : ajouter, renommer, supprimer un canal vide ; suppression d'un canal occupé au Lot 6. Un canal garde son numéro ; le dernier ne se supprime pas ; un téléphone en sursis bloque la suppression et le déplacement. |
| D242 | Canaux **numérotés de 1 à 6** (plus de lettres), touches 1 à 6 = canal du même numéro, **touche 0 = TOUS**, mot **CANAL** partout. |
| D243 | Statistiques du Lot 2 : qualité du lien en trois barres et « vu il y a N s » (mesurées depuis le Mac) ; « son actif » au Lot 3 ; le voyant de qualité de liaison sort du bloc 2 des évolutions. |
| D244 | CHANGER libre sur le téléphone, **avec confirmation** (focus sur ANNULER), et **visible seulement pendant l'écoute**. |
| D245 | Fenêtre **ACTIVER LE MICRO** à l'ouverture de la régie, refus possible (PLUS TARD, Échap). |
| D246 | Toasts de la page d'écoute **en haut, sous l'en-tête, fond opaque** (exception consciente à `tranquility-core`, limitée à `ecoute.html`). |
| D247 | Grammaire de panneau de pilotage pour les touches (chiffre au-dessus du nom, sans légende, 72 px) ; **module canal en atelier**. |

## 4. Livré et testé (dépôt `capcom`)

| Commit | Contenu |
|--------|---------|
| `3a92e46` | 2.1 — serveur : canaux en liste vivante 1 à 6, `canal-ajouter`, `canal-renommer`, `canal-supprimer`, `deplacer`, diffusion `channels`, antenne `{ canaux, personnes }` ; régie mise à niveau (touches 1, 2, 0, mot CANAL) |
| `af7e0cd` | Touche TOUS centrée |
| `abcf456` | Fenêtre ACTIVER LE MICRO (D245) |
| `4729886` | 2.2 — écoute : canaux à chaud, MODIFIÉ PAR LA RÉGIE, À VOUS SEUL, confirmation de CHANGER |
| `5e1751f` | CHANGER seulement pendant l'écoute ; toasts en haut, fond opaque (D244, D246) — deux corrections dans un seul commit (enregistrement oublié, voir Carnet) |
| `2e26e89` | 2.3 — colonnes générées depuis le serveur, touches 1 à 6, disposition de la maquette, une colonne sous 860 px, maintiens relâchés à la reconstruction |
| `a3752e1` | Étape intermédiaire de design : grammaire chiffre + nom, afficheur « À L'ÉCOUTE » v1 |

Tests sur iPhone à chaque étape. Ajout de canaux testé depuis la console du navigateur (`envoyer({ type: "canal-ajouter", … })`). **Pas encore testés** (faute de bouton côté régie) : déplacement par la régie, parole individuelle, « À VOUS SEUL », canaux renommés à chaud sur le téléphone — à tester en 2.4 à 2.6.

Observation : retard d'environ 1 à 1,5 s avec écouteurs Bluetooth (déjà ~1 s le 06/11). À mesurer au studio avec et sans Bluetooth.

## 5. Atelier du module canal (fin de session)

Deux planches ajoutées à l'Artifact « CAPCOM — Console de régie » : **variante A, coins vifs** (3 px, rayon hors réglages communs) et **variante B, coins adoucis** (6 et 10 px, rayons officiels). Pupitre des canaux séparé du tableau de bord par une rainure, module par canal, compteur à tambours, voyants ÉCOUTE / ANTENNE / ALERTE, rangée de démonstration.

**Retour de PRÉSIDENCE à la clôture, cap pour la prochaine session :**
- la **micro-console** de chaque canal est **beaucoup trop haute** : elle doit être **fine et discrète**, lisible d'un coup d'œil ;
- **pas de voyants ÉCOUTE / ANTENNE / ALERTE** dans le module : on reste sur la base actuelle, plus simple ;
- **seulement le compteur**, à tambours (façon compteur kilométrique), très discret ;
- à trancher : la règle de coins unique (A ou B) et la séparation plus marquée entre le tableau de bord et le pupitre des canaux.

## 6. Liste de polish (cumul V2)

Du 07/11 : titre ANTENNE sur le trait de CONTINU en fenêtre étroite ; ombre intérieure du tableau de bord ; affichage sous 860 px ; Commande puis Option ; bouton de mode muet sans micro ; libellé d'antenne tronqué. **Ajouts du 11/11 :** fenêtre micro par-dessus un clic très rapide pendant le chargement ; avec un seul canal, sa touche et TOUS s'allument ensemble ; message « VOUS ÉCOUTEZ LE … » en trop si la régie déplace pendant un changement en vol ; question de confirmation figée si le canal est renommé pendant l'affichage ; règle CSS orpheline `.equipe-vide`.

## 7. Dettes et points ouverts

- **Police des toasts** : `tranquility-core.css` leur donne Open Sans, contraire à la Design Reference (Lato partout) — défaut commun à la Suite, à traiter à l'audit Surveyor du 20/11, pas localement.
- Catalogue `docs/CAPCOM_CODES.md` : codes des refus de la régie (`canaux-max`, `libelle-invalide`, `dernier-canal`, `canal-occupe`, `auditeur-inconnu`, `auditeur-absent`) à attribuer en 2.4.
- Placement du lot « options son » (D239) toujours à confirmer.
- Registre de flotte : fiche CAPCOM rafraîchie à cette clôture.
- Hors CAPCOM : date de la séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11.

## 8. Prochaines étapes

1. Atelier du module canal (D247) : réviser les planches selon le cap ci-dessus, trancher les coins et la séparation, puis prompts.
2. 2.4 — édition minimale des canaux depuis la régie, avec codes CPC.
3. 2.5 PARLER sur chaque fiche ; 2.6 glisser-déposer ; 2.7 statistiques.
4. Lot 3, puis options son (à placer), Lot 4, test au studio, Lot 5, Lot 6.
5. Hors calendrier : test ATEM au prochain passage au studio.

## 9. Pièges

Treize entrées ajoutées au Carnet V79 (identifiants, maintien et reconstruction, CHANGER avant l'écoute, grille en ligne, z-index, bordures, toasts mobiles, cockpit, console du navigateur, variables CSS, rapports Cursor, enregistrement, SETI).

---

*Récap · Tranquility Suite · CAPCOM · 11 novembre 2026*
