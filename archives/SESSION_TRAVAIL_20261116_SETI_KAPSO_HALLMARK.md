# Récap de session — [SETI] Tri de quatre liens, exploration de Kapso

*16 novembre 2026, après-midi, Mac Maison*
*Plan Directeur V5.150 → V5.151 · Carnet de pièges V92 → V93 · Aucune décision nouvelle (pas de D-number)*

---

## Démarrage

- Session courte, ouverte directement par quatre liens collés, sans commentaire : démarrage V2.1 non déroulé.
- Sommaire du labo branché au projet daté du 15/11 (81 fiches), cohérent avec le Plan V5.150 : aucun écart de compte.
- Sources lues sans rien installer ni exécuter : clone superficiel de Hallmark (README, licence, SKILL.md, références), documentation officielle de Kapso, recherche web pour Qwen.

## Les quatre liens

| Piste | Verdict | En bref |
|---|---|---|
| **Hallmark** (`Nutlope/hallmark`) | EN RÉSERVE | Skill de conception d'interface pour Cursor et Claude Code, MIT, version 2.0.0, actif (11/11). Il juge les majuscules comme un « tic d'IA », contraire à notre charte, mais un `DESIGN.md` à la racine prime sur ses règles. Idée retenue : règles classées en trois niveaux (bloquant, réflexe, finition) et mode audit sans correction, pour le futur skill Design Reference (fiche Vercel Skills). Génération d'images : clé payante, jamais activée (règle 13). |
| **Kapso** (kapso.ai) | REJETÉ après exploration | Voir ci-dessous. |
| **qwen.ai** | Pas de fiche | Ligne datée ajoutée à `RD_OLLAMA_V1` : Qwen est un candidat à comparer à Mistral au prototype Ollama, en local seulement, licence à vérifier modèle par modèle. Sources contradictoires sur Qwen 4 (Carnet). |
| **Agent Skills Atlas** (pack) | Non lu | Lien Facebook trop long pour l'outil de lecture, page introuvable par recherche. En attente du lien coupé avant `fbclid`. Piste proche : find-skills (REJETÉ). |

## Kapso : l'exploration

1. Premier tri flash : REJETÉ proposé (alertes WhatsApp payantes chez Meta, doublon de ntfy).
2. PRÉSIDENCE : Kapso peut compléter ntfy. Exploration : ntfy est une sirène (l'app parle la première), Kapso un guichet (un humain écrit, l'app répond). Chez Meta, seul le second cas est gratuit, sous un plafond de 1 000 réponses par mois et par numéro (messages de service facturables depuis le 01/10/2026) ; les modèles de message sont toujours facturés ; le numéro de test partagé de Kapso ne profite pas du plafond. Idées : l'équipe interroge la Suite ; un QR code au tournage mène l'interviewé à son lien COVENANT.
3. Besoin réel révélé : **lire** WhatsApp comme source d'infos pour surveiller la prod, à côté des mails, des agendas et de Monday, c'est-à-dire un sujet Perimeter. Limites de la voie officielle : ni le compte WhatsApp perso, ni les groupes ; seulement les conversations à deux d'un numéro WhatsApp Business, en mode « coexistence » (jusqu'à six mois d'historique, moins stable selon Kapso). Outils non officiels écartés (bannissement du numéro). Données personnelles des collègues à cadrer (JURIDIQUE, ÉTHIQUE IA).
4. PRÉSIDENCE abandonne : trop compliqué. Fiche courte REJETÉ, idées gardées.

## Enregistrement

- Trois prompts Cursor, un fichier chacun : `fiches/RD_KAPSO_V1.md` (créé), `fiches/RD_HALLMARK_V1.md` (créé), `fiches/RD_OLLAMA_V1.md` (une ligne d'Historique, en-tête intact).
- Un seul enregistrement avec le sommaire régénéré : 83 fiches lues, 0 alerte, commit `71b988d` (repo `tranquility-rd`), poussé.
- État du labo : 83 fiches, 9 À TESTER, aucune EN TEST, 36 EN RÉSERVE, 3 ADOPTÉ, 35 REJETÉ.

## Carnet de pièges V93 (+3)

- JARVIS : lien Facebook vers un site hors GitHub, sans repli possible : demander tout de suite le lien coupé.
- Labo R&D : un lien vers un compte que Martin a déjà ouvert signale un usage en tête ; le demander avant de proposer un statut.
- Labo R&D : annonces de modèles d'IA contradictoires ; ne retenir que la source officielle.

## Corrections documentaires

- Plan V5.150 : la section Carnet de pièges et la ligne des ressources étaient restées sur V91 alors que V92 était poussée. Corrigé en V5.151.

## Dettes et suites

- Agent Skills Atlas : lien raccourci attendu de Martin, puis tri flash.
- « Sync now » sur les sources du projet après le push de clôture (sommaire du labo et Carnet).
- Compte Kapso de Martin : déconnecter le numéro éventuellement branché, à son rythme.
- Hallmark : prochaine action rattachée à la session de conception du skill Design Reference (pas de date).
- Rappels hors session : audit Surveyor complet et essai TANDEM vers le 20/11 (D285) ; vérifier la version de Cursor et l'existence d'un mode lecture seule avant l'essai.

*Récap rédigé par JARVIS — poste MÉMOIRE.*
