# Session de travail — 27 novembre 2026
## Tranquility Suite · BackUpFlow — Réparation NAS, règle de preuve, ouverture de la V2

*Session technique et stratégique · Mac Maison · suite du cadrage du 26/11 (Mac Studio)*

---

## Chantiers traités

### Démarrage
Récap du 26/11 relu. Postes actifs : CONCEPTUALISATION, CODE, QUALITÉ, INFRASTRUCTURE, MÉMOIRE, avec NAVIGATION et MISSION CONTROL. SETI : aucun signal. Nouveau mode de travail : la session est liée au Mac Maison ; sur accord de PRÉSIDENCE, JARVIS lit le code dans `~/Documents/GitHub` (dossier accordé), Martin exécute les commandes Git (clone, commit, push) dans son Terminal.

### Précision réseau
Le NAS est sur le réseau de L'Étudiant : accès direct depuis le Mac Studio et le Mac Bureau dans les locaux, sans VPN. Depuis le Mac Maison, seul le VPN FortiClient permet d'y accéder, très lentement. BackUpFlow n'a d'intérêt que dans les locaux. Sujet futur : améliorer le lien VPN (pistes open source).

### Diagnostic du bug compression / NAS / Gofile
BackUpFlow cloné pour la première fois sur le Mac Maison (`22638fa`, version 1.12.06.26, code inchangé depuis le 03/09). Constats :
- le bloc de secours NAS du 05/03/2026 n'a jamais été enregistré sur GitHub (seuls les journaux d'`upload.js` l'ont été) ; sans compression, le NAS ne recevait rien ;
- si HandBrake est introuvable, la compression est décochée en silence au démarrage (simple toast), puis sautée sans message ;
- chaîne du 26/11 : compression éteinte → pas de version compressée → Gofile n'envoie que l'original → pas de NAS.
Reste à confirmer au Mac Studio : HandBrake absent ou case décochée.

### Réparation sur `main`
Choix A de PRÉSIDENCE : sans compression, le NAS reçoit les originaux. Deux prompts Cursor sur `main.js` : (1) secours NAS placé après Gofile et avant le NAS (sinon Gofile renverrait les originaux comme « compressés ») ; (2) constats réels : l'historique, les métadonnées du projet et la notification de fin ne déclarent plus que ce qui est constaté. Diff vérifié par JARVIS (un seul fichier, syntaxe correcte). Commit `bca26b2`. Non testé en conditions réelles.

### Règle de preuve
PRÉSIDENCE pose une règle absolue, inscrite au Manifeste du Workflow Captif (V1.1) comme **corollaire de la Loi 3** : « Une app de la suite ne prétend jamais avoir accompli ce qu'elle n'a pas accompli. Ce qu'elle affirme, elle l'a constaté. Ce qu'elle n'a pas pu faire, elle le reconnaît. Ce qu'elle ne peut pas savoir, elle ne le présente jamais comme une certitude. » Les trois piliers (constater, reconnaître, avouer l'incertitude) guident la conception, pas la lettre des messages.

### Ouverture de la V2
Branche `evolution-v2` créée et poussée : la version en service reste sur `main`. Orientation : FFmpeg embarqué, candidat contre le standard « HandBrake Fast 1080p30 », à départager par un banc d'essai ; refonte du parcours (prise en main, étapes, progression, travaux en cours, messages de validation, d'erreur et de choix).

### État des lieux du parcours actuel
Lecture seule du code par JARVIS, document `docs/BACKUPFLOW_V2_ETAT_DES_LIEUX.md` (commit `280c87a`). Points saillants : option de vérification d'intégrité affichée et cochée mais jamais appliquée ; aucune vérification des branchements avant démarrage ; 19 erreurs détaillées sur 26 jamais déclenchées ; dix faux succès restants ; 4 `confirm()` natifs ; écran d'attente bloquant sans session Launcher (signal d'alarme D1/D5).

### Équipe
Changement dans l'équipe d'utilisateurs de référence début décembre (D337, détail au Carnet, dépôt privé).

---

## Décisions actées

- **D334** — Réparation NAS (originaux sans compression) et constats réels sur `main`, commit `bca26b2`, à tester au Studio
- **D335** — Corollaire de la Loi 3, la règle de preuve : une app ne ment pas sur ce qu'elle fait (Manifeste V1.1)
- **D336** — Conception de la V2 ouverte sur `evolution-v2` ; FFmpeg candidat ; standard HandBrake Fast 1080p30 mis en concurrence
- **D337** — Retour terrain urgent avant le départ d'un utilisateur de référence ; question de cap en session dédiée
- JARVIS peut lire et écrire des fichiers sur le Mac lié ; Git reste dans le Terminal de Martin

---

## Livrables produits

| Élément | Nature | État |
|---------|--------|------|
| `main.js` (BackUpFlow, `main`) | Secours NAS + constats réels | ✅ `bca26b2`, à tester au Studio |
| Branche `evolution-v2` | Copie de travail V2 | ✅ |
| `docs/BACKUPFLOW_V2_ETAT_DES_LIEUX.md` | État des lieux | ✅ `280c87a` |
| `CARNET_PIEGES_V103.md` | +12 pièges (4 du 26/11) + note privée D337 | ✅ `bd380ae` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_161.md` | D334 → D337 | ✅ `aa1c317` + `3aab900` (D335 alignée) |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | V1.1, corollaire de la Loi 3 | ✅ ressources du projet Claude |
| Ce récap | Document de session + prompt de continuation | ✅ |

---

## Dettes et liste de polish (V2)

- Envoi NAS compté réussi malgré des fichiers en erreur (`upload.js`)
- Compression annoncée terminée même vide ; NAS sauté affiché « terminé » ; fin de workflow `success: true` même si NAS ou Gofile échouent ; pastilles du batch sur intention ; MultiCam, SMB, VPN, Monday
- Sans compression, le NAS reçoit un dossier et non un `.zip` même si l'option zip est active
- Le secours NAS se déclenche aussi si la compression a planté : message `BKF` à prévoir
- Codes d'erreur hors format `BKF-xxx`, pas de `docs/BACKUPFLOW_CODES.md`
- Modale NAS qui parle de VPN au Studio ; vouvoiement / tutoiement ; accents manquants
- Polices monospace visibles, 4 `confirm()` natifs, 104 styles en ligne
- Dépendance à Launcher (D1/D5) ; liste des formats codée en dur (Loi 2)
- Uniformiser les dossiers GitHub sur les trois Macs (fichiers isolés à la racine de `~/Documents/GitHub` sur le Mac Maison)
- `TRANQUILITY_WORKFLOW_ASSIST.md` : bloc de contexte BackUpFlow non mis à jour cette session

---

## Prochaines étapes

1. Retour terrain BackUpFlow avant le 4/12 (entretien guidé)
2. Au Mac Studio : `git pull` sur `main`, vérifier HandBrake et `~/.backupflow/settings.json`, test réel (NAS avec et sans compression), puis build
3. Banc d'essai FFmpeg contre HandBrake Fast 1080p30 sur la copie d'un vrai rush
4. Fiche produit BackUpFlow V2 (D191 + état des lieux + règle de preuve + Guidance D196)
5. Session de cap PRÉSIDENCE : utilisateur de référence de la Suite (D337)

---

## Prompt de continuation

```
[BACKUPFLOW] Reprise — suite de la session du 27/11/2026

Contexte : réparation NAS + constats réels sur main (bca26b2, NON testée en réel). Corollaire de la Loi 3 acté (D335, Manifeste V1.1 : une app ne prétend jamais avoir accompli ce qu'elle n'a pas accompli). Branche evolution-v2 ouverte ; état des lieux docs/BACKUPFLOW_V2_ETAT_DES_LIEUX.md (280c87a). FFmpeg candidat contre HandBrake Fast 1080p30 (banc d'essai à faire). Un utilisateur de référence quitte la Cellule début décembre (D337, détail au Carnet, dépôt privé).

Documents : Plan Directeur V5.161 et récap SESSION_TRAVAIL_20261127_BACKUPFLOW_REPARATION_NAS_V2.md (repo tranquility-plan-directeur, actuel/), Carnet V103 (repo tranquility-carnet-pieges, actuel/), Manifeste du Workflow Captif V1.1 (projet).

Méthode : si la session est liée au Mac, JARVIS lit le code dans ~/Documents/GitHub (dossier accordé) ; Git reste dans le Terminal de Martin. Avant chaque prompt Cursor : git branch --show-current (main = production, evolution-v2 = V2).

Priorités :
1. URGENT avant le 4/12 : entretien guidé avec l'utilisateur de référence sortant sur son usage réel de BackUpFlow (JARVIS prépare la grille de questions)
2. Au Mac Studio : git pull sur main, vérifier HandBrake (which HandBrakeCLI) et ~/.backupflow/settings.json (compress), test réel NAS avec et sans compression, puis build
3. Banc d'essai FFmpeg vs HandBrake Fast 1080p30 sur la copie d'un vrai rush
4. Fiche produit BackUpFlow V2 (D191 + état des lieux + corollaire de la Loi 3 + Guidance D196)
5. Session de cap PRÉSIDENCE : utilisateur de référence de la Suite après ce départ
```

---

*Session 27/11/2026 · Tranquility Suite · BackUpFlow · Mac Maison*
