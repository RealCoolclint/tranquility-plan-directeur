# SESSION DE TRAVAIL — 15/11/2026 — [CAPCOM] Identité visuelle : patch ALTA ET CLARA, icônes d'en-tête et d'écran d'accueil

*Mac Maison · Plan Directeur V5.145 → V5.146 · Carnet V88 → V89 · Décisions D279 → D284 · version de l'app V2.14.11.26 (inchangée, D274) · catalogue CPC V0.7 (inchangé)*

---

## 1. Démarrage

- **Mac Maison** (`martinpavloff`), session ouverte le 15/11 vers 10 h 30, close vers 17 h 35 (avec une pause).
- Plan lu sur un clone du dépôt public (`5a8cea8`, **V5.145**) avec le récap du lot options son ; aucune session intercalée : numérotation des décisions à partir de **D279**.
- `git pull` de `capcom` (`a066562`, à jour) et du Carnet (V88, lu en entier) ; `tranquility-flow` absent du Mac. **Radar court réel** (31 dépôts) : aucune alerte nouvelle sur la flotte ; alertes connues inchangées (CAPCOM hors RENDEZVOUS, pointeur LFS de `launcher-tray@2x.png`, deux `patch-transporter.png`, instructions JARVIS figées depuis le 05/07, date de la séance SÉCURITÉ D211, audit complet vers le 20/11). **Nouveau pour le chantier** : le dépôt `tranquility-flow` (proposé par D88) n'a jamais été créé. SETI : aucun signal.
- **Changement de programme demandé par PRÉSIDENCE** (Electron, splash et patch au lieu du test au studio, impossible depuis la maison) : arrêt de NAVIGATION, D235 et D271 placent le test au studio avant Electron. Arbitrage **D279**.
- **Erreur de JARVIS corrigée en séance** : il avait annoncé une production du patch « par Google Flow, agence créa », en suivant l'instruction permanente du 04/09 sans vérifier le Plan ; or D92 a rétrogradé Flow en studio d'exécution, la question « abandonner Flow ? » est ouverte depuis le 19/10 et D233 laisse l'outil à choisir. Récidive d'un piège déjà au Carnet (06/11).

## 2. Patch fixe ALTA ET CLARA

- **Original** : `PATCH_Capcom.jpg` (1024 × 1024, empreinte `c990c3ce…41f2`), dans `Mission Patches_Apollo Design/Capcom` (chemin avec une espace après `BOULOT` et une apostrophe dans `L'Etudiant`). Devise d'origine *FIDE ET NUNTIA*, celle de l'ancien CAPCOM devenu DOWNLINK.
- **Outil (D280)** : retouche ciblée dans Photoshop (remplissage génératif Firefly) sur la seule zone de la devise, contre une régénération de l'image entière ou une retouche entièrement manuelle. ET conservé tel quel ; FIDE et ALTA ont le même nombre de lettres.
- **ALTA** réussi du premier coup. **CLARA** : trois variantes ratées (« CLRAM », « CLAR » suivi d'une lettre cassée) ; PRÉSIDENCE a gardé la meilleure et effacé la lettre parasite au lasso avec l'outil Supprimer.
- **Contrôle pixel par pixel** (export PNG, sans perte) : aucun pixel modifié hors des lettres ; CAPCOM, la scène, le pupitre, le liseré et ET strictement identiques à l'original.
- **Mesure de l'équilibre** (centre du patch mesuré sur le liseré : 510,5 ; 511,5) : ALTA démarre exactement où démarrait FIDE, mais CLARA s'arrête 14° plus tôt que NUNTIA ; devise décalée de **7,2°** vers la gauche.
- **Redressement (D281)** : PRÉSIDENCE efface les trois mots (remplissage génératif « plain black embroidered fabric », fond contrôlé : rien d'autre ne bouge) ; JARVIS découpe les lettres par différence entre le patch et ce fond, les fait tourner de 7,2° autour du centre mesuré et les repose. Devise recentrée à 89,6°, comme l'ancienne ; zéro pixel modifié au-dessus de la bande ; aucun pixel du pupitre transporté ; quelques pixels du bord intérieur du liseré modifiés d'une ou deux nuances par le fondu de Firefly (invisible à fort grossissement).
- **Patch maître validé (D282)** : `PATCH_Capcom_ALTA_ET_CLARA_V2.png`, 1024 × 1024 ; produit avec l'empreinte `52ae1d3c…94c3`, téléchargé avec l'empreinte **`b4809725…859b`** (fichier recompressé au téléchargement, pixels strictement identiques : 1 048 576 sur 1 048 576). L'empreinte de référence est celle du fichier entré dans le dépôt.
- **Rangement (D283)** : `capcom/public/assets/PATCH_Capcom.png` (convention de la flotte : chaque app garde son patch dans son dépôt), copie dans `Mission Patches_Apollo Design/Capcom` ; l'original JPG reste intact. Commit `739a595`.

## 3. Icônes et en-têtes (D284)

- **Constat** : la Design Reference demande un patch rond de 30 px (`.header-logo`, défini dans `tranquility-core.css`) à la place d'un logo texte ; les deux pages de CAPCOM n'affichaient que du texte. Le patch maître pèse 1,3 Mo et le serveur interdit la mise en cache (`no-store`) : chaque téléphone le retéléchargerait à chaque ouverture. `server.js` sert déjà les `.png` des sous-dossiers de `public/`, sans modification.
- **Deux dérivés fabriqués par JARVIS** à partir du patch maître : `patch-capcom-entete.png` (128 × 128, détouré en rond, fond transparent, 36 Ko) pour les en-têtes et les onglets ; `apple-touch-icon.png` (180 × 180, opaque, 51 Ko) pour l'écran d'accueil de l'iPhone. Icône iPhone **sans moodboard** (réduction directe du patch validé ; la règle « moodboard pour une icône de plateforme » venait de l'instruction Flow périmée).
- **Régie** : icône d'onglet + patch dans l'en-tête ; premier rendu avec le titre trop haut (repéré par PRÉSIDENCE : sorti de l'alignement sur la ligne de base, le patch laissait les deux textes en haut du bloc) ; correction : titre et devise dans un bloc `.header-titre` aligné sur la ligne de base, bloc centré avec le patch ; JARVIS avait demandé un `span`, Cursor a signalé qu'un `span` ne peut contenir ni `h1` ni `p` : remplacé par un `div`. Testé à l'écran, OK.
- **Écoute** : icône d'onglet, `apple-touch-icon`, patch dans l'en-tête (le bloc titre existant sert de bloc à centrer, aucun CSS ajouté) ; mode « app plein écran » d'iOS volontairement écarté (renvoyé aux évolutions). Testé sur iPhone : en-tête, raccourci recréé sur l'écran d'accueil avec le patch et le nom CAPCOM, ouverture depuis le raccourci. OK.
- Commit `9660847` (deux pages, deux icônes). Conformité Design Reference vérifiée avant chaque prompt (classe `.header-logo` non redéfinie, aucune couleur en dur, pas d'emoji, CSP déjà ouverte aux images locales).

## 4. Décisions

| N° | Objet |
|---|---|
| **D279** | Le test au studio reste avant Electron (D235, D271 confirmés) ; à la maison, on avance l'identité visuelle, dans l'ordre : patch fixe, icônes, patch animé et splash prêts à brancher au Lot 5 |
| **D280** | Devise du patch CAPCOM changée par retouche ciblée dans Photoshop (remplissage génératif sur la seule zone de la devise, ET conservé), contrôle pixel par pixel contre l'original ; choix valable pour ce patch seulement, la question « Flow, oui ou non » reste ouverte |
| **D281** | Devise recentrée par rotation calculée : lettres découpées par différence avec un fond vide généré, tournées de 7,2° autour du centre mesuré du patch ; axe de l'ancienne devise retrouvé (89,6°) |
| **D282** | Patch maître CAPCOM validé : `PATCH_Capcom_ALTA_ET_CLARA_V2.png`, 1024 px, empreinte de référence `b4809725…859b` (pixels identiques au fichier produit `52ae1d3c…`) ; l'original `PATCH_Capcom.jpg` (FIDE ET NUNTIA) reste intact, réservé à DOWNLINK |
| **D283** | Le patch maître vit dans le dépôt de l'app (`capcom/public/assets/PATCH_Capcom.png`), comme pour le reste de la flotte, avec une copie dans le dossier local des patches ; `tranquility-flow` n'est pas créé |
| **D284** | Icônes dérivées du patch maître, sans moodboard : `patch-capcom-entete.png` (128 px, rond, transparent) pour les en-têtes `.header-logo` et les onglets, `apple-touch-icon.png` (180 px) pour l'écran d'accueil iPhone ; pas de mode plein écran iOS |

## 5. Livré et testé (dépôt `capcom`, Mac Maison)

| Commit | Contenu |
|---|---|
| `739a595` | Patch maître `public/assets/PATCH_Capcom.png` (1024 px, ALTA ET CLARA) |
| `9660847` | Patch rond dans l'en-tête de la régie et de l'écoute, icônes d'onglet, icône d'écran d'accueil iPhone, bloc titre de la régie centré avec le patch |

Fichiers de travail hors dépôt : `PATCH_Capcom_TRAVAIL.psd` (calques génératifs conservés), `PATCH_Capcom_ALTA_ET_CLARA.png` (avant redressement), `PATCH_Capcom_FOND.png` (fond sans devise), dans `Mission Patches_Apollo Design/Capcom`.

## 6. Commandes Terminal produites

```bash
# Démarrer CAPCOM seulement si le port 3000 est libre
cd ~/Documents/GitHub/capcom && if lsof -nP -iTCP:3000 -sTCP:LISTEN; then echo "PORT 3000 DÉJÀ OCCUPÉ : rien lancé"; else npm start; fi
```

```bash
# Retrouver un fichier téléchargé introuvable : toutes les images .png des 20 dernières minutes
find ~ -path ~/Library -prune -o -name '*.png' -mmin -20 -print 2>/dev/null
```

```bash
# Copier une image seulement si sa taille en pixels est la bonne (exemple : 180 x 180)
f="$HOME/Downloads/Images/apple-touch-icon.png"; [ "$(sips -g pixelWidth "$f" | awk '/pixelWidth/{print $2}')" = "180" ] && cp "$f" ~/Documents/GitHub/capcom/public/assets/
```

## 7. Liste de polish (cumul V2)

Toutes les entrées des récaps précédents restent valables. **Ajouts du 15/11 :** `.impeccable/config.json` toujours suivi par Git dans `capcom` (à faire ignorer, comme RENDEZVOUS en octobre) ; icône d'onglet gardée en mémoire par certains navigateurs (sans incidence) ; un raccourci iPhone déjà posé garde l'ancienne icône tant qu'il n'est pas recréé (à dire à l'équipe le jour du déploiement).

## 8. Dettes et points ouverts

- **Question Flow** (ouverte depuis le 19/10) : à trancher au tour de table du Council **au début de la prochaine session**, avant le patch animé (génération vidéo). Le patch fixe a été produit sans Flow.
- **Instructions du projet** : l'instruction permanente « Google Flow, agence créa de la Suite » (04/09) est périmée depuis D92 et vient de faire dévier JARVIS ; à retirer ou annoter par PRÉSIDENCE. Règle Hazel à compléter : les `.png` vont dans `~/Downloads/Images/`.
- **Design Reference** (audit Surveyor du ~20/11) : inchangé (D265, D273, curseurs, police des toasts) ; la classe locale `.header-titre` de la régie ne crée aucune règle nouvelle.
- **Identité** : patch animé, splash et animation d'ouverture restent à faire ; la copie du patch pour RENDEZVOUS se fera à l'intégration.
- Test au studio inchangé (liste du lot options son) ; messages en attente perdus au rechargement de la régie ; hors CAPCOM : séance SÉCURITÉ (D211), audit Surveyor complet vers le 20/11.

## 9. Prochaines étapes

1. **Tour de table du Council « Flow, oui ou non ? »**, puis choix de l'outil du **patch animé** (consignes `TRANQUILITY_CONSIGNES_PATCH_ANIME.md`, mesure des coins de la vidéo).
2. **Patch animé**, puis **splash** (Mercury Opening commun) prêt à brancher.
3. **Test intermédiaire au studio** dès le prochain passage (liste inchangée, test ATEM compris).
4. **Lot 5 — Electron** (branchement du splash, détection fiable du Bluetooth), puis **Lot 6 — PARAMÈTRES et `.capcom`** ; fiche produit, intégration à RENDEZVOUS ; cible multi-régie après le Lot 5.

## 10. Pièges

Treize entrées ajoutées au Carnet V89 : instruction permanente périmée suivie (récidive) ; générateur d'images qui ne sait pas compter ; contrôle pixel par pixel en PNG ; mot plus court qui décentre une devise ; fond vide et rotation calculée ; téléchargement qui change l'empreinte ; Hazel et les images ; chemin avec espace finale et apostrophe ; copie de Terminal prise trop tôt ; consigne d'interface donnée par position ; image sortie d'un alignement sur la ligne de base ; `span` qui contient des blocs ; patch maître trop lourd pour un en-tête sans cache.

---

*Récap · Tranquility Suite · CAPCOM · 15 novembre 2026 · Mac Maison*
