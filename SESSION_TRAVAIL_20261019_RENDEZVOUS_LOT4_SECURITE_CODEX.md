# [RENDEZVOUS] Récap de session — R8 lot 4, contrôle SÉCURITÉ de ?preview=1 + défaut du patch CODEX

**Date :** lundi 19 octobre 2026 (10 h 12 à 14 h 39), Mac Maison
**Postes actifs :** NAVIGATION · MISSION CONTROL · SÉCURITÉ · MÉMOIRE (+ CODE pour les `git pull`). Session de lecture et de mesure : aucune ligne de code n'a été modifiée.
**Statut de ce fichier :** poussé sur GitHub avec le Plan Directeur (protocole de fin de session V2.1, D165). Clôture anticipée à la demande de PRÉSIDENCE (test de migration vers un compte team).

---

## 1. Résultat en une phrase

La piste 1 (fin du lot 4) est ouverte par son premier contrôle : le mode aperçu `?preview=1` est inactif en production (verdict SÉCURITÉ validé), et le patch CODEX est identifié comme le seul des 8 patches dont le fond n'est pas noir (bleu nuit, `060f1b`) ; sa correction (option A) est décidée mais pas encore faite.

## 2. Commits et versions

| Dépôt | Commit | Contenu |
|---|---|---|
| RENDEZVOUS (`lot4-ecran-principal`) | aucun | Aucune modification (lecture et mesures seulement). Dernier commit du lot inchangé : `bfc4e83`. Versions de cache inchangées : `style.css` v=50, `app.js` v=13, `carousel-data.js` v=3, `main-screen.js` v=10. |
| tranquility-plan-directeur | à la clôture | Plan V5.117 et ce récap, dans le même commit |
| tranquility-carnet-pieges | à la clôture | Carnet V59 |

`main` de RENDEZVOUS reste sans les étapes B à D4 (merge à la fin du lot).

## 3. Déroulé

1. **Ouverture.** `git pull` sur RENDEZVOUS et sur tranquility-plan-directeur : « Déjà à jour » des deux côtés. Lecture du Plan V5.116, de la Vision Produit et de la Design Reference. Mac actif : Mac Maison.
2. **Choix de chantier.** Les trois ordres (LOGIQUE, CONSTRUCTIF, SÉCURISÉ) convergent vers la piste 1, en commençant par le contrôle SÉCURITÉ de `?preview=1` (D169 : le merge sur `main` publie le code sur le vrai site). PRÉSIDENCE a retenu la piste 1.
3. **Contrôle SÉCURITÉ de `?preview=1`.** Recherche du mot « preview » dans le dépôt : le mode n'existe que dans `main-screen.js` (les autres occurrences, dans `admin.js` et `admin.html`, concernent le texte « Action sélectionnée »). Lecture complète de `main-screen.js` : le bloc s'active seulement si `location.hostname` est **exactement** `127.0.0.1` ou `localhost` (égalité stricte, pas une recherche de texte), donc jamais sur `realcoolclint.github.io`. Le mode fabrique de fausses données et n'ouvre aucune session réelle ni appel au proxy. **Verdict : porte fermée en production, aucune correction nécessaire. Validé par PRÉSIDENCE.**
4. **Trouvaille de PRÉSIDENCE.** En vérifiant le carrousel, le patch CODEX a encore un fond bleu foncé autour du cercle.
5. **Diagnostic.** Le carrousel lit `assets/patch-codex.mp4` (vidéo, 28/09) et `assets/patch-codex.png` (image fixe, 25/09) via `carousel-data.js` (lignes 142 et 143). Le dossier `assets` ne contient pas `ambiance-codex-noir.mp4`, seulement `ambiance-codex.mp4` (25/09). Mesure de la couleur du coin de `patch-codex.mp4` avec `ffmpeg` : `060f1b` (bleu nuit), au lieu de `000000`. Mesure des 8 vidéos : sept sont quasi noires (`000000` à `010101`, écarts de 0 à 2 niveaux = arrondi d'encodage), **seule CODEX est colorée**. Défaut isolé : pas de passe générale.
6. **Décision.** Option A retenue par PRÉSIDENCE : corriger maintenant (nouvelle vidéo `patch-codex-noir.mp4` produite à côté de l'original, sans rien écraser, jugée à l'œil avant substitution). Première étape engagée : mesurer le centre et le diamètre du cercle dans la vidéo ; les deux commandes (`ffprobe` pour la taille, `cropdetect` pour la zone du patch) ont été données mais pas exécutées avant la clôture.
7. **Clôture anticipée** demandée par PRÉSIDENCE (test de migration vers un compte team).

## 4. Décisions actées

Aucune nouvelle décision D-xx. Deux validations de PRÉSIDENCE, consignées dans le Plan V5.117 : verdict SÉCURITÉ sur `?preview=1` ; option A pour le patch CODEX.

## 5. Dettes (une ligne chacune, non traitées en séance)

**Nouvelles**
- **Patch CODEX à corriger** : `patch-codex.mp4` a un fond bleu nuit (`060f1b`) ; produire `patch-codex-noir.mp4` par masque circulaire calé sur le liseré, sans écraser l'original, puis juger à l'œil et substituer. Reste à mesurer le centre et le diamètre du cercle (`ffprobe` + `cropdetect`). À faire avant le merge sur `main`.
- **Le carrousel montre le bleu ; l'écran principal l'atténue probablement** (son masque circulaire `PATCH_EDGES`, codex 95 %, rogne les coins) : déduction non mesurée, à vérifier au moment du correctif.
- **Deux fichiers distincts à ne pas confondre** : D149 concerne l'ambiance (`ambiance-codex.mp4`, réexport `ambiance-codex-noir.mp4` « à substituer à la construction »), D152 concerne le patch (`patch-codex.mp4`). Le dossier `assets` de RENDEZVOUS ne contient pas la version noire de l'ambiance : substitution D149 à vérifier côté RENDEZVOUS et CODEX.
- **Recette après merge** : ouvrir `https://realcoolclint.github.io/RENDEZVOUS/?preview=1` et vérifier qu'on voit le lobby normal, sans écran connecté.
- **Code d'aperçu inerte mais publié** : il part en production avec le reste. À isoler à la V1 si PRÉSIDENCE le souhaite (aucune urgence).

**Soldée :** le contrôle SÉCURITÉ de `?preview=1` (voir 3.3).

**Toutes les autres dettes** (D4, D3, héritées du lot 4, nettoyage, documentation) restent celles du récap `SESSION_TRAVAIL_20261018_RENDEZVOUS_R8_LOT4_D4.md`, section 5, inchangées et reprises dans le prompt de continuation.

## 6. Chantiers ultérieurs

Inchangés par rapport au récap du 18/10 (D4), section 6 : D164 Authentification ADMIN avant la V1 (deux questions de cadrage à poser d'abord) · SSO RENDEZVOUS vers les apps web · refus de doublon côté proxy pour `request-affectation` · prénom et affectation dans le JWT avant le lot 6 · CORS dupliqué dans 9 fonctions · lots 5 et 6 · 7 patches d'affectation (moodboard Flow requis) · « Revue IA du mois » lundi 2 novembre.

## 7. Ce qui a bien marché

- Mesurer avant de conclure : la couleur du coin de la vidéo (`060f1b`) a tranché entre « vidéo » et « image fixe », puis le balayage des 8 vidéos a montré que le défaut était isolé.
- Contrôle SÉCURITÉ fondé sur la lecture du code complet (égalité stricte du nom d'hôte), pas sur une impression.

## 8. Prochaine session

Reprendre la piste 1 au point exact où elle s'est arrêtée : mesurer le cercle de `patch-codex.mp4` (`ffprobe` puis `cropdetect`), produire `patch-codex-noir.mp4`, le juger à l'œil, puis passer au polish des dettes, au merge de `lot4-ecran-principal` sur `main`, au nettoyage et à la recette sur GitHub Pages. L'Authentification ADMIN (D164) vient ensuite.

*Récap rédigé par JARVIS — poste MÉMOIRE.*
