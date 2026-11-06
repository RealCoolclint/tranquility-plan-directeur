# Session de travail — 3 novembre 2026
## Tranquility Suite — SETI, tri de six liens

*Type de session : Autre — séance SETI courte, ouverte directement par des liens collés (démarrage V2.1 non déroulé) · Mac Maison*

---

## Chantiers traités

### Tri flash de six liens
Six dépôts GitHub collés sans commentaire, triés par SETI après lecture des sources (README, licence, dernière version, archivage), sans rien installer ni exécuter : Qwen-Image, PawWork, Hex, spec-kit, Papra, Floorplan. Les six propositions de statut ont été validées telles quelles par PRÉSIDENCE.

### Écriture des fiches au labo (`tranquility-rd`)
- Qwen-Image et PawWork : une fiche courte chacune, relue, créée par Cursor, enregistrée avec le sommaire régénéré (commits `7f75b84`, `c825124`).
- spec-kit, Papra, Hex, Floorplan : à la demande de PRÉSIDENCE, les quatre fiches restantes ont été relues dans un seul prompt Cursor puis enregistrées en un seul commit (`9693e20`). Cursor a corrigé de lui-même un niveau de titre erroné dans la fiche Floorplan.
- Chaque enregistrement est conditionné à « 0 alertes » du générateur de sommaire.

### Contrôle de fraîcheur du catalogue
Le script a lu 59 fiches quand le sommaire branché au projet (31/10) en comptait 54. Après « Sync now », relecture du catalogue : les fiches manquantes (automate-faceless-content, video-scraping-apis, Lightpanda, FileCodeBox, puis Qwen-Image) ne faisaient doublon avec aucun lien du jour. La relecture complète a fait apparaître Strix (REJETÉ le 25/10), oublié dans le tri flash de Floorplan ; il a été ajouté à la fiche.

---

## Décisions actées

- Qwen-Image REJETÉ : Google Flow reste le seul générateur d'images de la Suite ; matériel inadapté.
- PawWork REJETÉ : règle 13 (clé de modèle payante), doublon de Claude et Cowork déjà payés.
- spec-kit EN RÉSERVE : on lit et on compare à notre méthode, on n'ajoute pas une seconde méthode (Loi 2).
- Papra EN RÉSERVE : candidat pour ARCHIVES ; aucun usage réel sans fiche au registre RGPD.
- Hex À TESTER et Floorplan À TESTER : l'ordre entre les deux se tranche au lancement d'un test.
- Sur demande de PRÉSIDENCE, plusieurs fiches peuvent être versées en un seul prompt Cursor et un seul commit, à condition qu'elles soient relues en entier dans le prompt et que le garde-fou « 0 alertes » soit conservé.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `fiches/RD_QWEN_IMAGE_V1.md` | Fiche courte (REJETÉ) | ✅ `7f75b84` |
| `fiches/RD_PAWWORK_V1.md` | Fiche courte (REJETÉ) | ✅ `c825124` |
| `fiches/RD_SPEC_KIT_V1.md` | Fiche courte (EN RÉSERVE) | ✅ `9693e20` |
| `fiches/RD_PAPRA_V1.md` | Fiche courte (EN RÉSERVE) | ✅ `9693e20` |
| `fiches/RD_HEX_V1.md` | Fiche complète avec kit de test (À TESTER) | ✅ `9693e20` |
| `fiches/RD_FLOORPLAN_V1.md` | Fiche complète avec kit de test (À TESTER) | ✅ `9693e20` |
| `SOMMAIRE.md` | Régénéré : 64 fiches, 0 alerte | ✅ `9693e20` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_131.md` | Document fondateur | 🟡 À pousser |
| `CARNET_PIEGES_V74.md` | Carnet de pièges (+3) | 🟡 À produire puis pousser |
| Ce récap | Récap | 🟡 À pousser |

État du labo : 64 fiches — 0 EN TEST, 7 À TESTER, 28 EN RÉSERVE, 2 ADOPTÉ, 27 REJETÉ.

---

## Commandes Terminal produites

```bash
# Ouvrir le labo dans Cursor
cursor ~/Documents/GitHub/tranquility-rd
```

```bash
# Enregistrer une fiche avec le sommaire régénéré, seulement si 0 alerte (modèle utilisé pour chaque fiche)
cd ~/Documents/GitHub/tranquility-rd && git pull && node scripts/generer-sommaire.js | tee /dev/stderr | grep -q "0 alertes" && git add fiches/RD_<NOM>_V1.md SOMMAIRE.md && git commit -m "Fiche R&D : <nom> (<statut>)" && git push
```

---

## Pièges découverts

- [LABO R&D] Le sommaire branché au projet, vieux de trois jours seulement, avait cinq fiches de retard sur le dépôt : la règle « plus de 7 jours » ne suffit pas → en début de séance SETI, comparer le nombre de fiches lu par le script (ou le dernier commit du labo) avec celui du sommaire du projet, et faire « Sync now » à la fin de chaque séance.
- [JARVIS / SETI] La case « Déjà vu » a été remplie à partir de recherches partielles dans le sommaire : Strix, pertinent pour Floorplan, est passé inaperçu → lire le sommaire complet, section REJETÉ comprise, avant de rédiger les tris flash.
- [JARVIS / lecture web] La lecture d'une page de dépôt GitHub par l'outil web renvoie la page entière, bien au-delà de la limite demandée, et l'API anonyme est épuisée dès la première requête → lire le README via raw.githubusercontent.com et la dernière version via la page /releases/latest (date dans l'attribut datetime), jamais la page complète du dépôt.

---

## Prochaines étapes

1. Session TANDEM prévue le 03/11/2026 à 12h (D209) : rendez-vous SETI spécial sur le multi-agents, puis session stratégique.
2. Lancer un premier test du labo (0 EN TEST, 7 À TESTER) : Hex est le plus court (30 minutes) ; trancher l'ordre entre Hex et Floorplan.
3. Au lancement du test Floorplan : vérifier d'abord que la copie de RENDEZVOUS ne contient aucun fichier de secrets.
4. Rattrapage de consignation toujours ouvert : la session du 31/10 (montage assisté par IA) n'est pas au Plan Directeur.
5. À la prochaine révision du skill `seti` : remplacer la règle de fraîcheur « 7 jours » par la comparaison des comptes de fiches.

---

*Session 03/11/2026 · Tranquility Suite — SETI · Mac Maison*
