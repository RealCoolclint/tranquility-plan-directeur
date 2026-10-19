# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.47 — 19 juin 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Philosophie centrale : le workflow captif.**
La suite est conçue pour que les bonnes pratiques de l'équipe soient encodées dans les outils — pas confiées à la mémoire ou à la rigueur individuelle. La conformité est une conséquence de l'usage, pas un effort conscient. Chaque chantier, chaque feature, chaque décision d'architecture est évalué contre cette philosophie avant d'être validé.
*Référence complète : `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` · Grille opérationnelle : `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md`*

**Mode de travail : l'Agence Tranquility.**
Travailler sur la suite, c'est opérer en mode Agence — une réorganisation du cerveau en 23 cellules expertes réparties en 6 familles : Commandement, Création, Réalisation, Garantie, Humain, Rayonnement. Martin Pavloff est le titulaire unique de tous les postes. JARVIS est l'interface opérationnelle de chaque cellule.
*Référence complète : `AGENCE_TRANQUILITY_MANIFESTE.md` · Agents : `AGENCE_TRANQUILITY_AGENTS.md` · Protocole : `AGENCE_TRANQUILITY_COUNCIL_SKILL.md`*

**Points Présidence — sessions régulières.**
Des sessions de bilan d'alignement et de pilotage général sont institutionnalisées. Elles ne sont pas greffées sur des sessions techniques — elles ont leur propre espace. Fréquence cible : trimestrielle minimum. Première session réalisée le 7 juin 2026.

**Principe technique :** GitHub = cloud de la Tranquility Suite.

**Workflow Git — Mac Switching :** `PROTOCOLE_GIT_MAC_SWITCHING.md` — clone dans `~/Documents/GitHub/` sur chaque Mac, pull au début, push à la fin. Toujours.

**Vision produit complète :** `TRANQUILITY_SUITE_VISION_PRODUIT.md` — document fondateur, à lire avant tout chantier. ⚠️ Révision nécessaire — potentiellement obsolète sur plusieurs points depuis avril 2026.

---

## Architecture Identité & Portail — Décisions PRESIDENCE

### RENDEZVOUS — Portail web public de la suite

**RENDEZVOUS** est le 23e outil de la flotte. Portail web public GitHub Pages. Porte d'entrée officielle de la Tranquility Suite pour tout collaborateur de L'Étudiant ayant un rapport à la vidéo.

**Devise :** *HIC OMNIA INCIPIUNT · Ici tout commence* — actée 18/06/2026

**Phrase fondatrice :** *"Un rendez-vous raté, c'est toute une mission qui s'arrête."*

**Principe directeur :** simple, efficace, sécurisé. Dans cet ordre.

**Deux états :**
- Non connecté → vitrine de la suite, présentation de la flotte, formulaire d'inscription
- Connecté → profil, apps disponibles selon niveau, statut d'accès par app, nouveautés

**Périmètre — ce que RENDEZVOUS fait :**
- Vitrine publique de la suite — présentation de la flotte et de la philosophie
- Inscription avec validation admin obligatoire
- État connecté : profil visible + apps accessibles + statut + section nouveautés
- Back-office Martin : validation des `pending`, gestion des profils, attribution des niveaux N1→N4
- Onboarding daemon guidé pour les profils N1 — trois parcours selon type de poste (Mac bureau / Mac perso / Mac partagé)
- Autorité unique de gouvernance des profils — proxy RENDEZVOUS = seul point d'écriture autorisé

**Périmètre — ce que RENDEZVOUS ne fait pas :**
- Modifier des settings d'apps (→ chaque app gère ses propres settings)
- Remplacer les apps en orbite
- Devenir un intranet ou un hub de communication quotidien

**Modèle d'inscription :** public + validation admin obligatoire. Modèle SAS. Invitation bidirectionnelle.

**Ouverture utilisateurs :** tout L'Étudiant (120 collaborateurs max). Critère unique : rapport réel à la vidéo. Pas de liste blanche à l'entrée — filtre sémantique + validation admin = double protection.

**Admin unique :** Martin Pavloff. Délégation = Phase Apollo.

**RGPD :** case à cocher obligatoire à l'inscription. Consentement explicite et traçable.

**Communication :** réunions managers trimestrielles L'Étudiant = vecteur naturel de présentation.

**Identité visuelle :**
- Mission patch validé — `assets/patch_RENDEZVOUS.jpg` — commit `ec63e49` — 18/06/2026
- Ambiance animée — `assets/ambiance_RENDEZVOUS.mp4` — commit `c7cde72` — 18/06/2026

### Grille de profils RENDEZVOUS (actée PRÉSIDENCE — 14 juin 2026)

| Niveau | Nom | Qui | Rapport vidéo | Accès apps |
|--------|-----|-----|--------------|------------|
| ADMIN | Martin Pavloff | Martin uniquement | Détenteur de la suite | Total |
| N1 | OPÉRATEURS | Cellule vidéo — ~10 personnes | Usage quotidien | Apps assignées — visibles uniquement + daemon requis |
| N2 | PÉRIPHÉRIQUES | Touchent à la vidéo par ricochet — ~20 personnes | Usage ponctuel ou partiel | Apps web uniquement — sur demande |
| N3 | OBSERVATEURS | Direction, IT, développeurs | Supervision, maintenance | Lecture — pas d'apps de production |
| N4 | INSTITUTIONNELS | Juridique, RH, financiers, direction générale | Vision stratégique | Vitrine uniquement |

**Règles transverses :**
- Invisibilité par défaut : une app non autorisée n'apparaît pas — ce qu'on ne voit pas, on ne peut pas le casser
- Vitrine flotte visible même connecté : statut par app — *disponible · sur demande · réservé*
- Mobilité entre niveaux : demande utilisateur + validation Martin
- Grille vivante — s'ajuste à l'usage réel
- **Daemon Launcher = N1 uniquement** — N2/N3/N4 : apps web exclusivement, aucun daemon requis

### Matrice accès app × niveau (actée PRÉSIDENCE — 14 juin 2026)

| App | N1 Opérateurs | N2 Périphériques | N3 Observateurs | N4 Institutionnels |
|-----|:---:|:---:|:---:|:---:|
| BackUpFlow | ✅ | ❌ | ❌ | ❌ |
| Transporter | ✅ | ❌ | ❌ | ❌ |
| Reviewer | ✅ | ✅ | 🔔 sur demande | 🔔 sur demande |
| Manifest | ✅ | ✅ | 🔔 sur demande | ❌ |
| ARK | ✅ | ❌ | ❌ | ❌ |
| ROVER | ✅ | ❌ | ❌ | ❌ |
| COVENANT | ✅ | ✅ | ✅ | ❌ |
| Launcher (daemon) | ✅ N1 uniquement | ❌ | ❌ | ❌ |

*✅ Accès complet · 🔔 Sur demande — visible vitrine, accès sur validation Martin · ❌ Invisible*

### Architecture technique RENDEZVOUS

```
GitHub Pages (repo public RENDEZVOUS)
  → Formulaire inscription + RGPD checkbox
  → Proxy Netlify dédié RENDEZVOUS (seul point d'écriture autorisé — D1)
  → API GitHub — écriture atomique profiles-public.json + profiles-private.json
  → Resend — notification mail Martin "nouvelle demande pending"
       ↓
  Martin valide dans back-office RENDEZVOUS (R7)
       ↓
  → API GitHub — profil passe "active" + niveau N1/N2/N3/N4 assigné
  → Resend — notification mail utilisateur "accès accordé"
  [Si N1] → Onboarding daemon guidé — parcours selon type de poste
```

### Six décisions architecturales fondatrices RENDEZVOUS (D1→D6)

| # | Décision | Essence | Acté |
|---|----------|---------|------|
| D1 | Double fichier + proxy seul écrivain | `profiles-public.json` (public) + `profiles-private.json` (privé) — cohérence atomique — proxy RENDEZVOUS seul point d'écriture | 16/06/2026 |
| D2 | Tokens signés + fallback 48h + denylist | RENDEZVOUS autorité centrale — tokens courts — cache local 48h — denylist CDN vérifiée au démarrage | 16/06/2026 |
| D3 | 3 modes session — le plus strict gagne | `persistent` / `bounded` / `ephemeral` — mode encodé dans le token — apps appliquent sans décider | 16/06/2026 |
| D4 | RGPD natif — minimisation + suppression atomique | Intérêt légitime — données minimisées à la source — suppression simultanée des deux fichiers | 16/06/2026 |
| D5 | Launcher daemon — RENDEZVOUS autorité unique | Launcher = agent de fond macOS, icône barre de menu, zéro interface. MASTER archivé. Launcher en lecture seule sur profils partagés. Intégrité par architecture, non par discipline individuelle. | 17/06/2026 |
| D6 | Heartbeat progressif — indicateur puis bloquant | Daemon ping proxy RENDEZVOUS. R6 : indicateur informatif. R8 : bloquant optionnel avec fallback 48h. Bascule = décision PRÉSIDENCE. | 17/06/2026 |
| D7 | Inscription en page séparée dédiée (`inscription.html`), pas in-page | **Renverse la décision R3 du 19/06 matin** (Council CREA : in-page). Nouveau Council (CONCEPTUALISATION · UX ET UI · STUDIO CREA + NAVIGATION + SÉCURITÉ consultation) : l'inscription est un acte rare/one-shot, mérite une rupture nette plutôt qu'une section noyée dans le scroll vitrine. Page séparée retenue sur modale superposée — lien direct partageable, bouton retour navigateur natif, sensation de seuil plus nette. Transition cinématique prévue (zoom à travers le patch RENDEZVOUS, sortie ~ vitrine → entrée ~ inscription) — intensité validée par Martin, retour simple (pas cinématique). | 19/06/2026 |



### Roadmap de build RENDEZVOUS (R1→R8) — révisée 17/06/2026

| # | Chantier | Estimation | État |
|---|----------|-----------|------|
| R1 | Fondations — scaffolding, GitHub Pages, Design Reference | 1 session | ✅ Livré — commit `8f15923` |
| R2 | Vitrine publique — présentation flotte, fiches app | 2 sessions | ✅ Livré — commits f1c7c86 + d2551ae + 9b6bc6f |
| R3 | Formulaire d'inscription + RGPD | 1 session | ✅ Livré — 19/06/2026 — double CTA + formulaire + RGPD + accessibilité |
| R4 | Proxy Netlify + API GitHub (double fichier D1) | 2-3 sessions | 🔵 À démarrer — **précédé par le sous-chantier D7** (extraction inscription vers page dédiée — structure HTML/CSS/JS + transition cinématique — découpé en 6 prompts Cursor séquentiels, aucun encore lancé) |
| R5 | Authentification — lien magique par email | 2 sessions | ⚫ À faire |
| R6 | État connecté — profil + flotte + statuts + heartbeat indicateur (D6) | 2 sessions | ⚫ À faire |
| R7 | Back-office MASTER admin Martin | 2-3 sessions | ⚫ À faire |
| R8 | Polish + tests tous devices + heartbeat bloquant optionnel (D6) + communication + lancement | 1-2 sessions | ⚫ À faire |

**Estimation totale : 13 à 16 sessions avant V1.**

---

## Launcher — Redéfinition daemon (D5 — actée 17/06/2026)

Launcher n'est plus une application avec interface utilisateur. Il est devenu un daemon macOS — agent de fond, icône barre de menu, zéro fenêtre principale. MASTER archivé dans le code (non supprimé). RENDEZVOUS = autorité unique de gouvernance des profils. Launcher = lecture seule sur profils partagés.

**Fiche produit réécrite :** `FICHE_PRODUIT_LAUNCHER_V2.md` — commit `3f8c45a` — 18/06/2026

---

## Pièges techniques récurrents

**Electron / Desktop**

**`session.json` — chemin canonique**
- `SUITE_DIR` = `~/Library/Application Support/tranquility-suite/` — jamais `~/.backupflow/`

**Cache `profiles-cache.json` — amorçage sur nouveau Mac**
- `session-profile.js` utilise `https.get` sans auth → repo `launcher-profiles` privé → 404 silencieux
- Amorçage manuel obligatoire : `gh api repos/RealCoolclint/launcher-profiles/contents/profiles.json --jq '.content' | base64 -d > ~/Library/Application\ Support/tranquility-suite/profiles-cache.json`

**`sp-boot` — clé canonique**
- Retourne toujours `allProfiles` (pas `profiles`) — attendu par le renderer

**Profils GitHub — champ `name` absent**
- Format réel : `firstName` + `lastName` séparés
- Toujours prévoir le fallback : `p.name || [p.firstName, p.lastName].filter(Boolean).join(' ')`

---

## Phase Mercury — ✅ Clôturée — 9 avril 2026

**Progression : 100%**

---

## Phase Gemini — Active

### Inventaire de flotte Gemini

| # | App | Type | État |
|---|-----|------|------|
| 1 | **ROVER** | Desktop | 🟣 En orbite — V1.04.06.26 |
| 2 | **COVENANT** | Web | 🟣 En orbite — C1→C7 ✅ · C9 ✅ · C11 ✅ · C12 ✅ · PWA ✅ · C10 ⚫ fermé |
| 3 | **READBACK** | Desktop | ⚫ En projet |
| 4 | **PAYLOAD** | Desktop + Mobile | ⚫ En projet |
| 5 | **RENDEZVOUS** | Web | 🔵 R1 ✅ · R2 ✅ · R3 ✅ livré — commits f1c7c86 + d2551ae + 9b6bc6f — formulaire inscription + RGPD + bug --accent corrigé — R4 à démarrer |

### Chantiers d'infrastructure Gemini

| # | Chantier | Type | État |
|---|----------|------|------|
| I1 | **Launcher bugs** — DMG + Resend | Infrastructure | ✅ Terminé — 06/06/2026 |
| I2 | **APPS_CATALOG externalisé** | Infrastructure | ⚫ Conditionnel — 10+ apps en orbite |
| I3 | **managers.json** — Shared Data Layer | Infrastructure | ✅ Terminé — 02/06/2026 |
| I4 | **SSD recovery** — protocole migration | Infrastructure | ⚫ À faire — nouveau SSD requis |
| I5 | **managers.json** — arbitrages + schema | Infrastructure | ✅ Terminé — 02/06/2026 |
| I6 | **tranquility-web-template** | Infrastructure | ✅ Terminé — commit `a9733ed` — 14/06/2026 |
| I7 | **RENDEZVOUS** — portail public + redéfinition Launcher daemon | Infrastructure | 🔵 R1 ✅ · R2 ✅ · R3 ✅ — formulaire inscription + RGPD livré — R4 à démarrer |

---

## Chantiers ouverts — Vue consolidée

### Famille A — Documentation fondatrice

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| A1 | **Audit Workflow** — cartographie + 26 chantiers | 🔴 Critique | ✅ Terminé — 10/04/2026 |
| A2 | **Fiches produit** — BackUpFlow → Manifest | 🟠 Important | ✅ Terminé — 11/04/2026 |
| A3 | **Fiche produit COVENANT** | 🟠 Important | ✅ Terminé — 11/04/2026 |
| A4 | **READBACK + CAPITAL** — fiches produit + spec complète | 🟠 Important | ✅ Terminé — 12/04/2026 |
| A5 | **Agence Tranquility** — manifeste + agents + council skill | 🔴 Critique | ✅ Terminé — 12/04/2026 |
| A6 | **RENDEZVOUS** — spec complète | 🔴 Critique | ✅ Terminé — 14/06/2026 |
| A7 | **RENDEZVOUS** — fiche produit V1.1 + spec technique D1→D6 | 🔴 Critique | ✅ Terminé — 18/06/2026 — commits `a0bb1d7` + `e747b4b` |
| A8 | **Launcher** — fiche produit réécrite (daemon) | 🟠 Important | ✅ Terminé — 18/06/2026 — commit `3f8c45a` |
| A9 | **Registre traitements RGPD** — livrable Audrey Weiss | 🟠 Important | ✅ Terminé — 18/06/2026 — commit `e80aabf` |
| A10 | **RENDEZVOUS R3** — formulaire inscription + RGPD + Council Sécurité architecture d'accès | 🔴 Critique | ✅ Terminé — 19/06/2026 |

### Famille B — Architecture et infrastructure

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| B1 | **TRANQUILITY_SERVICES_TIERS.md** | 🟠 Important | ✅ V1.3 — 14/06/2026 — commit `353c05a` |
| B2 | **Reviewer** — référence apps web | 🔴 Critique | ✅ Assainissement + corrections UI terminés |
| B7 | **Bitwarden** — vault "Tranquility Suite" | 🟠 Important | ✅ Terminé — 5 entrées — 13/06/2026 |
| B8 | **Audit transversal `--accent`/`.dark-theme`** — bug systémique détecté dans RENDEZVOUS, portée sur les autres apps web non vérifiée | 🟠 Important | 🔵 Chantier à part — non démarré |

### Famille I — Infrastructure produit

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| I6 | **tranquility-web-template** | 🟠 Important | ✅ Terminé — commit `a9733ed` — 14/06/2026 |
| I7 | **RENDEZVOUS** — build R1→R8 | 🔴 Critique | 🔵 R1 ✅ — documentation complète ✅ — R2 à démarrer |

---

## Carnet de pièges — Référence

`CARNET_PIEGES_V13.md` — 19 juin 2026

---

## Flotte complète — 23 outils

| # | Nom | Catégorie | État |
|---|-----|-----------|------|
| 1 | BackUpFlow | Desktop | 🟣 En orbite — V1.12.06.26 — Migration Session V1.1 ✅ — commit `77c5e34` |
| 2 | Transporter | Desktop | 🟣 En orbite |
| 3 | Reviewer | Web | 🟣 En orbite — assainissement CSS ✅ · corrections UI ✅ · bugs marqueurs + minuscules ✅ |
| 4 | Manifest | Web | 🟣 En orbite — identity crisis ✅ soldée 14/06/2026 — repo renommé `Manifest` |
| 5 | Launcher | Desktop daemon | 🟣 En orbite — redéfini daemon macOS — zéro interface — icône barre de menu — N1 uniquement — fiche V2.0 ✅ |
| 6 | ARK | Desktop | 🟣 En orbite |
| 7 | ROVER | Desktop | 🟣 En orbite — V1.04.06.26 |
| 8 | COVENANT | Web | 🟣 En orbite — C9 ✅ · PWA ✅ · C10 ⚫ fermé |
| 9 | READBACK | Desktop | ⚫ En projet |
| 10 | CAPITAL | Desktop | ⚫ En projet |
| 11 | PAYLOAD | Desktop + Mobile | ⚫ En projet |
| 12 | Cargo | Desktop | ⚫ En projet |
| 13 | Hatch | Web | ⚫ En projet — Organizer multicam — rôle original conservé |
| 14 | Guidance | Web | ⚫ En projet |
| 15 | Beacon | Desktop | ⚫ En projet |
| 16 | Debrief | Web | ⚫ En projet |
| 17 | Telemetry | Web | ⚫ En projet |
| 18 | CAPCOM | Extension | ⚫ En projet |
| 19 | DATAPAD | Extension | ⚫ En projet |
| 20 | BLACKBOX | Extension | ⚫ En projet |
| 21 | Scripter | À définir | ⚫ En idée |
| 22 | **SIGNAL** | Web | ⚫ En idée — Phase Apollo — vue pilotage flotte + résumé Ollama · *OMNIA CONSPICUA* |
| 23 | **RENDEZVOUS** | Web | 🔵 R1 ✅ · R2 ✅ · R3 ✅ — formulaire inscription + RGPD livré — R4 à démarrer |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail Agence | V1 |
| `AGENCE_TRANQUILITY_AGENTS.md` | 23 postes — personnalités et réflexes | V1 |
| `AGENCE_TRANQUILITY_COUNCIL_SKILL.md` | Protocole consultation multi-agents | V1 |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision produit — 5 décisions fondatrices | V2 ⚠️ Révision nécessaire |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design — règles UI non négociables | V2 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format profils — architecture settings | V1.1 ⚠️ V1.2 à produire — impactée par RENDEZVOUS |
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Protocole session — sync GitHub — 12 règles | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Les trois lois du workflow captif | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille d'évaluation opérationnelle | V1 |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Trois automatismes JARVIS | V3 — 08/06/2026 |
| `TRANQUILITY_COMPASS.md` | Orientation permanente JARVIS | V1 — 07/06/2026 |
| `TRANQUILITY_SERVICES_TIERS.md` | Services tiers — inventaire + règles | V1.3 — commit `353c05a` |
| `TRANQUILITY_IA_STRATEGIE.md` | Stratégie IA — 3 approches + règles | V1 — 14/06/2026 |
| `TRANQUILITY_VEILLE_IA.md` | Veille IA — process permanent | V1 — 14/06/2026 |
| `CARNET_PIEGES_V13.md` | Carnet de pièges empirique | V13 — 19/06/2026 |
| `FICHE_PRODUIT_RENDEZVOUS_V1.md` | Fiche produit RENDEZVOUS | V1.1 — 18/06/2026 ✅ D5/D6 intégrés |
| `FICHE_PRODUIT_LAUNCHER_V2.md` | Fiche produit Launcher daemon | V2.0 — 18/06/2026 ✅ |
| `SPEC_TECHNIQUE_RENDEZVOUS_V1.md` | Spec technique RENDEZVOUS D1→D6 | V1.0 — 18/06/2026 ✅ |
| `REGISTRE_TRAITEMENTS_RGPD_V1.md` | Registre RGPD — article 30 | V1.0 — 18/06/2026 ✅ |
| `TRANQUILITY_COMITE_EXTERNE_DESIGN.md` | Comité externe design — 3 voix (Emil Kowalski · Impeccable · Taste-skill), synthèse vanilla CSS/JS, complète la Design Reference | V1.0 — 19/06/2026 ✅ |
| `TRUE_ME.md` | Connaissance progressive Martin | Living document |

---

*Plan Directeur V5.47 · Tranquility Suite · Cellule Vidéo L'Étudiant · 19 juin 2026*
*Mise à jour — D7 actée : inscription RENDEZVOUS bascule en page dédiée (`inscription.html`), renverse la décision in-page de R3 · Transition cinématique validée (zoom patch, aller soigné/retour simple) · Comité Externe Design V1.0 ajouté · Carnet de Pièges V13 (+1 piège résiduel --color-primary, élargit B8) · R4 non démarré, précédé par sous-chantier D7 (0/6 prompts lancés)*
