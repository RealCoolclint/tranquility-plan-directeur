# Session de travail — 23 octobre 2026
## [SETI] Naissance du coach R&D de la Cellule

*Type de session : conception puis construction (outillage R&D), Mac Maison. Session BackUpFlow prévue (vague 0, gels) reportée à la demande de PRÉSIDENCE.*
*Postes actifs : R&D, CONCEPTUALISATION, NAVIGATION, QUALITÉ, MÉMOIRE.*

---

## Pourquoi cette session

Les liens GitHub reçus passaient par ChatGPT pour un premier avis, puis finissaient en fiches longues qui ne bougeaient plus. Preuve dans le labo : HyperFrames et AutoClip étaient « prototype » sans qu'aucun test ait été lancé. PRÉSIDENCE voulait un coach qui connaisse le catalogue, le tienne à jour, propose quoi faire de chaque lien, rappelle les pistes dormantes au bon moment et rende compte des tendances de l'IA et de l'open source.

---

## Décisions actées (D208)

- **SETI** (Search for Extra-Terrestrial Intelligence : on guette des intelligences nées ailleurs) donne une voix commune aux postes R&D, PROSPECTIVE et BENCHMARK. Pas de nouveau poste dans l'Agence.
- **Terrain** : toute la Cellule Vidéo, Suite comprise. Un seul labo, `tranquility-rd`, qui garde son nom.
- **Cinq statuts** : REJETÉ, EN RÉSERVE, À TESTER, EN TEST, ADOPTÉ. Toute piste vivante porte une prochaine action. Dans l'en-tête : « verdict » devient `statut`, « conditions de réouverture » devient `declencheur`, « apps » devient `terrain` ; ajout de `date_statut` et `prochaine_action`.
- **Limites d'activation** : deux pistes EN TEST au maximum ; trois semaines sans avancée, et SETI soumet la piste à PRÉSIDENCE (finir, remettre en réserve, rejeter).
- **Tri flash** à chaque lien collé, vulgarisé, commençant par « En clair : » ; fiche courte pour REJETÉ et EN RÉSERVE, fiche complète avec kit de démarrage (mini-plan et protocole de test) pour À TESTER.
- **Sommaire** `SOMMAIRE.md` fabriqué automatiquement par `scripts/generer-sommaire.js` à partir des en-têtes, jamais modifié à la main ; il remplace la règle « pas de registre central » de D154. `README.md` et `SOMMAIRE.md` sont branchés aux sources du projet.
- **Rappels** : au démarrage, au mini-plan, dès qu'un problème surgit, et pour les tests qui traînent ; deux lignes au plus ; silence si rien ne résonne ; « pas maintenant » respecté pour la session.
- **Rendez-vous SETI** (premier lundi du mois, à la demande) remplace la revue IA du mois : chiffres du labo, trois tendances au plus, une à trois pistes à trier ; rapport de travail et page partageable sans jargon ni détail sensible.
- **Deux chemins d'adoption** : dans une app de la Suite (4 conditions existantes), ou comme outil ou pratique de la Cellule (stabilité, valeur constatée, aucune donnée de la Cellule hors des machines sans décision, traçabilité).
- **Sources de veille** au README : RepoDir, There's An AI For That, un compte Facebook lu par PRÉSIDENCE (SETI n'y a pas accès).

---

## Ce qui a été construit

1. Lecture de l'existant (README, gabarit, 21 en-têtes).
2. Nouveau règlement (16 règles) et deux gabarits, sur une branche `seti`.
3. Générateur de sommaire (Node, sans dépendance), écrit par Cursor.
4. Reclassement des 21 fiches (Cursor en mode agent, liste de changements relue) : 3 À TESTER, 13 EN RÉSERVE (dont 4 anciens abandons réveillés : Logto, Typebot, DocuSeal, Paperless-ngx), 5 REJETÉ, 0 alerte.
5. Branche `seti` versée dans `main` puis supprimée ; `README.md` et `SOMMAIRE.md` branchés au projet, lecture vérifiée.
6. Skill `seti` (remplace `tranquility-rd`) et instruction permanente SETI, installés par PRÉSIDENCE.
7. Test dans une conversation neuve : lien seul, signal, silence. Trois essais conformes, deux corrections appliquées (tri flash qui commence directement par « En clair : » ; une seule question par message, le signal se termine alors par « À ressortir quand tu veux. »).
8. Premier usage réel : 9 liens triés, 3 sources de veille.

---

## Pistes triées ce jour

| Piste | Statut | En une ligne |
|---|---|---|
| Remotion | REJETÉ | Licence entreprise payante au-delà de 3 salariés (règle 13) ; étalon pour HyperFrames |
| Munder Difflin | REJETÉ | Bureau d'agents autonomes, contraire à la validation humaine ; idées de garde-fous |
| Agency Agents | À TESTER | Fiches de rôle d'agents ; séance de lecture d'une heure pour enrichir nos postes |
| Harness² | REJETÉ | Recherche Google, cloud payant ; confirme la méthode JARVIS |
| Boop | REJETÉ | Doublon de ntfy, app iPhone à signer ; quatre idées versées dans la fiche ntfy |
| MoneyPrinterTurbo | REJETÉ | Vidéos sans tournage, droits musicaux ; contraire à la ligne éditoriale |
| OpenCreator | EN RÉSERVE | Sous-titrage et traduction ; moteur Codex à vérifier en local |
| Adobe Skills | EN RÉSERVE | Skills officiels Adobe (Quick Cut, déclinaisons) ; signal pour le palier 2 |
| VoiceStudio | EN RÉSERVE | Voix locale ; licences des modèles et éthique du clonage à vérifier |

État du labo au 23/10/2026 : 30 fiches, 4 À TESTER (AutoClip, HyperFrames, ntfy, Agency Agents), 16 EN RÉSERVE, 10 REJETÉ, aucune EN TEST.

---

## Livrables

| Élément | État |
|---|---|
| `tranquility-rd` : README (16 règles, sources de veille), deux gabarits, générateur, sommaire, 30 fiches | ✅ commits `62a6b81`, `7a649f3`, `6b18306`, `fb61cbc` |
| Skill `seti` (fichier `seti.skill`) | ✅ installé ; ancien skill `tranquility-rd` retiré |
| Instruction permanente SETI | ✅ collée dans les instructions du projet |
| Plan Directeur V5.127 (D208) | 🟡 à pousser |
| Carnet de pièges V69 (+8) | 🟡 à pousser |
| Ce récap, prompt de continuation | 🟡 à pousser / à copier |

---

## Signaux SETI notés en route (pour plus tard)

- Transporter (D207) : l'idée d'OpenCreator, « chaque révision crée une nouvelle version sans écraser la précédente ; une mise à jour qui échoue laisse la version qui marche ».
- COVENANT : l'autorisation pourrait mentionner la voix et sa réutilisation par IA, refusée par défaut (VoiceStudio).
- REA pourrait lire la version de Transporter installée chez Thomas (dette existante).
- Tendance du jour pour le premier rendez-vous SETI : la majorité des liens reçus portent sur les agents IA et leur encadrement.

---

## Dettes ouvertes par cette session

- Générateur de sommaire : « Sans objet » avec majuscule non reconnu ; en-tête absent sans message dédié ; clé répétée sans alerte.
- Skill `seti` : sa source n'est versionnée nulle part (à ranger dans un dépôt).
- Instruction permanente SETI à verser dans `tranquility-jarvis-instructions` (déjà en retard).
- `TRANQUILITY_WORKFLOW_ASSIST.md` : remplacer la mention du skill `tranquility-rd` par SETI.
- Anciennes fiches : corps encore à l'ancien gabarit (l'en-tête fait foi), remis au propre au prochain changement de statut.
- Quatre pistes À TESTER, aucune lancée : choisir les deux premières à passer EN TEST.
