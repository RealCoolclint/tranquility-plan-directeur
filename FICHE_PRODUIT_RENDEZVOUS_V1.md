# RENDEZVOUS — Fiche Produit
## Tranquility Suite · Cellule Vidéo L'Étudiant

---

## IDENTITÉ

| | |
|---|---|
| **Nom** | RENDEZVOUS |
| **Devise** | *HIC OMNIA INCIPIUNT · Ici tout commence* |
| **Famille** | Web — GitHub Pages |
| **Statut** | En développement · Phase Gemini |
| **Phase** | Gemini |
| **Version** | R1→R5 livrés · R6 en cours — D17-D20 intégrés |
| **Repo GitHub** | `RealCoolclint/RENDEZVOUS` |
| **URL** | `https://realcoolclint.github.io/RENDEZVOUS/` |
| **Utilisateurs** | Tout collaborateur de L'Étudiant ayant un rapport réel à la vidéo — jusqu'à 120 personnes |

---

## LA PROMESSE

**Un seul endroit pour entrer dans la suite. Un seul endroit pour comprendre ce qu'elle fait. Un seul endroit pour demander l'accès à ce dont on a besoin.**

---

## L'AVANT

La suite grandit. Huit apps en orbite. Une neuvième en construction. Une dixième en projet.

Mais personne en dehors de la cellule vidéo ne sait vraiment ce qui existe. Le journaliste qui tourne une vidéo deux fois par semaine ne sait pas que Reviewer lui ferait gagner une heure par sujet. L'attachée de presse qui coordonne les tournages ne sait pas que COVENANT existe. La direction qui veut comprendre le workflow vidéo n'a nulle part où regarder.

Et même dans la cellule vidéo, l'onboarding d'un nouveau membre ressemble à un tour guidé oral — Martin explique, Martin montre, Martin partage les liens. Il n'y a pas de porte d'entrée officielle. Il y a des liens Slack, des bookmarks personnels, une note dans un coin de Notion. Chacun a sa version de la flotte.

Quand on demande "comment j'accède à Reviewer ?", la réponse est un message à Martin.

**RENDEZVOUS a été conçu pour que cette question n'ait plus besoin d'être posée.**

---

## CE QU'IL FAIT

**Présenter la flotte à ceux qui ne la connaissent pas** — RENDEZVOUS est la vitrine publique de la Tranquility Suite. Accessible sans connexion, il présente chaque app, sa mission, sa place dans le workflow. Quelqu'un qui arrive pour la première fois comprend en cinq minutes ce que fait la suite et pourquoi elle existe.

**Accueillir les nouvelles demandes d'accès** — Un formulaire simple. Prénom, email pro, rôle dans l'entreprise, rapport à la vidéo. Une case RGPD cochée. Un message de confirmation. Et une notification dans la boîte de Martin : nouvelle demande en attente. Le reste se passe entre Martin et l'utilisateur.

**Gérer les niveaux d'accès par combinaisons métier** — Quatre niveaux de gouvernance interne (N1 Opérateurs, N2 Périphériques, N3 Observateurs, N4 Institutionnels) + ADMIN, jamais affichés tels quels. Côté utilisateur, ce que l'on voit, c'est une **combinaison** — un kit d'apps cohérent avec un métier (ex. Cadreur/Monteur). Toute app de la flotte reste visible même hors périmètre — verrouillée avec un badge et une action de demande, jamais invisible (D17). Une demande débloque toute la combinaison du niveau visé, jamais une app isolée (D18).

**Donner à l'utilisateur connecté une vue personnalisée** — En état connecté, RENDEZVOUS affiche le profil de l'utilisateur, les apps auxquelles il a accès, le statut de chaque app de la flotte (disponible · sur demande · réservé), et les nouveautés récentes de la suite. C'est sa page d'accueil dans l'écosystème.

**Donner à Martin le back-office qu'il n'a pas encore** — Validation des profils `pending`, attribution des niveaux, modification des accès, désactivation d'un profil. Une interface admin propre, intégrée dans RENDEZVOUS. Sans passer par GitHub manuellement ou par Slack.

**Encoder les règles RGPD dans l'architecture elle-même** — Données minimisées à la source. Durée de conservation définie. Suppression automatique à désactivation du profil. Le consentement est tracé, horodaté, conservé. La conformité n'est pas un document qu'on remplit — c'est le fonctionnement normal de l'outil.

**Guider l'installation du daemon pour les profils N1** — Quand Martin valide un profil N1, RENDEZVOUS déclenche un parcours d'onboarding guidé adapté au type de poste : Mac bureau L'Étudiant, Mac personnel, ou Mac Studio partagé. Trois parcours distincts, une seule expérience cohérente.

---

## CE QU'IL NE FAIT PAS

RENDEZVOUS n'est pas un intranet. Il ne remplace pas Slack, il ne gère pas les plannings, il n'héberge pas les fichiers.

RENDEZVOUS ne modifie pas les settings des apps. Chaque app gère ses propres préférences — RENDEZVOUS gère uniquement l'accès à la suite.

RENDEZVOUS n'est pas un hub de communication quotidien. On s'y connecte pour accéder à la flotte ou vérifier son profil — pas pour y passer sa journée.

RENDEZVOUS ne remplace pas le Launcher daemon. Il en est l'autorité — il le gouverne, il ne l'exécute pas.

---

## SA PLACE DANS LA CHAÎNE

RENDEZVOUS est la porte d'entrée de la Tranquility Suite. Il précède tout le reste.

```
[COLLABORATEUR L'ÉTUDIANT — première découverte]
        │
        ▼
   RENDEZVOUS (vitrine publique)
        │
   ┌────┴──────────────────────────┐
   ▼                               ▼
Découverte flotte            Formulaire inscription
(sans connexion)             (RGPD + validation admin)
                                    │
                               Martin valide
                                    │
                       ┌────────────┴──────────────┐
                       ▼                           ▼
              État connecté                 Notification mail
              Profil + apps + statuts       "Accès accordé"
              Niveau N1/N2/N3/N4
                       │
               ┌───────┴────────────────────────┐
               ▼                                ▼
        Profils N1                      Profils N2/N3/N4
        Apps desktop + web              Apps web uniquement
        Onboarding daemon guidé         Aucun daemon requis
               │
               ▼
        Launcher daemon actif
        (icône barre de menu)
        Heartbeat proxy RENDEZVOUS
```

**Reçoit de :** rien — RENDEZVOUS est le point d'entrée, pas un consommateur

**Produit :** des profils validés, des niveaux d'accès attribués, une flotte visible et compréhensible

**Alimente :** toutes les apps de la suite — via `profiles-public.json` sur `tranquility-core`

---

## GRILLE DE PROFILS

| Niveau | Nom | Qui | Rapport vidéo | Accès apps |
|--------|-----|-----|--------------|------------|
| ADMIN | Martin Pavloff | Martin uniquement | Détenteur de la suite | Total |
| N1 | OPÉRATEURS | Cellule vidéo — ~10 personnes | Usage quotidien | Apps assignées — visibles uniquement + daemon requis |
| N2 | PÉRIPHÉRIQUES | Touchent à la vidéo par ricochet — ~20 personnes | Usage ponctuel ou partiel | Apps web uniquement — sur demande |
| N3 | OBSERVATEURS | Direction, IT, développeurs | Supervision, maintenance | Lecture — pas d'apps de production |
| N4 | INSTITUTIONNELS | Juridique, RH, financiers, direction générale | Vision stratégique | Vitrine uniquement |

**Visibilité verrouillée (D17) :** toute app de la flotte est visible, même hors périmètre de l'utilisateur — verrouillée avec un badge et une action de demande de déblocage. Plus aucune app invisible — remplace la règle d'invisibilité actée le 14/06/2026 (reversion consciente et tracée, Loi 3 du Workflow Captif).

**Déblocage par niveau, jamais par app (D18) :** une seule demande de montée de niveau ouvre toute la combinaison d'apps du niveau visé. Réponse sans délai annoncé — décision au cas par cas, gardée par Martin.

**Vocabulaire utilisateur = combinaison, pas niveau (D19) :** N1→N4 restent un outil de gouvernance interne pour Martin, jamais affiché. Une **combinaison** désigne un kit d'apps cohérent avec un métier (ex. Cadreur/Monteur, Rédaction) — pas un rang administratif.

**Daemon Launcher = N1 uniquement.** N2/N3/N4 utilisent exclusivement des apps web. Aucun daemon requis, aucune installation macOS.

**Mobilité entre niveaux :** demande utilisateur + validation Martin. La grille est vivante.

---

### MATRICE D'ACCÈS APP × NIVEAU

| App | N1 Opérateurs | N2 Périphériques | N3 Observateurs | N4 Institutionnels |
|-----|:---:|:---:|:---:|:---:|
| BackUpFlow | ✅ | 🔒 | 🔒 | 🔒 |
| Transporter | ✅ | 🔒 | 🔒 | 🔒 |
| Reviewer | ✅ | ✅ | 🔒 | 🔒 |
| Manifest | ✅ | ✅ | 🔒 | 🔒 |
| ARK | ✅ | 🔒 | 🔒 | 🔒 |
| ROVER | ✅ | 🔒 | 🔒 | 🔒 |
| COVENANT | ✅ | ✅ | ✅ | 🔒 |
| Launcher (daemon) | ✅ N1 uniquement | 🔒 | 🔒 | 🔒 |

*✅ Accès complet · 🔒 Verrouillé — visible, débloqué par une demande de montée de niveau (D17, D18), jamais par app individuelle, jamais invisible*

---

## COMBINAISONS MÉTIER

Construction volontairement progressive : la Cellule Vidéo d'abord, les cercles périphériques de L'Étudiant ensuite — décision Martin du 23/06/2026.

### Cadreur/Monteur — première combinaison actée (D20, 23/06/2026)

| | |
|---|---|
| **Périmètre** | Toute la Cellule Vidéo, sans distinction de statut (permanents et alternants confondus) |
| **Niveau interne** | N1 — OPÉRATEURS (conforme à la grille actée le 14/06/2026) |
| **Apps incluses** | BackUpFlow · TransPorter · Manifest · Reviewer · ARK · Rover · Covenant (7 apps) |
| **Daemon Launcher** | Requis — seul niveau N1 nécessite le daemon |

Ces 7 apps étaient déjà toutes en accès complet (✅) au niveau N1 dans la matrice existante — aucune modification de la matrice n'a été nécessaire. Cette première combinaison **nomme officiellement** ce contenu pour l'affichage utilisateur.

**Combinaisons restant à construire** (sessions dédiées, avec la cellule et les métiers périphériques concernés) :
- Rédaction vidéo
- Réseaux sociaux
- Direction artistique / Studio
- Autres métiers périphériques de L'Étudiant, à identifier au fur et à mesure de l'élargissement du périmètre

---

## ARCHITECTURE

| Composant | Choix technique |
|---|---|
| **Runtime** | Navigateur — HTML5 / CSS3 / Vanilla JS |
| **Déploiement** | GitHub Pages — repo public `RealCoolclint/RENDEZVOUS` |
| **Authentification** | Lien magique par email (R5) |
| **Tokens de session** | Tokens signés émis par proxy RENDEZVOUS — durée courte |
| **Fallback offline** | Cache local 48h — validité maintenue sans réseau |
| **Révocation d'urgence** | Denylist CDN versionnée — vérifiée au démarrage même hors ligne |
| **Base de données profils** | Double fichier : `profiles-public.json` (public, léger) + `profiles-private.json` (repo privé, données sensibles) |
| **Point d'écriture** | Proxy Netlify dédié RENDEZVOUS — seul point d'écriture autorisé sur les deux fichiers |
| **Notifications** | Resend — mail Martin (nouvelle demande) + mail utilisateur (accès accordé) |
| **Design** | Tranquility Design System · `tranquility-core.css` |
| **Profils consommés par les apps** | `profiles-public.json` sur `tranquility-core` via CDN GitHub Pages |
| **Daemon** | Launcher daemon macOS — N1 uniquement — gouverné par RENDEZVOUS |

---

## SIX DÉCISIONS QUI COMPTENT

**D1 — Double fichier avec cohérence automatique**

`profiles-public.json` reste public et léger — consommé en lecture par toutes les apps de la suite. `profiles-private.json` sur repo privé GitHub contient les données sensibles : email, statut, niveau, horodatages RGPD. Une seule opération d'écriture atomique dans le proxy — les deux fichiers sont toujours synchrones. Le proxy RENDEZVOUS est le seul point d'écriture autorisé. Modification manuelle interdite.

Ce choix protège la performance (les apps ne chargent que ce dont elles ont besoin) et la confidentialité (les données sensibles ne sont jamais exposées publiquement).

**D2 — RENDEZVOUS comme autorité centrale, tokens signés**

RENDEZVOUS émet des tokens signés à courte durée. Les apps valident leur session auprès du proxy au démarrage. Fallback cache local 48h en cas d'indisponibilité. Denylist d'urgence : poussée par RENDEZVOUS, vérifiée au démarrage même hors ligne. Architecture hybride JWT + denylist CDN versionnée.

Ce choix centralise l'autorité sans créer de dépendance bloquante : les apps continuent de fonctionner offline, mais la révocation reste possible en cas de besoin urgent.

**D3 — Trois modes de session normalisés**

`persistent` — poste personnel, SSO actif, 48h offline.
`bounded` — intermédiaire, 4h maximum.
`ephemeral` — poste partagé (Mac Studio), effacé à la fermeture, sélecteur obligatoire.

Le mode le plus strict gagne toujours. RENDEZVOUS encode le mode dans le token — les apps appliquent sans avoir à décider. La politique de sécurité est dans le token, pas dans chaque app individuellement.

**D4 — RGPD natif, pas une couche supplémentaire**

Base légale : intérêt légitime de l'employeur (pas le consentement au sens RGPD strict — plus robuste en contexte RH interne).
Données minimisées à la source : prénom, email pro, rôle, niveau d'accès, consentement horodaté.
Durée de conservation : durée d'activité + suppression automatique à désactivation.
Suppression = opération atomique sur les deux fichiers simultanément.

La conformité RGPD n'est pas un document qu'on remplit après coup. Elle est dans l'architecture depuis la première ligne de code.

**D5 — Launcher devient daemon macOS**

Launcher n'est plus une application avec interface utilisateur. Il devient un agent de fond macOS : icône dans la barre de menu, signal de vie, profil actif visible. Zéro fenêtre principale. Zéro interaction directe.

RENDEZVOUS est désormais l'unique interface de gouvernance des profils et des niveaux d'accès. Le proxy RENDEZVOUS est le seul point d'écriture autorisé sur les profils partagés. Launcher opère en lecture seule sur ces données.

Le MASTER (interface admin desktop existante) est archivé dans le code — non supprimé, mais mis en veille. La gouvernance migre vers le back-office web R7 de RENDEZVOUS.

Principe fondateur : l'intégrité du système ne peut pas dépendre de la discipline d'une personne. Elle doit être garantie par la structure elle-même.

**Daemon réservé aux profils N1** (cellule vidéo, ~10 personnes). N2/N3/N4 utilisent exclusivement des apps web — aucun daemon requis, aucune installation.

**D6 — Heartbeat progressif : indicateur puis bloquant**

Le daemon Launcher ping le proxy RENDEZVOUS à intervalle régulier pour signaler sa présence et vérifier la validité du token.

- **R6** : le heartbeat est informatif. Martin voit dans son back-office quels postes N1 sont actifs. Non bloquant — les apps fonctionnent même sans heartbeat récent.
- **R8** : mode bloquant optionnel. Les apps desktop exigent un heartbeat récent pour démarrer. Fallback offline 48h garanti (D2). La bascule vers ce mode = décision consciente de la PRÉSIDENCE, pas un automatisme.

Ce choix protège contre les profils fantômes tout en évitant de bloquer le travail en cas de problème réseau ponctuel.

---

## ÉTAT & ROADMAP

**Phase actuelle :** Gemini — R1 livré
**Disponible pour l'équipe :** Non — en développement

| # | Chantier | Estimation | État |
|---|----------|-----------|------|
| R1 | Fondations — scaffolding, GitHub Pages, Design Reference | 1 session | ✅ Livré — commit `8f15923` |
| R2 | Vitrine publique — présentation flotte, fiches app | 2 sessions | ⚫ À démarrer |
| R3 | Formulaire d'inscription + RGPD | 1 session | ⚫ À faire |
| R4 | Proxy Netlify + API GitHub (double fichier D1) | 2-3 sessions | ⚫ À faire |
| R5 | Authentification — lien magique par email | 2 sessions | ⚫ À faire |
| R6 | État connecté — profil + flotte + statuts + heartbeat indicateur (D6) | 2 sessions | ⚫ À faire |
| R7 | Back-office MASTER admin Martin | 2-3 sessions | ⚫ À faire |
| R8 | Polish + tests tous devices + heartbeat bloquant optionnel (D6) + communication + lancement | 1-2 sessions | ⚫ À faire |

**Estimation totale : 13 à 16 sessions avant V1.**

---

## GENÈSE

Il y a une tension au cœur de toute suite d'outils internes : plus elle grandit, moins elle est lisible pour ceux qui n'en sont pas les auteurs.

La Tranquility Suite a été construite de l'intérieur vers l'extérieur. BackUpFlow d'abord — une app pour un besoin précis. Puis Transporter. Puis Reviewer, Manifest, ARK, ROVER, COVENANT. Chaque app est conçue pour une personne précise, un moment précis dans le workflow. Mais l'ensemble reste opaque pour quelqu'un qui arrive sans guide.

RENDEZVOUS est la réponse à cette opacité. Pas un dashboard de management, pas un portail corporate. Un rendez-vous — un endroit où l'équipe et la suite se rencontrent formellement, une fois, pour que tout le reste se passe naturellement.

Un rendez-vous raté, c'est toute une mission qui s'arrête. Un rendez-vous réussi, c'est une collaboration qui commence du bon pied.

*HIC OMNIA INCIPIUNT.* Ici tout commence.

---

*Fiche produit RENDEZVOUS · V1.2 · 23 juin 2026 · D17-D20 intégrés, première combinaison métier (Cadreur/Monteur) documentée*
*Mise à jour V1.1 — Devise HIC OMNIA INCIPIUNT · D5 (Launcher daemon) · D6 (Heartbeat progressif) · Onboarding daemon N1*
