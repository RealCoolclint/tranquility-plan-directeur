# Tranquility Suite — Protocole « Point d'étape » et « Entretien PRÉSIDENCE »

*Version 1.0 — 28 novembre 2026 · validé par PRÉSIDENCE · Mac Maison*

---

## Principe fondateur — L'imaginaire d'abord

On est des créateurs avant d'être des techniciens. Tout part de l'imaginaire et du monde des idées ; l'ingénierie vient ensuite, pour les servir. La PRÉSIDENCE n'est pas une présidence molle qui valide l'industrialisation de ses premières idées : elle est sollicitée, elle a des idées, elle porte le projet et sa vision d'avenir, comme un patron de la tech.

Conséquences pour JARVIS :
- on rêve **avant** de juger : l'entretien commence par ouvrir, le grill ne vient qu'après ;
- une idée n'est jamais tuée par sa difficulté technique, seulement par l'absence de vrai problème à résoudre ou par un conflit avec le cap ;
- JARVIS apporte lui aussi des idées, y compris audacieuses, à chaque point d'étape ;
- le tiroir n'est pas un cimetière : chaque idée rangée a une date de réexamen.

---

## Partie 1 — Le point d'étape

**Définition :** un état général, précis, méticuleux et vérifié de toute la Suite et de notre méthode, pour décider de la suite. Il s'appuie sur Surveyor (le contrôle technique de la flotte) et sur l'audit de complétude (la check-list de fin de session), mais va au-delà : priorités, calendrier, terrain, méthode, vision.

**Déclencheurs :** « point d'étape », « tour d'horizon », « où on en est ».

**Règle :** pas de conclusion ni de recommandation avant la fin de l'étape 3. Un coup d'œil sur le Plan et quelques récaps n'est pas un point d'étape (erreur du 28/11/2026).

### Étape 0 — Préparation
- Quel Mac ?
- `git pull` de tous les dépôts (commande fournie par JARVIS).
- Accès en lecture au dossier `~/Documents/GitHub`.

### Étape 1 — Collecte (toutes les sources)
1. **Code, dépôt par dépôt :** branche courante, dernier commit et date, travail non commité ou non poussé, branches ouvertes, version affichée de l'app.
2. **Pilotage :** Plan Directeur, **tous** les récaps depuis le dernier point d'étape, Carnet de pièges (entrées récentes), Workflow Assist, catalogues de codes, notes de concept.
3. **Surveyor :** dernier rapport et écarts depuis.
4. **Labo SETI :** pistes EN TEST, pistes qui stagnent.
5. **Mémoire et ressources du projet Claude :** fraîcheur, doublons, documents périmés.
6. **Calendrier :** tournages, présentations, passages au studio, échéances promises.
7. **Terrain (questions à Martin) :** ce que l'équipe utilise vraiment, incidents récents, retours de Thomas et des autres.

### Étape 2 — Analyse (grille fixe)
**Par app :** état déclaré dans le Plan contre état réel du code · dernier mouvement · prochaine étape écrite · bloquants · dettes · écart au cap (Vision Produit, critère Apollo D188/D205) · identité visuelle (patch, splash, animation, D64) · catalogue de codes.

**Transverse :** priorités annoncées contre temps réellement passé · échéances dépassées · sécurité · poids et fraîcheur des documents · cohérence entre apps.

### Étape 3 — Entretien PRÉSIDENCE (voir partie 2)
Placé après l'analyse : JARVIS interroge en connaissant les faits, et la vision de la PRÉSIDENCE façonne l'ordre des chantiers.

### Étape 4 — Restitution (format fixe)
Document daté `points/POINT_ETAPE_AAAAMMJJ.md` dans `tranquility-plan-directeur` :
1. Synthèse en 5 lignes
2. Tableau de la flotte
3. Échéances
4. Alertes (rouge, orange)
5. Écarts écrit / réel
6. Idées de l'entretien et leurs verdicts
7. Ordre des chantiers proposé (logique, constructif, sécurisé)
8. Questions à trancher

### Étape 5 — Arbitrage
Questions posées une par une · chaque décision reçoit un D-number · Plan Directeur mis à jour.

**Durée réaliste :** une demi-session pour les étapes 0 à 2, avant toute présentation.

---

## Partie 2 — L'entretien PRÉSIDENCE

**Deux usages :** étape 3 du point d'étape, ou seul à tout moment (« entretien », « j'ai une idée », « mettons ça au grill »).

**Format :** une vingtaine de minutes, une question à la fois.

### Temps 1 — Ouvrir (sans juger)
1. **État d'esprit :** ce qui enthousiasme, ce qui pèse, ce qui semble dériver.
2. **Vision :** la Suite dans 6 à 12 mois, Apollo, Constellation, Artemis.
3. **Idées en vrac :** tout, sans filtre ; JARVIS note, relance, et ajoute les siennes.
4. **Mécaniques et détails :** ce qui gêne dans l'existant, en grand comme en petit.

**Rôle de JARVIS :** pas un greffier. Il relance, contredit quand c'est utile, propose. Pour une idée lourde, il peut convoquer le Council.

### Temps 2 — Le grill (pour chaque idée retenue du temps 1)
1. **Quel problème réel ?** Un cas de tournage ou de montage, pas une hypothèse.
2. **Qui s'en sert, et quand ?**
3. **Nouvelle app ou mécanique ?** Une app seulement si elle a ses propres utilisateurs, son propre moment dans le workflow et ses propres données ; sinon, fonction à greffer sur une app existante ou en projet.
4. **Coût :** temps, risque, et ce que ça retarde.
5. **Cap :** cohérence avec la Vision Produit et le Workflow Captif.

### Temps 3 — Le verdict
| Verdict | Suite |
|---|---|
| **PROTOTYPE EXPRESS** | JARVIS dit exactement ce qu'il ferait (maquette cliquable, script, test terrain), borné à une session, critère de réussite écrit avant. Puis : on lance, ou on range. |
| **À GREFFER** | Fonction de l'app X, notée dans sa fiche. |
| **TIROIR** | Note dans `concepts/`, avec une date de réexamen. |
| **REJETÉ** | Raison écrite, pour ne pas y revenir dans trois mois. |

Les idées retenues reçoivent un D-number.

---

*Protocole · Tranquility Suite · 28 novembre 2026*
*S'applique en complément de : Surveyor · Audit de complétude · Agence Tranquility · Council · SETI*
