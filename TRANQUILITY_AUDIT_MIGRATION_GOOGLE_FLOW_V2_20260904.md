# Tranquility Suite — Audit Migration Google Flow
## V2 — Consolidé et vérifié sur repos réels

*Cellule Vidéo L'Étudiant · JARVIS + Martin Pavloff · 4 septembre 2026*
*Remplace intégralement `TRANQUILITY_AUDIT_MIGRATION_GOOGLE_FLOW_V1_20260904.md` — ne pas travailler depuis la V1*
*Document de travail — préparatoire à `TRANQUILITY_CHARTE_DA_GOOGLE_FLOW.md` (non encore rédigée)*

---

## 0. Ce qui a changé depuis la V1

La V1 était construite sur les fichiers présents dans le projet Claude. Elle affirmait à tort que 4 apps n'avaient pas de patch et qu'aucune app n'avait de patch animé. Une vérification `gh api` complète, arbre de repo entier (pas juste le dossier `assets/`), a corrigé ces deux points — et en a révélé d'autres, plus importants, qu'aucune des deux versions précédentes n'avait anticipés. Cette V2 ne travaille plus que sur du vérifié.

---

## 1. Périmètre Google Flow — inchangé, avec un ajout acté

Flow couvre l'image et la vidéo générées (patches, patches animés, illustrations, visuels de communication) — **y compris les moodboards et l'ensemble des assets de la communication visuelle de la Suite**, pas seulement les livrables finaux. Un moodboard Flow en amont devient l'outil de cadrage visuel avant chaque nouveau chantier DA (patch, document, campagne), au même titre qu'un mini-plan cadre un chantier technique. Reste hors périmètre : le code, `tranquility-core.css`, la logique fonctionnelle des apps.

**Décision actée cette session : Flow remplace intégralement NotebookLM**, y compris pour la génération de la vidéo de présentation et du podcast audio (cf. section 8).

---

## 2. Direction artistique déjà actée — inchangée

- Cercle brodé, effet tissu réel, style Apollo 1960s — jamais littéral, jamais cartoonish
- Nom d'app en arc, devise latine discrète en bordure
- Palette patch : noir/marine profond, or, blanc chaud, un seul accent — **distincte de la palette UI** (`--accent` bleu `#2563eb` et les tokens de `tranquility-core.css`, qui gouvernent l'interface des apps, pas les patches)
- Deux familles : paysage + annotations discrètes (BackUpFlow, Guidance, Rover, patch mère) / scène iconique centrée (les autres)
- Patches produits historiquement sur cinq outils différents (Gemini, Firefly, Reve, Ideogram, Leonardo) selon les sessions — consolider chez Flow est une remise à niveau de cohérence autant qu'une complétion

---

## 3. État des Mission Patches — 23 apps, table définitive

Pour les 10 apps avec un vrai repo, la donnée vient d'un scan complet de l'arbre Git (`git/trees?recursive=1`), pas d'un nom de dossier supposé. Pour les 13 apps sans repo encore créé, la donnée vient des fichiers déposés dans le projet Claude — c'est la seule source possible à ce stade, et c'est signalé comme tel.

| App | Statut app | Patch | Patch animé | Source |
|---|---|---|---|---|
| BackUpFlow | Livrée | ✅ | ✅ | Repo vérifié |
| Transporter | Livrée | ✅ | ✅ | Repo vérifié |
| Reviewer | Livrée | ✅ | ✅ | Repo vérifié |
| Manifest | Livrée | ✅ | ✅ | Repo vérifié |
| Launcher | Livrée | ⚠️ Pas de patch propre — voir §5 | — | Repo vérifié |
| ARK | Livrée | ✅ | ❌ | Repo vérifié |
| ROVER | Livrée | ✅ | ✅ | Repo vérifié |
| COVENANT | Livrée | ✅ | ✅ | Repo vérifié |
| RENDEZVOUS | En chantier — priorité absolue | ✅ (+ patch mère) | ✅ (+ patch mère) | Repo vérifié |
| READBACK | En chantier actif | ❌ — dette D64 confirmée sans équivoque | ❌ | Repo vérifié (arbre entier vide de visuel) |
| CAPITAL | En projet | ❌ Pas encore attendu | ❌ | Projet Claude uniquement |
| PAYLOAD | En projet | ✅ | ❌ | Projet Claude uniquement |
| Cargo | En projet | ✅ | ❌ | Projet Claude uniquement |
| Hatch | En projet | ✅ | ❌ | Projet Claude uniquement |
| Guidance | En projet | ✅ | ❌ | Projet Claude uniquement |
| Beacon | En projet | ✅ | ❌ | Projet Claude uniquement |
| Debrief | En projet | ✅ | ❌ | Projet Claude uniquement |
| Telemetry | En projet | ✅ | ❌ | Projet Claude uniquement |
| CAPCOM | En projet | ✅ | ❌ | Projet Claude uniquement |
| DATAPAD | En projet | ✅ | ❌ | Projet Claude uniquement |
| BLACKBOX | En projet | ✅ | ❌ | Projet Claude uniquement |
| Scripter | Idée | ❌ Pas encore attendu | ❌ | — |
| SIGNAL | Idée | ❌ Pas encore attendu | ❌ | — |
| **Tranquility Suite** (mère) | Identité globale | ✅ | ✅ (via RENDEZVOUS) | Repo vérifié |

**Lecture :** sur les 10 apps livrées ou en chantier actif, une seule a un vrai manque (READBACK, déjà acté en D64). Le travail de complétion pure est donc limité. Le vrai chantier Flow est ailleurs — sections 4 à 6.

---

## 4. Découverte majeure — GIFs de réaction sous droits (Transporter + BackUpFlow)

Les dossiers `loading/`, `upload/` et `GIF/` de **Transporter** (~70 fichiers) et **BackUpFlow** (~33 fichiers) contiennent des GIFs de réaction extraits de séries et films protégés — Friends, The Office, Brooklyn Nine-Nine, Deadpool, Loki, Despicable Me, contenus NBC/HULU/ABC/Prime Video/20th Century Fox. Organisés par usage (attente, chargement, succès), dupliqués sur les deux apps : ce sont des assets de production, pas des oublis de test.

**Constat factuel, conservé pour la traçabilité :**
- **Juridique** — contenus protégés utilisés en interne dans un outil d'un média. Zéro couverture, zéro licence identifiée.
- **Design Reference** — viole directement §1 : *"Une seule ambiance — cosmos, espace profond, minimalisme technique"* et *"Zéro bruit"*.

**Décision actée cette session (PRÉSIDENCE) :** ces GIFs restent en l'état. La Suite est un produit privé, sans diffusion externe — le risque juridique est jugé acceptable et assumé consciemment, de même que la rupture avec la Design Reference sur ces éléments précis. **Ce chantier sort du périmètre Google Flow.** Il reste documenté ici pour garder la trace de l'arbitrage, pas comme travail restant à faire.

---

## 5. Découverte structurelle — Launcher comme dépôt centralisé non synchronisé

Le dossier `assets/` de Launcher ne contient pas un patch qui lui soit propre — il héberge une **copie parallèle** des patches et animations de 7 apps (ARK, BackUpFlow, Manifest, Reviewer, ROVER, Transporter, + son propre logo) et un second jeu complet des 28 avatars.

**Ce qui en découle :** les avatars existent en **trois emplacements distincts** — le repo `tranquility-avatars` (bibliothèque officielle), `BackUpFlow/assets/avatars/`, et `Launcher/assets/avatars/`. Rien ne garantit aujourd'hui que les trois copies restent identiques dans le temps. C'est exactement le type de dérive silencieuse que le Workflow Captif (Lois 2 et 3) est censé rendre impossible — et qui existe pourtant déjà dans les faits, probablement parce que chaque app a été construite avant que `tranquility-avatars` devienne la source unique.

**Pour la Charte DA à venir :** il faudra soit établir un mécanisme de synchronisation (les apps consomment `tranquility-avatars` par URL plutôt que par copie locale — cohérent avec le principe déjà appliqué à `tranquility-core.css`), soit assumer explicitement la duplication et documenter pourquoi. Ce n'est pas une décision que je prends seul.

---

## 6. Icônes de plateforme — catégorie à part entière, jamais spécifiée

Le patch (cercle brodé, haute résolution) n'est l'icône d'aucune plateforme réelle. Trois formats distincts ont été repérés, tous produits au cas par cas, sans règle commune :

| Contexte | Où | Ce qui existe | Ce qui manque |
|---|---|---|---|
| Icône barre de menu macOS (Launcher, daemon) | `Launcher/assets/icons/` | `launcher-tray.png`, `@2x`, `-trayTemplate` (monochrome adaptatif) | Rien — c'est fait correctement |
| Icône Dock/Finder (app Electron) | `BackUpFlow/build/icon.png` | Un seul fichier trouvé, sur une seule app | Aucune règle sur la résolution, le format, ni si les 9 autres apps livrées en ont un |
| Icônes PWA (COVENANT, seule vraie PWA de la Suite) | `manifest.json` | 192×192 et 512×512 — **mais les deux tailles pointent vers le même fichier patch brut**, sans déclinaison ni icône *maskable* Android | Un vrai jeu d'icônes PWA n'a jamais été produit |
| Favicon (RENDEZVOUS, vitrine publique de la Suite) | racine du repo | Aucun trouvé | Absence totale |

**Conclusion :** ce n'est pas un oubli isolé, c'est une catégorie entière de la DA qui n'a jamais eu de spec — contrairement au patch et au splash, qui eux sont rigoureusement documentés dans la Design Reference. La future Charte DA devra combler ce vide, pas seulement le constater.

---

## 7. Bibliothèques transverses

| Repo | Contenu | État |
|---|---|---|
| `tranquility-avatars` | 28 avatars (22 jpeg + 6 png) | Solide en soi — mais dupliqué ailleurs, cf §5 |
| `tranquility-core` | `tranquility-core.css`, `profiles-public.json`, `managers.json` | Code/data uniquement — confirmé hors périmètre Flow |
| `tranquility-quotes` | `quotes.json` | Devises latines en data — hors périmètre Flow, alimente le texte des patches |

---

## 8. Documents & communication — par audience

### Trois découpages coexistent, non réconciliés

| Source | Découpage |
|---|---|
| Bible COM (mars 2026) | 4 registres : direction/hiérarchie · collègue d'une autre cellule · nouveau membre d'équipe · interlocuteur externe |
| Session Marketing (16 mai 2026) | 3 cercles de diffusion : L'Étudiant 45% · monde de la prod vidéo 35% · communauté tech/indie 20% |
| Cadrage donné cette session | 4 usages : utilisateurs · direction · novices · public plus large |

Ces trois grilles se recoupent mais ne se superposent pas terme à terme. **Décision à prendre avant de cadrer la Charte DA côté documents** : on en choisit une comme référence, on les fusionne, ou on assume qu'elles servent des contextes différents (interne au quotidien / positionnement marketing / brief Flow) — dans ce cas il faut le dire explicitement pour ne pas les mélanger par erreur plus tard.

### Inventaire — zéro visuel à ce jour

Bible COM + Addendum mai 2026, Guide de démarrage équipe (novices), 23 fiches produit : tous purement textuels, aucune illustration, aucun visuel associé.

### Le pipeline NotebookLM — retrouvé, pas perdu

Une session du 16 mai 2026 a produit un Brief Créatif (V3, arc narratif en 7 temps), un Kit de Lancement (5 documents + 6 patches + 1 schéma PDF), et généré un podcast validé (transcript de ~13 minutes disponible). Ni le Brief ni le Kit ne sont dans les ressources actuelles du projet Claude — retrouvés dans une conversation archivée, pas perdus.

**Décision actée cette session : Flow remplace NotebookLM intégralement**, vidéo et podcast compris. Le narratif, le ton et le public cible définis en mai restent valables — seul le moteur de génération change. Recommandation : rapatrier le Brief Créatif V3 et le Kit de Lancement dans les ressources du projet avant de rédiger le brief Flow équivalent, pour ne pas perdre le travail éditorial déjà validé.

---

## 9. Ce qui reste réellement ouvert

Deux points, à traiter avant de considérer le cadrage terminé — je ne les marque pas comme résolus par facilité :

1. **Extensions Premiere Pro (CAPCOM, DATAPAD, BLACKBOX, Telemetry)** — aucune fiche produit n'existe pour ces 4 outils. Leurs contraintes de format (écosystème de panneau CEP/UXP, tailles d'icônes imposées par Adobe, pas de patch circulaire plein écran possible) sont à **définir de zéro**, pas à retrouver dans une doc existante.

2. **Réconciliation des 3 découpages d'audience** (§8) — décision PRÉSIDENCE nécessaire avant de rédiger le volet "documents" de la Charte DA.

---

## 10. Pièges méthodologiques découverts pendant cet audit — pour le carnet

- Un fichier absent des ressources du projet Claude ne prouve rien sur son existence réelle dans le repo — seule une vérification `gh api` fait foi
- Chercher par mot-clé dans un nom de fichier (`*patch*`) ne trouve pas un asset nommé différemment (`ambiance-*.mp4`, `logo_etudiant.png`) — lister l'arbre complet du repo (`git/trees?recursive=1`) et filtrer par extension est la seule méthode fiable
- Sous zsh, toute URL `gh api` contenant un `?` doit être entre guillemets — sinon zsh l'interprète comme un glob et échoue silencieusement avec "no matches found"
- Un dossier `assets/` peut être un dépôt centralisé partagé (Launcher) plutôt que les assets propres de l'app qui le contient — ne jamais supposer la correspondance 1 app = 1 dossier assets

---

## 11. Prochaine étape proposée

Rédaction de `TRANQUILITY_CHARTE_DA_GOOGLE_FLOW.md`, structurée en chantiers de nature différente pour ne pas les mélanger :
0. **Cadrage visuel** — un moodboard Flow par grand axe (patch, document, campagne) avant toute production, au même titre qu'un mini-plan cadre un chantier technique
1. **Combler** — READBACK (patch, animé, splash — D64)
2. **Spécifier** — icônes de plateforme (favicon, PWA, Dock, extensions Premiere), jamais cadrées à ce jour
3. **Uniformiser** — repasser les patches existants dans Flow pour une cohérence de main
4. **Documents & communication** — une fois la réconciliation d'audience tranchée par PRÉSIDENCE
5. **Structurel** — décision sur la duplication des avatars (Launcher / BackUpFlow / repo officiel)

**Hors périmètre, acté :** les GIFs de réaction sous droits (Transporter, BackUpFlow) restent en l'état — décision PRÉSIDENCE, cf. §4. Ne pas les réintroduire dans un futur chantier sans nouvel arbitrage explicite.

---

*Audit Migration Google Flow · V2 · 4 septembre 2026*
*Remplace la V1 du même jour*
