# Session de travail — 9 septembre 2026
## Google Flow — pivot Brand OS / Brand Brain · Mac Bureau

---

## Contexte d'ouverture

Reprise après la session du 4 septembre 2026 (lancement de Google Flow comme agence créa centralisée, décisions D83→D91). Deux trous identifiés en ouverture :
- Le Plan Directeur (vu en V5.90 dans les ressources projet) et le Carnet de Pièges (vu en V40) étaient périmés — les vraies dernières versions sur GitHub étaient V5.94 et V43. Récupérées via `cat` direct sur les repos locaux (Mac Bureau).
- Les décisions D83→D91 de la session Google Flow n'avaient jamais été intégrées au Plan Directeur V5.94 malgré son écriture après cette session.

---

## Décision principale — pivot architectural

Après un premier test réel (moodboard patch READBACK, 2 directions sur 3 retenues par Flow), Martin constate que Google Flow est un bon **exécutant** visuel mais pas un **cerveau stratégique de marque** — pas de mémoire, pas de jugement de cohérence dans le temps.

Deux pistes croisées avant de trancher :
- Un prompt de recherche envoyé à ChatGPT sur les IA/services gratuits capables de jouer ce rôle de "Brand Brain"
- Recherche web menée par JARVIS sur le même sujet, convergeant vers la même architecture

**Architecture retenue** : Brand OS (mémoire documentaire, appartient à la Suite) → Brand Brain (JARVIS, remplaçable par nature) → Flow (studio d'exécution pur, ne décide plus rien). Principe non négociable acté : la mémoire de marque ne vit jamais dans un outil de génération.

Une seconde proposition de ChatGPT (6 skills de design détaillés, structure `Brand Strategy / Visual Identity / Art Direction / Visual Critique / Motion Direction / Flow Prompting`) a été explicitement challengée plutôt qu'adoptée telle quelle — Tranquility Suite a déjà son ADN de marque écrit (Brief Initial, Design Reference, Comité Externe Design), le besoin réel est un système qui **fait respecter** cet ADN, pas qui **l'invente**. Résultat : 6 skills différents, plus adaptés — 2 fusionnés/allégés, 1 nouveau (Decision Archivist) créé pour combler un vrai trou.

---

## Décisions actées (D83 → D95)

| D# | Statut | Essence |
|---|---|---|
| D83 | APPROVED, 04/09 | Flow = agence créa unique de la Suite (session du 4/09) — **révisé par D92** |
| D84 | APPROVED, 04/09 | GIFs sous droits (Transporter/BackUpFlow) restent en l'état, hors périmètre Flow |
| D85 | PROPOSED, non tranché | Duplication des avatars (3 emplacements) — décision à prendre plus tard |
| D86 | APPROVED, 04/09 | Icônes de plateforme reconnues comme catégorie DA jamais spécifiée |
| D87 | PROPOSED, non tranché | 3 découpages d'audience non réconciliés — décision PRÉSIDENCE à venir |
| D88 | APPROVED, 04/09 | Chantier 0 Charte DA verrouillé — moodboard obligatoire avant production |
| D89 | APPROVED, 04/09 | Brief Initial Google Flow rédigé — **section YOUR ROLE révisée par D95** |
| D90 | APPROVED, 04/09 | Consignes patch animé actées |
| D91 | APPROVED, 04/09 | Agent DA Marque + Agent Directeur Communication formalisés |
| **D92** | **APPROVED, 09/09** | **Pivot architectural — Brand OS + Brand Brain + Flow exécutant, révise D83 (Loi 3, tracé)** |
| **D93** | **APPROVED, 09/09** | **Création `TRANQUILITY_BRAND_OS.md`** |
| **D94** | **APPROVED, 09/09** | **Création `TRANQUILITY_BRAND_BRAIN_SKILLS.md` — 6 skills** |
| **D95** | **APPROVED, 09/09** | **Correction du rôle affiché de Flow dans Charte DA + Brief Initial** |

---

## Livrables de la session

- `TRANQUILITY_BRAND_OS.md` (nouveau) — gouvernance, architecture, carte des sources (aucun contenu dupliqué)
- `TRANQUILITY_BRAND_BRAIN_SKILLS.md` (nouveau) — 6 skills : VISUAL_IDENTITY_GUARDIAN, ART_DIRECTION, FLOW_PROMPTING, VISUAL_CRITIQUE, BRAND_QA, DECISION_ARCHIVIST — chacun avec INPUTS/METHOD/OUTPUTS/CHECKLIST/FAILURE MODES/ESCALATION, aucune règle en dur
- `TRANQUILITY_CHARTE_DA_GOOGLE_FLOW.md` (révisé) — Chantier 0, Flow requalifié en atelier d'exécution
- `TRANQUILITY_BRIEF_INITIAL_GOOGLE_FLOW.md` (révisé) — section "YOUR ROLE" du prompt Flow lui-même
- `CARNET_PIEGES_V44.md` — nouveau piège méthode documenté
- `TRANQUILITY_PLAN_DIRECTEUR_V5_95.md` — intégration D83→D95, table des ressources et note de version mises à jour

Tous poussés et vérifiés sur GitHub (commits `8c8ec71`, `c9ae522`, `90cea60`, `b966ab5`, `2c85f11`).

---

## Nouveau piège méthode (Carnet V44, BLOC 1)

Un heredoc bash (`cat > fichier << 'EOF' ... EOF`) contenant lui-même un bloc de code entre triple-backticks (schéma, exemple) referme silencieusement le heredoc au premier bloc de ce type rencontré à l'intérieur — la commande s'exécute sans aucune erreur visible, mais le fichier n'est jamais créé, ou créé tronqué. Découvert sur `TRANQUILITY_BRAND_OS.md` (jamais créé au premier essai), détecté uniquement par vérification explicite (`cat`) avant commit. Règle retenue : tout schéma à l'intérieur d'un heredoc s'écrit en texte indenté simple, jamais en bloc de code imbriqué — et toujours vérifier par `cat` après toute création de fichier via heredoc contenant un diagramme.

---

## Reste ouvert — non traité cette session

- Les 5 chantiers restants de la Charte DA Google Flow (1. READBACK, 2. icônes de plateforme, 3. uniformisation des patches existants, 4. documents & communication — bloqué par D87 non tranché, 5. duplication des avatars — bloqué par D85 non tranché)
- Chantier READBACK (saccades de défilement iPad, D78) — nécessite Mac Maison + iPad + câble USB
- Migration Launcher → RENDEZVOUS (D77) — conception non cadrée
- `FICHE_PRODUIT_RENDEZVOUS_V1.md` toujours en V1.6, dette documentaire croissante (R5-bis/R6/R7/D79→D82 absents)
- RENDEZVOUS R8 (polish, tests multi-devices, anti-spam, lancement) — seul chantier restant avant V1

---

## Prompt de continuation — à coller en ouverture de la prochaine session

```
On reprend le travail sur la Tranquility Suite.

Dernière session (9 septembre 2026, Mac Bureau) : pivot architectural sur le rôle
de Google Flow. Après un premier test réel décevant (Flow bon exécutant, pas
stratège de marque), nouvelle architecture actée — Brand OS (mémoire documentaire,
TRANQUILITY_BRAND_OS.md) + Brand Brain (JARVIS, 6 skills de raisonnement,
TRANQUILITY_BRAND_BRAIN_SKILLS.md) + Flow rétrogradé en studio d'exécution pur.
Décisions D92→D95 actées, D83→D91 (session du 4/09) intégrées rétroactivement au
Plan Directeur. Charte DA et Brief Initial Google Flow corrigés en conséquence.
Plan Directeur à V5.95, Carnet de Pièges à V44 (nouveau piège : heredoc bash +
triple-backticks imbriqués = fichier jamais créé, sans erreur visible).

Aujourd'hui on continue par : [DÉCRIS CE QUE TU VEUX FAIRE]

Candidats naturels si tu n'as pas d'idée précise :
- Chantier 1 de la Charte DA (READBACK — patch, animé, splash, toujours en dette D64)
- RENDEZVOUS R8 (dernier chantier avant V1)
- Trancher D85 (duplication avatars) ou D87 (réconciliation des 3 découpages
  d'audience) pour débloquer les chantiers 4 et 5 de la Charte DA
```

---

*Session close · Tranquility Suite · 9 septembre 2026*
