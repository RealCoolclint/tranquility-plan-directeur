# Session de travail — 7 novembre 2026 (après-midi)
## Tranquility Suite — CAPCOM : construction de la V2, Lot 1 (console sur l'existant)

*Type de session : construction (prompts Cursor, tests sur iPhone) · Mac Maison*

---

## Chantiers traités

### 1. Démarrage
- Pull des dépôts `capcom`, `tranquility-plan-directeur` et `tranquility-carnet-pieges` : tous à jour. Plan V5.134 (`4c7e231`) et récap du 07/11 matin présents dans `actuel/` : la clôture précédente était bien poussée.
- Radar court depuis les documents : rien de nouveau. Rappels : date de la séance SÉCURITÉ (D211, niveau 1) toujours à fixer ; audit Surveyor complet vers le 20/11.
- Maquette « CAPCOM — Console de régie » relue (référence de construction). Copies du projet Claude toujours périmées : GitHub fait foi.

### 2. Plan de construction de la V2 (D235)
- Question du prompt de continuation tranchée : la console se construit d'abord dans le prototype web, puis on passe en Electron. Raison : `regie.html` devient tel quel la fenêtre de l'app, rien n'est jeté, et une panne n'a qu'un suspect à la fois (l'autorisation micro d'Electron sur macOS est un chantier à part).
- Ordre validé : étape 0 (filet), Lot 1 console sur l'existant, Lot 2 groupes libres et statistiques, Lot 3 actions et messages, Lot 4 QR code, test intermédiaire au studio, Lot 5 Electron, Lot 6 PARAMÈTRES et `.capcom`.
- Ajout de JARVIS validé : un test au studio avant Electron.

### 3. Étape 0 — filet de sécurité
- Étiquette Git `v1-prototype` posée sur `c594b30` et poussée.
- Numéro de version au format de la Suite : `V2.07.11.26` dans `regie.html` et `ecoute.html` (`c7465bf`).

### 4. Lot 1 — console sur l'existant (`public/regie.html` seul)
Principe : changer le visage, pas le moteur. Les touches gardent leur attribut `data-cle` (A, B, AB) ; toute la logique de parole, de VERROU, de micro, de WebRTC et de reconnexion est restée intacte (vérifié par comparaison ligne à ligne du script après la sous-étape 1.1).
- **1.1 Squelette** (`fea6d6a`) : en-tête (titre, devise, entrée audio, micro, jauge, version), tableau de bord encastré (voyants éteints), rangée TOUS + VERROU, colonnes A et B avec grosse touche, antenne en rouge (fin du bleu). `appliquerLibelles()` adaptée pour ne plus écraser le contenu des touches. Cursor a ajouté une exception de lisibilité dans `.impeccable/config.json` (textes de 9 et 10 px, limitée à `regie.html`) : tracée, acceptée, enregistrée.
- **1.2a Accolades de cockpit** (`11298d6`) : demande de PRÉSIDENCE, référence MIC SELECTOR d'un Boeing 737. Trois itérations : trait épais (2 px), blanc franc, air proportionnel au texte, puis blanc atténué à 85 % (`--accolade`, dérivé de `--text-primary`).
- **1.2 Tableau de bord vivant** (`b4c6a4c`) : fonction unique `majTableau()` ; voyants LIAISON, MICRO, ANTENNE (OUVERTE, TROP LONGUE, VERROU), ÉQUIPE ; chrono MM:SS rouge puis orange à 30 s ; toast CPC-205 au premier palier seulement ; libellé « ANTENNE FERMÉE » / « À L'ANTENNE : … » ; jauge verte, rouge à l'antenne ; badge et bandeau provisoires retirés ; voyants en `role="img"` avec libellé allumé / éteint. Retouches validées à l'œil : voyants de 60 px, air sous les traits, aucun code affiché dans les voyants, un seul branchement par voyant (extrémités de l'accolade sur le bord extérieur des voyants d'extrémité), ÉQUIPE sans trait central. Le prompt d'origine avait été coupé au collage : les points manquants ont été renvoyés dans un prompt court.
- **1.3 Fiches de l'équipe** (`c070479`) : fiches dans la colonne du canal (prénom en casse normale, poste, liaison verte / orange / grise, jamais rouge), personnes en difficulté en tête, liseré rouge quand leur groupe est à l'antenne, trois densités automatiques (COMPLET 56 px, COMPACT 36 px, MINI 28 px) et « + N AUTRES », compteur sous chaque touche, colonne vide « PERSONNE DANS CE GROUPE » ; liste provisoire du bas retirée. Test avec plusieurs onglets d'écoute sur le Mac pour les densités.
- **1.4 Alertes et hors service** (`390a529`) : bandeau orange MICRO PERDU (fermé par VU ou par la réactivation du micro ; le voyant EN PANNE reste allumé tant que le micro n'est pas revenu) ; voile RÉGIE HORS SERVICE (CPC-203, CPC-204), page inerte, focus sur RECHARGER, Échap sans effet. Test micro perdu fait avec un casque Bluetooth rangé dans son boîtier.
- **1.5 VERROU en deux modes** (`a814bb4`) : un premier essai Option + 1 / 2 / 3 a été construit puis remplacé avant enregistrement, sur demande de PRÉSIDENCE, par un sélecteur de mode PUSH TO TALK / CONTINU basculé par la touche Option seule (D237).

### 5. Incidents de test
- Adresse `localhost` tapée sur l'iPhone : ne peut pas marcher (localhost = l'appareil lui-même). Adresse du Mac trouvée avec `ifconfig` (le Mac Maison n'utilise pas `en0`) : écoute sur `192.168.1.89:3000/ecoute.html` ce jour-là.
- Voix de l'opérateur entendue dans le casque Bluetooth : causée par les onglets d'écoute de test restés ouverts sur le Mac. CAPCOM ne renvoie jamais le micro vers le Mac ; règle actée (D238).

---

## Décisions actées

- **D235** — Ordre de construction de la V2 : web d'abord, test studio intermédiaire, puis Electron, puis PARAMÈTRES et `.capcom`. Filet `v1-prototype`, version `V2.07.11.26`.
- **D236** — Accolades de cockpit à branchement unique sur le tableau de bord ; les voyants ne portent aucun code (codes dans les toasts et bandeaux), seule exception le nombre sous ÉQUIPE À VOIR.
- **D237** — Le VERROU devient un sélecteur de mode : PUSH TO TALK (départ) / CONTINU, basculé par la touche Option seule ; remplace Option + chiffre.
- **D238** — Aucun retour du micro dans la régie ; aucun onglet d'écoute sur le Mac de régie pendant un tournage.
- **D239** — Besoin d'options son (niveau d'entrée, source, deux entrées réunies) ; lot à part proposé après le Lot 3, placement à confirmer.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| Étiquette `v1-prototype` | Filet de sécurité sur la V1 (`c594b30`) | ✅ Poussée |
| `capcom` : `c7465bf`, `fea6d6a`, `11298d6`, `b4c6a4c`, `c070479`, `390a529`, `a814bb4` | Version V2 puis Lot 1 complet de la console | ✅ Poussés |
| `capcom/.impeccable/config.json` | Exception de lisibilité tracée pour `regie.html` | ✅ Poussé (`fea6d6a`) |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_135.md` | Plan Directeur (D235 → D239, section CAPCOM, inventaire, ressources) | 🟡 À pousser |
| `CARNET_PIEGES_V78.md` | Carnet (+6 pièges) | 🟡 À pousser |
| Ce récap | Récap de session | 🟡 À pousser (`actuel/`) |

Catalogue des codes `docs/CAPCOM_CODES.md` inchangé : aucun nouveau code (CPC-202, 203, 204, 205 existaient).

---

## Pièges découverts

Voir `CARNET_PIEGES_V78.md` (6 entrées) : Cursor peut modifier le réglage d'un outil de contrôle sans qu'on le lui demande ; un long prompt peut être coupé au collage ; un onglet d'écoute ouvert sur le Mac de régie renvoie la voix dans le casque de l'opérateur ; `localhost` ne marche pas sur un téléphone ; sur le Mac Maison, l'adresse réseau n'est pas sur `en0` ; une accolade sur un petit groupe de voyants doit tomber sur leurs bords extérieurs.

---

## Dettes et points à reprendre

- **Liste de polish de la V2** : titre ANTENNE sur le trait de CONTINU en fenêtre étroite ; ombre intérieure du tableau de bord peu visible ; affichage sous 860 px ; Commande enfoncée avant Option bascule quand même le mode ; bouton de mode désactivé et muet au clic sans micro (doit répondre CPC-201) ; libellé d'antenne d'un seul canal tronqué sous le chrono.
- **Liste de polish du 06/11 toujours ouverte** (paliers CPC-205 si l'onglet dort, délai de 4 s, sursis non lu à l'ouverture, onglet dupliqué, jeton en clair, `tranquility-core.css` en local au Lot 5, archivage de `docs/a-integrer/`).
- **Placement du lot « options son »** à confirmer (D239).
- **Micro EN PANNE** jamais testé avec un vrai micro USB débranché (au programme du studio).
- **Codes CPC à créer** au fil des Lots 2 et 3 (messages reçus, configurations, QR, règles par poste).
- **Patch** : outil de production à choisir, devise à remplacer, MP4 animé pour le splash (Lot 5).
- **Hors CAPCOM** : date de la séance SÉCURITÉ (D211, niveau 1) ; audit Surveyor complet vers le 20/11.

---

## Prochaines étapes

1. **Lot 2 — groupes libres** : mini-plan sans code d'abord (serveur, régie et écoute touchés ensemble), puis prompts un par un.
2. **Lot 3 — actions et messages** (D229, ALERTE, bandeau, exergue, nouveaux codes CPC).
3. **Placement du lot « options son »** (D239).
4. **Lot 4 — QR code**, puis **test au studio**.
5. **Lot 5 — Electron** (avec splash), **Lot 6 — PARAMÈTRES et `.capcom`**.

---

*Session du 7 novembre 2026 (après-midi) · Tranquility Suite · CAPCOM · Mac Maison*
