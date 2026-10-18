# Protocole — Fin de session Tranquility Suite
## Et protocole d'ouverture symétrique

*Version 2.1 — 18 octobre 2026*
*Remplace intégralement la V2.0 (9 juillet 2026). Réécriture complète, aucun patch — conformément à la règle de méthode sur les documents fondateurs. Apports de la V2.1 (D165, décision PRÉSIDENCE) : cadre de clôture fermé, récap poussé sur GitHub, documents `.md` écrits directement par JARVIS.*

---

## Ce qui change par rapport à la V1.0

La V1.0 reposait sur un circuit fragile : téléchargement du Plan Directeur depuis Claude → Hazel route le fichier vers `~/Downloads/Markdowns/Tranquility files/` → commande Terminal `sleep 3` pour absorber le délai → copie + commit + push. Ce circuit imposait de régénérer les documents fondateurs en entier à chaque fois, avec un risque de perte sur les fichiers volumineux, et une checklist manuelle de ressources projet Claude à tenir à jour à la main.

**Décision actée (D52, 08/07/2026) :** ce circuit est abandonné. Remplacé par un patch rédigé par JARVIS, appliqué directement par Cursor dans les fichiers réels du repo `tranquility-plan-directeur`, diff affiché avant écriture. **GitHub redevient l'unique source de lecture en ouverture de session** — la double copie dans les ressources projet Claude n'est plus le mécanisme de vérité.

**Précision V2.1 (18/10/2026, rappel de PRÉSIDENCE) :** dans D52, le mot « patch » désigne ce que Martin relit (le diff), jamais la méthode d'écriture. Les documents fondateurs sont toujours des réécritures complètes, depuis le texte intégral lu sur GitHub (règle de méthode du 24/06/2026), jamais depuis la mémoire de session.

**Piège découvert en mettant en œuvre D52 :** un diagnostic basé sur un `git log` local sans `git fetch` préalable a produit une fausse alerte de 13 versions de retard. Toujours `git fetch` avant de comparer une version locale à la version distante.

**Piège découvert le 09/07/2026 (à l'origine de cette réécriture) :** D52 avait acté le passage en V2.0, mais ce document lui-même — celui qui décrit *comment* exécuter le protocole — était resté en V1.0 dans les ressources projet Claude. La décision existait dans le Plan Directeur, l'opérationnel n'avait pas suivi. Détecté en session Cowork le jour même, en comparant la version des ressources projet Claude (V5.75 du Plan Directeur) à la version réelle sur GitHub (V5.79) — un écart de 4 versions invisible tant que personne ne va vérifier contre la source réelle. Cette réécriture referme la boucle.

---

## Vue d'ensemble — les livrables de fin de session

Systématiquement, sans qu'on ait à le demander :

1. **Récapitulatif `.md` de la session** — poussé à la racine de `tranquility-plan-directeur`, nommé `SESSION_TRAVAIL_AAAAMMJJ_[APP]_[SUJET].md`, dans le même commit que le Plan Directeur
2. **Plan Directeur mis à jour** — nouvelle version réécrite en entier par JARVIS (jamais un patch) dans le repo `tranquility-plan-directeur`, diff affiché et validé par Martin avant commit
3. **Carnet de Pièges mis à jour** — si de nouveaux pièges ont été découverts, même logique que le Plan Directeur, mais repo privé (voir contrainte plus bas)
4. **Prompt de continuation** — contient l'intégralité du récap, pas une référence à celui-ci (voir pourquoi plus bas)

---

## Cadre de clôture fermé (D165 — 18/10/2026)

**Pourquoi :** le 18/10/2026, la clôture a dérivé en une chaîne de prompts Cursor, chaque rapport rouvrant une correction. Rien ne figeait le périmètre de la clôture. Ce cadre le fige.

**Ouverture.** Quand la clôture commence, JARVIS annonce : « Clôture ouverte : 4 livrables, 1 passe de correction ». La liste est alors figée.

**Les 4 livrables, dans cet ordre :**
1. Récap `.md`
2. Plan Directeur : nouvelle version, réécriture complète
3. Carnet de Pièges : nouvelle version, réécriture complète (si de nouveaux pièges ont été découverts)
4. Prompt de continuation, en dernier parce qu'il embarque tout le reste

**Aucun ajout.** Aucun cinquième livrable ne s'invite en cours de route.

**Une seule passe de correction.** Après le diff de la nouvelle version du Plan, JARVIS trie : ce qui bloque la clôture (corrigé, une seule fois) et le reste. Pas de seconde passe, même si un nouveau constat apparaît.

**Tout le reste est une dette.** Elle tient en une ligne dans la section « Dettes » du prompt de continuation. Elle n'est jamais corrigée en séance.

**Un état, un seul endroit.** Dans le Plan, l'état d'un chantier s'écrit dans une seule cellule. Les copies existantes sont traitées en dette, jamais à chaud.

**Fin.** La clôture est terminée quand les cases sont cochées, que le Plan et le récap sont commités et poussés, et que le prompt de continuation est remis. Ensuite, plus aucune modification de fichier dans la session.

---

## Plan Directeur — nouveau circuit (D52)

Le Plan Directeur vit uniquement dans le repo `tranquility-plan-directeur` (branche `main`). Il n'est plus téléchargé depuis Claude ni copié à la main.

**Méthode :**
1. JARVIS lit le texte intégral de la version actuelle directement depuis GitHub (`raw.githubusercontent.com/RealCoolclint/tranquility-plan-directeur/main/[FICHIER]`) — jamais depuis une copie locale ou des ressources projet Claude qui pourraient être en retard
2. JARVIS réécrit le document en entier à partir de ce texte intégral (nouvelles décisions D-xx, mise à jour de la roadmap, nouveaux pièges) — jamais un patch, jamais de la mémoire de session
3. Le diff entre l'ancienne et la nouvelle version est affiché à Martin avant tout commit (le diff sert à relire ; le fichier livré reste une réécriture complète)
4. JARVIS écrit la nouvelle version complète dans le repo (nouveau fichier `TRANQUILITY_PLAN_DIRECTEUR_V5_XX.md`), grâce à son accès en écriture au repo cloné dans son environnement. Les documents `.md` ne passent plus par Cursor, qui reste l'outil du code des apps
5. Validation humaine avant commit — la méthode de préparation change, la validation reste entière

**Commit et push :** après la validation humaine du diff, JARVIS commite et pousse lui-même (Plan Directeur et récap dans le même commit). Côté Mac de Martin, un seul geste, dans un bloc Terminal séparé :

```bash
cd ~/Documents/GitHub/tranquility-plan-directeur && git pull
```

**Secours** (si l'accès en écriture de JARVIS est indisponible), commande de commit à lancer sur le Mac :

```bash
cd ~/Documents/GitHub/tranquility-plan-directeur && git add . && git commit -m "Plan Directeur V5.XX — [sujet]" && git push
```

---

## Carnet de Pièges — même logique, contrainte différente

Le Carnet de Pièges vit dans le repo privé `tranquility-carnet-pieges`. **Contrainte technique :** un repo privé n'est pas lisible via une URL `raw.githubusercontent.com` sans authentification — le fetch direct que JARVIS peut faire sur le Plan Directeur ne fonctionne pas ici.

**Méthode adaptée :**
- Sur un Mac où `gh` est authentifié (Maison, Bureau) : `gh api repos/RealCoolclint/tranquility-carnet-pieges/contents/[FICHIER] --jq '.content' | base64 -d`
- En session Cowork (comme celle-ci, sans accès Terminal réel au Mac de Martin) : JARVIS ne peut pas lire le Carnet en direct — Martin doit coller ou uploader le contenu si une vérification est nécessaire en cours de session
- Le récap de fin de session reste le point d'entrée normal pour les nouveaux pièges — pas besoin de relire tout le Carnet à chaque fois, seulement d'y ajouter

---

## Session recap `.md` — poussé sur GitHub, règle de portabilité (D165)

Le récap est poussé à la racine de `tranquility-plan-directeur`, avec le Plan Directeur, dans le même commit (GitHub est l'unique source de vérité). Les ressources projet Claude peuvent en garder une copie, sans valeur de preuve. **Pourquoi :** les ressources projet Claude ne sont pas une source fiable de vérité en temps réel — elles peuvent prendre plusieurs sessions de retard (constaté aujourd'hui, 4 versions d'écart sur le Plan Directeur), et en environnement Cowork spécifiquement, le dossier de ressources est un instantané figé au moment de sa synchronisation, pas une copie vivante.

**Conséquence actée :** le prompt de continuation ne doit jamais se contenter de renvoyer au récap ("voir le récap de la session du X") — il doit reprendre l'intégralité des décisions et livrables de la session, en clair, dans le message lui-même. C'est ce qui a permis de vérifier aujourd'hui, malgré des ressources projet Claude en retard, que le récap collé en ouverture de session était fiable — la vérification s'est faite contre GitHub directement, pas contre les ressources.

---

## Protocole d'OUVERTURE de session (nouveau — symétrique à la clôture)

En début de toute session Tranquility Suite, dans cet ordre :

1. **Lire le prompt de continuation** fourni par Martin — première approximation de l'état du chantier
2. **Vérifier contre GitHub, pas contre les ressources projet Claude** : fetch direct du Plan Directeur (`raw.githubusercontent.com/RealCoolclint/tranquility-plan-directeur/main/[dernier fichier connu]`) pour confirmer la version réelle et croiser les décisions récentes (D-xx) avec ce que dit le prompt de continuation
3. **Les ressources projet Claude servent de fond historique uniquement** (fiches produit, design reference, manifeste, specs stables) — jamais comme preuve de "où on en est aujourd'hui"
4. **Carnet de Pièges** : lu depuis les ressources projet Claude ou collé par Martin si une entrée précise doit être vérifiée — pas de fetch direct possible (repo privé)
5. **Confirmer le Mac actif** (Maison / Bureau / Studio) avant toute commande Git/Terminal
6. **Signaler tout écart** entre le prompt de continuation et la version GitHub avant de commencer le travail — jamais silencieusement choisir une source

---

## Règles inchangées depuis la V1.0

- Le récap `.md` → poussé sur GitHub avec le Plan Directeur, dans le même commit (modifié en V2.1, D165 ; la V1.0 disait « jamais pushé »)
- Les documents fondateurs sont toujours des réécritures complètes, jamais des patchs (règle non négociable, rappelée par PRÉSIDENCE le 18/10/2026)
- Une commande Terminal Git est toujours dans un bloc séparé du prompt Cursor
- Le nom de fichier du Plan Directeur suit toujours `TRANQUILITY_PLAN_DIRECTEUR_V5_XX.md`

---

*Protocole Fin de Session · Tranquility Suite · V2.1 · 18 octobre 2026*
*V2.0 (9 juillet 2026) : réécrite en session Cowork suite à la question de Martin sur la cohérence entre protocole d'ouverture et protocole de clôture (D52). V2.1 : cadre de clôture fermé, récap poussé sur GitHub, documents `.md` appliqués par JARVIS (D165).*
