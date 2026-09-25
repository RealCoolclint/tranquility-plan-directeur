# REGISTRE DE FLOTTE — Tranquility Suite

*Faits techniques de la flotte, lus par Surveyor et par son radar. Le Plan Directeur raconte les décisions ; ce registre décrit l'état. Leur divergence est une alerte.*
*Créé le 25/09/2026 (Surveyor, rapport n°1). Toute nouvelle app y entre dès sa naissance (Loi 1).*

**Règles de lecture pour le radar :** 2e colonne = dépôt (« — » si aucun), 3e colonne = catégorie. Une catégorie contenant « Hors Tranquility » exclut le dépôt des sections 3, 4, 7 et 8 du radar. Les dépôts archivés sur GitHub sont exclus automatiquement.

Légende assets : ✓ présent · ⚠ écart · ✗ manquant

---

## Apps de la flotte

| App | Dépôt | Catégorie | Type | Phase | Statut | Assets attendus | Emplacements des assets | Maturité déclarée | Notes |
|---|---|---|---|---|---|---|---|---|---|
| CODEX | CODEX | App | Web | Gemini | En ligne V1 (24/09/2026) | Patch ✓ · Ambiance ✓ · Ouverture Mercury ✓ · Devise EX UNO DUO ✓ | `CODEX/assets/PATCH_Codex.png`, `ambiance-codex.mp4` · copies `RENDEZVOUS/assets/patch-codex.png`, `ambiance-codex.mp4` | — | Affectations COLUMBIA + GUMDROP (D128). Sa sortie prompteur devra être lue par READBACK |
| RENDEZVOUS | RENDEZVOUS | App | Web (portail) | Gemini | R8 en cours | Patch ✓ · Ambiance ✓ · Devise HIC OMNIA INCIPIUNT ✓ | `RENDEZVOUS/assets/patch_RENDEZVOUS.jpg`, `ambiance_RENDEZVOUS.mp4` · patch et ambiance TRANQUILITY | — | Nom public : Tranquility Suite (D15). Détient une copie des assets de chaque app |
| BackUpFlow | BackUpFlow | App | Desktop | Mercury | En orbite (V1.12.06.26) | Patch ✓ · Ambiance ✓ · Devise NULLA DATA PEREUNT ✓ | `BackUpFlow/assets/PATCH_BackUpFlow.png`, `ambiance-backupflow.mp4` · copies RENDEZVOUS, Launcher | — | App pionnière (15/02/2026) |
| Transporter | Transporter | App | Desktop | Mercury | En orbite | Patch ✓ · Ambiance ✓ · Devise RECTE ET CELERITER ✓ | `Transporter/src/renderer/assets/PATCH_Transporter.jpg`, `ambiances/ambiance-transporter.mp4` · copies RENDEZVOUS (JPG), Launcher (PNG transparent) | — | Au-delà des seuils de fraîcheur : interview à faire |
| Reviewer | Reviewer | App | Web | Mercury | En orbite, référence design | Patch ✓ · Ambiance ✓ · Devise NIHIL NISI PROBATUM ✓ | `Reviewer/assets/PATCH_Reviewer.png`, `ambiance-reviewer.mp4` · copies RENDEZVOUS, Launcher | — | |
| Manifest | Manifest | App | Web | Mercury | En orbite | Patch ✓ · Ambiance ✓ · Devise ANTE OMNIA PARARE ✓ | `Manifest/assets/PATCH_Manifest.png`, `ambiance-manifest.mp4` · copies RENDEZVOUS, Launcher | — | Badge ADMIN codé en dur (D57, dette) |
| ARK | ARK | App | Desktop | Mercury | En orbite | Patch ✓ · Ambiance ⚠ absente du dépôt ARK · Devise MEMORIA MANET ✓ | `ARK/assets/patch.png` · ambiance source `Launcher/.../ambiance-ark.mp4` · copies `RENDEZVOUS/assets/patch-ark.png`, `ambiance-ark.mp4` | — | Au-delà des seuils de fraîcheur : interview à faire |
| ROVER | ROVER | App | Desktop | Mercury | En orbite (V1.04.06.26) | Patch ✓ · Ambiance ⚠ fond clair (D129) · Devise EXPLORA ET REFER ✓ | `ROVER/src/renderer/assets/patch-rover.png`, `ambiance-rover.mp4` · copies RENDEZVOUS, Launcher | — | Dépôt privé, Git LFS. Au-delà du seuil fixe : interview à faire |
| COVENANT | COVENANT | App | Web (PWA) | Mercury | En orbite | Patch ✓ · Ambiance ⚠ fond clair (D129) · Devise ✗ non documentée | `COVENANT/assets/patch_COVENANT.png`, `ambiance_COVENANT.mp4` · copies RENDEZVOUS | — | Cache hors-ligne `CACHE_NAME` à incrémenter à chaque mise en ligne (v2 au 25/09/2026). Fonction d'envoi sur Netlify `musical-tanuki-a691a5` |
| Launcher | Launcher | App | Desktop (daemon) | Mercury | Développement en pause (D77) | Patch ✓ · Ambiance ✓ · Devise INITIUM EST DIMIDIUM FACTI ✓ | `Launcher/src/renderer/assets/` | Pause actée (D77) | Source cachée d'assets d'autres apps (ambiance ARK, patch Transporter PNG) |
| READBACK | READBACK | App | Desktop + iPad / iPhone | Gemini | En pause (D78) | Patch ✗ · Ambiance ✗ · Devise ✗ | — | Pause actée (D78) | Dépôt privé. À la reprise : identité visuelle + lecture native de la sortie CODEX |

## Apps en projet (sans dépôt)

| App | Dépôt | Catégorie | Type | Phase | Statut | Assets attendus | Emplacements des assets | Maturité déclarée | Notes |
|---|---|---|---|---|---|---|---|---|---|
| PAYLOAD | — | App en projet | Desktop + Mobile | À planifier | Documentation projet détaillée | Patch ✓ (ressource projet) · Devise NIHIL IGNOTUM | — | — | Parc matériel de tournage |
| CAPITAL | — | App en projet | Desktop | Apollo (visée) | Fiche produit rédigée | Patch ✗ · Devise ✗ | — | — | Suivi budgétaire |
| Cargo | — | App en projet | Desktop | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise OMNIA TUTA SERVANTUR | — | — | Registre des SSD |
| Hatch | — | App en projet | Web | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise HIC INCIPIT MISSIO | — | — | Ingestion multicam |
| Guidance | — | App en projet | Web | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise NIHIL SINE ORDINE | — | — | Vérification d'intégrité après backup |
| Beacon | — | App en projet | Desktop | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise LUX IN TENEBRIS | — | — | Pages de livraison |
| Debrief | — | App en projet | Web | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise MISSUM EST | — | — | Historique des livraisons |
| Telemetry | — | App en projet | Web / Extension Premiere | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise SEMPER AUDIRE | — | — | Suivi des versions de montage |
| CAPCOM | — | App en projet | Extension Premiere | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise FIDE ET NUNTIA | — | — | Statuts Monday depuis Premiere |
| DATAPAD | — | App en projet | Extension Premiere | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise LEGE ET INTELLEGE | — | — | Brief projet dans Premiere |
| BLACKBOX | — | App en projet | Extension Premiere | À planifier | Rôle documenté | Patch ✓ (ressource projet) · Devise OMNIA RECORDANTUR | — | — | Journal des exports |
| SIGNAL | — | App en projet | Web | Apollo (visée) | Idée | Devise OMNIA CONSPICUA | — | — | Vue de pilotage de la flotte : à bâtir sur Surveyor |

## Briques communes

| Nom | Dépôt | Catégorie | Type | Phase | Statut | Assets attendus | Emplacements des assets | Maturité déclarée | Notes |
|---|---|---|---|---|---|---|---|---|---|
| Core CSS | tranquility-core | Brique commune | Données partagées | — | Actif | — | — | — | Source unique des tokens design |
| Proxy RENDEZVOUS | rendezvous-proxy | Brique commune | Serveur Netlify | — | Actif | — | — | — | Site `rendezvous-proxy-tranquility`. Table AFFECTATIONS dupliquée dans `RENDEZVOUS/admin.js` |
| Profils RENDEZVOUS | rendezvous-profiles-private | Brique commune | Données privées | — | Actif | — | — | — | Écrit uniquement par le proxy (D1) |
| Gabarit web | tranquility-web-template | Brique commune | Gabarit | — | Figé depuis 14/06/2026 | — | — | — | I6 |
| Avatars | tranquility-avatars | Brique commune | Bibliothèque | — | Figé | — | — | — | 28 avatars |
| Citations | tranquility-quotes | Brique commune | Bibliothèque | — | Figé | — | — | — | |
| Profils Launcher | launcher-profiles | Brique commune | Données | — | Figé depuis 13/04/2026 | — | — | — | Second registre de profils, non réconcilié avec RENDEZVOUS |

## Documentation

| Nom | Dépôt | Catégorie | Type | Phase | Statut | Assets attendus | Emplacements des assets | Maturité déclarée | Notes |
|---|---|---|---|---|---|---|---|---|---|
| Plan Directeur | tranquility-plan-directeur | Documentation | Public | — | Actif | — | — | — | Contient `surveyor/` (radar, registre, rapports) |
| Carnet de Pièges | tranquility-carnet-pieges | Documentation | Privé | — | Actif | — | — | — | |
| Instructions JARVIS | tranquility-jarvis-instructions | Documentation | Privé | — | Actif | — | — | — | |
| Présentations | Presentations-Tranquility-suite | Documentation | Public | — | Figé depuis 27/05/2026 | — | — | — | |

## Archivés (25/09/2026)

| Nom | Dépôt | Catégorie | Type | Phase | Statut | Assets attendus | Emplacements des assets | Maturité déclarée | Notes |
|---|---|---|---|---|---|---|---|---|---|
| Vitrine beta Mercury | tranquility-suite | Archivé | Web | Mercury | Remplacée par RENDEZVOUS | — | — | — | |
| Ancienne copie BackUpFlow | backupflow-studio | Archivé | Desktop | Mercury | Remplacée par BackUpFlow | — | — | — | |
| Proxy COVENANT (ancien) | covenant-proxy | Archivé | Serveur Netlify | — | Jamais déployé | — | — | — | Remplacé par la fonction d'envoi intégrée à COVENANT |

## Hors Tranquility

| Nom | Dépôt | Catégorie | Type | Phase | Statut | Assets attendus | Emplacements des assets | Maturité déclarée | Notes |
|---|---|---|---|---|---|---|---|---|---|
| Perimeter | perimeter | Hors Tranquility | — | — | — | — | — | — | Projet personnel distinct |
| True Me | true-me | Hors Tranquility | — | — | — | — | — | — | |
| Appels d'offres Cellule | cellule-video-ao | Hors Tranquility | — | — | — | — | — | — | Pilotage des AO de la Cellule Vidéo |

---

*REGISTRE_FLOTTE · V1 · 25/09/2026*
