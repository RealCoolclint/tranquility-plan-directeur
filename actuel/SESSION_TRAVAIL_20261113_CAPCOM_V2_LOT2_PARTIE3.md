# SESSION DE TRAVAIL — 12 au 13/11/2026 — [CAPCOM] Construction de la V2, Lot 2, partie 3

*Mac Maison · Plan Directeur V5.137 → V5.138 · Carnet V80 → V81 · Décisions D251 → D253*

---

## 1. Démarrage

- **Mac Maison** (`martinpavloff`), session ouverte le 12/11 au soir et close le 13/11 au matin.
- Dépôt du Plan tiré (`c1620a6` → `3b49621` : Plan V5.137, récap du 12/11, registre de flotte).
- **Radar court réel** (`radar.sh court`, 31 dépôts, aucune erreur) : rien de nouveau depuis la clôture du 12/11 ; alertes connues seulement (CAPCOM hors RENDEZVOUS, pointeur LFS de Launcher, dernier rapport Surveyor au 20/10, audit complet prévu vers le 20/11). Le rapport collé dans le Terminal a provoqué un `parse error` : transmis ensuite en glissant `RADAR_latest.txt`.
- `capcom` tiré de `a3752e1` à `0640947` (dépendances à jour) ; `tranquility-rd` à jour ; Carnet bloqué par `.DS_Store` modifié localement, débloqué (`git checkout -- .DS_Store`), tiré jusqu'à V80 (`17d3252`).
- **Hygiène `.DS_Store` (D253)** : liste noire globale `~/.gitignore_global` posée sur le Mac Maison.
- Plan V5.137 et récap du 12/11 relus sur le dépôt public : concordants avec le prompt de continuation. SETI : aucun signal sur la parole individuelle.

## 2. 2.5 — parole individuelle

- **Lecture du code** : le serveur était déjà prêt (`on-air` avec `{ canaux, personnes }`, nettoyage d'une personne qui part, refus silencieux des identifiants inconnus) ; tout le travail porte sur `public/regie.html`.
- **Arbitrage du geste (D251)** : option B, une touche PARLER sur chaque fiche, contre « toute la fiche est le bouton » (même début de geste que le glisser-déposer du 2.6).
- **Comportements validés** : mêmes gestes que les touches de canal, une seule cible à la fois, touche grisée en SURSIS, PERDU, mode édition et hors service, pas de raccourci clavier, « À L'ANTENNE : PRÉNOM », fermeture si la personne se déconnecte.
- **Prompt 1** : état d'antenne `{ canaux, personnes }`, `antenneOuverte()`, `cibleDe()`, `doitEntendre()`, touche `.fiche-parler` dans les trois densités, liseré rouge par fiche, libellé d'antenne.
- **Prompt 2 (correctif)** sur les trois fragilités signalées par Cursor : filet `touchend`/`touchcancel` sur la fenêtre ; **fermeture automatique avec CPC-410** quand la personne visée décroche (D252) ; clé retirée de la pile clavier quand sa touche disparaît ou se grise.
- **Contrôle** : fichier comparé à la version d'avant (seuls les rapports d'analyse finaux de Cursor avaient été collés). Périmètre respecté, aucune couleur en dur, variables officielles, réglage « réduire les animations » respecté.
- **Tests sur iPhone** (l'iPhone et un onglet du Mac sur le même canal) : parole à une seule personne et « À VOUS SEUL », mode CONTINU, décrochage de l'iPhone (antenne fermée, toast CPC-410), touches grisées en mode édition. **Tout conforme.** Le journal du serveur confirme la séquence (personnes ciblées, sursis, antenne muette).

## 3. Catalogue V0.4

Seconde ligne CPC-410 (parole individuelle), règles de la touche PARLER (section 2xx, sans code), état normal **À VOUS SEUL** ajouté aux états de la page d'écoute (grande ligne LA RÉGIE VOUS PARLE, petite ligne À VOUS SEUL ; libellés lus dans `ecoute.html`, oubli datant de la 2.2), note 409/410 corrigée.

## 4. Décisions

- **D251** — Parole individuelle par une touche PARLER sur chaque fiche (option B) ; mêmes gestes que les canaux ; une seule cible à la fois ; le corps de la fiche reste libre pour le 2.6.
- **D252** — La personne visée décroche : l'antenne se ferme d'elle-même, même en CONTINU, toast unique « LIAISON PERDUE AVEC [PRÉNOM] — ANTENNE FERMÉE — CODE CPC-410 » ; réutilisation de CPC-410 (même cause) ; jamais pour un relâchement normal. Catalogue V0.4.
- **D253** — Hygiène `.DS_Store` : liste noire globale sur chaque Mac ; réflexe `git checkout -- .DS_Store` en cas de blocage.

## 5. Livré et testé (dépôt `capcom`, Mac Maison)

| Commit | Contenu |
|--------|---------|
| `0bde27b` | 2.5 — touche PARLER sur chaque fiche, parole à une seule personne, fermeture CPC-410, filet de sécurité du doigt |
| `32e3c6e` | Catalogue CPC V0.4 — seconde ligne CPC-410, état À VOUS SEUL, règles de la touche PARLER |

**Restent à tester sur iPhone** : canaux renommés à chaud, déplacement par la régie (2.6).

## 6. Liste de polish (cumul V2)

Du 07/11 : titre ANTENNE sur le trait de CONTINU en fenêtre étroite ; ombre intérieure du tableau de bord ; affichage sous 860 px ; Commande puis Option ; bouton de mode muet sans micro ; libellé d'antenne tronqué. Du 11/11 : fenêtre micro par-dessus un clic très rapide pendant le chargement ; avec un seul canal, sa touche et TOUS s'allument ensemble ; message « VOUS ÉCOUTEZ LE … » en trop si la régie déplace pendant un changement en vol ; question de confirmation figée si le canal est renommé pendant l'affichage ; règle CSS orpheline `.equipe-vide`. Du 12/11 : tambour des unités qui recule de 9 à 0 ; tambours plafonnés à 99 ; en mode édition, renommage tapé pendant une coupure de liaison non envoyé et non signalé (griser les champs) ; refus de nom arrivé pendant qu'on a repris le champ ; pupitre plus serré d'environ 46 px sur une fenêtre basse. **Ajouts du 13/11 :** filet du doigt sur PARLER à vérifier quand la régie passera sur iPad ; en CONTINU, personne visée cachée dans « + N AUTRES » sans touche visible pour couper (remède prévu : la personne visée toujours en tête de sa colonne).

## 7. Dettes et points ouverts

- **Soldées** : ligne `tranquility-rd` des ressources du Plan (70 fiches au 11/11) ; piège `.DS_Store` transformé en règle (D253).
- **`.DS_Store`** : liste noire globale à poser sur le Mac Bureau et le Mac Studio (même commande) ; retrait du suivi dans les dépôts qui le suivent encore, à l'audit Surveyor du 20/11.
- **Police des toasts** : Open Sans dans `tranquility-core.css`, contraire à la Design Reference — audit Surveyor du 20/11, pas localement.
- Placement du lot « options son » (D239) toujours à confirmer.
- Hors CAPCOM : date de la séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11 (avec le dépôt des instructions JARVIS figé depuis le 05/07 et le pointeur LFS de Launcher) ; test ATEM au prochain passage au studio ; retard audio à mesurer au studio, avec et sans Bluetooth.

## 8. Prochaines étapes

1. 2.6 — glisser-déposer par le corps de la fiche (la touche PARLER reste à part) ; CPC-409 et CPC-410 deviennent atteignables côté déplacement ; tester le déplacement et les canaux renommés à chaud sur iPhone.
2. 2.7 — statistiques (D243).
3. Lot 3, puis options son (à placer), Lot 4, test au studio, Lot 5, Lot 6.
4. Hors calendrier : test ATEM au prochain passage au studio.

## 9. Pièges

Huit entrées ajoutées au Carnet V81 (`.DS_Store` qui bloque un pull, rapport du radar collé dans le Terminal, maintien sur une touche redessinée, cible qui décroche, gestes parler et déplacer, rapports Cursor partiels, prompt rejoué, état normal absent du catalogue).

---

*Récap · Tranquility Suite · CAPCOM · 13 novembre 2026*
