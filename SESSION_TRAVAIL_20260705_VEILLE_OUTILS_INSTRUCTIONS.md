# Session de travail — 5 juillet 2026
## Veille outils open source · Rangement instructions permanentes JARVIS

*Tranquility Suite · Cellule Vidéo L'Étudiant*
*Mac Maison (martinpavloff)*

---

## Contexte

Session ouverte sur R5-bis Chantier B (`login.js`), mise en pause à la demande de Martin dès le début pour une session de réflexion stratégique. Aucun code touché sur RENDEZVOUS. Le Chantier B reste intact, prêt à reprendre.

---

## Ce qui a été fait

### 1. Veille outils open source — session fondatrice ✅

Sept projets soumis par Martin (source TikTok *howtowebdev*) examinés un à un, à l'échelle de la flotte complète (23 outils) plutôt qu'au seul chantier RENDEZVOUS en cours — correction de méthode actée après un premier passage trop resserré.

**Process posé :** quatre niveaux de lecture pour tout projet open source — adoption directe / reverse engineering conceptuel / inspiration UX-fonctionnelle / signal de marché. Un projet peut produire plusieurs de ces niveaux à la fois, pour plusieurs apps différentes.

| Projet | Verdict |
|---|---|
| Typebot | Inspiration UX — formulaire séquentiel, piste COVENANT V2 |
| Paperless-ngx | Lacune identifiée — PDF COVENANT/CAPITAL jamais indexés après envoi, piste future "Archives" |
| Logto | Signal de marché — valide le modèle d'affectations RENDEZVOUS ; vérification à prévoir sur rotation de clé JWT (R5-bis Chantier E) |
| DocuSeal | Concept "template + zones de signature configurables" — piste future si COVENANT gère plusieurs types de documents |
| Dub | Signal de marché faible — confirme le pattern lien+expiration déjà en place |
| Tauri | Dette technique Electron à surveiller — décision de Conseil complet le jour où un signal concret apparaît, aucune action aujourd'hui |
| **ntfy** | **Retenu — chantier ouvert (I8)** |

**Document fondateur créé :** `TRANQUILITY_VEILLE_OUTILS.md` V1.0 — poussé sur `tranquility-plan-directeur`, commit `cca244e`.

### 2. Plan Directeur mis à jour — V5.65 → V5.66 ✅

- Chantier **I8 — ntfy** ouvert dans la Famille I (Infrastructure produit) : notifications push HTTP légères, transverses à SIGNAL, BackUpFlow, ARK/ROVER, COVENANT. Aucune architecture d'intégration tranchée — à concevoir au démarrage du chantier.
- `TRANQUILITY_VEILLE_OUTILS.md` référencé dans la table des ressources.
- Poussé sur `tranquility-plan-directeur`, commit `744cb85`.

### 3. Rangement des instructions permanentes JARVIS ✅

Les instructions permanentes du projet Claude (empilées chronologiquement du 7 avril au 4 juillet 2026, avec doublons et méta-commentaires de rédaction) ont été entièrement réécrites, regroupées par thème, sans perte d'information :

1. Identité & posture de JARVIS
2. Méthode de travail — partenariat Cursor
3. Début et fin de session
4. Design Reference
5. Mode Agence Tranquility
6. Workflow Assist
7. Workflow Captif
8. Infrastructure & outils
9. Contexte & anecdotes

**Remplacées par Martin directement dans les instructions du projet Claude** (V2.0, 5 juillet 2026). `userPreferences` conservé séparément (tutoiement, rôle de bras droit/coach).

### 4. Correction de comportement JARVIS — accusés de réception répétitifs

Signalé par Martin : JARVIS répétait un accusé de réception cérémonial ("reçu 5/5, rien n'est perdu") à chaque message contenant un bloc d'instructions, ce qui devenait du bruit. Corrigé en session : le contenu est intégré silencieusement, sans préambule de confirmation systématique — seule une vraie ambiguïté ou un conflit d'instructions justifie de le signaler.

---

## Décisions actées

| # | Décision | Détail |
|---|----------|--------|
| — | Process de veille outils à 4 niveaux de lecture | Adoption directe / reverse engineering / inspiration UX / signal de marché — toujours à l'échelle de la flotte complète |
| — | ntfy = chantier ouvert I8 | Statut choisi explicitement par Martin (vs. "à l'étude") |
| — | Versionnement `TRANQUILITY_VEILLE_OUTILS.md` | Logique Plan Directeur — rewrite complet, jamais de patch, mention de version en pied de page. Principe non écrit explicitement dans le doc (jugé inutile, déjà une règle de méthode générale) |
| — | Instructions JARVIS réorganisées par thème | 9 sections, V2.0, remplace l'empilement chronologique antérieur |

---

## Prochaines étapes

- **R5-bis Chantier B (`login.js`)** — prioritaire, non démarré. Première action obligatoire à la reprise : nettoyer le profil de test `p_test_r5bis_001` dans `profiles-private.json` (repo `rendezvous-profiles-private`).
- **Chantier I8 (ntfy)** — architecture d'intégration à concevoir, pas de date fixée.
- Pistes notées en réserve dans `TRANQUILITY_VEILLE_OUTILS.md`, à remonter en chantier si le contexte s'y prête : formulaire séquentiel COVENANT (Typebot), archives PDF indexées (Paperless-ngx), rotation clé JWT (Logto), template multi-document COVENANT (DocuSeal).

---

## Carnet de pièges — rien de nouveau côté technique

Aucun piège de code découvert cette session (pas de chantier technique). Un point de méthode déjà traité en session, pas au niveau du Carnet de pièges technique : la lecture d'un projet externe doit toujours se faire à l'échelle de la flotte complète, jamais du seul chantier en cours.

---

*Session · 5 juillet 2026 · Tranquility Suite · Cellule Vidéo L'Étudiant*
