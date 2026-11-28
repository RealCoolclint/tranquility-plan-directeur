# Session de travail — 28 novembre 2026
## Tranquility Suite · BackUpFlow — Conception du parcours V2, audit du chemin contre le code

*Session hybride (conception produit + audit technique) · Mac Maison · suite de la session du 27/11*

---

## Chantiers traités

### Démarrage
Récap du 27/11 lu. Postes actifs : TERRAIN, ADOPTION, FORMATION, QUALITÉ, CONCEPTUALISATION, MÉMOIRE, avec NAVIGATION et MISSION CONTROL. SETI : aucun signal. Session liée au Mac Maison, dossier `~/Documents/GitHub` accordé ; JARVIS lit et écrit les documents, Martin exécute Git.

### Retour terrain recadré
La grille d'entretien proposée par JARVIS, cristallisée sur un utilisateur sortant, est écartée par PRÉSIDENCE. Le retour terrain devient un protocole de labo rejouable (cobaye de l'équipe, consigne unique, pensée à voix haute, relevé, vérification croisée, débrief court), d'abord sur la V1 comme mesure de départ, puis sur la V2. ADMIN ne sert pas de cobaye (trop de clés de réponse), mais conçoit le parcours avec JARVIS.

### Conception du parcours V2
Quatre actes : JE TE CONNAIS (scénario + profil, reconnaissance des supports par signature et photo, provenance des rushes), PRÉPARATION (points de contrôle validés seuls par l'app ; 11 points pour STUDIO A), EN ROUTE (piste de stations, heure de fin, étalons, signe de vie, point de sécurité), BILAN (verdict à trois états, preuves par destination, relance ciblée, certificat de sauvegarde, célébration méritée). Environnement : un T7 par ATEM, adaptateur Ethernet direct et sécurisé, Wi-Fi contrôlé, switch en évolution. Catalogue des pannes d'environnement vécues (7 pannes, 4 prises en charge totalement).

### Audit du chemin contre le code
Lecture seule de `main.js`, `modules/storage.js` et `renderer.js` (`bca26b2`). Quatre écarts : double lecture de la source, étapes post-copie en option, multicam sur une autre chaîne, copie Studio sautée en silence. Quatre angles morts : copies non vérifiées et progression simulée, écran de fin mensonger, lien Gofile et Monday jamais vérifiés, vidéos renommées. Bonnes bases : montage et reconnexion NAS, contrôle d'espace, écriture Monday.

### Copie V2
Comparaison de trois méthodes ; retenue : lecture unique, écriture double, avec empreintes (plus rapide que la V1 et vérifiée). Ordre d'exécution : Gofile (originaux) en parallèle de la compression.

### Documentation
`docs/BACKUPFLOW_V2_PARCOURS.md` créé puis complété sur `evolution-v2`.

---

## Décisions actées

- **D338** — Le parcours V2 se déroule en quatre actes : JE TE CONNAIS, PRÉPARATION, EN ROUTE, BILAN ; les scénarios sont des données partagées ; l'app vérifie, l'utilisateur confirme
- **D339** — Un T7 reste en permanence sur son ATEM ; adaptateur Ethernet direct, sécurisé, port attitré, même kit pour tous ; Wi-Fi contrôlé par l'app, switch en évolution
- **D340** — Chaîne V2 : SSD1 Studio + SSD Profil → compression → NAS (compressé uniquement) + Gofile (original + compressé) → Monday relu ; compression obligatoire ; filet D334 conservé sur `main` jusqu'à la V2
- **D341** — Copie V2 : lecture unique, écriture double, empreintes, reprise, progression mesurée ; Gofile (originaux) en parallèle de la compression ; un échec NAS ne prive jamais Monday du lien Gofile
- **D342** — EN ROUTE et BILAN : suivre et prouver ; célébration réservée au succès complet ; effacement des supports hors périmètre (action ADMIN)
- **D343** — V1 gelée : défauts connus acceptés consciemment jusqu'à la V2, aucune micro-correction ; la V2 doit être un vrai changement
- **D344** — Le retour terrain passe par un protocole de labo rejouable avec n'importe quel utilisateur naturel ; l'urgence de D337 est levée

---

## Livrables produits

| Élément | Nature | État |
|---------|--------|------|
| `docs/BACKUPFLOW_V2_PARCOURS.md` (BackUpFlow, `evolution-v2`) | Parcours V2, audit, questions ouvertes | ✅ `0045a6d` puis `531dca5` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_162.md` | D338 → D344 | 🟡 à pousser |
| `CARNET_PIEGES_V104.md` | +8 pièges | 🟡 à pousser |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Contexte BackUpFlow à jour | 🟡 à pousser |
| Ce récap | Document de session + prompt de continuation | 🟡 à pousser |

---

## Pièges découverts

- Commandes Git sans `cd` → échec si le Terminal se rouvre dans `~` → toujours commencer par `cd ~/Documents/GitHub/<repo> &&`
- Commentaire « EN PARALLÈLE » faux dans `main.js` → lire le code exécuté, pas le commentaire
- Réparation de `main.js` sans `renderer.js` → l'écran ment encore → vérifier moteur et écran
- Échec NAS → lien Gofile jamais inscrit dans Monday
- Copie V1 : double lecture de la source et progression simulée
- Multicam V1 : chaîne différente (pas de Gofile, écrasement)
- Remède matériel proposé contraire à la règle T7 = ATEM → vérifier les règles de terrain d'abord
- Un exemple nommé n'est pas une dépendance (retour terrain)

---

## Dettes et points ouverts

- Acte 1 à décliner pour STUDIO B, EXTÉRIEUR, MULTICAM
- Protocole de labo : feuille de relevé et questions du débrief à rédiger
- `docs/BACKUPFLOW_CODES.md` à créer (codes `BKF-xxx`)
- `compression.js` et `upload.js` non lus en détail
- Ancienne règle du carnet « jamais Promise.all Gofile + HandBrake » : retrouver sa raison avant de coder D341
- Douze questions ouvertes listées dans `docs/BACKUPFLOW_V2_PARCOURS.md` (section 12)

---

## Prochaines étapes

1. Confirmer le sort de `bca26b2` après D343 : test et build au Studio, ou V1 gelée en l'état
2. Fiche produit BackUpFlow V2 (D191 + état des lieux + parcours + règle de preuve + Guidance D196)
3. Au Studio : vérifier HandBrake et `~/.backupflow/settings.json`, constater la structure d'une carte Sony, mesurer le débit réel du T7 à travers l'ATEM
4. Banc d'essai FFmpeg contre HandBrake Fast 1080p30 sur la copie d'un vrai rush
5. Protocole de labo : rédiger la feuille de relevé, puis première passe sur la V1
6. Session de cap PRÉSIDENCE : utilisateur de référence de la Suite (D337)

---

## Prompt de continuation

```
[BACKUPFLOW] Reprise — suite de la session du 28/11/2026

Ce qui s'est passé (28/11) : parcours V2 conçu en quatre actes (JE TE CONNAIS, PRÉPARATION, EN ROUTE, BILAN — D338 à D342), confronté au code réel bca26b2 (4 écarts, 4 angles morts). Copie V2 : lecture unique, écriture double, empreintes (D341). Compression obligatoire, NAS compressé uniquement (D340). V1 gelée jusqu'à la V2, défauts acceptés consciemment (D343). Retour terrain par protocole de labo rejouable (D344, urgence de D337 levée).

Documents : docs/BACKUPFLOW_V2_PARCOURS.md (BackUpFlow, evolution-v2, 531dca5) et docs/BACKUPFLOW_V2_ETAT_DES_LIEUX.md ; Plan Directeur V5.162 et ce récap (tranquility-plan-directeur, actuel/) ; Carnet V104 (tranquility-carnet-pieges, actuel/).

Méthode : si la session est liée au Mac, JARVIS lit le code dans ~/Documents/GitHub (dossier accordé) ; Git reste dans le Terminal de Martin, chaque bloc commence par cd. Avant chaque prompt Cursor : git branch --show-current (main = V1 gelée, evolution-v2 = V2).

Priorités :
1. Trancher le sort de bca26b2 (test et build au Studio, ou gel en l'état)
2. Fiche produit BackUpFlow V2
3. Au Studio : HandBrake, settings.json, structure d'une carte Sony, débit du T7 via l'ATEM
4. Banc d'essai FFmpeg vs HandBrake Fast 1080p30
5. Protocole de labo : feuille de relevé, première passe sur la V1
```

---

*Session 28/11/2026 · Tranquility Suite · BackUpFlow · Mac Maison*
