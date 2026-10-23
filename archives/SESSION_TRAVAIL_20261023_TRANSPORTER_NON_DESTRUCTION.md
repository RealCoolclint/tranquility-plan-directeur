# Session de travail — 20 au 23 octobre 2026
## Tranquility Suite · [TRANSPORTER] Vague 0 : non-destruction de Transporter · Mac Maison

*Martin + JARVIS · Plan Directeur V5.125 → V5.126 · Carnet V67 → V68*

---

## Démarrage

Protocole V2.1 appliqué : Mac Maison ; `git pull` de `tranquility-plan-directeur` et `tranquility-carnet-pieges` (déjà à jour) ; clone du dépôt public du Plan par JARVIS : V5.125, commit `a5dc8de`, récap `SESSION_TRAVAIL_20261020_RENDEZVOUS_AUDIT_PLANIFICATION.md`. Carnet : la recherche dans les ressources du projet ne trouvait que la V66 (vue figée à l'ouverture de la conversation) ; vérification sur le Mac : V67 bien présente (`b60a07b`), transmise en pièce jointe. Versions conformes au prompt de continuation.

Cap vérifié : la session suit D206 (vague 0, point 1 : non-destruction de Transporter, D192 et D204). Aucune dérive.

Postes actifs : SÉCURITÉ, QUALITÉ, CODE, TERRAIN, MÉMOIRE (NAVIGATION en fin de session).

Aucun code d'app modifié. Aucun prompt Cursor.

---

## Chantiers traités

### 1. Diagnostic du code de Transporter (lecture seule)

Dépôt public `Transporter` lu par JARVIS : dernier commit `9a163bb` (29/03/2026), étiquette la plus récente `v1.01.04.26` ; les fichiers qui manipulent les fichiers (copie, ZIP, réécriture du projet) n'ont pas changé depuis le premier commit du 20/03/2026.

Constat : en usage normal, le `.prproj` d'origine est seulement lu, empreinté et copié ; toutes les écritures vont dans la valise ou dans le dossier temporaire du Mac. La promesse de la documentation tient pour l'usage normal. Le code laissait toutefois prévoir des chemins dangereux hors usage normal, classés du plus grave au plus anodin, puis soumis au test.

### 2. Protocole de test de non-destruction, écrit puis exécuté

Protocole validé par PRÉSIDENCE avant exécution : six tests sur des copies, dans un labo isolé, photo des empreintes avant et après chaque test, témoins rangés hors de la zone de test.

Labo (conservé tel quel, servira de recette à la correction) :
- `~/Desktop/TEST_TRANSPORTER/` : `PROJET_TEST/` (projet Premiere de test et ses médias) et `DESTINATION/` ;
- `~/Desktop/TEST_TRANSPORTER_TEMOINS/` : copie de référence du projet, photos des empreintes, valises de chaque test (T1, T2, T3, T5) et copie de réception.

Médias de test fabriqués avec ffmpeg : deux clips portant le même nom `C0001.MP4` (rouge dans `CARTE_A`, bleu dans `CARTE_B`), un son, une image. Transporter n'est pas installé sur le Mac Maison : il a été cloné dans `~/Documents/GitHub/Transporter` et lancé depuis son code (`npm start`), ce qui teste exactement le code lu.

### 3. Résultats

| Test | Scénario | Original | Constat |
|---|---|---|---|
| T1 | Valise normale, sans ZIP | Intact (constaté) | Un des deux médias de même nom omis dès l'analyse ; rapport « succès » |
| T2 | Valise normale, avec ZIP | Intact (constaté) | Même omission ; ZIP sain ; dossier de la valise supprimé comme prévu |
| T3 | Cas de nommage particulier, avec ZIP | **Détruit (constaté)** | Dossier du projet supprimé définitivement, rushes compris, hors Corbeille ; contenu rescapé seulement dans le ZIP ; rapport « succès » |
| T4 | Médias de même nom | — | Couvert par T1 |
| T5 | Valise refaite le même jour, même destination, avec ZIP | Intact (constaté) | Ancienne valise fusionnée puis effacée ; un fichier ajouté par un monteur ne survit que dans le ZIP ; aucune alerte |
| T6 | Valise posée dans le dossier du projet, avec ZIP | Intact (constaté) | Rien à signaler |

Contrôle chez le destinataire (valise de T1 ouverte dans Premiere, original masqué) : Premiere rétablit seul les liens et branche le clip rouge à la place du bleu, sans message. Constaté à l'image. Le défaut des médias de même nom produit donc un mauvais plan invisible, pas un média hors ligne. Le `.prin` absent de la valise n'a pas empêché l'ouverture du projet (constaté sur ce test).

T3 donne une explication crédible, non prouvée, de l'incident de D192 : PRÉSIDENCE ne se souvient pas des circonstances.

### 4. Arbitrages de PRÉSIDENCE

- Aucune consigne temporaire à l'équipe : Transporter n'est pas déployé, seul Thomas l'avait, et l'usage est en pause jusqu'à ce que l'app soit prête.
- Option B retenue : la vague 0 continue dans l'ordre de D206 ; la correction de Transporter est inscrite comme décision (D207) avec une échéance.
- Clôture de session plutôt qu'enchaînement : BackUpFlow ouvre sa propre session.

---

## Décisions actées

- **D207** — Transporter : correction de trois défauts de non-destruction, recette par les six tests du labo, à terminer avant la fin de la vague 2 ; à défaut, Transporter n'est pas proposé au téléchargement dans le hub du palier 1 (D205). Usage en pause, consigne « jamais sans sauvegarde » maintenue.
- Le labo `TEST_TRANSPORTER` et ses témoins restent en place jusqu'à la recette de la correction.

---

## Défauts à corriger (D207)

1. **Critique** : suppression définitive d'un dossier existant dans un cas de nommage combiné à l'option ZIP (détail au Carnet, dépôt privé).
2. **Critique** : médias de même nom, l'un est omis de la valise ; chez le destinataire, Premiere relie le mauvais fichier sans alerte.
3. **Élevé** : une valise refaite le même jour, dans la même destination, fusionne avec la précédente puis l'efface.
4. **Moyen** (vu dans le code, non testé) : le dossier de la valise est supprimé dès que le ZIP existe, sans vérifier qu'il est complet.
5. **Transverse** : le rapport annonce « succès » dans tous ces cas (rejoint la brique Guidance, D196).

## Liste de polish Transporter (sans risque pour les fichiers)

- `.prin` non copié dans la valise (aucun blocage constaté à l'ouverture).
- Sélecteur de projet par le bouton : ne fonctionne qu'au deuxième essai (constaté deux fois).
- Heures des fichiers du ZIP en heure universelle.
- 11 failles signalées par `npm audit` dans les dépendances (4 modérées, 7 élevées) ; aucun `npm audit fix` avant la correction.
- Envoi automatique de chaque valise vers Gofile : à inscrire dans le registre RGPD.
- Finder planté une fois pendant T2, cause inconnue, non reproduit en T3 ni T5.
- Version installée chez Thomas à contrôler (lecture directe de la version dans le paquet de l'app).

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `SESSION_TRAVAIL_20261023_TRANSPORTER_NON_DESTRUCTION.md` | Récap | ✅ |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_126.md` | Plan Directeur, réécriture complète (D207) | ✅ |
| `CARNET_PIEGES_V68.md` | Carnet, réécriture complète (+7 pièges) | ✅ |
| Prompt de continuation | Texte | ✅ |
| Labo `TEST_TRANSPORTER` et témoins | Mac Maison, sur le Bureau | ✅ conservé |
| Clone `~/Documents/GitHub/Transporter` | Mac Maison | ✅ |

---

## Pièges découverts

Sept entrées ajoutées au Carnet V68 : trois propres à Transporter, deux de méthode de test, une sur zsh, une sur la version affichée en lancement depuis le code.

---

## Prochaines étapes

1. Vague 0, suite, en session `[BACKUPFLOW]` : diagnostic des gels de BackUpFlow, en lecture seule.
2. Vague 0 : fiche RGPD de COVENANT (y ajouter au passage l'envoi Gofile de Transporter au registre), séance SÉCURITÉ sur l'ancien registre des profils, mesure du poids moyen d'une vidéo terminée.
3. Vague 1 : Authentification ADMIN.
4. Correction de Transporter (D207) à placer avant la fin de la vague 2.

---

*Session du 20 au 23 octobre 2026 · Tranquility Suite · [TRANSPORTER] · Mac Maison*
