# Patch animé — Consignes génériques
## Passage d'un patch statique validé à sa version MP4

*Cellule Vidéo L'Étudiant · 4 septembre 2026*
*Complète `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` §5, qui fixe le format technique mais pas le contenu de l'animation — ce document comble ce trou*

---

## Principe de base

On n'anime jamais un patch depuis zéro. On anime **le patch déjà validé**, tel quel — c'est un passage supplémentaire sur un design acté, pas une nouvelle génération. Si le patch statique n'est pas encore verrouillé, on ne touche pas à sa version animée.

---

## Ce qui bouge

Uniquement les éléments atmosphériques de la scène : étoiles qui scintillent doucement, poussière stellaire ou nébuleuse qui dérive lentement, une lueur ponctuelle qui pulse légèrement (moteur, écran, phare), une fumée ou un panache d'échappement qui ondule. Le choix précis dépend du contenu propre à chaque patch — pas de recette unique, mais toujours dans ce registre.

Le mouvement est **lent, continu, jamais saccadé** — aucun à-coup, aucune coupe brutale. Cohérent avec la règle déjà actée : jamais de rebond élastique, nulle part dans la Suite.

---

## Ce qui ne bouge jamais

- La forme circulaire du badge
- La bordure brodée et le grain du tissu — un tissu ne respire pas
- Le nom de l'app et la devise latine — parfaitement fixes du début à la fin

---

## Format technique (rappel Design Reference §5)

- Fond noir plein, `#0a0f1e` — jamais transparent
- Cadrage carré 1:1, centré sur le patch
- Boucle parfaite : première et dernière image strictement identiques, invisible à l'œil
- Durée : 4 à 8 secondes
- Export MP4, nommage `ambiance-[appkey].mp4`, dans `assets/ambiances/` du repo de l'app

---

## Prompt générique — à adapter pour n'importe quel patch

```
ANIMATED PATCH REQUEST — [APP NAME]

Animate the validated static patch for [APP NAME] into a seamless looping ambiance 
video, following these fixed rules:

WHAT MOVES: only atmospheric elements within the scene — for example, gently 
twinkling stars, slowly drifting stardust or nebula, a soft pulsing glow from a 
single light source, or a faint drifting exhaust plume, whichever fits this specific 
patch's imagery. Motion should be slow, continuous, and subtle — never fast, never 
jittery, never a hard cut.

WHAT NEVER MOVES: the circular badge shape, the embroidered border and fabric 
texture (embroidery doesn't breathe), the app name, and the Latin motto. These stay 
perfectly still throughout.

LOOP: the first and last frame must match exactly for a seamless, invisible loop. 
Duration: 4 to 8 seconds.

FORMAT: solid black background (#0a0f1e), square 1:1 framing centered on the patch, 
export as MP4.

Use [attach the validated static patch] as the exact starting point — do not 
reinterpret the composition, colors, or details. This is an animation pass on an 
already-validated design, not a new generation.
```

---

*Consignes génériques — patch animé · Tranquility Suite · 4 septembre 2026*
*S'applique en complément de : Design Reference §5 · Charte DA Google Flow (chantier 3 — Uniformiser)*
