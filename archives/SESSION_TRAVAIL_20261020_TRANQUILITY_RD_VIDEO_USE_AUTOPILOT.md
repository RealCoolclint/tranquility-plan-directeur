# Session de travail — 20 octobre 2026 (après-midi)
## Tranquility Suite — Labo R&D : video-use · Concept AUTOPILOT

*Session courte — veille (labo R&D) et conception · Mac Maison (martinpavloff) · compte Claude Team, mode C (D177)*
*Postes actifs : R&D · BENCHMARK · SÉCURITÉ · NAVIGATION · MÉMOIRE en clôture*

---

## Chantiers traités

### Évaluation de video-use (`browser-use/video-use`)
Brief d'évaluation soumis par PRÉSIDENCE pour AUTOPILOT. Dépôt cloné (`--depth 1`, dernier commit du 08/10/2026) et code lu sans installation ni exécution : 6 scripts Python, `SKILL.md`, tests limités au rendu, MIT, version 0.1.0.

Constats [vérifié 20/10] :
- La transcription passe obligatoirement par ElevenLabs Scribe : clé payante, audio des rushes envoyé dans le cloud, aucun autre moteur prévu.
- Les décisions de montage (hésitations, reprises, choix des prises) sont entièrement confiées au LLM de l'agent. Seules les règles de précision sont codées (coupe aux frontières de mots, rembourrage, fondus de 30 ms, sous-titres en dernier).
- L'EDL est un JSON maison : ni CMX3600, ni FCP XML, ni OTIO. Aucune sortie vers Premiere, le résultat est un MP4 fini.
- Briques réutilisables hors Claude Code : `render.py` (rendu et calage du SRT), `pack_transcripts.py`, `timeline_view.py`, `grade.py`.

Comparaison des trois stratégies (adoption, extraction, inspiration) : inspiration recommandée, avec `render.py` comme référence de lecture, sans fork.

### Fiche `RD_VIDEO_USE_V1`
Montrée à PRÉSIDENCE et validée avant écriture, déposée par copie de fichier (plutôt que par Cursor, pour éviter toute recopie fautive), contrôlée (en-tête, `git status`), commitée et poussée. Elle propose un test de la méthode greffé sur le prototype AutoClip : extrait de 5 à 10 min, transcription locale, coupes justifiées, timeline importée dans Premiere, critères chiffrés à confirmer.

### Note de concept AUTOPILOT
Fiche idée « AutoPilot » de PRÉSIDENCE confrontée aux documents fondateurs. Trois signaux d'alarme :
1. Authentification et préférences via Launcher : contredit D1 et D5.
2. Guidance présenté comme moteur de « recommandations éditoriales » : le nom désigne la vérification d'intégrité des backups (Document Fondateur), Loi 2.
3. MVP de cinq modules : trop large pour un premier jalon.

Option A retenue par PRÉSIDENCE : note de concept corrigée, statut « en réflexion », sans fiche produit avant les tests. Note relue et validée telle quelle, puis rangée dans un nouveau dossier `concepts/` du repo `tranquility-plan-directeur` (option A également).

### Clôture V2.1
Plan Directeur V5.121 produit par insertions scriptées depuis le texte complet de V5.120 (clone du dépôt public), contrôlé par `diff`. Carnet V63 = V62 (lue via les ressources du projet après « Sync now ») + un bloc ajouté par script sur le Mac, jamais retapé. Constat de NAVIGATION : ni AUTOPILOT ni la décision AutoClip du 19/10 ne figuraient dans le Plan V5.120, et la fiche AutoClip n'est pas déposée.

---

## Décisions actées

- video-use : abandon comme brique (règle 13, confidentialité des rushes, pas de sortie Premiere). Idée retenue : pipeline transcription → transcript compact → coupes justifiées → EDL → rendu ou export → contrôle, à reconstruire en local pour AUTOPILOT.
- D181 : les notes de concept d'app vivent dans `tranquility-plan-directeur/concepts/` ; AUTOPILOT y entre « en réflexion ».
- AUTOPILOT, corrections actées : Launcher jamais requis (lecture du profil comme les autres apps) ; Guidance retiré, le besoin éditorial devient une question ouverte ; premier jalon = Smart Cut, Smart Captions et export d'une timeline importable dans Premiere ; architecture de travail = moteur indépendant plutôt que plugin UXP en premier ; « Open source » requalifié en question ouverte (la Suite est interne).
- Passage d'AUTOPILOT en fiche produit seulement après le go/no-go AutoClip, le test de la méthode du pipeline et la validation de PRÉSIDENCE ; patch, splash et animation entreront alors dans la fiche.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `tranquility-rd/fiches/RD_VIDEO_USE_V1.md` | Fiche R&D, verdict abandon | ✅ Poussée, commit `c3e9112` |
| `tranquility-plan-directeur/concepts/TRANQUILITY_AUTOPILOT_NOTE_CONCEPT_V1.md` | Note de concept, en réflexion | ✅ Poussée, commit `2689031` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_121.md` | Plan Directeur, D181 | 🟡 À pousser (rotation `actuel/` → `archives/`) |
| `CARNET_PIEGES_V63.md` | Carnet, V62 + bloc de 4 pièges | 🟡 À construire et pousser sur le Mac (rotation) |
| `SESSION_TRAVAIL_20261020_TRANQUILITY_RD_VIDEO_USE_AUTOPILOT.md` | Ce récap | 🟡 À pousser avec le Plan |

---

## Commandes Terminal produites

```bash
# Dépôt de la fiche R&D par copie, puis contrôle
cd ~/Documents/GitHub/tranquility-rd && git pull && cp ~/Downloads/Markdowns/RD_VIDEO_USE_V1.md fiches/RD_VIDEO_USE_V1.md && head -12 fiches/RD_VIDEO_USE_V1.md && git status --short
```

```bash
# Création du dossier concepts/ et dépôt de la note
cd ~/Documents/GitHub/tranquility-plan-directeur && git pull && mkdir -p concepts && cp ~/Downloads/Markdowns/"Tranquility files"/TRANQUILITY_AUTOPILOT_NOTE_CONCEPT_V1.md concepts/ && ls concepts/ && git status --short
```

---

## Pièges découverts

- `git fetch --deepen` sur un dépôt lourd dépasse la limite de 5 min de la session → date du dernier commit du clone superficiel, mesures d'historique sur le Mac.
- Décisions restées en mémoire sans document fondateur (AUTOPILOT, AutoClip) → vérifier à chaque clôture.
- Fiche externe qui réutilise un nom de la flotte et réintroduit une dépendance à Launcher → confronter au Document Fondateur et à D1/D5.
- Fiche du labo citée avant d'être déposée (`RD_AUTOCLIP_V1`) → vérifier sa présence, sinon écrire « fiche à déposer ».

---

## Dettes et points ouverts

- Fiche `RD_AUTOCLIP_V1` à déposer : la fiche video-use et la note AUTOPILOT la citent déjà.
- Script Surveyor (`radar.sh`) : vérifier au prochain audit que le nouveau dossier `concepts/` ne le gêne pas (sans effet attendu, il lit `actuel/`).
- Seuils du test de la méthode (90 % des hésitations, temps de correction divisé par deux) à confirmer par PRÉSIDENCE avant le test.
- Activité réelle de video-use (rythme des commits) non mesurée, sans enjeu après l'abandon.

---

## Prochaines étapes

1. Déposer la fiche `RD_AUTOCLIP_V1` dans `tranquility-rd`.
2. Reprendre RENDEZVOUS : refonte mobile du lobby et de l'écran principal (D180).
3. Session dédiée : prototype AutoClip + test de la méthode du pipeline sur la même interview, dossier isolé, sans dépense.
4. Restent ouverts au labo : prototype HyperFrames (D161), session REA (D159), skill `tranquility-design-reference` côté Cursor.

---

*Session 20 octobre 2026 (après-midi) · Tranquility Suite, labo R&D et concept AUTOPILOT · Mac Maison (martinpavloff)*
