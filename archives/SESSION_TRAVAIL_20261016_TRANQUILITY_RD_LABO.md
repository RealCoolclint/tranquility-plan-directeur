# Session de travail — 16 octobre 2026
## Tranquility Suite — Laboratoire R&D (repo `tranquility-rd`)

*Type de session : hybride — Bloc A stratégique (audit de 5 idées) puis Bloc B technique (création du repo, des fiches et du skill)*

---

## Chantiers traités

### Audit critique de cinq idées de veille
Cinq projets ont été audités à partir de leurs sources (README, licences, documentation, fichiers de skills et de scripts), sans aucune installation ni exécution : Lathe, HyperFrames, REA (avec le cadrage du laboratoire R&D), billion-context, Anatomy. Chaque affirmation a été classée [vérifié], [déduit] ou [à tester]. Les listings de dossiers GitHub étaient inaccessibles (robots) : les fichiers ont été lus via leurs URL brutes ; le code interne de plusieurs projets n'a donc pas été lu.

### Création du laboratoire R&D
Repo privé `RealCoolclint/tranquility-rd`, cloné dans `~/Documents/GitHub/tranquility-rd`, branche `main`. Socle posé via Cursor : `README.md` (10 règles), `TEMPLATE_FICHE.md` (gabarit avec en-tête YAML qui sert d'index), `fiches/.gitkeep`. Le gabarit a été corrigé après relecture : valeurs sans alignement, commentaires `#` retirés (ils faussaient le grep), consignes déplacées dans un bloc de commentaire HTML placé après l'en-tête, règle des guillemets pour les valeurs contenant `: ` ou `#`.

### Les cinq premières fiches
Rédigées via Cursor à partir des audits, relues, commitées et poussées une par une.

| Piste | Verdict | Idée à retenir |
|-------|---------|----------------|
| Lathe | abandon | L'outil enseigne un sujet, il ne documente pas un outil existant. Sa méthode (citer ou signaler, checkpoints, statut de vérification) est reprise dans un futur skill maison `tranquility-documentation` |
| HyperFrames | prototype | Rendu vidéo déterministe en local ; le critère décisif (ce que lint et check contrôlent de la charte) se teste. Lancement du prototype non validé |
| billion-context | veille | Traite une seule session, pas la mémoire entre sessions ; maturité contradictoire ; mise à jour automatique par défaut |
| Anatomy | veille | Mermaid fait mieux pour l'architecture ; niche étroite en illustration ; gouvernance Google Flow à trancher |
| REA | veille | Inutile quand les sources sont accessibles ; piste possible : auditer nos propres builds Electron ; cibles autorisées uniquement |

### Skill `tranquility-rd`
Skill en deux portes, rédigé et proposé à la sauvegarde : entrée (déposer une idée en fiche, accord de Martin avant toute écriture) et sortie (consultation automatique et discrète au mini-plan de chaque nouveau chantier, plus consultation à la demande).

### Clôture
Lecture du Plan Directeur V5.109 (clone du dépôt public) ; V5.110 produite avec l'entrée du labo.

---

## Décisions actées

- Le labo R&D vit dans un repo dédié et privé, `tranquility-rd`. Pas dans le dépôt du Plan Directeur (déjà chargé).
- Une piste = une fiche Markdown indépendante, nommée `fiches/RD_<NOM>_V1.md`. Aucun registre central : l'en-tête YAML de chaque fiche sert d'index.
- Verdicts possibles : abandon, veille, prototype, adopter. Toute affirmation technique porte un marqueur [vérifié], [déduit] ou [à tester].
- Une piste = un seul fichier, modifié sur place ; chaque évolution ajoute une ligne datée dans « Historique ». `_V2` seulement pour une réévaluation complète, qui remplace la V1.
- Aucune dépendance sans justification écrite dans une fiche et validation de la Présidence ; aucune dépense IA ni installation sans validation explicite ; prototype toujours isolé hors des apps de production.
- Ne jamais analyser un logiciel sans autorisation appropriée (règle 10 du README).
- La consultation du labo est automatique et discrète au mini-plan de chaque nouveau chantier : silence si rien ne correspond, une ou deux lignes si une fiche correspond.
- Verdict initial des cinq pistes : Lathe abandon, HyperFrames prototype, billion-context veille, Anatomy veille, REA veille.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `RealCoolclint/tranquility-rd` (repo privé) | Repo | ✅ |
| `README.md` (10 règles) | Mode d'emploi du labo | ✅ |
| `TEMPLATE_FICHE.md` | Gabarit de fiche | ✅ |
| `fiches/RD_LATHE_V1.md` | Fiche | ✅ |
| `fiches/RD_HYPERFRAMES_V1.md` | Fiche | ✅ |
| `fiches/RD_BILLION_CONTEXT_V1.md` | Fiche | ✅ |
| `fiches/RD_ANATOMY_V1.md` | Fiche | ✅ |
| `fiches/RD_REA_V1.md` | Fiche | ✅ |
| Skill `tranquility-rd` | Skill | 🟡 Rédigé et proposé à la sauvegarde |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_110.md` | Document fondateur | 🟡 Produit, à pousser |
| Ce récap | Récap | 🟡 À pousser |

Commits du repo `tranquility-rd` : `6959b0d` (socle), `86ff699` (Lathe), `0859b9a` (HyperFrames), `0c3b05b` (billion-context), `ac3ef8b` (Anatomy), `ca2cc25` (REA + règle 10).

---

## Commandes Terminal produites

```bash
# Créer le repo privé du labo et le cloner
gh repo create RealCoolclint/tranquility-rd --private --description "Laboratoire R&D Tranquility Suite - fiches de veille" --clone
```

```bash
# Ranger le clone au bon endroit
mv ~/tranquility-rd ~/Documents/GitHub/tranquility-rd
```

```bash
# Ouvrir le repo dans Cursor
cursor ~/Documents/GitHub/tranquility-rd
```

```bash
# Commit type d'une fiche (un fichier à la fois, jamais git add .)
cd ~/Documents/GitHub/tranquility-rd && git add fiches/RD_NOM_V1.md && git commit -m "Fiche R&D : NOM (verdict ...)" && git push
```

```bash
# Contrôle rapide d'un correctif (compte les occurrences)
cd ~/Documents/GitHub/tranquility-rd && grep -c "texte attendu" fiches/RD_NOM_V1.md
```

---

## Pièges découverts

- Un commentaire HTML placé dans le bloc YAML casse l'en-tête (ou devient la valeur du champ) → placer les consignes dans un bloc `<!-- -->` juste après le `---` de fermeture.
- Valeurs YAML alignées par espaces et commentaires `#` laissés dans le gabarit : `grep "verdict: veille"` ne trouve plus rien, ou trouve des faux positifs → un seul espace après les deux-points, aucun commentaire `#`.
- Une valeur YAML qui contient `: ` ou `#` casse l'en-tête → l'écrire entre guillemets doubles.
- Le motif `^` ancre le début de ligne, il ne limite pas à l'en-tête : une ligne du corps qui commence par un nom de champ serait trouvée aussi → à garder en tête à la lecture des résultats.
- Un texte entre chevrons (`<modèle>`) disparaît dans un aperçu Markdown, pris pour une balise HTML → le mettre entre backticks.
- Une coquille dans un prompt Cursor est recopiée telle quelle dans la fiche quand on demande « mot pour mot » → relire le prompt avant de le coller.
- Le fetch web d'un document long ne le restitue pas mot pour mot (limite de citation) → cloner le dépôt public (`git clone --depth 1`) et lire le fichier directement.
- Listings de dossiers GitHub (`tree`) refusés par robots → lire les fichiers via `raw.githubusercontent.com` ; la branche par défaut peut être `master` (billion-context) et pas `main`.
- Les cinq documents joints au projet en début de séance sont arrivés vides côté JARVIS → à revérifier avant la prochaine séance qui en dépend.

---

## Prochaines étapes

1. Arbitrer le recoupement entre le labo R&D et `TRANQUILITY_VEILLE_OUTILS.md` (process de veille open source du 05/07/2026, 7 projets, 4 niveaux de lecture, verdicts adopté / inspiration / signal / écarté) : fusion progressive, cohabitation ou alignement du vocabulaire des verdicts. Loi 2 du Workflow Captif : pas de convention parallèle.
2. Pousser le Plan Directeur V5.110 et ce récap sur `tranquility-plan-directeur`.
3. Trancher la gouvernance Google Flow : les schémas techniques (guides, notices, documentation) relèvent-ils de Flow, ou seulement l'identité et les visuels de marque ? (question ouverte de la fiche Anatomy)
4. Répondre aux deux questions restées sans réponse : quelles apps étudier avec REA (open source ou outils commerciaux) ; Claude Code avec abonnement ou clé API (conditionne le seul chemin vérifié de billion-context).
5. Décider du prototype du skill `tranquility-documentation` (premier cas : le manuel d'ARK). Bloqué par l'accès au code d'ARK.
6. Valider ou décliner le prototype HyperFrames (vidéo fictive de 20 à 30 s, formats 16:9 et 9:16) avant toute installation de Node.js, FFmpeg ou des skills.
7. Mettre à jour `TRANQUILITY_WORKFLOW_ASSIST.md` (la consultation du labo devient une étape du mini-plan) et le carnet de pièges avec les entrées ci-dessus.

---

*Session 16/10/2026 · Tranquility Suite — Laboratoire R&D · Mac utilisé : non précisé*
