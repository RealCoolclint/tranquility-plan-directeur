# Session de travail — 13 novembre 2026
## Tranquility Suite — SETI, tri de six liens

*Type de session : Autre — séance SETI courte, ouverte directement par des liens collés (démarrage V2.1 non déroulé) · Mac Maison · Plan Directeur V5.138 → V5.139 · Carnet V81 → V82*

---

## Chantiers traités

### Tri flash de six liens
Six dépôts GitHub collés sans commentaire : Floorplan, Local Code (Draw Things), Claude-BugHunter, cinecode, image-blaster, ffmpeg-skill. Lecture des sources sur clone superficiel (README, licence, CHANGELOG, dernier changement, versions), sans rien installer ni exécuter ; l'API GitHub anonyme était saturée. Les six propositions de statut ont été validées telles quelles par PRÉSIDENCE.

### Écriture des fiches au labo (`tranquility-rd`)
- Quatre fiches courtes (cinecode, Local Code, Claude-BugHunter, image-blaster) puis la fiche complète d'ffmpeg-skill, avec son protocole de test, relues et validées une par une.
- Fiches livrées en téléchargement, copiées dans `fiches/` par commande Terminal (au lieu d'un prompt Cursor qui aurait recopié cinq fiches).
- Ligne d'Historique ajoutée à la fiche Floorplan par Cursor (version 0.8.0 constatée, statut inchangé).
- Enregistrement en un seul commit avec le sommaire régénéré, conditionné à « 0 alertes » (`87cc6f3`).

### Contrôle de fraîcheur du catalogue
Le générateur a lu 75 fiches quand JARVIS en annonçait 69 : le sommaire branché au projet datait du 03/11. Vérification sur le dépôt : aucune piste EN TEST (la phrase de la fiche ffmpeg-skill est juste), six fiches créées depuis le 03/11, dont deux voisines des pistes du jour. Fiches cinecode et Local Code complétées pour citer Bang Motion et AnythingLLM, puis enregistrées avec le sommaire régénéré (`80c6b76`).

---

## Décisions actées

- ffmpeg-skill À TESTER : test dans `~/RD-tests/ffmpeg-skill/` sur le Mac Maison, dépôt cloné en version 3.8.1 sans installation (l'installeur officiel écrit dans le dossier des skills de Claude, partagé), copie d'une interview française de 10 à 20 minutes ; cinq critères de réussite validés (aucun mot coupé, 9:16 sans visage coupé, niveau sonore conforme, timeline ouverte dans Premiere avec les coupes au bon endroit, zéro donnée sortie et zéro euro).
- cinecode EN RÉSERVE : se compare avec HyperFrames et Bang Motion au bilan du test HyperFrames.
- Local Code EN RÉSERVE : se compare avec AnythingLLM le jour où le besoin d'IA hors ligne ou le prototype Ollama arrive.
- Claude-BugHunter REJETÉ : outil d'expert en tests d'intrusion ; le besoin de la Suite est couvert par Floorplan.
- image-blaster REJETÉ d'office : règle 13 (clés World Labs et FAL payantes).
- Une correction de fiche faite le jour même de sa création ne reçoit pas de ligne d'Historique.
- Aucune décision d'architecture : pas de D-number.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `fiches/RD_FFMPEG_SKILL_V1.md` | Fiche complète avec kit de test (À TESTER) | ✅ `87cc6f3` |
| `fiches/RD_CINECODE_V1.md` | Fiche courte (EN RÉSERVE) | ✅ `87cc6f3`, `80c6b76` |
| `fiches/RD_LOCAL_CODE_V1.md` | Fiche courte (EN RÉSERVE) | ✅ `87cc6f3`, `80c6b76` |
| `fiches/RD_CLAUDE_BUGHUNTER_V1.md` | Fiche courte (REJETÉ) | ✅ `87cc6f3` |
| `fiches/RD_IMAGE_BLASTER_V1.md` | Fiche courte (REJETÉ) | ✅ `87cc6f3` |
| `fiches/RD_FLOORPLAN_V1.md` | Ligne d'Historique | ✅ `87cc6f3` |
| `SOMMAIRE.md` | Régénéré deux fois : 75 fiches, 0 alerte | ✅ `80c6b76` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_139.md` | Document fondateur | 🟡 À pousser |
| `CARNET_PIEGES_V82.md` | Carnet de pièges (+5) | 🟡 À pousser |
| Ce récap | Récap | 🟡 À pousser |

État du labo : 75 fiches — 0 EN TEST, 9 À TESTER, 33 EN RÉSERVE, 2 ADOPTÉ, 31 REJETÉ.

---

## Commandes Terminal produites

```bash
# Copier les fiches téléchargées dans le labo, après contrôle de leur heure
cd ~/Documents/GitHub/tranquility-rd && git pull && ls -l ~/Downloads/Markdowns/RD_{FFMPEG_SKILL,CINECODE,LOCAL_CODE,CLAUDE_BUGHUNTER,IMAGE_BLASTER}_V1*.md && cp ~/Downloads/Markdowns/RD_{FFMPEG_SKILL,CINECODE,LOCAL_CODE,CLAUDE_BUGHUNTER,IMAGE_BLASTER}_V1.md fiches/ && git status --short
```

```bash
# Enregistrer plusieurs fiches avec le sommaire régénéré, seulement si 0 alerte
cd ~/Documents/GitHub/tranquility-rd && node scripts/generer-sommaire.js | tee /dev/stderr | grep -q "0 alertes" && git add fiches/RD_<NOM>_V1.md SOMMAIRE.md && git commit -m "Fiches R&D : ..." && git push && git log -1 --oneline
```

```bash
# Lire l'état réel du labo : chiffres, fiches du mois, pistes EN TEST
cd ~/Documents/GitHub/tranquility-rd && sed -n '7,16p' SOMMAIRE.md && grep -H "^date_fiche: 2026-11" fiches/*.md && grep -l "^statut: en-test" fiches/*.md
```

---

## Pièges découverts

- [LABO R&D / SETI] Sommaire du projet du 03/11 en retard sur le dépôt, tri flash écrit dessus, écart vu après le commit (récidive) → avant un tri flash, comparer le compte du Plan public au sommaire du projet, et demander les chiffres du dépôt s'ils diffèrent.
- [LABO R&D] Le tri flash d'ffmpeg-skill avait raté l'export de timeline et la liste française des « euh » → relire outils, prérequis et confidentialité avant toute fiche À TESTER.
- [JARVIS / lecture web] API GitHub anonyme saturée dès le premier appel → clone superficiel et `git ls-remote --tags`.
- [SYSTÈME / Hazel] Fichier pas encore rangé quand la commande l'a cherché → relancer quelques secondes plus tard, garder `ls -l` avant `cp`.
- [MÉTHODE / Plan] Section et ligne du Carnet restées sur V80 dans la V5.138 → chercher « CARNET_PIEGES_V » avant de remettre un Plan.

---

## Dettes et points ouverts

- « Sync now » sur les sources du projet (sommaire et Carnet), avant la prochaine conversation.
- Test ffmpeg-skill sans date : à lancer en séance dédiée, deux questions à trancher ce jour-là (quelle interview, quel niveau sonore de référence pour la Cellule).
- Rien d'autre de neuf ; les dettes CAPCOM restent celles du récap du 13/11 au matin.

---

## Prochaines étapes

1. Test ffmpeg-skill, séance dédiée sur le Mac Maison (premier test réel du labo depuis claude-video-vision).
2. CAPCOM : sous-étape 2.6 (glisser-déposer), suite du Lot 2.
3. Audit Surveyor complet vers le 20/11.

---

*Session 13/11/2026 · Tranquility Suite — SETI · Mac Maison*
