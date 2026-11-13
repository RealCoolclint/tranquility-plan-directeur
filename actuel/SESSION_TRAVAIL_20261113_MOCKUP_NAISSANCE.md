# Session de travail — 13 novembre 2026
## Tranquility Suite — Du Projet Simulation à MOCKUP

*Session de conception (Bloc A stratégique) · aucun code d'app modifié · Plan Directeur V5.139 → V5.140 · Carnet V82 → V83*

---

## Chantiers traités

### Instruction du « Projet Simulation »
Proposition R&D rédigée hors session : application macOS de simulation d'éclairage photographique en studio 3D, sur le modèle de SET A LIGHT 3D (Elixxier), avec photométrie, caméra virtuelle et rendu Blender. Réponse en sept points (compréhension, acceptation avec réserves, positionnement, faisabilité, dépendances, charge, prochaine étape). Réserves posées : destination (un concept d'app va dans `concepts/`, D181, pas dans le labo R&D), vocabulaire de statut propre à la proposition, pile React/TypeScript/Tauri étrangère à la flotte. Construction écartée de Gemini (critère de sortie D188). Charge estimée à 40-60 sessions. Synergie relevée avec PAYLOAD (le parc réel de la Cellule comme bibliothèque).

### Pivot vers la logistique des studios
PRÉSIDENCE précise que l'outil serait personnel, puis réoriente : la Cellule sait éclairer, le vrai besoin est d'anticiper les configurations et le matériel qu'elles immobilisent. Cas terrain récent : Studio A passé en V2 (manque de clamps, de rotules, emprunts au Studio B), totem étendu d'un second ATEM Extreme (câbles puisés dans plusieurs réserves), pieds lumière immobilisés par le décor. Le besoin s'élargit à un manuel vivant des studios, lisible par toute l'équipe : l'outil redevient un outil d'équipe.

### Naissance de MOCKUP
Arbitrage de structure (module de PAYLOAD ou app sœur), naming en cinq salves, devise en trois temps (*IMAGINARI / FINGERE*, *SCIRE / SAPERE*, puis variations), note de concept rédigée ouverte et validée.

---

## Décisions actées

- **D254** — Le Projet Simulation est abandonné : ni dans la Suite, ni en outil personnel. SET A LIGHT 3D reste une inspiration (plan vu de dessus, configurations sauvegardées, comparaison).
- **D255** — MOCKUP est une app distincte de la Suite, outil d'équipe, sœur de PAYLOAD, reliée par un sas ; elle lit les données de PAYLOAD et ne les recopie jamais (Loi 2). En projet, sans phase.
- **D256** — PAYLOAD se conçoit d'abord et sert de modèle ; MOCKUP est recadré une fois le périmètre de PAYLOAD tracé et décidé. Aucun chantier MOCKUP avant.
- **D257** — Nom : MOCKUP. Devise : *EX IMAGINE VERITAS* (« De l'image naît la vérité »), en duo avec *NIHIL IGNOTUM* de PAYLOAD. Note de concept `concepts/TRANQUILITY_MOCKUP_NOTE_CONCEPT_V1.md`, statut en réflexion.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `TRANQUILITY_MOCKUP_NOTE_CONCEPT_V1.md` | Note de concept (repo `tranquility-plan-directeur`, `concepts/`) | ✅ validée, à pousser |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_140.md` | Plan Directeur (D254 → D257, flotte n° 25, ligne PAYLOAD, ressources, Carnet V83) | ✅ à pousser |
| `CARNET_PIEGES_V83.md` | Carnet de pièges (+5) | ✅ à pousser |
| `SESSION_TRAVAIL_20261113_MOCKUP_NAISSANCE.md` | Ce récap | ✅ à pousser |

Écarts mécaniques par rapport au brouillon validé de la note : le nom de fichier est aligné sur celui d'AUTOPILOT (`TRANQUILITY_MOCKUP_NOTE_CONCEPT_V1.md` au lieu de `TRANQUILITY_CONCEPT_MOCKUP.md`, Loi 2) et l'en-tête porte les numéros D254 → D257. Aucun changement de fond.

---

## Pièges découverts

- Proposition d'app rédigée hors session (vocabulaire, pile, destination étrangers à la Suite) → la confronter à `concepts/` (D181), aux statuts de la Suite et à la pile de la flotte avant de l'instruire.
- L'objet demandé (simulateur) n'était pas le besoin (logistique) → demander un cas terrain récent avant toute estimation.
- Naming en cinq salves → poser l'époque et le registre attendus avant la première.
- API GitHub anonyme tentée au lieu d'un clone du dépôt public (récidive du jour) → `git clone --depth 1`, ou demander le fichier à Martin pour un dépôt privé.
- `cut -c` sur de l'UTF-8 → sortie rejetée par l'outil ; lire les extraits par Python.

---

## Prochaines étapes

1. Aucune action MOCKUP avant la conception de PAYLOAD (D256).
2. À la session de conception PAYLOAD : répondre à la question du petit matériel (clamps, rotules, câbles, pieds) dans le board Monday « Liste Matériel », et mentionner l'app sœur MOCKUP et le sas dans la documentation de PAYLOAD.
3. Session de recadrage de MOCKUP une fois PAYLOAD tracé : type d'app, sas technique, périmètre (studios seuls ou kits Reportage et Mojos), format des blueprints face à la règle « schémas = Mermaid » du 17/10, forme du « pas de côté » sans clé API payante, phase.
4. Au recadrage : patch, splash, animation d'ouverture (D64) et préfixe de codes d'erreur à réserver au registre.

---

*Session 13/11/2026 · Tranquility Suite · MOCKUP · Mac non précisé*
