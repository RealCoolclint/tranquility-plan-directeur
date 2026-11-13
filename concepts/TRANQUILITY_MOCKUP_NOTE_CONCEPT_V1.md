# Note de concept : MOCKUP

*Statut : en réflexion · Créée le 13/11/2026 (D254 → D257) · Dossier `concepts/` du repo `tranquility-plan-directeur`*

## En clair

MOCKUP est le manuel vivant des studios de la Cellule Vidéo. Il montre comment
chaque installation est construite, ce qu'elle immobilise, comment passer d'une
configuration à l'autre sans rien perdre, et où le parc est sous tension.
C'est l'app sœur de PAYLOAD : PAYLOAD sait ce qu'on possède, MOCKUP sait ce
qu'on en fait.

## Identité

- Nom : MOCKUP (les maquettes grandeur nature de la NASA, sur lesquelles on
  répétait montages et démontages au sol)
- Devise : EX IMAGINE VERITAS (« De l'image naît la vérité »)
- Duo de devises avec PAYLOAD : NIHIL IGNOTUM / EX IMAGINE VERITAS
- Mission patch, splash screen, animation d'ouverture : à concevoir (checklist
  identité visuelle)
- Préfixe de codes d'erreur : à réserver au registre TRANQUILITY_CODES_ERREUR

## Origine

Née le 13/11/2026 de l'abandon du « Projet Simulation », qui proposait un
simulateur d'éclairage photographique 3D inspiré de SET A LIGHT 3D (Elixxier).
Décision : la Cellule sait éclairer, la simulation lumineuse n'est pas son
besoin. On garde seulement trois idées de SET A LIGHT 3D, à titre
d'inspiration : le plan vu de dessus, les configurations sauvegardées, la
comparaison de configurations.

## Le besoin terrain

- Reconfiguration du Studio A en V2 : manque de clamps, de rotules et de
  petits éléments, emprunts au Studio B, solutions de fixation à réinventer.
- Extension du totem avec un deuxième ATEM Extreme : câbles et éléments puisés
  dans plusieurs réserves.
- Pieds lumière immobilisés pour tenir le décor du Studio A : moins de
  possibilités d'éclairage ailleurs, projecteurs en déport difficiles à fixer.
- Résultat : beaucoup de matériel sollicité en même temps, perte de la vision
  d'ensemble, aucun recul pour voir en amont ce qui est employé où.

## Relation avec PAYLOAD

- MOCKUP est une app distincte, amarrée à PAYLOAD par un sas (une connexion
  définie, pas une fusion), sur le modèle d'une station modulaire.
- MOCKUP ne recopie jamais les données de PAYLOAD : il les lit (Loi 2).
- PAYLOAD est prioritaire. MOCKUP suit sa conception : il sera recadré une
  fois le périmètre de PAYLOAD tracé et décidé.

## Fonctions de base envisagées (valeur ajoutée par rapport à PAYLOAD)

1. La fiche installation : ce qui compose chaque installation (Studio A,
   Studio B, totem…), petits accessoires compris, comptés en quantité.
2. Le blueprint : un schéma lisible par n'importe qui, par couches
   (artistique, technique, électrique), sans rendre l'ensemble intimidant.
3. La transition : comparer une configuration actuelle et une future, lister
   ce qui se déplace, ce qui manque, et en tirer une notice pas à pas, façon
   IKEA ou Lego.
4. La vue d'occupation : ce qui est immobilisé où, les points de tension,
   les besoins de spare et de rotation.
5. Le pas de côté : une revue d'une configuration pour proposer mieux
   (réflexion collective, avec JARVIS dans la boucle).

## Usage au quotidien (l'anti-poussière)

Risque identifié : une app qu'on n'ouvre qu'au moment de reconfigurer un
studio, c'est-à-dire rarement, finit sur l'étagère. Pistes de gestes
réguliers, à confirmer :

- Avant toute reconfiguration ou extension : simuler la transition et voir
  les manques.
- Quand on emprunte un élément à une installation : l'emprunt devient
  visible au lieu d'être silencieux (Loi 3). Le geste pourrait passer par le
  scan PAYLOAD, sans ouvrir MOCKUP.
- Après un tournage : remettre une installation dans sa configuration
  standard, avec une checklist.
- Avant un achat : la liste des manques et des spares sert de base.
- Pour un nouvel arrivant : comprendre un studio d'un coup d'œil.

## Ce que MOCKUP n'est pas

- Pas un simulateur d'éclairage : ni photométrie, ni rendu 3D.
- Pas un second inventaire : l'inventaire vit dans PAYLOAD.
- Pas un outil de planning de tournages : l'unité est l'installation, pas
  le tournage.

## Questions ouvertes

- Type d'app : desktop, web, iPad posé au studio ?
- Le petit matériel (clamps, rotules, câbles, pieds) est-il inventorié dans
  le board Monday « Liste Matériel » ? Sinon, où et comment le compter ?
- Qui tient MOCKUP à jour, et à quel moment ?
- Format des blueprints : un plan de studio sort du champ de Mermaid (règle
  du 17/10/2026, schémas = Mermaid). Faut-il une exception, ou un autre outil ?
- Jusqu'où va la couche électrique (circuits, puissances, prises) ?
- Le pas de côté : sous quelle forme, sans nouvelle clé API payante (règle
  13 du labo) ?
- La forme technique du sas avec PAYLOAD.
- Périmètre : les studios seulement, ou aussi les kits Reportage et Mojos ?
- Phase de la feuille de route.

## Dépendances

PAYLOAD (données du parc, priorité absolue) · Monday (back-office de PAYLOAD)
· RENDEZVOUS (distribution) · Design Reference et tranquility-core.css ·
Catalogue des codes d'erreur.

## Déclencheur et prochaine étape

Déclencheur : périmètre de PAYLOAD tracé et décidé.
Prochaine étape : session de recadrage de MOCKUP à la lumière de PAYLOAD.

## Historique

- 2026-11-13 : création de la note, après abandon du Projet Simulation.
  Nom MOCKUP et devise EX IMAGINE VERITAS choisis par la Présidence.
