# COMITÉ EXTERNE — DESIGN
## Tranquility Suite · Trois voix externes consultées pour faire évoluer le design

---

> Ce document complète `TRANQUILITY_SUITE_DESIGN_REFERENCE.md`. Il ne le remplace pas, il l'enrichit. Les trois voix ci-dessous sont des skills publics consultés pour challenger nos choix visuels — leur contenu original est pensé pour React/Tailwind/Next.js ; ce document ne retient que ce qui est réellement applicable à notre stack HTML/CSS/JS vanilla et à notre système de tokens (`tranquility-core.css`).
>
> **Sources d'origine :**
> - Emil Kowalski — `emilkowalski/skills` (design engineering, animation)
> - Impeccable — `pbakaus/impeccable` (audit UI complet, craft de production)
> - Taste-skill — `Leonxlnx/taste-skill` (anti-slop, dials de variance/mouvement/densité)
>
> **Usage :** JARVIS consulte ce document avant tout prompt Cursor touchant au visuel, en complément (jamais en remplacement) de la Design Reference et du Workflow Captif. En cas de conflit entre une recommandation externe et une règle déjà actée par Council interne, **la règle interne prime toujours** — ce comité conseille, il ne décide pas. PRÉSIDENCE tranche.

---

## > EMIL KOWALSKI — Le sens de l'animation

*Design engineer, ex-Vercel, équipe web de Linear. Sa voix : sobre, précise, hostile à la décoration gratuite. Sa question systématique : "pourquoi est-ce que ça anime ?"*

### Principes retenus

**La fréquence d'usage détermine si on anime du tout.**

| Fréquence d'usage | Décision |
|---|---|
| 100+ fois/jour (raccourcis clavier, actions répétées) | Aucune animation. Jamais. |
| Plusieurs fois/jour (hover, navigation) | Réduire au minimum ou supprimer |
| Occasionnel (modales, tiroirs, notifications) | Animation standard |
| Rare / première fois (onboarding, formulaires, célébration) | On peut se faire plaisir |

→ **Application directe RENDEZVOUS :** l'inscription est un acte *rare/première fois* pour chaque utilisateur. C'est exactement la catégorie où Emil dit "on peut ajouter du delight" — ça valide objectivement notre transition cinématique prévue pour le passage vitrine → page d'inscription.

**Toute animation doit répondre à une question : pourquoi celle-ci anime ?**
Raisons valables : cohérence spatiale (d'où vient un élément, où il repart), indication d'état, explication, retour de confirmation, éviter un changement brutal. "Ça fait classe" ne suffit pas si l'élément est vu souvent.

**Règles d'easing :**
- Élément qui entre ou sort → `ease-out` (démarre vite, ressenti comme réactif)
- Élément qui se déplace/se transforme à l'écran → logique différente, à éviter le `ease-in` qui paraît mou
- Jamais de rebond/élastique — **cohérent avec notre Design Reference déjà actée**

**Format de revue (utile pour nos audits) :** toujours présenter les corrections motion sous forme de tableau Avant/Après/Pourquoi, jamais en liste plate.

### Ce qu'on écarte
Les références à des librairies (Framer Motion, GSAP) ne nous concernent pas — on reste en CSS transitions/keyframes vanilla.

---

## > IMPECCABLE — Le sens du métier

*Système d'audit et de craft complet. Sa voix : exigeante, exhaustive, orientée production réelle. Sa hantise : le détail invisible qui casse la confiance.*

### Principes retenus

**Contraste — non négociable.**
Texte de corps ≥ 4.5:1 contre le fond. Texte large (≥18px ou gras ≥14px) ≥ 3:1. Le piège n°1 : du gris clair "pour l'élégance" sur fond clair teinté — illisible en pratique. *(Notre dark theme nous protège globalement de ce piège, mais à vérifier sur les textes secondaires/tertiaires de RENDEZVOUS.)*

**Typographie :**
- Largeur de ligne de corps de texte : 65–75 caractères max
- Ne jamais marier deux polices "presque pareilles" (deux sans-serif géométriques) — soit un contraste net (serif+sans), soit une seule famille en plusieurs graisses. *(Chez nous : Lato seul, donc non concerné — mais à garder en tête si on introduit une seconde police un jour.)*
- Plafond des titres : éviter le sur-dimensionnement qui "crie" plutôt que "design"

**Layout :**
- Varier l'espacement pour créer un rythme — ne pas tout caler sur une seule unité
- Les cartes (`cards`) sont la réponse facile — à utiliser seulement quand l'élévation visuelle communique une vraie hiérarchie. Jamais de cartes imbriquées dans des cartes.
- Flexbox pour une dimension, Grid pour deux dimensions

**Mouvement :**
- Le mouvement doit être pensé dès la conception, pas ajouté après coup
- Ne jamais animer les propriétés CSS de layout (`width`, `height`, `top`) — seulement `transform` et `opacity`
- Courbes d'accélération exponentielles en sortie (`ease-out-quart/quint/expo`) — **aucun rebond, aucun élastique** (convergence totale avec notre règle)
- **`prefers-reduced-motion` n'est pas optionnel** — chaque animation a besoin d'une alternative (fondu instantané ou transition coupée). *(Point que nous n'avons pas encore traité sur RENDEZVOUS — à ajouter au prochain prompt Cursor sur l'animation de transition.)*
- Les animations d'entrée groupées (stagger) sont légitimes ; le vrai problème est le réflexe uniforme — une seule animation d'apparition collée sur tout sans distinction

**Interaction :**
- Les menus déroulants en `position: absolute` dans un conteneur `overflow:hidden` se retrouvent coupés — utiliser `position: fixed` ou l'API native pour sortir du contexte d'empilement

**Le test anti-générique :**
Si quelqu'un peut regarder l'interface et dire "ça, c'est fait par une IA" sans hésiter, c'est raté. Vérification à deux niveaux : d'abord, est-ce qu'on peut deviner le thème/palette juste depuis la catégorie du produit ? Ensuite, plus subtil — est-ce qu'on peut deviner la famille esthétique même en sachant qu'on a évité le premier réflexe ?

### Bans absolus pertinents pour nous
- **Bordure latérale colorée** (`border-left` épaisse comme décoration sur cartes/alertes) — jamais intentionnel
- **Texte en dégradé** (`background-clip:text` + gradient) — purement décoratif, jamais porteur de sens
- **Glassmorphism par défaut** — rare et volontaire, ou rien
- **Grilles de cartes identiques** répétées à l'infini — à vérifier sur notre `.fleet-grid` (13 cartes actuellement toutes au même format — pas un problème en soi si la donnée justifie l'uniformité, mais à garder en tête si on enrichit le contenu de la flotte)
- **Texte qui dépasse son conteneur** — toujours tester les titres à toutes les tailles d'écran

### Ce qu'on adapte
Le système de commandes (`craft`, `audit`, `polish`...) suppose des scripts Node exécutés en local (`context.mjs`, `palette.mjs`). On n'installe pas ces scripts — on garde l'esprit des commandes comme grille mentale que JARVIS applique manuellement :
- **Avant un nouveau chantier visuel** → équivalent de `shape` : on pose le plan avant de coder (déjà notre pratique avec le mini-plan)
- **Sur l'existant** → équivalent d'`audit`/`critique` : on vérifie contraste, hiérarchie, accessibilité avant de livrer
- **En fin de chantier** → équivalent de `polish` : dernière passe avant de considérer terminé

---

## > TASTE-SKILL — Le sens de la singularité

*Système à curseurs, pensé pour éviter "l'esthétique IA par défaut". Sa voix : directe, presque clinique, obsédée par la différenciation. Sa question systématique : "est-ce que n'importe qui aurait pu deviner ce choix ?"*

### Les trois dials — traduits en grille de calibrage maison

Plutôt que d'adopter les valeurs numériques 1-10 telles quelles (pensées pour des briefs marketing variés), on les retient comme **trois questions de calibrage** à se poser à chaque nouvelle interface :

| Dial original | Notre traduction | Position actuelle RENDEZVOUS |
|---|---|---|
| `DESIGN_VARIANCE` (1=symétrie parfaite, 10=chaos créatif) | Est-ce que notre mise en page ressemble à un template par défaut ? | Plutôt bas — centré, classique. Acceptable pour une vitrine institutionnelle sobre, mais la page d'inscription dédiée est l'occasion d'oser un peu plus |
| `MOTION_INTENSITY` (1=statique, 10=cinématique) | Le mouvement est-il à la hauteur de l'intention du moment ? | Bas partout, sauf le moment d'inscription qu'on vient de décider de pousser haut — cohérent avec la règle Emil "rare = on peut se faire plaisir" |
| `VISUAL_DENSITY` (1=aéré, 10=dense) | Est-ce qu'on respecte l'esprit "agence légère, pas intranet lourd" de RENDEZVOUS ? | Bas — cohérent avec la promesse produit actée ("simple, efficace, sécurisé") |

→ **Lecture utile :** notre vitrine est volontairement sobre (variance et densité basses) — ce n'est pas un défaut, c'est cohérent avec notre identité institutionnelle. Le seul endroit où on a une vraie marge de manœuvre pour "oser" sans trahir l'ADN, c'est le mouvement, sur des moments rares.

### Principes universels retenus (indépendants de la stack)

**Anti-réflexes par défaut à vérifier sur nos prochains chantiers :**
- Dégradés violets/bleus automatiques ("AI purple") — on n'en a pas, notre `--accent` bleu est un choix assumé et cohérent, pas un réflexe
- Héros centré par défaut — c'est notre cas sur RENDEZVOUS ; acceptable ici car la marque institutionnelle EST le message (le skill lui-même prévoit cette exception pour les briefs "manifeste/annonce")
- Cartes identiques répétées — déjà noté côté Impeccable

**Contraste et lisibilité des boutons (mandatory) :**
- Vérifier qu'aucun bouton n'a un texte illisible sur son propre fond — pertinent vu notre bug `--accent` récent, qui aurait pu créer exactement ce problème
- **Aucun doublon d'intention de CTA sur une même page** — un seul libellé par intention (ex : pas "Se connecter" + "Accéder à mon compte" + "Entrer" sur la même page). *(Notre `SE CONNECTER` / `S'INSCRIRE` respecte déjà ce principe — deux intentions clairement distinctes, pas de doublon.)*
- Le texte d'un bouton doit tenir sur une seule ligne au format desktop — sinon raccourcir le libellé plutôt que rétrécir le bouton

**Densité de contenu :**
- Une page d'accueil/vitrine vit sur la première impression, pas la lecture complète — couper sans pitié ce qui n'est pas essentiel
- Les longues listes méritent un autre composant qu'une simple liste à puces au-delà de 5 éléments — pertinent si notre grille de flotte (13 apps) continue de grossir

### Ce qu'on écarte entièrement
Tout le bloc technique (React/Next.js, Tailwind v4, Motion/Framer, shadcn/ui, Phosphor Icons, polices comme Geist/Satoshi/Cabinet Grotesk, bento grids, marquees, génération d'images produit automatique) ne s'applique pas à notre stack vanilla et à notre identité visuelle déjà figée (Lato, dark theme uniquement, zéro emoji). On retient les *intentions*, jamais les *implémentations React*.

---

## SYNTHÈSE OPÉRATIONNELLE — Grille de vérification rapide

À appliquer par JARVIS avant tout prompt Cursor touchant au visuel, en complément de la Design Reference :

- [ ] **Fréquence (Emil)** — Cet élément est-il vu souvent ? Si oui, animation minimale ou nulle. Si rare, on peut soigner.
- [ ] **Pourquoi anime-t-on (Emil)** — Y a-t-il une raison autre que "ça fait joli" ?
- [ ] **Reduced motion (Impeccable)** — A-t-on prévu l'alternative `prefers-reduced-motion` ?
- [ ] **Contraste (Impeccable + Taste)** — Le texte est-il lisible sur tous les fonds, y compris les boutons ?
- [ ] **Cartes justifiées (Impeccable)** — Si on utilise des cartes, est-ce que l'élévation porte un vrai sens ?
- [ ] **Un seul CTA par intention (Taste)** — Pas de doublon de bouton pour la même action
- [ ] **Test du regard extérieur (Impeccable)** — Est-ce que ça ressemble à un template, ou est-ce que ça porte notre identité ?
- [ ] **Cohérence avec l'existant (Tous)** — Est-ce qu'on reste fidèle à Lato, dark theme, zéro emoji, `var(--accent)` et au reste de la Design Reference ?

---

*Document fondateur — Tranquility Suite · Comité Externe Design · 19 juin 2026*
*Consulté en complément de : Design Reference · Vision Ancrage · Workflow Captif · Agence Tranquility*
*Sources : emilkowalski/skills · pbakaus/impeccable · Leonxlnx/taste-skill — synthèse et adaptation vanilla CSS/JS par JARVIS, validée par Martin Pavloff*
