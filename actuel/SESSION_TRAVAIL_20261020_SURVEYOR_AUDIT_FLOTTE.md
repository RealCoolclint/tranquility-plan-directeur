# Session de travail — 20 octobre 2026 (soir)
## Tranquility Suite · Audit Surveyor complet n°2 · Mac Maison

*Martin + JARVIS · Plan Directeur V5.123 → V5.124 · Carnet V65 → V66*

---

## Démarrage

Protocole V2.1 appliqué : Mac Maison ; clone du dépôt public `tranquility-plan-directeur` (Plan V5.123 et récap `SESSION_TRAVAIL_20261020_RENDEZVOUS_D180_MOBILE.md` dans `actuel/`, commit `b26b849`) ; Carnet V65 trouvé par la recherche dans les ressources (absent de la liste des fichiers du projet, vue figée connue). Versions conformes.

Chantier annoncé par le prompt de continuation : AUTOPILOT (prototype AutoClip et test de la méthode du pipeline).

---

## Réorientation de PRÉSIDENCE

AUTOPILOT est jugé beaucoup trop tôt : c'est un concept, pas un chantier de la phase Gemini. **D187** le reporte à la phase Apollo. PRÉSIDENCE pose le critère de passage Gemini → Apollo : **RENDEZVOUS à 100 % (D188)**, puis fixe l'ordre de la session : un vrai passage Surveyor (le dernier datait du 25/09), une interview app par app, ensuite seulement RENDEZVOUS et la suite.

Un premier état des lieux tiré du seul Plan Directeur (« audit sur pièces ») a été écarté au profit du radar réel. Il avait d'ailleurs affirmé à tort que l'identité visuelle de CODEX n'était pas faite.

---

## Passage Surveyor

- Radar complet lancé par Martin le 20/10 à 18 h 03 (`RADAR_latest.txt`), croisé avec le registre de flotte, le rapport du 25/09, le Plan, les fiches produit et le registre RGPD.
- Lecture directe des dépôts publics de données, sans afficher de données nominatives.
- **Rapport `surveyor/SURVEYOR_20261020.md` poussé (commit `c7943f6`)** : synthèse, sources, inventaire, grille, écarts, effets croisés, fraîcheur et interview, plan d'action, propositions pour le registre.

### Alertes

| Niveau | Constat |
|---|---|
| 1 · Données | Ancien registre de profils des apps de bureau : dépôt public contenant des données de collègues et le coffre chiffré des clés ; décrit privé en mars. Raison du passage en public non retrouvée (probablement l'échec de lecture des apps de bureau, qui lisent sans s'authentifier). Détail au Carnet V66. **Aucune modification à chaud** |
| 1 · Données | Transporter : un `.prproj` d'origine a disparu une fois après création d'une valise ; correction jamais tracée |
| 1 · Conformité | Registre RGPD V1.1 : une seule fiche (RENDEZVOUS), COVENANT absent |
| 1 · Données | Dépôt privé des profils RENDEZVOUS : messages de commit nominatifs (dette connue, toujours ouverte) |
| 2 · Production | BackUpFlow se fige parfois en pleine copie (arrêt forcé) ; pannes silencieuses (NAS non monté, Gofile trop lourd, étape bloquée) |

### Constat transverse

La flotte de bureau est peu utilisée non par manque de besoin, mais par **manque de distribution** (transmission, installation, accompagnement). Les apps web se diffusent seules (Reviewer). RENDEZVOUS reçoit le rôle de plateforme de distribution.

---

## Interview app par app — verdicts

| App | Verdict |
|---|---|
| BackUpFlow | Niveau 2 (gels) d'abord ; lot « pré-vol » candidat ; V2 après le chantier profils et Launcher (D191) |
| Transporter | Niveau 1, non-destruction à prouver ; évolutions Monday et dossier de destination par profil (D192) |
| Reviewer | Stable et en croissance : commentaires automatiques, contrôle du niveau sonore, horizon lointain safe zone et regard |
| Manifest | Stable ; grande mise à niveau plus tard ; données d'entrée à fiabiliser **sans modifier Monday** (outil universel, Manifest sert surtout les OPS) |
| ARK | Deux temps : ARK « vite » (régénérable + compression des rushes diffusés, quatre verrous dont un consentement explicite) puis ARK « complet » après la gouvernance des données (D193) |
| ROVER | Stable mais sous-exposé ; crédit automatique des sources externes ; Envato à étudier |
| COVENANT | Stable pour les OPS ; déploiement conditionné : fiche RGPD, textes juridiques (majeurs et mineurs), étape de lecture explicite |
| CODEX | En rodage (4 scripts) ; retours des monteurs attendus ; teaser dans le même document, à isoler ; fiche produit à écrire |
| READBACK | Pause D78 levée en principe (D194) : sans-fil, multi-écran, multicam synchronisé, deux studios, lien CODEX |
| Launcher | Pause (D77), sujet versé au chantier profils et Launcher (D190) |

### Apps en projet

PAYLOAD réveillé et prioritaire (D202) · Cargo validé en principe, option B (D201) · Hatch module externe de BackUpFlow (D195) · Guidance brique commune (D196) · DATAPAD, CAPCOM, Telemetry, BLACKBOX réunis en boîte à outils Premiere (D197) · Beacon et Debrief absorbés par le logiciel de livraison (D198) · CAPITAL sorti de la Suite (D199) · SIGNAL fonction de l'admin de RENDEZVOUS (D200, révise D136).

---

## Décisions actées (D187 → D204)

| # | Décision |
|---|---|
| D187 | AUTOPILOT reporté à la phase Apollo |
| D188 | Critère de passage Gemini → Apollo : RENDEZVOUS à 100 % |
| D189 | Audit Surveyor complet : une fois par mois de préférence, tous les trois mois au minimum ; visibilité des dépôts de données ajoutée au crible |
| D190 | Chantier « profils et Launcher » ouvert (B24) |
| D191 | BackUpFlow : diagnostic des gels, puis V2 |
| D192 | Transporter : non-destruction à prouver, puis évolutions |
| D193 | ARK en deux temps |
| D194 | READBACK : levée de la pause en principe |
| D195 | Hatch : module externe, fusion prévue |
| D196 | Guidance : brique commune |
| D197 | Boîte à outils Premiere |
| D198 | Logiciel de livraison (absorbe Beacon et Debrief) |
| D199 | CAPITAL hors Suite |
| D200 | SIGNAL dans l'admin de RENDEZVOUS |
| D201 | Cargo, option B |
| D202 | PAYLOAD prioritaire à concevoir |
| D203 | Chantier suivant : Authentification ADMIN (secret existant gardé, changement sécurisé, Touch ID sur les Mac de PRÉSIDENCE ; « mot de passe perdu » à confirmer) |
| D204 | Principes transverses : non-destruction, évolution continue, test d'existence |

---

## Livrables

- `surveyor/SURVEYOR_20261020.md` — poussé, commit `c7943f6`
- `TRANQUILITY_PLAN_DIRECTEUR_V5_124.md` — réécriture complète depuis le texte intégral de la V5.123 (CODEX ajouté à l'inventaire Gemini, ligne RENDEZVOUS de l'inventaire alignée sur R8)
- `CARNET_PIEGES_V66.md` — V65 intégrale + bloc du 20/10 (+8 pièges)
- Ce récap
- Prompt de continuation

Aucun code d'app modifié.

---

## Dettes et points ouverts

**Issues de l'audit (une ligne chacune)**
- Registre de flotte V2 à écrire (décisions D195 → D202, colonne Visibilité).
- Skill Surveyor à mettre à jour (cadence D189, visibilité des dépôts de données).
- `tranquility-jarvis-instructions` en retard de 3,5 mois sur les instructions permanentes.
- `tranquility-flow` : dépôt désigné par l'instruction Google Flow, inexistant.
- Fiche produit ROVER périmée ; documentation technique Transporter (profils locaux) à vérifier.
- Fiche produit CODEX à écrire ; devise COVENANT à documenter ; ambiance ARK absente de son dépôt.
- Description GitHub de Launcher périmée ; icône de barre de menu de 233 octets à vérifier si reprise.
- PNG du patch Transporter sans source dans son propre dépôt.
- CAPITAL : fiche produit à archiver, carte de la vitrine RENDEZVOUS à retirer, Document Fondateur à corriger.
- Document de projet PAYLOAD en double dans les ressources du projet.
- Fiches R&D à créer : Envato (conditions d'accès), plateforme d'extensions Premiere.
- Poids moyen d'une vidéo terminée à mesurer (dossier gouvernance).
- `cellule-video-ao` public (hors Suite) : vérifier son contenu.

**Reprises du prompt précédent (toujours ouvertes)**
- RENDEZVOUS : notifications sur téléphone ; lien DÉCOUVRIR LA FLOTTE en retrait ; iPad portrait et téléphone horizontal non recettés ; `focus()` sans `preventScroll` (seulement si glissement) ; branche `mobile-d180` à supprimer ou garder.
- Suite : sort du détecteur de design de Cursor.
- `TRANQUILITY_WORKFLOW_ASSIST.md` : contexte RENDEZVOUS non mis à jour.
- Ressources du projet : retirer `CARNET_PIEGES_V59.md`.
- `PROTOCOLE_FIN_DE_SESSION.md` n'intègre ni D177 ni D179.

Soldée cette session : la ligne RENDEZVOUS de l'inventaire de flotte (alignée sur R8) ; l'audit Surveyor complet (fait).

---

## Prochaines étapes

1. Session **[RENDEZVOUS] — étape RENDEZVOUS de l'audit et planification** : ce qui reste selon JARVIS et selon PRÉSIDENCE, angles morts, définition de « livré » (D188), puis ordre logique, constructif et sécurisé de tous les chantiers issus de l'audit.
2. Chantier **Authentification ADMIN (D203)**, en commençant par la lecture seule du proxy.
3. Prochain audit Surveyor complet : au plus tard mi-novembre (cadence D189), au maximum le 20/01/2027.
