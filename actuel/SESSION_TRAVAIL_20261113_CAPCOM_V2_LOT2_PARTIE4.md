# SESSION DE TRAVAIL — 13/11/2026 — [CAPCOM] Construction de la V2, Lot 2, partie 4 : Lot 2 terminé

*Mac Maison · Plan Directeur V5.140 → V5.141 · Carnet V83 → V84 · Décisions D258 → D259*

---

## 1. Démarrage

- **Mac Maison** (`martinpavloff`), session du 13/11 en fin de matinée.
- Dépôt du Plan à jour (`f28589f`, **V5.140**) : deux sessions intercalées depuis le prompt de continuation (SETI, V5.139 ; naissance de MOCKUP, V5.140, D254 → D257). Les décisions du jour sont donc numérotées à partir de **D258**, et le Carnet est en V83 (le piège `dl()` annoncé pour la V82 entre en V84).
- **Radar court réel** (31 dépôts, aucune erreur) : aucune alerte nouvelle. Alertes connues : CAPCOM hors RENDEZVOUS, pointeur LFS de Launcher, dépôt des instructions JARVIS figé depuis le 05/07, audit complet vers le 20/11. **Écart documentaire** relevé : ligne CAPCOM du tableau des chantiers du Plan restée sur l'état du 11/11 (corrigée en V5.141).
- `capcom` (`32e3c6e`) et Carnet (`2532f42`, V83) à jour. Plan V5.140 lu sur clone du dépôt public ; Carnet V83, `regie.html` et `server.js` fournis par Martin. SETI : aucun signal.

## 2. 2.6 — glisser-déposer des fiches entre canaux

- **Lecture du code** : le serveur était prêt depuis la 2.1 (message `deplacer`, refus `auditeur-inconnu`, `auditeur-absent`, `canal-inconnu` déjà traduits en CPC-409, 410, 408 ; mise à jour du téléphone avec `parRegie`). Tout le travail porte sur `public/regie.html`. Point d'attention : `dessinerAuditeurs()` recrée toutes les fiches à chaque changement.
- **Comportements (D258)**, tranchés par JARVIS à partir des décisions actées et validés tels quels par PRÉSIDENCE (le mot « vol » expliqué en cours de route) : saisie par le corps de la fiche, vol après 6 px, copie qui suit le pointeur, original pâli, colonne visée en `var(--accent)`, serveur seul juge, Échap et lâcher hors colonne pour annuler, CPC-410 pour une personne en sursis ou perdue, CPC-409 pour une personne partie en vol, autorisé antenne ouverte et en mode MODIFIER LES CANAUX, interdit hors service. Geste écrit pour la souris et le doigt.
- **Un prompt Cursor**, contrôlé par comparaison avant / après (Martin n'avait collé que l'analyse finale) : un seul fichier, aucune couleur en dur, Échap capté avant la sortie du mode édition, vol annulé proprement en cas de hors service, perte de liaison ou perte de focus.
- **Serveur de test de Cursor** resté allumé sur le port 3000 (avec une personne fictive) : arrêté (`kill`) avant `npm start`.
- **Test sur iPhone, six scénarios, tous conformes** : clic simple sans effet ; déplacement vers le canal 2 avec « MODIFIÉ PAR LA RÉGIE » ; annulation par Échap ; son qui suit la personne déplacée, antenne ouverte en CONTINU ; **canal renommé à chaud vu sur l'iPhone** et déplacement en mode édition ; Wi-Fi coupé, saisie refusée avec CPC-410.
- Commit **`457bb8d`**.

## 3. 2.7 — statistiques de liaison

- **Arbitrage de PRÉSIDENCE (D259)** : option B, « VU IL Y A N S » seulement quand les nouvelles traînent, jamais en permanence.
- **Mesure** dans la régie seule, sans toucher au serveur : `getStats` de la paire de candidats active (temps de réponse, vérifications de liaison qui circulent même sans son). Rythme observé par Cursor : une réponse toutes les 1 à 3 s, temps de réponse de 5 à 47 ms.
- **Prompt 1** : trois barres dans toutes les densités (3 gris clair, 2 gris clair, 1 orange, éteintes sans nouvelles), mise à jour sur place chaque seconde, texte de retard en complet et compact.
- **Prompt 2 (retouches)**, après comparaison avant / après : première mesure affichée directement (sinon chaque arrivée passait 9 s par l'orange) ; seuil de retard porté de 6 à 8 s (deux vérifications manquées) ; point de liaison remis à 8 px (élargi par Cursor à cause d'un adjectif ambigu du prompt).
- **Test sur iPhone, tous conformes** : trois barres dès l'arrivée sans orange ; 30 s de calme sans texte ; barres stables en parlant ; Wi-Fi coupé : passage direct à PERDU puis EN SURSIS (le seuil de 8 s n'est jamais atteint : le texte de retard ne servira qu'aux liaisons hachées), retour à la normale avec le Wi-Fi.
- Commit **`d625ac7`**.

## 4. Version

Lot 2 livré : numéro de version **V2.13.11.26** (D235), trouvé par recherche transverse de Cursor en mode agent dans la régie et dans la page d'écoute, nulle part ailleurs. Commit **`379a2fd`**.

## 5. Décisions

- **D258** — Déplacer une personne par glisser-déposer de sa fiche : saisie par le corps (jamais par PARLER), vol après 6 px, serveur seul juge, Échap annule, CPC-409 et CPC-410 atteignables, autorisé antenne ouverte et en mode MODIFIER LES CANAUX.
- **D259** — Statistiques de liaison : trois barres mesurées depuis le Mac, première mesure directe, « VU IL Y A N S » seulement après 8 s sans nouvelles (option B), mise à jour sur place sans redessin.

## 6. Livré et testé (dépôt `capcom`, Mac Maison)

| Commit | Contenu |
|--------|---------|
| `457bb8d` | 2.6 — glisser-déposer des fiches entre canaux |
| `d625ac7` | 2.7 — statistiques de liaison sur les fiches |
| `379a2fd` | Version V2.13.11.26 (régie et écoute), Lot 2 livré |

**Lot 2 terminé.** Tous les points en retard depuis la 2.4 sont testés sur iPhone. **Non vus à l'écran** : fiches compactes et mini avec barres et texte de retard (plusieurs appareils nécessaires, au test du studio).

## 7. Liste de polish (cumul V2)

Du 07/11 : titre ANTENNE sur le trait de CONTINU en fenêtre étroite ; ombre intérieure du tableau de bord ; affichage sous 860 px ; Commande puis Option ; bouton de mode muet sans micro ; libellé d'antenne tronqué. Du 11/11 : fenêtre micro par-dessus un clic très rapide pendant le chargement ; avec un seul canal, sa touche et TOUS s'allument ensemble ; « VOUS ÉCOUTEZ LE … » en trop si la régie déplace pendant un changement en vol ; question de confirmation figée si le canal est renommé pendant l'affichage ; règle CSS orpheline `.equipe-vide`. Du 12/11 : tambour des unités qui recule de 9 à 0 ; tambours plafonnés à 99 ; en mode édition, renommage tapé pendant une coupure de liaison non envoyé et non signalé ; refus de nom arrivé pendant qu'on a repris le champ ; pupitre plus serré d'environ 46 px sur une fenêtre basse. Du 13/11 (2.5) : filet du doigt sur PARLER à vérifier sur iPad ; en CONTINU, personne visée cachée dans « + N AUTRES » sans touche visible pour couper (remède : personne visée toujours en tête de colonne). **Ajouts du 13/11 (2.6, 2.7) :** deux toasts qui s'empilent si l'on promène la personne à qui l'on parle et qu'elle décroche pendant le vol ; glisser-déposer au doigt jamais essayé (iPad) ; copie promenée qui ne suit pas un renommage pendant le vol ; personne cachée dans « + N AUTRES » impossible à saisir ; liaison saine qui pourrait passer « en retard » si `getStats` ne renvoie pas de paire active (jamais observé).

## 8. Dettes et points ouverts

- **Police des toasts** en Open Sans dans `tranquility-core.css`, contraire à la Design Reference : audit Surveyor du 20/11, pas localement.
- **`.DS_Store`** : liste noire globale à poser sur le Mac Bureau et le Mac Studio ; retrait du suivi dans les dépôts qui le suivent encore, à l'audit Surveyor du 20/11.
- **Placement du lot « options son » (D239)** toujours à confirmer.
- **Catalogue `docs/CAPCOM_CODES.md`** (V0.4) non relu dans cette session (dépôt privé) : CPC-409 et CPC-410 y sont déjà décrits pour le déplacement depuis la V0.3 (D250) ; vérifier en une lecture que rien n'y annonce encore le déplacement « à venir », et y ajouter si besoin la règle sans code des barres de liaison et de « VU IL Y A N S » (règle du Carnet : tout nouvel affichage d'état entre au catalogue). À faire en ouverture du Lot 3, qui modifiera de toute façon le catalogue.
- **Stats de liaison sur Safari** : compteur propre à Chrome, à vérifier le jour où la régie passera sur iPad.
- Hors CAPCOM : date de la séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11 (avec le dépôt des instructions JARVIS figé depuis le 05/07 et le pointeur LFS de Launcher) ; test ATEM au prochain passage au studio ; retard audio à mesurer au studio, avec et sans Bluetooth.
- **Soldées** : ligne CAPCOM du tableau des chantiers du Plan ; MOCKUP ajouté au registre de flotte (oublié à sa naissance en V5.140).

## 9. Prochaines étapes

1. **Lot 3, conception puis construction** : actions et messages (D229 : six messages préenregistrés, ALERTE, bandeau d'alerte, fiche en exergue, « son actif » de D243, nouveaux codes CPC). Premier lot depuis la 2.1 à toucher `server.js`, `ecoute.html` et `regie.html` ensemble : mini-plan obligatoire. Commencer par relire le catalogue des codes.
2. Placement du lot « options son » (D239).
3. Lot 4 (QR code), test intermédiaire au studio (avec fiches compactes et mini), Lot 5 (Electron), Lot 6 (PARAMÈTRES et `.capcom`).
4. Hors calendrier : test ATEM au prochain passage au studio.

## 10. Pièges

Neuf entrées ajoutées au Carnet V84 : `dl()` sans filtre de date, serveur de test laissé allumé par Cursor, récidive double de JARVIS (API GitHub, `cut -c`), adjectif pris au pied de la lettre dans un prompt, signes de vie WebRTC sans audio, première mesure directe, liaison qui tombe avant le seuil de retard, app née sans entrée au registre de flotte, lignes d'état du Plan désaccordées.

---

*Récap · Tranquility Suite · CAPCOM · 13 novembre 2026 · Mac Maison*
