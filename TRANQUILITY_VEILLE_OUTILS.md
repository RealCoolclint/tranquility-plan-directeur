# Tranquility Veille Outils
## Veille de projets open source — process permanent
*Cellule Vidéo L'Étudiant · Rédigé le 5 juillet 2026 · JARVIS + Martin Pavloff*

---

## Pourquoi ce document existe

La Tranquility Suite ne se construit pas en vase clos. L'écosystème open source produit en continu des projets qui résolvent des problèmes similaires à ceux de la suite — authentification, gestion documentaire, notifications, formulaires, signature électronique, etc. Ignorer cette matière serait une perte sèche : elle contient des idées de fonctionnalités, des concepts UX déjà validés à grande échelle, des choix d'architecture éprouvés, et parfois des briques directement utilisables.

Ce document encode le **process de veille** et sert de **journal des projets examinés** — pour ne pas repartir de zéro à chaque fois qu'un projet open source croise la route de Martin (réseaux sociaux, recommandations, recherche active).

**Différence avec `TRANQUILITY_VEILLE_IA.md` :** la veille IA regarde les modèles et familles d'intelligence artificielle gratuites exploitables dans la suite. La veille Outils regarde les **projets logiciels open source** — produits, frameworks, librairies — indépendamment de toute IA. Les deux documents sont complémentaires et suivent la même logique de process.

---

## Le principe fondateur — quatre niveaux de lecture

Face à un projet open source, la question n'est **jamais** binaire ("on l'adopte ou pas"). Un projet se lit à quatre niveaux, du plus concret au plus abstrait :

1. **Adoption directe** — le projet est intégré tel quel (ou quasi) dans la suite. Rare : la suite privilégie le vanilla JS, l'architecture GitHub-comme-database, et l'autonomie totale vis-à-vis de services tiers lourds.
2. **Reverse engineering conceptuel** — on n'adopte pas le projet, mais on étudie *comment* il résout son problème (architecture, modèle de données, découpage des responsabilités) pour s'en inspirer dans une brique maison.
3. **Inspiration UX/fonctionnelle** — on retient une idée de fonctionnalité ou un concept d'interface, indépendamment de toute technique, et on l'implémente à la main dans le style Tranquility.
4. **Signal de marché** — le projet valide (ou infirme) une direction déjà prise par la suite, sans qu'il y ait quoi que ce soit à construire. Un signal qu'on note, sans action.

Un même projet peut produire plusieurs de ces niveaux à la fois, pour plusieurs apps différentes de la flotte. **La lecture doit toujours se faire à l'échelle de la Suite entière — jamais à l'échelle du seul chantier en cours.** Un projet qui ne sert à rien pour le chantier du jour peut être une pépite pour une app en projet ou une app déjà en orbite.

---

## Le process de veille — trois étapes

### Étape 1 — Vérification de fraîcheur

Avant toute analyse, vérifier que le projet est toujours actif, maintenu, pas une mode éphémère de réseau social. Recherche web rapide : dernière release, taille de communauté, statut du repo.

### Étape 2 — Passage en revue à l'échelle de la flotte

Pour chaque projet retenu comme sérieux, la question posée est : **à quelle(s) app(s) de la flotte (les 23, en orbite ou en projet) ça parle**, et à quel niveau de lecture (1 à 4 ci-dessus). Pas de présupposé sur le chantier en cours.

### Étape 3 — Verdict et capitalisation

Chaque projet examiné reçoit un verdict tracé dans ce document : adopté / inspiration retenue / signal noté / écarté. Si une piste concrète émerge, elle est remontée en chantier nommé dans le Plan Directeur.

---

## Projets examinés

### Session fondatrice — 5 juillet 2026

Source : compte TikTok *howtowebdev*, transmis par Martin. Sept projets analysés.

| Projet | Rôle | Verdict | Niveau de lecture | Piste retenue |
|--------|------|---------|--------------------|----------------|
| **Typebot** | Chatbots / formulaires conversationnels drag & drop | Écarté en adoption | Inspiration UX | Formulaire séquentiel (une question à la fois, barre de progression) — piste pour COVENANT V2, terrain avec interviewé non technicien |
| **Paperless-ngx** | Gestion documentaire OCR auto-hébergée | Écarté en adoption | Reverse engineering conceptuel | Lacune identifiée : les PDF produits par COVENANT et CAPITAL ne sont jamais indexés après envoi — piste future "Archives" transverse, en version légère (JSON append-only + métadonnées), pas un vrai Paperless-ngx |
| **Logto** | IAM complet open source (auth, SSO, RBAC, MFA) | Écarté en adoption | Reverse engineering conceptuel + signal de marché | (1) Vérifier la bonne pratique de rotation de clé de signature JWT pour RENDEZVOUS Chantier E ; (2) le modèle "Organization" de Logto valide structurellement le système d'affectations RENDEZVOUS (D20→D31) comme un pattern IAM reconnu, pas une réinvention isolée |
| **DocuSeal** | Signature électronique + formulaires PDF auto-hébergés | Écarté en adoption | Reverse engineering conceptuel | Concept "template réutilisable + zones de signature positionnées visuellement" — architecture à viser si COVENANT doit un jour gérer plusieurs types de documents (pas seulement l'autorisation droit à l'image) |
| **Dub** | Liens courts + analytics marketing | Écarté | Signal de marché faible | Confirme que le pattern lien + expiration + usage unique de RENDEZVOUS (magic link / reset password) est un standard d'industrie, rien à construire |
| **Tauri** | Alternative légère à Electron (backend Rust) | En dormance stratégique | Reverse engineering conceptuel (futur) | Dette technique à surveiller sur toutes les apps Desktop (BackUpFlow, Transporter, ARK, ROVER, Launcher, READBACK, CAPITAL). Pas d'action tant qu'aucun signal concret (poids des DMG, lenteur au démarrage) n'apparaît. Décision de bascule = sujet de Conseil complet, jamais une initiative isolée |
| **ntfy** | Notifications push HTTP, auto-hébergeable, ultra léger | **Retenu — chantier ouvert** | Adoption directe envisagée | Brique transverse "notifications suite" — voir Plan Directeur, nouveau chantier |

**Décision de la session :** ntfy est le seul projet des sept à passer directement en chantier nommé au Plan Directeur. Les autres pistes (formulaire séquentiel COVENANT, archives PDF indexées, rotation clé JWT, template multi-doc COVENANT) sont notées ici comme réserve d'idées — à remonter en chantier le jour où le contexte s'y prête, pas avant.

---

## Ce que la veille outils ne fait pas

- Elle ne remplace pas une conception isolée : une bonne idée notée ici doit toujours repasser par le Conseil ou une session de conception dédiée avant de devenir un prompt Cursor.
- Elle n'autorise aucune dépendance externe lourde sans arbitrage PRÉSIDENCE — la philosophie GitHub-comme-database et l'autonomie de la suite priment sur la sophistication d'un outil tiers, aussi bon soit-il.
- Elle ne se substitue pas à la veille IA (`TRANQUILITY_VEILLE_IA.md`), qui reste le document de référence pour tout ce qui touche aux modèles et familles d'intelligence artificielle.

---

*Document fondateur · TRANQUILITY_VEILLE_OUTILS · V1.0 · Tranquility Suite · Cellule Vidéo L'Étudiant · 5 juillet 2026*
*Poussé sur `tranquility-plan-directeur` — branche `main`*
