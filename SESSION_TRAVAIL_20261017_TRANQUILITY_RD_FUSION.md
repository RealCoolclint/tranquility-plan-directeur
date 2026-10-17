# Session de travail — 17 octobre 2026
## Tranquility Suite — Laboratoire R&D : fusion des veilles

*Hybride : arbitrage stratégique (un seul repo) puis exécution documentaire*

---

## Chantiers traités

### Arbitrage du recoupement labo R&D / veilles
Le labo `tranquility-rd` (5 fiches, 16/10) recoupait `TRANQUILITY_VEILLE_OUTILS.md` (05/07/2026, 7 projets, 4 niveaux de lecture) et `TRANQUILITY_VEILLE_IA.md` (14/06/2026, 5 familles). Martin tranche : un seul repo pour la veille, l'analyse et la consignation des outils et solutions IA. Seule la R&D migre ; les décisions d'architecture restent hors du labo.

### Contrôle des versions des outils externes
Pas de connecteur dédié aux versions : l'API GitHub (appelée depuis le Mac, la session cloud n'ayant accès qu'aux dépôts rattachés) donne activité, archivage, licence et dernière release. Constats du 17/10/2026 : Ollama v0.40.5 (référence « 0.19+ » périmée) ; `whisper-node-addon` sans activité depuis 07/2025 ; dépôt Meta de Demucs archivé (suite : `adefossez/demucs`) ; Moondream 3 en BSL 1.1 (dépôt Apache-2.0) ; SDK Python officiel d'Apple (`python-apple-fm-sdk`) ; Tauri 3 en alpha 5 ; ntfy v2.31.1.

### Migration en fiches (12)
7 fiches issues de la veille outils (ntfy prototype ; Tauri veille ; Typebot, Paperless-ngx, Logto, DocuSeal, Dub abandon, idée retenue conservée) et 5 issues de la veille IA (Whisper, Ollama, Demucs, Apple Foundation Models, Moondream, toutes en veille). Chaque fiche montrée à Martin avant écriture.

### README du labo
Règles 11 et 12, sections « Lecture d'une piste » (quatre niveaux de lecture, sauvés de la veille outils), « Revue du labo » et « Règle d'intégration » (4 critères, sauvés de la veille IA).

### Veilles en V2, Plan Directeur V5_111, Workflow Assist
`VEILLE_OUTILS` devient un renvoi ; `VEILLE_IA` ne garde que le tableau des points d'entrée IA (seule copie existante), SIGNAL et l'historique de juin. Plan Directeur V5_111 dérivé de la V5_110 par script (8 lignes modifiées, 5 ajoutées, contrôle par diff). `TRANQUILITY_WORKFLOW_ASSIST.md` reçoit la consultation du labo dans l'automatisme 1.

---

## Décisions actées

- D156 : un seul repo R&D (`tranquility-rd`) pour la veille, l'analyse et la consignation des outils open source et des solutions IA.
- Un seul vocabulaire de verdict : abandon · veille · prototype · adopter. La famille IA se porte par `famille-…` dans `mots_cles`.
- Un verdict « abandon » conserve l'idée retenue (section « Intérêt » + `conditions_reouverture`).
- D157 : un seul déclencheur, consultation du labo au mini-plan ou à la demande ; la recherche web automatique de démarrage est supprimée ; revue IA du mois à la demande, audit semestriel en janvier et juillet.
- Le tableau des points d'entrée IA reste dans `TRANQUILITY_VEILLE_IA.md` (nom de fichier inchangé : `IA_STRATEGIE` et `SERVICES_TIERS` le citent).
- Un document volumineux se versionne par insertions scriptées à partir du texte GitHub, contrôlées par `diff`, jamais retapé.
- ntfy : fiche en « prototype », chantier I8 laissé inchangé (« chantier ouvert »).

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `tranquility-rd/fiches/` : 7 fiches outils (commit `7c60658`) | fiches | ✅ pushé |
| `tranquility-rd/fiches/` : 5 fiches IA (commit `8d2ca83`) | fiches | ✅ pushé |
| `tranquility-rd/README.md` : règles 11-12, revue du labo, règle d'intégration (`0dc6202`) | doc | ✅ pushé |
| `tranquility-rd/README.md` : Lecture d'une piste (`5950e16`) | doc | ✅ pushé |
| `TRANQUILITY_VEILLE_OUTILS.md` V2.0 | doc fondateur | 🟡 écrit, à pousser |
| `TRANQUILITY_VEILLE_IA.md` V2.0 | doc fondateur | 🟡 écrit, à pousser |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_111.md` | doc fondateur | 🟡 écrit, à pousser |
| `TRANQUILITY_WORKFLOW_ASSIST.md` (consultation du labo) | skill | 🟡 écrit, à pousser |
| `SESSION_TRAVAIL_20261017_TRANQUILITY_RD_FUSION.md` | récap | 🟡 écrit, à pousser |

---

## Commandes Terminal produites

```bash
# Mettre à jour le dépôt avant d'y pousser
cd ~/Documents/GitHub/tranquility-plan-directeur && git pull && git status
```

```bash
# Pousser les 5 fichiers de la session
git add TRANQUILITY_PLAN_DIRECTEUR_V5_111.md TRANQUILITY_VEILLE_IA.md TRANQUILITY_VEILLE_OUTILS.md TRANQUILITY_WORKFLOW_ASSIST.md SESSION_TRAVAIL_20261017_TRANQUILITY_RD_FUSION.md && git commit -m "V5.111 : fusion des veilles dans tranquility-rd (D156, D157), veilles en V2, Workflow Assist" && git push
```

---

## Pièges découverts

- [TERMINAL] Un nouveau Terminal repart de `~` → toujours donner `cd ~/Documents/GitHub/[repo] && …` en entier, même quand le Terminal précédent était déjà dans le repo.
- [GITHUB] La session cloud n'a accès à l'API GitHub que pour les dépôts rattachés → interroger l'API publique depuis le Mac (`curl https://api.github.com/repos/…`) pour contrôler versions et archivage.
- [VEILLE] Le tableau des points d'entrée IA n'existait que dans `TRANQUILITY_VEILLE_IA.md` (0 occurrence dans le Plan Directeur) → ne jamais réduire une veille à un renvoi sans vérifier où vit chaque contenu.
- [VEILLE] Références de juin périmées : Ollama « 0.19+ » (v0.40.5), dépôt Meta de Demucs (archivé), moondream2 (Moondream 3, BSL 1.1), binding Whisper (inactif depuis 07/2025).
- [WORKFLOW_ASSIST] Le fichier cite encore `/Volumes/BACKUP PRO/...` (SSD abandonné le 04/07/2026) et son en-tête date du 30/05, alors que le Plan Directeur le note V3 du 08/06 → écart documentaire non traité.
- [LICENCE] Typebot et Dub : GitHub ne classe pas la licence (NOASSERTION) → lire le texte avant tout usage au-delà de l'inspiration.

---

## Prochaines étapes

1. Pousser les 5 fichiers de la session (commandes ci-dessus).
2. Mettre à jour le carnet de pièges (repo `tranquility-carnet-pieges`) avec les entrées des récaps du 16/10 et du 17/10.
3. Trancher les décisions en suspens de PRÉSIDENCE : schémas techniques sous Google Flow ou non ; apps à étudier avec REA ; Claude Code par abonnement ou clé API.
4. Valider ou décliner le prototype HyperFrames (20 à 30 s, 16:9 et 9:16, avant toute installation) ; skill `tranquility-documentation` (manuel ARK) bloqué par l'accès au code d'ARK.
5. Arbitrer SIGNAL (D136 contre le texte de `VEILLE_IA` V2), le verdict de `RD_NTFY_V1` contre I8, et l'écart documentaire de `WORKFLOW_ASSIST`.
6. Mettre à jour le skill `tranquility-rd` : sa liste « fiches existantes au 16/10/2026 » ne cite que 5 fiches sur 17.
7. À la prochaine revue IA : vérifier la publication du framework Foundation Models d'Apple et l'existence d'un pont Node.js.

---

*Session 17/10/2026 · Tranquility Suite — Laboratoire R&D · Mac non précisé*
