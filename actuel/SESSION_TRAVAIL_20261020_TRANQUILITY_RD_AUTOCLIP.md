# Session de travail — 20 octobre 2026 (suite)
## Tranquility Suite — Labo R&D : fiche AutoClip

*Session courte — labo R&D · Mac Maison (martinpavloff) · compte Claude Team, mode C (D177)*
*Postes actifs : MÉMOIRE · NAVIGATION · MISSION CONTROL au démarrage, puis R&D · BENCHMARK · SÉCURITÉ*

---

## Chantiers traités

### Démarrage V2.1
Dépôt public `tranquility-plan-directeur` cloné : Plan V5.121 et récap `SESSION_TRAVAIL_20261020_TRANQUILITY_RD_VIDEO_USE_AUTOPILOT.md` présents dans `actuel/`, Plan déjà poussé (`f1fb8d6`), `concepts/` présent. Carnet : la liste des fichiers du projet ne montrait que l'ancienne copie V59 et la recherche renvoyait d'abord la V62. Vérification sur le Mac : V63 bien poussée (`64d7ff5`), donc vue figée à l'ouverture de la conversation, rien à reconstruire. `radar.sh` lit `actuel/` puis la racine : `concepts/` ne devrait pas le gêner (à confirmer au prochain audit Surveyor).

### Ordre des chantiers
Proposé et validé par PRÉSIDENCE : 1. fiche AutoClip (ferme une référence orpheline), 2. refonte mobile de RENDEZVOUS (D180) dans une conversation `[RENDEZVOUS]` dédiée, 3. session AUTOPILOT (prototype AutoClip + test de la méthode du pipeline).

### Fiche `RD_AUTOCLIP_V1`
L'évaluation du 19/10 datait de l'ancien compte : conversation introuvable, constats perdus, seule la décision restait en mémoire. Plusieurs dépôts portent le nom AutoClip ; PRÉSIDENCE a confirmé `artbyjazi/autoclip` (l'homonyme `zhouxiaoka/autoclip` passe par des API payantes).

Code relu sur clone superficiel (dernier commit du 01/08/2026), sans installation ni exécution [vérifié 20/10] :
- Pipeline : préparation audio → transcription faster-whisper au mot → choix des clips par un LLM (numéros de mots, score, justification) → recadrage vertical qui suit le locuteur → sous-titres incrustés → MP4 (SRT en option).
- MIT, alpha (`0.1.0.dev0`), aucune release, un seul auteur, environ 290 tests ; interface sur `127.0.0.1` seulement.
- Fournisseur par défaut : clé API Anthropic, facturée à part de l'abonnement Claude, donc règle 13. Chemin local Whisper + Ollama disponible : rien ne quitte la machine.
- Ne nettoie pas une interview (pas de retrait des hésitations) et n'exporte aucune timeline Premiere.

Fiche validée par PRÉSIDENCE, déposée par copie, contrôlée (en-tête, `git status`), commitée et poussée : commit `cb6f92c` (repo `tranquility-rd`).

### Clôture V2.1
Plan Directeur V5.122 produit par insertions scriptées depuis le texte complet de V5.121 (clone du dépôt public), contrôlé par `diff` (8 zones modifiées). Carnet V64 = V63 + un bloc de 4 pièges, assemblé sur le Mac, jamais retapé.

---

## Décisions actées

- **D182** : AutoClip = `artbyjazi/autoclip` ; le prototype passe uniquement par le chemin local Whisper + Ollama, sans aucune clé API (règle 13). AutoClip ne couvre pas tel quel le premier jalon d'AUTOPILOT (pas de nettoyage d'interview, pas de timeline Premiere) ; il reste en prototype pour les clips verticaux et sa transcription locale au mot.
- Ordre des chantiers : fiche AutoClip, puis RENDEZVOUS mobile (D180) en conversation dédiée, puis session AUTOPILOT.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `tranquility-rd/fiches/RD_AUTOCLIP_V1.md` | Fiche R&D, verdict prototype | ✅ Poussée, commit `cb6f92c` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_122.md` | Plan Directeur, D182 | 🟡 À pousser (rotation `actuel/` → `archives/`) |
| `CARNET_PIEGES_V64.md` | Carnet, V63 + bloc de 4 pièges | 🟡 À assembler et pousser sur le Mac (rotation) |
| `SESSION_TRAVAIL_20261020_TRANQUILITY_RD_AUTOCLIP.md` | Ce récap | 🟡 À pousser avec le Plan |

---

## Commandes Terminal produites

```bash
# Vérifier la présence du Carnet V63 et identifier le Mac
cd ~/Documents/GitHub/tranquility-carnet-pieges && scutil --get ComputerName && git pull && ls actuel/ && git --no-pager log --oneline -3
```

```bash
# Dépôt de la fiche par copie, puis contrôle
cd ~/Documents/GitHub/tranquility-rd && git pull && cp ~/Downloads/Markdowns/RD_AUTOCLIP_V1.md fiches/RD_AUTOCLIP_V1.md && head -12 fiches/RD_AUTOCLIP_V1.md && git status --short
```

```bash
# Commit et push de la fiche
cd ~/Documents/GitHub/tranquility-rd && git add fiches/RD_AUTOCLIP_V1.md && git commit -m "Fiche R&D : AutoClip (verdict prototype, chemin local Ollama)" && git push && git --no-pager log --oneline -1
```

---

## Pièges découverts

- Évaluation faite sur l'ancien compte, constats perdus à la migration → consigner chaque évaluation en fiche le jour même ; sinon relire le code, jamais reconstituer de souvenir.
- Homonymes GitHub (AutoClip) → faire confirmer l'adresse exacte du dépôt avant de le lire.
- Liste des fichiers du projet et recherche dans les ressources désynchronisées → croiser les deux et vérifier sur le Mac avant d'alerter.
- Version du Carnet citée à deux endroits du Plan, une seule mise à jour en V5.121 → chercher toutes les occurrences à chaque nouvelle version.

---

## Dettes et points ouverts

- Seuils du go/no-go AutoClip (au moins 3 clips sur 10 jugés publiables, transcription française exploitable, aucun visage coupé, temps acceptable) et du test de la méthode du pipeline (90 % des hésitations, temps de correction divisé par deux) : à confirmer par PRÉSIDENCE avant le test.
- Choix du modèle Ollama et de la taille du modèle Whisper pour le français : à trancher en session AUTOPILOT.
- Contradiction du dépôt AutoClip sur l'accélération Apple Silicon (README contre `pyproject.toml`) : à mesurer pendant le prototype.
- Rythme réel des commits d'AutoClip non mesuré (à faire depuis le Mac si utile).
- `radar.sh` et le dossier `concepts/` : à vérifier au prochain audit Surveyor.
- Ancienne copie `CARNET_PIEGES_V59.md` toujours présente dans les ressources du projet, contraire à D178 : à retirer.
- `PROTOCOLE_FIN_DE_SESSION.md` n'intègre toujours ni D177 ni D179.

---

## Prochaines étapes

1. RENDEZVOUS : refonte mobile du lobby et de l'écran principal (D180), dans une nouvelle conversation `[RENDEZVOUS]`, en commençant par un diagnostic en lecture seule.
2. Session dédiée AUTOPILOT : prototype AutoClip par le chemin Ollama + test de la méthode du pipeline sur la même interview, dossier isolé, zéro dépense, seuils confirmés avant le lancement.
3. Restent ouverts au labo : prototype HyperFrames (D161), session REA (D159), skill `tranquility-design-reference` côté Cursor.

---

*Session 20 octobre 2026 (suite) · Tranquility Suite, labo R&D, fiche AutoClip · Mac Maison (martinpavloff)*
