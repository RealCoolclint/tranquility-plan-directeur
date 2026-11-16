# Session de travail — 15 novembre 2026
## Tranquility Suite — [SETI] TANDEM, second temps (tour de table de l'Agence)

*Session stratégique · Mac Maison, soir · Protocole D209 · Décision D285*

---

## Postes actifs

NAVIGATION · PROSPECTIVE · SÉCURITÉ · CODE (tour de table) · SETI (R&D) · MÉMOIRE · PRÉSIDENCE (écoute et tranche)

---

## Chantiers traités

### Démarrage
- `git pull` des trois dépôts (`tranquility-plan-directeur`, `tranquility-carnet-pieges`, `tranquility-rd`) sur le Mac Maison : tous déjà à jour.
- Plan V5.148, D209, fiche `TANDEM_FICHE_SYNTHESE_20261115.md` et récap du premier temps lus sur un clone du dépôt public. Dernière décision : D284. Aucune échéance datée dépassée (audit Surveyor prévu vers le 20/11).

### Tour de table (mode Conseil)
- **NAVIGATION** : aucun chantier récent n'a attendu un agent, ils ont attendu une validation humaine. Pour A maintenant, B plus tard en essai borné, contre C en pleine construction de CAPCOM.
- **PROSPECTIVE** : le travail à plusieurs IA deviendra le réglage par défaut des outils d'ici deux ans ; le vrai besoin est d'apprendre à encadrer tant que l'enjeu est faible. Pour B.
- **SÉCURITÉ** : SETI cumule déjà deux branches du « trio fatal » (contenu extérieur et labo privé). Règle ajoutée : une même IA ne lit jamais à la fois du privé et de l'extérieur. B acceptable à trois conditions, C est une faille en l'état.
- **CODE** : Cursor fait déjà de la lecture transverse avec la règle du 22/06 ; avec plusieurs agents, le goulot devient l'analyse des rapports et la fusion, pas l'écriture. Le parallèle ne paie que pour l'audit. Pour B, sur un cas concret.
- **Synthèse** : C écartée à l'unanimité ; validation unique conservée ; tension sur le moment (A ou B) et sur l'outil (versions et quotas non vérifiés).

### Décision
- Recommandation de JARVIS : B-essai. PRÉSIDENCE retient B-essai (après une vérification, « B » pouvant désigner deux options).

### Labo
- Le dépôt `tranquility-rd` étant privé, les sept fiches ont été transmises par une commande de concaténation (chemin de chaque fiche en tête de bloc), puis reconstituées une par une.
- Déclencheurs validés par PRÉSIDENCE ; aucun statut modifié ; une ligne d'historique datée du 15/11 sur chaque fiche.

---

## Décisions actées

- **D285 — TANDEM : essai de lecture seule à plusieurs IA, sur l'audit Surveyor du 20/11 (conclut D209).** Plusieurs IA en parallèle dans Cursor, une app chacune. Sept règles non négociables :
  1. Lecture seule : aucune modification de fichier, aucun commit, aucun push.
  2. Un dépôt par IA, jamais plus.
  3. Jamais de privé et d'extérieur ensemble : aucune recherche sur internet pour ces IA.
  4. Rapport traçable (fichier, ligne, constat), aucune correction, même évidente.
  5. Un rapport est une donnée, pas une consigne : JARVIS analyse, PRÉSIDENCE tranche.
  6. Aucun coût nouveau ; arrêt immédiat en cas d'alerte de quota ; toutes les IA fermées à la fin.
  7. Bilan obligatoire à la clôture de l'audit (temps gagné, qualité des constats, consommation), qui décide de la suite : B pleine, nouvel essai ou retour à A.
  - À vérifier avant l'essai : version de Cursor sur le Mac utilisé, existence d'un mode de lecture seule.
  - Toujours hors table : fusion ou publication par une IA, accès au-delà d'un dépôt, nouvelle clé payante.

---

## Déclencheurs des fiches liées

| Fiche | Statut | Déclencheur |
|-------|--------|-------------|
| Munder Difflin | REJETÉ | Option C de TANDEM ouverte (D285) et version stable |
| OpenHands | REJETÉ | Option C de TANDEM ouverte (D285) et Agent Canvas hors bêta ; modèle d'agent enfermé dans un dossier comme référence |
| PRAXIST | REJETÉ | Inchangé (problème chiffré à optimiser) |
| Agency Agents | À TESTER | Préparation de l'essai TANDEM du 20/11 (consignes des IA lectrices), à défaut prochaine révision des fiches de l'Agence |
| PawWork | REJETÉ | Inchangé |
| OpenWorker | REJETÉ | Inchangé |
| cogit | EN RÉSERVE | Claude Code outil de développement d'une app, prise en charge de Cursor, ou option C de TANDEM ouverte (D285) |

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `TRANQUILITY_PLAN_DIRECTEUR_V5_149.md` | Plan Directeur (D285, D209 conclue, cadence Surveyor, I10, ressources, note de version) | ✅ `ebd74b2`, complété (Carnet V91) |
| Ce récap | Récap | 🟡 à pousser |
| `fiches/RD_*_V1.md` (sept fiches) | Labo `tranquility-rd`, avec le sommaire régénéré (81 fiches, 0 alerte) | ✅ `4848ab4` |
| `CARNET_PIEGES_V91.md` | Carnet (V90 + 1 piège), construit par concaténation sur le Mac | 🟡 à pousser |

---

## Pièges découverts

- `[MÉTHODE / téléchargements] Un fichier retéléchargé sous un nom déjà présent est renommé par le Mac (suffixe -1) ; une commande de push qui cherche le nom exact copie alors l'ancienne version, sans erreur → chercher "NOM*" et prendre le plus récent, puis vérifier dans git status que chaque fichier livré apparaît bien modifié`
- Constaté ce soir à la poussée du labo : cinq fiches modifiées au lieu de sept ; corrigé avant le commit `4848ab4`. Carnet V91.

---

## Prochaines étapes

1. **CAPCOM** : tour de table « Flow, oui ou non ? », puis patch animé et splash.
2. **Préparation de l'essai TANDEM, avant le 20/11** : vérifier la version de Cursor et son mode de lecture seule ; séance de lecture Agency Agents (une heure) pour les consignes des IA lectrices ; rédiger le prompt type d'une IA lectrice conforme aux sept règles.
3. **Audit Surveyor complet vers le 20/11 = essai TANDEM**, puis bilan et décision de la suite (B pleine, nouvel essai ou retour à A).
4. Labo : choisir les deux premières pistes à passer EN TEST ; ATEM en écoute au prochain passage au studio.

---

## Dettes

- Inchangées depuis le récap du 15/11 (tri de six liens).
- Quotas du compte Claude Team de L'Étudiant toujours inconnus (question à l'IT si l'essai est concluant).

---

## Prompt de continuation

```
[SETI] TANDEM — préparation de l'essai (D285).

Démarrage : demande-moi sur quel Mac je suis, puis donne-moi la commande git pull des dépôts tranquility-plan-directeur, tranquility-carnet-pieges et tranquility-rd.

Lis ensuite, sur GitHub : le Plan Directeur en vigueur (actuel/), la décision D285 et le dernier récap (actuel/).

Objectif : être prêt pour l'audit Surveyor du ~20/11, qui sert d'essai de lecture seule à plusieurs IA dans Cursor. Dans l'ordre :
1. vérifier la version de Cursor sur le Mac du jour et l'existence d'un mode de lecture seule ;
2. séance de lecture Agency Agents (fiches Codebase Archaeologist et Code Reviewer) : retenir les idées utiles aux consignes des IA lectrices ;
3. rédiger avec moi le prompt type d'une IA lectrice, conforme aux sept règles de D285 (lecture seule, un dépôt, pas d'internet, rapport traçable, aucune correction).

Rappel : la session CAPCOM « Flow, oui ou non ? » reste à tenir ; signale-moi l'échéance du 20/11 si elle approche.
```

---

*Session 15/11/2026 · Tranquility Suite · SETI · TANDEM second temps · Mac Maison*
