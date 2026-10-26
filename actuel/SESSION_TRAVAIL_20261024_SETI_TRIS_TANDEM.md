# Session de travail — 24 octobre 2026
## [SETI] Tris de liens, sources de veille et protocole TANDEM

*Type de session : tri de liens par SETI (outillage R&D), soirée. Session ouverte directement par des liens collés : démarrage V2.1 non déroulé. Aucun code d'app modifié, aucun changement d'état de RENDEZVOUS.*
*Postes actifs : R&D, PROSPECTIVE, BENCHMARK (via SETI), NAVIGATION, MÉMOIRE.*

---

## Chantiers traités

### Six liens triés par SETI
Chaque lien a été lu à la source (README, licence, activité), sans installation ni exécution, puis trié en « tri flash ». PRÉSIDENCE a tranché chaque statut ; chaque fiche courte a été montrée en entier avant écriture, créée par Cursor, puis enregistrée avec le sommaire régénéré (0 alerte à chaque fois).

| Piste | Statut | En une ligne |
|---|---|---|
| open-edits | REJETÉ | Shorts animés façon youtubeur tech : images de presse et visages téléchargés (droits), transcription anglaise seulement ; idée retenue : mesurer le style d'une vidéo de référence |
| vertical-video-editing-skills | EN RÉSERVE | Skill de montage 9:16 construit sur HyperFrames ; charte décrite une fois (`FRAME.md`), contrôle automatique du fichier final ; déclencheur : HyperFrames passe EN TEST |
| claude-video-kit | EN RÉSERVE | Agents de montage, sous-titres locaux toutes langues, contrôle qualité chiffré ; idée : checklist de livraison de la Cellule ; déclencheur : cadrage AUTOPILOT ou bilan AutoClip |
| Recordly | EN RÉSERVE | Capture d'écran en démo soignée (AGPL-3.0, gratuit) ; déclencheur : tutoriels de déploiement de la Suite ou démo pour la hiérarchie |
| find-skills | REJETÉ | Installe des skills de tiers à la volée : contraire à « aucune installation sans accord » et aux Lois 2 et 3 du Workflow Captif |
| OpenHands | REJETÉ | Poste de pilotage d'agents qui codent, interface en bêta, accès complet aux fichiers sans isolement ; PRÉSIDENCE note que la question multi-agents commence à se poser |

État du labo au 24/10/2026 : 37 fiches, 4 À TESTER (aucune lancée), 19 EN RÉSERVE, 14 REJETÉ, aucune EN TEST.

### Source de veille
skills.sh (catalogue public des skills, classement, audits de sécurité) ajouté aux sources de veille du README du labo.

### Question de Remotion
Vérifié au sommaire : Remotion déjà REJETÉ le 23/10 (licence entreprise payante, règle 13), HyperFrames a pris sa place en À TESTER.

### Question multi-agents
Quatre pistes du labo abordent le sujet par des bouts différents (Munder Difflin, OpenHands, PRAXIST, Agency Agents). Protocole TANDEM retenu et inscrit à l'agenda.

---

## Décisions actées

- **D209 — Protocole TANDEM** : la question multi-agents se traite en deux temps. (1) Rendez-vous SETI spécial le mardi 3 novembre 2026 à 12h (au lieu du premier lundi) : état du labo, veille ciblée multi-agents (maturité, coûts, sécurité), relecture des quatre pistes liées. (2) Session stratégique juste après, dans une nouvelle conversation : tour de table PRÉSIDENCE, NAVIGATION, PROSPECTIVE, SÉCURITÉ, CODE ; trois questions (quel besoin réel, ce que ça change au duo JARVIS et Cursor, quelles règles non négociables) ; décision écrite au Plan Directeur, déclencheurs des fiches mis à jour. Lancement : « Lance TANDEM ».
- **D210 — Après Apollo : Constellation, puis Artemis.** Noms réservés aux phases futures de la Suite, à n'utiliser pour rien d'autre.
- skills.sh est une source de veille du labo ; rien ne s'installe depuis ce site sans fiche validée.

---

## Livrables produits

| Élément | Nature | État |
|---|---|---|
| `fiches/RD_OPEN_EDITS_V1.md`, `RD_VERTICAL_VIDEO_EDITING_SKILLS_V1.md`, `RD_CLAUDE_VIDEO_KIT_V1.md` + sommaire | Fiches R&D | ✅ `f4421e7` |
| `fiches/RD_RECORDLY_V1.md` + sommaire | Fiche R&D | ✅ `0f060cc` |
| `fiches/RD_FIND_SKILLS_V1.md` + sommaire | Fiche R&D | ✅ `d397af2` |
| `README.md` du labo : skills.sh en source de veille | Règlement du labo | ✅ `3eb2520` |
| `fiches/RD_OPENHANDS_V1.md` + sommaire | Fiche R&D | ✅ `1934982` |
| Rendez-vous TANDEM, 03/11/2026, 12h–13h30 | Google Agenda | ✅ créé |
| Plan Directeur V5.128 (D209, D210) | Document fondateur | 🟡 poussé le 26/10 |
| Carnet de pièges V70 (+2) | Document fondateur | 🟡 poussé le 26/10 |
| Ce récap | Récap | 🟡 poussé le 26/10 |

---

## Pièges découverts

- Nom proposé (« CONSTELLATION ») déjà réservé par PRÉSIDENCE à une phase future → vérifier phases, apps, postes et protocoles avant de proposer un nom.
- Nom proposé consigné en mémoire avant validation, puis refusé → ne rien consigner avant validation explicite ; corriger sinon.

---

## Prochaines étapes

1. Mardi 3 novembre, 12h : « Lance TANDEM » (rendez-vous SETI spécial, puis session stratégique multi-agents).
2. Session BackUpFlow reportée le 23/10 (vague 0, gels).
3. Choisir les deux premières pistes À TESTER à passer EN TEST (AutoClip, HyperFrames, ntfy, Agency Agents).

---

## Dettes (inchangées depuis le 23/10, rien de neuf ce soir)

- Générateur de sommaire : « Sans objet » avec majuscule, en-tête absent, clé répétée.
- Source du skill `seti` versionnée nulle part ; instruction permanente SETI à verser dans `tranquility-jarvis-instructions`.
- `TRANQUILITY_WORKFLOW_ASSIST.md` : remplacer la mention du skill `tranquility-rd` par SETI.
- Anciennes fiches au corps de l'ancien gabarit.
- Mémoire de JARVIS : le protocole y figure encore sous le nom « CONSTELLATION », à corriger en « TANDEM ».

---

*Session 24/10/2026 · Tranquility Suite · labo R&D (SETI)*
*Note du 26/10/2026 : cette clôture n'avait jamais été poussée. Les trois fichiers ont été reconstruits à l'identique depuis la conversation du 24/10, sur la base du Plan V5.127 lu sur GitHub.*
