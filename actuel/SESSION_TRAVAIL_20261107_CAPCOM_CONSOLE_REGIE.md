# Session de travail — 7 novembre 2026
## Tranquility Suite — CAPCOM : conception de la console de régie (maquette cliquable)

*Type de session : conception produit et design d'interface, sans code d'app modifié · Mac Maison*

---

## Chantiers traités

### 1. Démarrage
- Pull des dépôts `capcom` (`c594b30`), `tranquility-plan-directeur` (`ee70ef8`, Plan V5.133) et `tranquility-carnet-pieges` (`3f28702`, Carnet V76) : la clôture du 06/11 était bien poussée, note d'homonymie présente dans `archives/`.
- Radar court depuis les documents : rien de nouveau. Rappel niveau 1 : la date de la séance SÉCURITÉ sur l'ancien registre de profils (D211) n'est toujours pas fixée. Audit Surveyor complet prévu vers le 20/11.
- Copies du projet Claude toujours périmées (Plan sous le nom V5_90, Carnet V59) : lecture des vraies versions transmises par Martin.
- Lecture de `public/regie.html` (1558 lignes) et `server.js` (703 lignes) pour inventorier les états déjà connus.

### 2. Inventaire des systèmes et des statistiques
- Cinq systèmes de la régie : liaison, micro, antenne (avec chrono), VERROU, auditeurs.
- Demande de PRÉSIDENCE : un maximum de statistiques individuelles, des actions par personne et un retour du téléphone vers la régie.
- Vérification de faisabilité : la batterie n'est pas lisible par une page web (Safari jamais, Chrome seulement en https) ; vibration et flash absents de Safari iOS. Piste Raccourcis iOS étudiée puis écartée.

### 3. Conception de la console sur maquette
- Maquette cliquable construite comme Artifact Design (« CAPCOM — Console de régie »), une dizaine d'itérations validées pas à pas par PRÉSIDENCE.
- Ordre des retours intégrés : colonnes par groupe avec l'équipe sous sa touche ; alerte d'une personne mise en exergue avec le bandeau ; un seul écran sans défilement ; vocabulaire « équipe » ; disposition adaptative en trois densités ; tableau de bord séparé et voyants non cliquables ; cases carrées façon cabine Apollo ; sous-cadres collés et chrono élastique ; plan intérieur des voyants ; édition à chaud ; PARAMÈTRES ; aperçus des densités ; QR code ; place du patch.

### 4. Patch
- Recherche des patches existants : quatre variantes dans `Mission Patches_Apollo Design/Capcom/`, toutes avec la devise de DOWNLINK.
- Choix de PRÉSIDENCE : `PATCH_Capcom.jpg`, tel quel, devise remplacée par *ALTA ET CLARA*.

---

## Décisions actées

- **D228** — Règle d'égalité : une fonction qui ne marche pas sur tous les téléphones n'entre pas dans CAPCOM. Vibration, flash et batterie automatique écartés ; bip dans l'oreillette retenu.
- **D229** — Le son reste à sens unique ; six messages préenregistrés remontent du téléphone vers la régie : REÇU, RÉPÉTEZ, PROBLÈME EN PLATEAU, LOW BAT TEL, LOW BAT CAM, URGENT : COUPER (demande d'arrêt du tournage, confirmée de vive voix). Précise D214.
- **D230** — Console de régie validée sur maquette, clôt la conception de D225 : colonnes par groupe, tableau de bord encastré à voyants carrés (LIAISON, MICRO, ANTENNE + chrono, ÉQUIPE), rouge réservé à l'antenne, alertes rares en bandeau orange fermé à la main, fiche en exergue pour une alerte venue d'une personne, un seul écran, densités COMPLET / COMPACT / MINI, « + N AUTRES » plutôt que cacher.
- **D231** — CAPCOM s'ouvre prête à l'emploi et se modifie à chaud (référence ATEM) avec trois niveaux de barrières (direct, confirmation, bloqué antenne ouverte), journal de chaque changement, menu PARAMÈTRES, configurations `.capcom` (JSON), règles d'affectation par poste. Le téléphone propose prénom et poste, la régie décide et le téléphone voit « MODIFIÉ PAR LA RÉGIE ». Révise D219 sur le lancement.
- **D232** — Bouton QR CODE toujours accessible, fenêtre « QR CODE DE CONNEXION », mode grand écran, compteur des connectés. Exception consciente : QR sur carré blanc.
- **D233** — Patch retenu : `PATCH_Capcom.jpg` tel quel, devise *ALTA ET CLARA*. DOWNLINK aura un patch neuf.
- **D234** — Renumérotation : le prototype devient la V1 (ex-V0), la cible Electron devient la V2 (ex-V1).
- Préférence : on parle d'« équipe », jamais d'« équipage ».

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| Artifact « CAPCOM — Console de régie » | Maquette cliquable de la console V2 (six scénarios, données fictives) | ✅ En ligne (claude.ai, privé) |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_134.md` | Plan Directeur (D228 → D234, section CAPCOM, inventaire) | 🟡 À pousser |
| `CARNET_PIEGES_V77.md` | Carnet (+11 pièges) | 🟡 À pousser |
| Ce récap | Récap de session | 🟡 À pousser (`actuel/`) |

Aucun code d'app modifié, aucun commit dans `capcom`.

---

## Pièges découverts

Voir `CARNET_PIEGES_V77.md` (11 entrées). Les principaux : la batterie est hors de portée d'une page web ; un QR inversé se lit mal ; un voyant qui ressemble à un bouton invite au clic ; des étiquettes longues débordent des cases carrées ; un panneau en `space-between` crée un vide ; un écran qui ne fait que rétrécir devient chaotique ; un réglage sans aperçu force les allers-retours ; une édition par remplacement mal ancrée casse toute la maquette.

---

## Dettes et points à reprendre

- **Écarts de couleur dans `regie.html`** : PERDU et HORS SERVICE en rouge, antenne en bleu (contraire à D222 et D230). À corriger à la construction.
- **Codes CPC à créer** pour les nouveaux états (messages reçus, configuration illisible ou introuvable, QR, règles par poste) et catalogue `docs/CAPCOM_CODES.md` à faire évoluer au fil de la construction.
- **Numéro de version dans le code** : `APP_VERSION` affiche encore `V0.06.11.26` (D234 : le prototype est la V1).
- **Finition de la console en demi-fenêtre** : reportée en V2 polish.
- **Liste de polish du 06/11 toujours ouverte** (paliers CPC-205 si l'onglet dort, délai de 4 s, sursis non lu à l'ouverture, onglet dupliqué, jeton en clair, `tranquility-core.css` en local, archivage de `docs/a-integrer/`).
- **Patch** : outil de production à choisir, devise à remplacer, puis MP4 animé sur fond noir pour le splash.
- **Hors CAPCOM** : date de la séance SÉCURITÉ (D211, niveau 1) ; audit Surveyor complet vers le 20/11.

---

## Prochaines étapes

1. **Plan de construction de la V2** : ordre logique, constructif et sécurisé, mini-plan, puis prompts Cursor un par un. Base : la maquette D230.
2. **Premier test au studio** : plusieurs téléphones, micro débranchable (CPC-202), Wi-Fi de L'Étudiant.
3. **Fiche produit** `FICHE_PRODUIT_CAPCOM_V1.md`.
4. **Production du patch** (D233), patch animé et splash.
5. **Intégration à RENDEZVOUS.**

---

*Session du 7 novembre 2026 · Tranquility Suite · CAPCOM · Mac Maison*
