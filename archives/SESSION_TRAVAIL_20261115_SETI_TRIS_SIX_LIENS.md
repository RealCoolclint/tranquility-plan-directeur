# Session de travail — 15 novembre 2026
## Tranquility Suite — [SETI] Tri de six liens

*Session courte de tri R&D, ouverte directement par des liens collés · Mac Maison, soir*

---

## Chantiers traités

### Tri flash de six liens
Six dépôts GitHub soumis sans commentaire. Sources lues sur leur dépôt (README, licence, dernière version, activité, archivage), sans rien installer ni exécuter. Sommaire du labo consulté avant le tri (76 fiches au 14/11).

| Piste | Statut | En une phrase |
|-------|--------|---------------|
| ComfyUI | REJETÉ | Atelier de génération d'images, vidéos et sons en briques, GPL-3.0 ; doublon de Google Flow (Loi 2), comme Qwen-Image |
| VideoHighlighter | EN RÉSERVE | Moments forts d'une vidéo brute en local, AGPL-3.0, avec un rapport qui justifie chaque coupe ; à comparer avec AutoClip |
| cogit | EN RÉSERVE | Trace de la demande derrière chaque ligne de code écrite par une IA, MIT ; Claude Code et Codex seulement, pas Cursor |
| OpenWorker | REJETÉ | Collègue IA de bureau ; clé de modèle payante (règle 13), doublon de Claude Cowork |
| Vulture | REJETÉ | Détecteur de code mort, Python seulement ; la Suite est en JavaScript |
| video-scraping-apis | déjà fiché | REJETÉ le 01/11/2026, aucune nouvelle fiche |

### Fiches et enregistrement
Cinq fiches courtes montrées en entier à PRÉSIDENCE, validées, créées par Cursor dans `fiches/`, puis enregistrées en une fois avec le sommaire régénéré : 81 fiches lues, 0 alerte, commit `fc78fa8` poussé sur `main` (repo `tranquility-rd`).

---

## Décisions actées

- Aucune décision nouvelle (pas de D-number) : les cinq statuts proposés par SETI sont validés tels quels par PRÉSIDENCE.
- Idées retenues dans les fiches : le rapport qui justifie chaque coupe (VideoHighlighter), les tâches non finies repérées à la clôture (cogit), les garde-fous en quatre niveaux d'un agent (OpenWorker), la chasse au code mort comme rubrique d'audit Surveyor (Vulture), le graphe de nœuds (ComfyUI).

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `fiches/RD_COMFYUI_V1.md` | Fiche R&D (REJETÉ) | ✅ `fc78fa8` |
| `fiches/RD_VIDEOHIGHLIGHTER_V1.md` | Fiche R&D (EN RÉSERVE) | ✅ `fc78fa8` |
| `fiches/RD_COGIT_V1.md` | Fiche R&D (EN RÉSERVE) | ✅ `fc78fa8` |
| `fiches/RD_OPENWORKER_V1.md` | Fiche R&D (REJETÉ) | ✅ `fc78fa8` |
| `fiches/RD_VULTURE_V1.md` | Fiche R&D (REJETÉ) | ✅ `fc78fa8` |
| `SOMMAIRE.md` du labo | Régénéré, 81 fiches, 0 alerte | ✅ `fc78fa8` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_147.md` | Plan Directeur (entrée de session, ligne des ressources du labo, ligne du récap) | 🟡 à pousser |
| Ce récap | Récap | 🟡 à pousser |

État du labo au 15/11/2026 : 81 fiches, 9 À TESTER, aucune EN TEST, 35 EN RÉSERVE, 3 ADOPTÉ, 34 REJETÉ.

---

## Commandes Terminal produites

```bash
# Mettre le labo à jour et l'ouvrir dans Cursor
cd ~/Documents/GitHub/tranquility-rd && git pull && cursor .
```

```bash
# Régénérer le sommaire et enregistrer les cinq fiches, seulement si 0 alerte
cd ~/Documents/GitHub/tranquility-rd && node scripts/generer-sommaire.js | tee /dev/stderr | grep -q "0 alertes" && git add fiches/RD_COMFYUI_V1.md fiches/RD_VIDEOHIGHLIGHTER_V1.md fiches/RD_COGIT_V1.md fiches/RD_OPENWORKER_V1.md fiches/RD_VULTURE_V1.md SOMMAIRE.md && git commit -m "Fiches R&D : ComfyUI, OpenWorker, Vulture (rejete) ; VideoHighlighter, cogit (en-reserve)" && git push
```

---

## Pièges découverts

Aucun nouveau piège. Carnet inchangé (V89). Constat documentaire corrigé dans le Plan : la ligne des ressources du labo annonçait encore 75 fiches au 13/11 (la fiche `qrcode-generator` du 14/11 n'y était pas comptée).

---

## Prochaines étapes

1. « Sync now » sur les sources du projet J.A.R.V.I.S, pour que SETI voie le sommaire à 81 fiches.
2. Reprendre CAPCOM là où la session du 15/11 l'a laissé : tour de table « Flow, oui ou non ? », puis patch animé et splash.
3. Labo : neuf pistes À TESTER, aucune EN TEST ; ffmpeg-skill reste la plus prête (déclencheur « dès maintenant »).
4. Audit Surveyor complet vers le 20/11 (y verser l'idée de chasse au code mort JavaScript).

---

*Session 15/11/2026 · Tranquility Suite · SETI · Mac Maison*
