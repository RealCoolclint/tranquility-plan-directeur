# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 5.52 — 21 juin 2026*

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

**Identité de la suite — vocabulaire de rôle (D12).** Le code et les textes visibles par l'utilisateur ne portent jamais de nom personnel. Le rôle (ADMIN, équipe) prime sur la personne, même quand Martin est aujourd'hui l'unique titulaire des postes — la suite doit paraître portée par une équipe, pas par un individu.

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

**Idée notée, non planifiée (21/06/2026) :** la vitrine publique manque de personnalité visuelle — trop sobre. Chantier croisé DESIGN + COM/MARKETING (postes STUDIO CREA/UX ET UI + COM/RP), à programmer au bon moment plutôt qu'improvisé.

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
  → Resend — notification mail admin "nouvelle demande pending" (notifierAdmin — D12)
       ↓
  Martin valide dans back-office RENDEZVOUS (R7)
       ↓
  → API GitHub — profil passe "active" + niveau N1/N2/N3/N4 assigné
  → Resend — notification mail utilisateur "accès accordé"
  [Si N1] → Onboarding daemon guidé — parcours selon type de poste
```

**État d'implémentation (21/06/2026) :** le bloc d'écriture initial (formulaire → proxy → `profiles-private.json`) est opérationnel et testé en production. La notification Resend admin (`notifierAdmin()`, ex-`notifierMartin()`) envoie désormais depuis le domaine dédié `notifications@mail.tranquilitysuite.com` (B13), testée de bout en bout. Repos concrets : `rendezvous-proxy` (fonction Netlify, privé) et `rendezvous-profiles-private` (données sensibles, privé), tous deux distincts des repos COVENANT. La bascule "pending → active" et l'écriture dans `profiles-public.json` restent à construire en R7.

### Treize décisions architecturales fondatrices RENDEZVOUS (D1→D13)

| # | Décision | Essence | Acté |
|---|----------|---------|------|
| D1 | Double fichier + proxy seul écrivain | `profiles-public.json` (public) + `profiles-private.json` (privé) — cohérence atomique — proxy RENDEZVOUS seul point d'écriture | 16/06/2026 |
| D2 | Tokens signés + fallback 48h + denylist | RENDEZVOUS autorité centrale — tokens courts — cache local 48h — denylist CDN vérifiée au démarrage | 16/06/2026 |
| D3 | 3 modes session — le plus strict gagne | `persistent` / `bounded` / `ephemeral` — mode encodé dans le token — apps appliquent sans décider | 16/06/2026 |
| D4 | RGPD natif — minimisation + suppression atomique | Intérêt légitime — données minimisées à la source — suppression simultanée des deux fichiers | 16/06/2026 |
| D5 | Launcher daemon — RENDEZVOUS autorité unique | Launcher = agent de fond macOS, icône barre de menu, zéro interface. MASTER archivé. Launcher en lecture seule sur profils partagés. Intégrité par architecture, non par discipline individuelle. | 17/06/2026 |
| D6 | Heartbeat progressif — indicateur puis bloquant | Daemon ping proxy RENDEZVOUS. R6 : indicateur informatif. R8 : bloquant optionnel avec fallback 48h. Bascule = décision PRÉSIDENCE. | 17/06/2026 |
| D7 | Inscription et connexion en modales **Glass Drawer** partagées (pas de page séparée) | **Renverse la décision D7 initiale du 19/06 (page séparée `inscription.html`)**, elle-même renversement de la décision R3 du 19/06 matin (in-page). Page séparée construite intégralement (6 prompts Cursor, 4 appliqués + Mercury conditionnel par session) puis abandonnée après travail en direct Martin/Cursor hors protocole JARVIS, à visée exploratoire assumée ("disruption créative volontaire"). Glass Drawer : module générique `glass-drawer.js` partagé par `#connect-drawer` et `#inscription-drawer`, morph organique depuis le bouton cliqué, hauteur mesurée avant ouverture (anti-saut de position), exclusion mutuelle stricte, backdrop modal bloquant. Mercury Opening conditionnel par session (construit lors de la phase page séparée) conservé intact — règle transverse survivant au changement d'architecture. Validé par Martin en usage réel ("totalement convaincu"). **Construit et validé localement le 19/06, mais jamais commité ni poussé — déployé en production pour la première fois le 20/06**, après découverte fortuite lors de la reprise de session sur R4. Itération page séparée documentée comme abandonnée, non effacée — voir `SESSION_TRAVAIL_20260619_RENDEZVOUS_D7_GLASS_DRAWER.md`. | 19/06/2026 (décidé) · 20/06/2026 (déployé) |
| D8 | R4 — écriture exclusive dans `profiles-private.json`, schéma public différé | Le proxy R4 n'écrit jamais dans `profiles-public.json` à l'étape `pending` — une inscription en attente n'est pas un profil actif. La réconciliation entre le modèle existant (`role` + `appPermissions`) et le modèle niveau N1→N4 de D1 est reportée à R7, au moment de la validation admin, plutôt que tranchée à l'aveugle pendant la construction du proxy. | 20/06/2026 |
| D9 | Domaine d'envoi Resend — bac à sable pour notifications internes, domaine dédié pour R5 | `letudiant.fr` n'a jamais été vérifié sur le compte Resend de la suite ("No domains yet") — découvert en diagnostiquant l'échec de la notification R4. Les notifications BackUpFlow/COVENANT, documentées comme envoyées depuis `noreply@letudiant.fr`, utilisent en réalité le bac à sable Resend `onboarding@resend.dev` (vérifié en ouvrant un email réel) — la doc ne reflète pas le comportement réel, à corriger un jour dans `TRANQUILITY_SUITE_ELECTRON_SKILL.md`. Ce mécanisme fonctionne uniquement parce que le destinataire est toujours le compte Resend lui-même (`mpavloff@letudiant.fr`) — Resend bloque tout envoi vers un tiers sans domaine vérifié. Décision : la notification admin R4 reste sur `onboarding@resend.dev` (cas d'usage valide, destinataire = Martin). **Refus explicite de vérifier `letudiant.fr`** — domaine corporate, hors périmètre suite, l'IT de L'Étudiant n'est pas sollicitée pour préserver l'autonomie de la suite, même si ça impose des limites à court terme. Un domaine dédié à la Tranquility Suite (acheté et contrôlé par Martin, comme GitHub/Netlify/Bitwarden) sera vérifié sur Resend au moment de R5, qui nécessitera d'envoyer de vrais emails à des utilisateurs autres que Martin. | 20/06/2026 |
| D10 | Domaine Resend dédié vérifié — `mail.tranquilitysuite.com` | Domaine `tranquilitysuite.com` acheté via Cloudflare (registrar + DNS unifiés). Sous-domaine d'envoi dédié `mail.tranquilitysuite.com` choisi plutôt que le domaine racine, pour isoler la réputation d'envoi et garder la racine libre pour un usage futur non lié à l'email. Vérifié via le bouton "Auto configure" de Resend — intégration **Cloudflare Domain Connect**, autorisation à usage unique explicitement affichée ("ne permet pas à Resend d'effectuer de futures modifications") — pas d'OAuth permanent, aucune révocation d'accès à prévoir. Trois enregistrements DNS posés automatiquement en mode "DNS uniquement" (MX `feedback-smtp`, TXT DKIM, TXT SPF). Domaine passé en statut **Verified** en 9 minutes (23h57 → 00h06). Lève le blocage D9 pour R5. | 21/06/2026 |
| D11 | RENDEZVOUS n'a pas de sidebar — convention `--topbar-*` | RENDEZVOUS n'a jamais eu de sidebar dans sa conception (confirmé : `grep -rln "sidebar" *.html` vide). Les variables `--sidebar-bg`, `--sidebar-bg-hover`, `--sidebar-text`, `--sidebar-text-hover`, `--sidebar-border` trouvées dans `style.css` (chacune définie jusqu'à 3 fois, probable copié-collé depuis Reviewer) ne servaient en réalité qu'à `.top-bar`/`.nav-btn`. Renommées en `--topbar-text`, `--topbar-text-hover`, `--topbar-border`, `--topbar-bg`, consolidées en une seule définition propre par variable (suppression des doublons en hex dur et des références fantômes). Convention actée : toute variable CSS exclusive à la barre du haut de RENDEZVOUS porte le préfixe `--topbar-*`, jamais `--sidebar-*`. | 21/06/2026 |
| D12 | Vocabulaire de rôle — jamais de nom personnel dans le code ou l'identité visible de la suite | Découvert sur `notifierMartin()` (renommé `notifierAdmin()` — la fonction notifie qui détient le rôle ADMIN, pas Martin nommément) puis une deuxième fois le même jour sur le texte de confirmation inscription ("Ta demande a bien été reçue. Martin reviendra vers toi par email sous 48h." → "...L'équipe reviendra..."). Le rôle prime sur la personne, même quand Martin est l'unique titulaire — la suite doit paraître portée par une équipe. Principe suite-wide, pas spécifique à RENDEZVOUS — audit à mener un jour sur COVENANT/BackUpFlow (noté, non traité). | 21/06/2026 |
| D13 | RENDEZVOUS aligné sur les valeurs officielles de `tranquility-core.css` — le core évolue par sessions dédiées | Diff exhaustif token par token entre `:root` de `style.css` et `:root` de `tranquility-core.css` : 25 tokens dupliqués localement (chiffre exact — ni 6 comme estimé initialement, ni 24 comme estimé en rescope), dont 14 avec des valeurs divergentes du core (fonds, `--success`, `--border`, `--shadow-md`/`-lg`, `--radius-md`/`-lg`). Décision : RENDEZVOUS abandonne ses valeurs locales au profit des valeurs officielles du core — changement visuel accepté consciemment plutôt que de figer une divergence silencieuse. Principe complémentaire acté : le core ne doit pas évoluer en correctif réactif au fil d'un chantier d'app — des sessions dédiées, ponctuelles, calées sur les grandes phases du programme (type de chantier **DESIGN + R&D**), seront programmées pour le faire évoluer si besoin. | 21/06/2026 |

---

### Roadmap de build RENDEZVOUS (R1→R8) — révisée 21/06/2026

| # | Chantier | Estimation | État |
|---|----------|-----------|------|
| R1 | Fondations — scaffolding, GitHub Pages, Design Reference | 1 session | ✅ Livré — commit `8f15923` |
| R2 | Vitrine publique — présentation flotte, fiches app | 2 sessions | ✅ Livré — commits f1c7c86 + d2551ae + 9b6bc6f |
| R3 | Formulaire d'inscription + RGPD | 1 session | ✅ Livré — formulaire + RGPD + accessibilité, migré en modale Glass Drawer (D7), déployé en production le 20/06 |
| R4 | Proxy Netlify + API GitHub (double fichier D1) + notification admin | 2-3 sessions | ✅ **Livré** — proxy + écriture `pending` + notification Resend admin (D9), testés en production de bout en bout (repos `rendezvous-proxy` + `rendezvous-profiles-private`) — commits `9f1964e`, `0b83ec5`, `ca7b5ab` |
| R5 | Authentification — lien magique par email | 2 sessions | ⚫ À faire — **tous les préalables sont levés** : domaine dédié vérifié (D10) ET activé dans le code (B13, `notifierAdmin()` envoie depuis `mail.tranquilitysuite.com`). Dépendance B14 (réputation/chauffage du domaine) à surveiller en parallèle, non bloquante pour démarrer le développement |
| R6 | État connecté — profil + flotte + statuts + heartbeat indicateur (D6) | 2 sessions | ⚫ À faire |
| R7 | Back-office MASTER admin Martin | 2-3 sessions | ⚫ À faire — devra réconcilier le schéma `profiles-public.json` existant avec le modèle niveau N1→N4 (D8) |
| R8 | Polish + tests tous devices + heartbeat bloquant optionnel (D6) + communication + lancement | 1-2 sessions | ⚫ À faire — inclut la protection anti-spam du formulaire d'inscription (non bloquant en usage interne actuel) |

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
- Amorçage manuel requis : `gh api repos/RealCoolclint/launcher-profiles/contents/profiles.json --jq '.content' | base64 -d > ~/Library/Application\ Support/tranquility-suite/profiles-cache.json`

**Deux registres de profils non réconciliés (découvert 20/06/2026)**
- `tranquility-core/profiles-public.json` (apps web, format `role` + `appPermissions`) et `launcher-profiles/profiles.json` (apps desktop, lu via `session-reader.js`) coexistent sans synchronisation connue
- Aucun des deux n'est aligné avec le modèle niveau N1→N4 de RENDEZVOUS/D1
- Réconciliation prévue à R7 (D8), pas avant

**Documents fondateurs d'une app web ≠ forcément dans le repo de cette app (découvert 20/06/2026)**
- `FICHE_PRODUIT_RENDEZVOUS_V1.md`, `SPEC_TECHNIQUE_RENDEZVOUS_V1.md`, `REGISTRE_TRAITEMENTS_RGPD_V1.md` vivent dans `tranquility-plan-directeur`, pas dans `RENDEZVOUS` — logique pour des documents internes (dont un registre RGPD), mais source de confusion lors d'une vérification git
- Avant de conclure qu'un commit annoncé n'a jamais eu lieu, vérifier tous les repos plausibles, pas seulement le plus évident

**Domaine d'envoi Resend de toute la suite (découvert 20/06/2026 — D9, résolu 21/06/2026 — D10, activé 21/06/2026 — B13)**
- `letudiant.fr` n'a jamais été vérifié sur le compte Resend — toutes les notifications de la suite passent en réalité par `onboarding@resend.dev`, restreint à l'envoi vers l'adresse du compte Resend lui-même
- Résolu : domaine dédié `mail.tranquilitysuite.com` acheté et vérifié (D10), puis effectivement activé dans le code (`notifierAdmin()`, ex-`notifierMartin()` — B13/D12)
- Nouveau sujet ouvert par l'activation : réputation/délivrabilité du domaine neuf (voir B14 ci-dessous)

**CSS — cascade de variables dupliquées (découvert 21/06/2026 — B8)**
- Plusieurs déclarations de la même variable CSS dans un même fichier → seule la dernière dans l'ordre du fichier s'applique, les précédentes sont silencieusement ignorées (syntaxiquement valides mais inertes)
- Toujours grep TOUTES les occurrences d'une définition avant de diagnostiquer une variable comme cassée ou de proposer un remplacement — ne pas s'arrêter à la première trouvée

**Contamination CSS inter-apps (confirmé une deuxième fois 21/06/2026, résidu purgé le 21/06/2026 — B9)**
- Du CSS copié-collé depuis une autre app de la suite (Reviewer → RENDEZVOUS, confirmé deux fois) peut survivre indéfiniment si le sélecteur ne correspond à rien dans le HTML actuel
- Vérification systématique avant suppression : `grep` le nom de classe suspect dans tous les `*.html` du repo — si vide, suppression sûre
- Résidu RENDEZVOUS entièrement purgé (B9) : `.comments-title`, `.empty-note`, `.note-item`, `.note-timecode` retirés de `style.css`. Vérification des autres apps web (Reviewer source, Manifest, COVENANT, BackUpFlow) toujours non faite

**Cloudflare Domain Connect ≠ OAuth classique (découvert 21/06/2026 — D10)**
- Le bouton "Auto configure" de Resend pour un domaine Cloudflare est une autorisation à usage unique, pas un accès permanent — aucune révocation nécessaire après vérification du domaine
- Tout enregistrement DNS posé par un tiers sur un domaine Cloudflare doit être en mode "DNS uniquement" (nuage gris), jamais "Proxied" (nuage orange) — un enregistrement proxié ne sera jamais lu correctement par le service tiers, l'échec est silencieux
- **Complément découvert 21/06/2026 (B14) :** l'auto-configure ne pose pas systématiquement tout ce que Resend recommande — le DMARC (`_dmarc` TXT) était listé dans l'email de vérification mais absent des enregistrements réellement posés sur Cloudflare. Ajouté manuellement.

**Réputation d'un domaine d'envoi neuf (découvert 21/06/2026 — B14)**
- Un domaine vérifié sur Resend avec SPF/DKIM/MX corrects peut quand même être classé en spam par défaut chez les gros fournisseurs (Microsoft 365/Outlook notamment) — "Delivered" côté Resend signifie seulement que le serveur destinataire a accepté le message, pas qu'il atterrit en boîte de réception
- Comportement attendu pour un domaine sans historique d'envoi, pas un bug de configuration — un chauffage de réputation dans le temps est nécessaire avant un envoi à grande échelle (R5)

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
| 5 | **RENDEZVOUS** | Web | 🟢 R1 ✅ · R2 ✅ · R3 ✅ · R4 ✅ · Glass Drawer (D7) en production · domaine vérifié ET activé (D10+B13) · reste R5→R8 |

### Chantiers d'infrastructure Gemini

| # | Chantier | Type | État |
|---|----------|------|------|
| I1 | **Launcher bugs** — DMG + Resend | Infrastructure | ✅ Terminé — 06/06/2026 |
| I2 | **APPS_CATALOG externalisé** | Infrastructure | ⚫ Conditionnel — 10+ apps en orbite |
| I3 | **managers.json** — Shared Data Layer | Infrastructure | ✅ Terminé — 02/06/2026 |
| I4 | **SSD recovery** — protocole migration | Infrastructure | ⚫ À faire — nouveau SSD requis |
| I5 | **managers.json** — arbitrages + schema | Infrastructure | ✅ Terminé — 02/06/2026 |
| I6 | **tranquility-web-template** | Infrastructure | ✅ Terminé — commit `a9733ed` — 14/06/2026 |
| I7 | **RENDEZVOUS** — portail public + redéfinition Launcher daemon | Infrastructure | 🟢 R1 ✅ · R2 ✅ · R3 ✅ · R4 ✅ — Glass Drawer en production · domaine activé (B13) · reste R5→R8 |

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
| A7 | **RENDEZVOUS** — fiche produit V1.1 + spec technique D1→D6 | 🔴 Critique | ✅ Terminé — 18/06/2026 — commits `a0bb1d7` + `e747b4b` (repo `tranquility-plan-directeur`) |
| A8 | **Launcher** — fiche produit réécrite (daemon) | 🟠 Important | ✅ Terminé — 18/06/2026 — commit `3f8c45a` |
| A9 | **Registre traitements RGPD** — livrable Audrey Weiss | 🟠 Important | ✅ Terminé — 18/06/2026, **corrigé en V1.1 le 20/06/2026** — commit `e80aabf` puis `de23620` (repo `tranquility-plan-directeur`) |
| A10 | **RENDEZVOUS R3** — formulaire inscription + RGPD + Council Sécurité architecture d'accès | 🔴 Critique | ✅ Terminé — 19/06/2026 |
| A11 | **SPEC_TECHNIQUE_RENDEZVOUS_V1.md** — intégration D7→D13 | 🟡 Mineur | ⚫ À faire — la spec technique n'a toujours pas été mise à jour depuis D6 ; **D7 à D13 manquants — 7 décisions de retard**, la dette grossit session après session |

### Famille B — Architecture et infrastructure

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| B1 | **TRANQUILITY_SERVICES_TIERS.md** | 🟠 Important | ✅ V1.3 — 14/06/2026 — commit `353c05a` |
| B2 | **Reviewer** — référence apps web | 🔴 Critique | ✅ Assainissement + corrections UI terminés |
| B7 | **Bitwarden** — vault "Tranquility Suite" | 🟠 Important | ✅ Terminé — 6 entrées (PAT RENDEZVOUS ajouté 20/06) |
| B8 | **Audit transversal CSS mort RENDEZVOUS** — `--color-primary` résiduel, `--info` fantôme, `--sidebar-*` consolidé en `--topbar-*` (D11), contamination Reviewer (1ère passe) | 🟠 Important | ✅ Terminé — 21/06/2026 — commits `4fa40a8`, `e4646f3`, `69ded96`, `0d2e292` (repo `RENDEZVOUS`) |
| B9 | **Audit tokens CSS RENDEZVOUS vs Core** — terminé en trois passes le 21/06/2026 : (1) nettoyage de `:root` — 25 tokens dupliqués du core supprimés (chiffre exact), 13 tokens propres à RENDEZVOUS conservés ; (2) fusion des deux blocs `.dark-theme` en un seul (3 tokens réels : `--border-light`, `--shadow-xl` — `--shadow-sm` retiré, inutilisé) ; (3) purge complète de la contamination Reviewer résiduelle (`.comments-title`, `.empty-note`, `.note-item`, `.note-timecode`). Décision D13 actée à cette occasion. Validé visuellement en navigation privée. Portée sur les autres apps web (Reviewer, Manifest, COVENANT, BackUpFlow) toujours non vérifiée | 🟠 Important | ✅ **Terminé — 21/06/2026** — commits `855427a`, `42c6919`, `29396e7`, `847fdab` (repo `RENDEZVOUS`) |
| B10 | **Réconciliation profils** — `tranquility-core/profiles-public.json` (role/appPermissions) vs `launcher-profiles/profiles.json` vs modèle niveau N1→N4 de RENDEZVOUS/D1 | 🟠 Important | 🔵 Chantier à part — non démarré, prévu pour R7 (D8) |
| B11 | **Domaine Resend dédié Tranquility Suite** — `tranquilitysuite.com` acheté via Cloudflare, sous-domaine `mail.tranquilitysuite.com` vérifié via Domain Connect en 9 minutes (D10) | 🟠 Important | ✅ Terminé — 21/06/2026 (D10) |
| B12 | **Correction `TRANQUILITY_SUITE_ELECTRON_SKILL.md`** — section Resend documente `from: 'BackUpFlow <noreply@letudiant.fr>'` alors que la valeur réelle en production est `onboarding@resend.dev` | 🟡 Mineur | 🔵 Chantier à part — non démarré (D9) |
| B13 | **Activation domaine RENDEZVOUS** — `notifierMartin()` renommé `notifierAdmin()` (D12), `from` basculé vers `notifications@mail.tranquilitysuite.com`. Testé en conditions réelles (curl + vérification Resend dashboard + nettoyage profil test dans `rendezvous-profiles-private`). Email confirmé Delivered mais initialement classé en spam (réputation domaine neuf, pas un bug) — a déclenché l'ouverture de B14 | 🟠 Important | ✅ **Terminé — 21/06/2026** — commit `f5dcd55` (repo `rendezvous-proxy`) |
| B14 | **Réputation et délivrabilité du domaine d'envoi** — diagnostic : Resend recommandait 4 enregistrements DNS à la vérification du domaine (D10), seuls 3 posés par l'auto-configure (MX, DKIM, SPF) — le DMARC manquait. Ajouté manuellement (`_dmarc.tranquilitysuite.com`, `v=DMARC1; p=none;`), propagation confirmée par `dig`. Reste : chauffage de réputation dans le temps, à surveiller avant que R5 envoie des liens magiques à de vrais utilisateurs | 🟠 Important | 🟡 **Ouvert — 21/06/2026** — DMARC posé, chauffage du domaine à suivre dans le temps |

### Famille I — Infrastructure produit

| # | Chantier | Priorité | État |
|---|----------|---------|------|
| I6 | **tranquility-web-template** | 🟠 Important | ✅ Terminé — commit `a9733ed` — 14/06/2026 |
| I7 | **RENDEZVOUS** — build R1→R8 | 🔴 Critique | 🟢 R1 ✅ · R2 ✅ · R3 ✅ · R4 ✅ · Glass Drawer en production · domaine vérifié ET activé (D10+B13) · reste R5→R8 |

---

## Carnet de pièges — Référence

`CARNET_PIEGES_V18.md` — 21 juin 2026

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
| 23 | **RENDEZVOUS** | Web | 🟢 R1 ✅ · R2 ✅ · R3 ✅ · R4 ✅ · Glass Drawer en production (20/06) · domaine vérifié ET activé (21/06) · reste R5→R8 |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `AGENCE_TRANQUILITY_MANIFESTE.md` | Mode de travail Agence | V1 |
| `AGENCE_TRANQUILITY_AGENTS.md` | 23 postes — personnalités et réflexes | V1 |
| `AGENCE_TRANQUILITY_COUNCIL_SKILL.md` | Protocole consultation multi-agents | V1 |
| `TRANQUILITY_SUITE_VISION_PRODUIT.md` | Vision produit — 5 décisions fondatrices | V2 ⚠️ Révision nécessaire |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design — règles UI non négociables | V2 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format profils — architecture settings | V1.1 ⚠️ V1.2 à produire — impactée par RENDEZVOUS et par B10 |
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Protocole session — sync GitHub — 12 règles | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_MANIFESTE.md` | Les trois lois du workflow captif | V1 |
| `TRANQUILITY_WORKFLOW_CAPTIF_GRILLE.md` | Grille d'évaluation opérationnelle | V1 |
| `TRANQUILITY_WORKFLOW_ASSIST.md` | Trois automatismes JARVIS | V3 — 08/06/2026 |
| `TRANQUILITY_COMPASS.md` | Orientation permanente JARVIS | V1 — 07/06/2026 |
| `TRANQUILITY_SERVICES_TIERS.md` | Services tiers — inventaire + règles | V1.3 — commit `353c05a` |
| `TRANQUILITY_IA_STRATEGIE.md` | Stratégie IA — 3 approches + règles | V1 — 14/06/2026 |
| `TRANQUILITY_VEILLE_IA.md` | Veille IA — process permanent | V1 — 14/06/2026 |
| `CARNET_PIEGES_V18.md` | Carnet de pièges empirique | V18 — 21/06/2026 |
| `FICHE_PRODUIT_RENDEZVOUS_V1.md` | Fiche produit RENDEZVOUS | V1.1 — 18/06/2026 ✅ D5/D6 intégrés |
| `FICHE_PRODUIT_LAUNCHER_V2.md` | Fiche produit Launcher daemon | V2.0 — 18/06/2026 ✅ |
| `SPEC_TECHNIQUE_RENDEZVOUS_V1.md` | Spec technique RENDEZVOUS D1→D6 | V1.0 — 18/06/2026 ✅ ⚠️ D7→D13 à intégrer (A11) |
| `REGISTRE_TRAITEMENTS_RGPD_V1_1.md` | Registre RGPD — article 30 | V1.1 — 20/06/2026 ✅ nom de famille corrigé + périmètre Resend mis à jour |
| `TRANQUILITY_COMITE_EXTERNE_DESIGN.md` | Comité externe design — 3 voix (Emil Kowalski · Impeccable · Taste-skill), synthèse vanilla CSS/JS, complète la Design Reference | V1.0 — 19/06/2026 ✅ |
| `SESSION_TRAVAIL_20260619_RENDEZVOUS_D7_GLASS_DRAWER.md` | Récap session — D7 page séparée (abandonnée) puis bascule Glass Drawer, découverte B9 | 19/06/2026 ✅ |
| `SESSION_TRAVAIL_20260620_RENDEZVOUS_R4_GLASS_DRAWER_DEPLOY.md` | Récap session (matin) — R4 démarré, déploiement effectif du Glass Drawer, fix CSP, sauvetage `profiles-public.json` | 20/06/2026 ✅ |
| `SESSION_TRAVAIL_20260620_RENDEZVOUS_R4_RESEND_RGPD.md` | Récap session (soir) — R4 livré (notification Resend), Registre RGPD V1.1, découverte domaine Resend (D9) | 20/06/2026 ✅ |
| `SESSION_TRAVAIL_20260621_RENDEZVOUS_B11_B8.md` | Récap session (matin) — B11 livré (domaine dédié vérifié, D10), B8 livré avec portée étendue (D11, renommage `--topbar-*`), B9 rescopé | 21/06/2026 ✅ |
| `SESSION_TRAVAIL_20260621_RENDEZVOUS_B13_B9_D12_D13.md` | Récap session (après-midi) — B13 livré (domaine activé), B14 ouvert (DMARC posé), B9 clôturé (D13), D12 acté et appliqué 2x | 21/06/2026 ✅ |
| `TRUE_ME.md` | Connaissance progressive Martin | Living document |

---

*Plan Directeur V5.52 · Tranquility Suite · Cellule Vidéo L'Étudiant · 21 juin 2026*
*Mise à jour — B13 livré : `notifierMartin()` renommé `notifierAdmin()`, `from` Resend basculé vers `notifications@mail.tranquilitysuite.com`, testé en conditions réelles (D12) · B14 ouvert : email initialement classé en spam (réputation domaine neuf), DMARC manquant de l'auto-configure Resend ajouté manuellement et propagé · B9 clôturé en trois passes : 25 tokens core dupliqués supprimés de `:root` (chiffre exact), fusion des deux blocs `.dark-theme` (3 tokens réels restants), purge complète de la contamination Reviewer · D12 acté (vocabulaire de rôle, jamais de nom personnel) et appliqué deux fois dans la même session (fonction + texte UI) · D13 acté (alignement RENDEZVOUS sur le core officiel + principe de sessions DESIGN+R&D dédiées pour faire évoluer le core) · Idée notée non planifiée : la vitrine RENDEZVOUS manque de personnalité visuelle, chantier croisé avec COM/MARKETING*
