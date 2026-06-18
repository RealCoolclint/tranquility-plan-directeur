# Launcher — Fiche Produit
## Tranquility Suite · Cellule Vidéo L'Étudiant

---

## IDENTITÉ

| | |
|---|---|
| **Nom** | Launcher |
| **Devise** | *INITIUM EST DIMIDIUM FACTI · Commencer, c'est faire la moitié du travail* |
| **Famille** | Desktop macOS — Electron — Daemon |
| **Statut** | En orbite · En production · Redéfini Phase Gemini |
| **Phase** | Mercury complète · Gemini — redéfinition daemon actée |
| **Version** | V1.18.04.26 (dernière build avec interface) |
| **Repo GitHub** | `RealCoolclint/Launcher` |
| **Utilisateurs** | Profils N1 uniquement — Cellule vidéo (~10 personnes) |
| **Rôle dans la suite** | Agent de fond macOS · Gardien de session · Signal de vie |

---

## LA PROMESSE

**Toujours là, jamais dans le chemin. Launcher tourne en silence — il sait qui tu es, il le dit aux apps, et il rentre dans son coin.**

---

## CE QU'IL EST DEVENU — DECISION D5

*Décision PRÉSIDENCE actée le 17 juin 2026.*

Launcher n'est plus une application avec interface utilisateur. Il est devenu un **daemon macOS** — un agent de fond qui tourne en silence dès le démarrage de la machine.

**Ce que ça change concrètement :**
- Zéro fenêtre principale. Zéro tableau de bord. Zéro interaction directe.
- Une icône dans la barre de menu : signal de vie + profil actif visible en un coup d'œil.
- Il démarre avec la machine. Il tourne sans que personne ne le lance.
- Il n'a plus d'opinion sur les apps — il leur transmet la session et s'efface.

**Pourquoi cette décision :**
L'ancienne version de Launcher avait une interface admin (le MASTER) pour gérer les profils, les niveaux d'accès, les permissions. C'était puissant — mais ça créait une dépendance à la discipline individuelle. Si Martin oubliait d'ouvrir Launcher, rien n'était centralisé. Si quelqu'un contournait le MASTER, la cohérence était rompue.

La règle fondatrice de D5 : *l'intégrité du système ne peut pas dépendre de la discipline d'une personne. Elle doit être garantie par la structure elle-même.*

RENDEZVOUS prend en charge toute la gouvernance des profils et des accès. Launcher exécute — il ne décide plus.

**Le MASTER :** archivé dans le code, non supprimé. Il reste accessible pour consultation ou réactivation si besoin. Il ne fait plus partie du workflow normal.

---

## CE QU'IL FAIT

**Tourner en silence dès le démarrage** — Launcher se lance automatiquement avec macOS. Pas besoin de l'ouvrir. Pas besoin de penser à lui. Il est là.

**Signaler sa présence dans la barre de menu** — Une icône discrète. Un clic : profil actif, statut de session, option de déconnexion. Rien de plus.

**Maintenir la session active** — Launcher lit le profil depuis `profiles-public.json` (via `tranquility-core`) et maintient `session.json` à jour dans `~/Library/Application Support/tranquility-suite/`. Toutes les apps de la suite lisent ce fichier au démarrage.

**Transmettre la session aux apps** — Chaque app desktop lit `session.json` au lancement. Elle sait qui est connecté, son niveau, ses préférences. Launcher a fait le travail en amont — les apps n'ont rien à demander.

**Envoyer le heartbeat au proxy RENDEZVOUS** — À intervalle régulier, Launcher ping le proxy RENDEZVOUS pour signaler que le poste est actif et que le token est valide. Ce signal alimente le back-office Martin (R6). En R8, ce heartbeat pourra devenir bloquant si la PRÉSIDENCE le décide.

**Appliquer le mode de session** — Le token émis par RENDEZVOUS encode le mode : `persistent` (poste personnel), `bounded` (intermédiaire), `ephemeral` (Mac Studio partagé). Launcher applique le mode le plus strict sans discussion.

---

## CE QU'IL NE FAIT PLUS

Launcher ne gère plus les profils. C'est RENDEZVOUS.

Launcher n'attribue plus les niveaux d'accès. C'est RENDEZVOUS.

Launcher n'a plus d'interface admin. Le MASTER est archivé.

Launcher ne lance plus les apps depuis un tableau de bord. Chaque app a son propre lanceur.

Launcher n'est plus visible comme une app à part entière. Il est une infrastructure.

---

## SA PLACE DANS LA CHAÎNE

```
RENDEZVOUS (autorité — gouvernance profils et accès)
        │
        │  Token signé + mode session (persistent / bounded / ephemeral)
        ▼
   LAUNCHER DAEMON (exécution — lecture seule sur les profils)
        │
        │  session.json
        ├──────────────┬──────────────┬──────────────┐
        ▼              ▼              ▼              ▼
  BackUpFlow     Transporter        ARK           ROVER
  
        │  Heartbeat
        ▼
  Proxy RENDEZVOUS (signal de vie → back-office Martin R6)
```

**Reçoit de :** RENDEZVOUS — token signé, mode session, profil validé

**Produit :** `session.json` — consommé par toutes les apps desktop

**Alimente :** BackUpFlow, Transporter, ARK, ROVER — et toute future app desktop N1

---

## PÉRIMÈTRE — N1 UNIQUEMENT

Launcher daemon est **réservé aux profils N1** (Cellule vidéo, ~10 personnes).

Les profils N2, N3, N4 n'ont pas de daemon. Ils accèdent à la suite exclusivement via des apps web. Aucune installation macOS requise pour eux.

**Trois sous-cas N1 — trois stratégies d'onboarding daemon :**

| Type de poste | Stratégie |
|---|---|
| Mac bureau L'Étudiant | Installation par Martin ou IT — daemon configuré en amont |
| Mac personnel | Onboarding guidé dans RENDEZVOUS — parcours autonome |
| Mac Studio partagé | Mode `ephemeral` forcé — sélecteur de profil à chaque session |

L'onboarding daemon est géré par RENDEZVOUS au moment de la validation N1. Martin valide le profil — RENDEZVOUS déclenche le parcours adapté au type de poste déclaré.

---

## ARCHITECTURE

| Composant | Choix technique |
|---|---|
| **Runtime** | Electron · Node.js |
| **Interface** | Icône barre de menu uniquement — zéro fenêtre principale |
| **Profils** | Lecture seule — `profiles-public.json` via `tranquility-core` CDN |
| **Session** | `session.json` dans `~/Library/Application Support/tranquility-suite/` |
| **Token** | Émis par proxy RENDEZVOUS — validé au démarrage daemon |
| **Heartbeat** | Ping proxy RENDEZVOUS à intervalle régulier |
| **Mode session** | Encodé dans le token — `persistent` / `bounded` / `ephemeral` |
| **Fallback offline** | Cache local 48h — validité maintenue sans réseau (D2) |
| **Denylist** | CDN versionnée — vérifiée au démarrage même hors ligne (D2) |
| **Clés API** | macOS Keychain — service global, inchangé |
| **Build** | `electron-builder --mac dir` · Format `V1.JJ.MM.AA` |

---

## HEARTBEAT — DECISION D6

Le daemon Launcher ping le proxy RENDEZVOUS à intervalle régulier.

**R6 — Phase indicateur (actuelle roadmap) :**
Le heartbeat est informatif. Martin voit dans son back-office quels postes N1 sont actifs en temps réel. Non bloquant — les apps fonctionnent même sans heartbeat récent. Aucun impact sur l'expérience utilisateur.

**R8 — Phase bloquante optionnelle (future) :**
Les apps desktop peuvent exiger un heartbeat récent pour démarrer. Fallback offline 48h garanti (D2). La bascule vers ce mode = décision consciente de la PRÉSIDENCE. Jamais un automatisme.

Ce mécanisme progressif protège contre les profils fantômes (poste désactivé qui continue de tourner) tout en évitant de bloquer le travail en cas de problème réseau ponctuel.

---

## ÉTAT & ROADMAP

**Phase actuelle :** Mercury complète ✅ · Gemini — redéfinition daemon en cours
**Disponible pour l'équipe :** Oui — V1.18.04.26 (dernière version avec interface)

**À bord (version actuelle) :**
- Sélection de profil avec synchronisation GitHub
- SSO implicite via `session.json` V1.1
- Dashboard — grille apps avec mission patches *(archivé avec MASTER)*
- MASTER panel — gestion profils, rôles, permissions, clés API *(archivé)*
- Profils archivés — filtrés automatiquement
- Avatars NASA sélectionnables
- Mises à jour — vérification GitHub Releases
- Signalement de problème — Resend
- Mercury Opening — splash animé
- `profiles-public.json` déployé sur `tranquility-core`

**Prochaine version — Daemon :**
- Suppression interface principale
- Icône barre de menu — profil actif + déconnexion
- Validation token RENDEZVOUS au démarrage
- Heartbeat proxy RENDEZVOUS (R6)
- Mode session encodé dans le token (D3)
- Onboarding guidé depuis RENDEZVOUS

---

## GENÈSE

### Acte I — L'invention de la suite

BackUpFlow existait déjà. Transporter aussi. Mais ils vivaient chacun dans leur coin — sans profil commun, sans design partagé, sans langage commun. Chaque app était un outil isolé. Ensemble, elles ne formaient pas encore une suite.

La question qui a changé tout : *et si on créait un point d'entrée commun ?*

Pas pour forcer les gens à l'ouvrir. Pas pour centraliser le contrôle. Mais pour donner à chaque membre de l'équipe un endroit où il existe dans le système — un profil, une identité, des préférences — qui voyagent avec lui de machine en machine.

Launcher V2 est né de cette question. Et en le construisant, quelque chose a changé dans la façon dont on parlait du reste des apps. On ne parlait plus d'outils séparés. On parlait d'une suite.

**C'est Launcher qui a inventé la Tranquility Suite — pas l'inverse.**

### Acte II — La mue

La suite a grandi. Huit apps en orbite. Une architecture de profils. Un système d'accès par niveaux. RENDEZVOUS en construction comme portail public.

Et une tension est apparue : Launcher avait un MASTER — une interface admin puissante pour gérer les profils, les accès, les permissions. Mais cette interface dépendait d'une discipline : Martin devait l'ouvrir, l'utiliser, maintenir la cohérence manuellement. Si quelqu'un contournait, si Martin oubliait, l'intégrité était fragile.

La règle qui a tout changé : *l'intégrité du système ne peut pas dépendre de la discipline d'une personne.*

RENDEZVOUS prend la gouvernance. Launcher abandonne son interface. Il devient ce qu'il a toujours voulu être au fond — invisible, fiable, toujours là.

Un daemon. Pas une app.

---

*Fiche produit · Launcher · V2.0 · Tranquility Suite · Cellule Vidéo L'Étudiant · 18 juin 2026*
*Refonte majeure — D5 (daemon macOS) · MASTER archivé · RENDEZVOUS autorité unique · Heartbeat D6*
