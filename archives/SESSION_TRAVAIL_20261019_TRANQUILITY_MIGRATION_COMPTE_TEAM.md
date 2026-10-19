# [TRANQUILITY] Récap de session — Migration vers le compte Claude Team de L'Étudiant

**Date :** lundi 19 octobre 2026 (après-midi, après la session RENDEZVOUS du matin), Mac Maison
**Postes actifs :** MISSION CONTROL · MÉMOIRE · INFRASTRUCTURE · SÉCURITÉ · NAVIGATION. Session d'infrastructure : aucune ligne de code d'app modifiée.
**Statut de ce fichier :** à pousser à la racine de `tranquility-plan-directeur` avec le Plan V5.118, par la commande de secours (mode C, D177).

---

## 1. Résultat en une phrase

JARVIS tourne désormais sur le compte Claude Team de L'Étudiant, avec sa mémoire, ses 12 skills, ses connecteurs et ses sources de vérité rétablis, et un test de continuité réussi à partir du prompt de l'ancien compte (trois écarts, tous identifiés).

## 2. Déroulé

1. **Inventaire des manques.** Comparaison des 257 fichiers du projet avec les documents cités dans les récaps : Plan Directeur en V5.89 dans les ressources (V5.117 sur GitHub), Carnet en V40 (V59), fiches R&D, `TRUE_ME.md`, fiche CODEX, documents Google Flow absents ; une vingtaine de doublons (`__2_`, `claude_`).
2. **Mémoire.** Export JSON de l'ancien compte (66 fichiers, 8 projets). Import limité au projet J.A.R.V.I.S, seul périmètre où ce compte peut écrire : 16 fichiers, en français, sans identifiants techniques (clés n8n, adresse Supabase, n° de workflow) ni états périmés. Arbitrages de PRÉSIDENCE : Audrey Weiss = N+2 ; orthographe « Antoine Vassas » ; documents fondateurs = réécritures complètes, jamais de patch.
3. **Skills.** Les 12 skills (audit-completude, braquage, context-loader, jarvis-methode, llm-council, multi-perspective-council, point-hebdo-cellule-video, session-recap, tranquility-rd, tranquility-surveyor, true-me, ui-ux-pro-max) étaient déjà actifs sur le compte via un plugin. Un upload de `jarvis-methode` a remplacé le skill du même nom sans créer de doublon (contenu identique, seule différence : guillemets autour de la description).
4. **Connecteurs.** Sur un compte Team, un propriétaire doit activer un connecteur au niveau de l'organisation avant qu'un membre puisse le brancher ; le propriétaire est l'IT de L'Étudiant. Demande groupée envoyée (GitHub, Firecrawl, Google Drive/Docs/Sheets/Slides, Claude in Chrome) ; connecteurs activés le jour même. L'Intégration GitHub de claude.ai donne la lecture des repos depuis les fichiers du projet, pas l'écriture.
5. **Sources de vérité.** `tranquility-plan-directeur` et `CODEX` (publics) sont lus en direct par clone depuis la session. `tranquility-carnet-pieges`, `true-me` et `tranquility-rd` (privés) sont reliés au projet par l'Intégration GitHub ; les copies manuelles du Carnet V59 et de `TRUE_ME.md` ont été retirées.
6. **Fiche produit CODEX.** Elle n'a jamais existé : de V5.99 à V5.104, chaque mise à jour CODEX la cite en « reste à traiter ». Dette documentaire, pas une perte de migration.
7. **Test de continuité.** Prompt de continuation de l'ancien compte confronté à la mémoire, au Plan V5.117, au Carnet V59 et au repo RENDEZVOUS : les 10 commits du lot 4, les versions de cache, les lignes 142-143 de `carousel-data.js`, `PATCH_EDGES` codex à 95 % et l'absence d'`ambiance-codex-noir.mp4` sont confirmés. Trois écarts : écriture directe dans les repos impossible sur ce compte ; Vision Produit sans source sur GitHub ; statut de Google Flow.

## 3. Décisions actées

- **D176 — Compte de travail.** JARVIS travaille sur le compte Claude Team de L'Étudiant à partir du 19/10/2026. L'IT de L'Étudiant en est le propriétaire : toute activation de connecteur passe par une demande groupée à l'IT.
- **D177 — Mode C (amende D165 sur un point).** Depuis ce compte, JARVIS n'a aucun accès aux dossiers du Mac ni droit d'écriture sur GitHub : il produit les documents complets dans son environnement et les remet en téléchargement ; Martin les place dans le repo et lance la commande de secours (add, commit, push, avec le cd complet). Le reste de D165 est inchangé (4 livrables, 1 passe de correction, réécritures complètes). À réévaluer si un connecteur GitHub en écriture devient disponible.
- **D178 — Sources de vérité sur le compte Team.** Repos publics : lus en direct par clone en début de session. Repos privés : reliés au projet par l'Intégration GitHub. Aucune copie manuelle d'un document vivant dans les ressources du projet.

Google Flow : pas de décision. D92 fait foi (Flow n'est plus l'agence créa, il reste un exécutant possible). PRÉSIDENCE penche vers l'abandon pur et simple : question ouverte, à arbitrer à froid (tour de table du Council), avec l'enjeu des 7 patches d'affectation (D146).

## 4. Livrables produits

| Élément | Nature | État |
|---|---|---|
| Mémoire du projet J.A.R.V.I.S (16 fichiers) | Mémoire Claude | ✅ |
| 12 skills actifs | Compte | ✅ |
| Connecteurs (Firecrawl, famille Google, Gmail, Google Agenda, Figma, Microsoft 365, monday.com) | Compte | ✅ |
| Repos privés reliés au projet (carnet, true-me, tranquility-rd) | Projet | ✅ |
| Demande d'activation des connecteurs à l'IT | E-mail | ✅ Envoyé, traité |
| Ce récap | Récap | 🟡 À pousser |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_118.md` | Document fondateur | 🟡 Livrable 2 |
| `CARNET_PIEGES_V60.md` | Document fondateur | 🟡 Livrable 3 |

## 5. Pièges découverts

- Compte Team : un connecteur absent de la liste n'est pas un bug → un propriétaire de l'organisation doit d'abord l'activer ; vérifier qui est propriétaire avant de chercher plus loin.
- L'Intégration GitHub de claude.ai n'apparaît pas comme un outil dans la conversation → elle s'utilise depuis les fichiers du projet, en lecture seule.
- Depuis la session, un repo privé non relié renvoie « could not read Username » au clone → le relier au projet par l'Intégration GitHub.
- Un skill peut être déjà installé par un plugin sans figurer dans les skills uploadés → vérifier les skills chargés dans la session avant tout réupload ; deux versions qui diffèrent de 2 octets = guillemets autour de la description.
- Une copie glissée dans les ressources du projet est une photo qui vieillit (Plan V5.89 et Carnet V40 face à V5.117 et V59) → relier la source plutôt que copier.
- La mémoire d'un compte ne suit pas un changement de compte, et un projet ne peut écrire que dans sa propre mémoire → importer l'export JSON projet par projet, en filtrant identifiants et états périmés.

## 6. Dettes (une ligne chacune)

- Instruction permanente Google Flow à retirer des instructions du projet (périmée depuis D92, quelle que soit la décision sur Flow).
- Question ouverte : abandon pur et simple de Google Flow, et outil de remplacement pour D146.
- Vision Produit absente du repo du Plan (V1.0 dans les ressources, « V2 » dans le Plan) : devient bloquant pour le démarrage.
- Ménage des fichiers du projet : une vingtaine de doublons et de copies périmées, à remplacer par les sources GitHub (session dédiée).
- Mémoire des 7 autres projets de l'ancien compte à importer depuis chacun d'eux (corriger « Bassas » en « Vassas » dans Cerveau de la cellule vidéo).
- Projets perso (Perimeter, maison connectée) sur un compte dont l'IT est propriétaire : à réexaminer.
- `FICHE_PRODUIT_CODEX_V1.md` jamais écrite (dette depuis le 22/09).
- Claude in Chrome : branchement non vérifié ; Adobe et Canva, déjà en panne sur l'ancien compte : utilité à trancher.
- Protocole de clôture V2.1 : à réécrire avec D177 à sa prochaine version.

## 7. Prochaines étapes

1. Reprendre la piste 1 de RENDEZVOUS au point exact du prompt de continuation (mesure du cercle de `patch-codex.mp4`).
2. Session de ménage des fichiers du projet.
3. Arbitrage Google Flow.

---

*Session du 19 octobre 2026 (après-midi) · Tranquility Suite · Mac Maison · compte Claude Team L'Étudiant*
