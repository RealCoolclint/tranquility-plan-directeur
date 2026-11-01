# Session de travail — 26 octobre 2026
## [RENDEZVOUS] Authentification ADMIN — étapes 1 et 2

*Mac Maison. Session ouverte par « On en est où dans le plan d'action ? ». Postes actifs : MISSION CONTROL, NAVIGATION, SÉCURITÉ, CODE, UX ET UI, QUALITÉ, MÉMOIRE.*

---

## Démarrage

- État des lieux fait **sur pièces** (Plan Directeur lu sur GitHub), sans passage du radar. Prochain audit Surveyor complet : mi-novembre.
- **Anomalie détectée** : la clôture du 24/10 n'avait jamais été poussée. GitHub s'arrêtait au Plan V5.127 et au Carnet V69, et les fichiers n'étaient pas dans les téléchargements.
- **Rattrapage** : Plan V5.128, récap du 24/10 et bloc Carnet V70 reconstruits depuis la conversation du 24/10, sur la base de la V5.127 lue sur GitHub, puis poussés (`21a5c4d`, `a8a055e`). Contrôle octet par octet sur GitHub : identiques. Synchro du projet faite.

## Décisions actées

- **D211 — RENDEZVOUS repasse en tête (révision de D206).** Option 2 sur 3 : l'Authentification ADMIN démarre tout de suite ; la séance SÉCURITÉ sur l'ancien registre des profils (alerte de niveau 1, dépôt public `launcher-profiles`) garde une date rapprochée ; le reste de la vague 0 (gels BackUpFlow, fiche RGPD COVENANT, poids moyen d'une vidéo) passe après la V1.
- **D212 — Authentification ADMIN en cinq étapes**, chacune testée en production avant la suivante : (1) serrure renforcée, (2) jeton de session admin, (3) changement du secret depuis l'admin, (4) secret oublié par e-mail, (5) Touch ID. Seuil de la serrure : 5 essais ratés par quart d'heure. Durée du jeton : 7 jours.

## Ce qui a été construit

| Étape | Dépôt | Commit | Contenu |
|---|---|---|---|
| 1 | rendezvous-proxy | `9d1484c` | Module `_shared/admin-auth.js` : 5 échecs par IP en 15 min puis 429 (même avec le bon secret), comparaison en temps constant ; les deux portes admin l'utilisent |
| 1 | RENDEZVOUS | `1ea92e2` | Message « Trop d'essais, réessaie dans quelques minutes. » à l'écran, `admin.js?v=4` |
| 2 | rendezvous-proxy | `4d11e32` | Fonction `admin-session` (secret échangé contre un jeton `admin-session` de 7 jours, lié au secret par une marque HMAC) ; portes admin en `Authorization: Bearer` uniquement |
| 2 | RENDEZVOUS | `e8f6740` | L'écran demande le jeton, le présente aux portes, ne mémorise plus le secret et efface l'ancien ; messages de session expirée ; `admin.js?v=5` |

Travail sur la branche `auth-admin` des deux dépôts, versée dans `main` par avance rapide à chaque étape. Les deux dépôts sont revenus sur `auth-admin`.

**Tests en production** : étape 1, 5 gestes ✅ (blocage au 6e essai, blocage maintenu avec le bon secret, levée après 15 min) ; étape 2, 5 gestes ✅ (re-saisie unique, ouverture directe au rechargement, `admin_secret` à `null`, action « modifier » acceptée, secret faux refusé).

**Lecture SÉCURITÉ** : aucun secret écrit en dur dans le proxy. Cloisonnement des jetons vérifié dans les deux sens (portes utilisateurs : `session` ou `magic-link` ; admin : `admin-session`).

## Liste de polish ouverte

- Compteur d'essais partagé et durable (aujourd'hui en mémoire, par instance).
- `jwt.js` : `verifyToken` peut lever une exception, les portes utilisateurs répondent alors 500.
- Audit de `admin.html` et `admin.js` contre la Design Reference : texte trop petit, défilement automatique, ombres lumineuses colorées, transition `300ms ease` en dur dans les toasts.
- Bouton « Se déconnecter » de l'admin ; champ du secret vidé après connexion ; signalement d'un jeton expiré pendant une actualisation silencieuse ; contrôle `Number.isFinite` de `expiresAt`.
- `.DS_Store` suivi dans le dépôt du Carnet.

## Pièges découverts (Carnet V71)

Clôture jamais poussée · « Déjà à jour » seul = fichier introuvable · VPN de la fenêtre privée Opera et limite par IP · `verifyToken` à entourer d'un try/catch · compteur d'essais par instance Netlify.

## Prochaines étapes

1. **Étape 3** : changer le secret admin depuis l'espace admin. Mini-plan et tour SÉCURITÉ avant le premier prompt. Point d'architecture à trancher : où ranger l'empreinte du nouveau secret (recommandation de départ : fichier dans le dépôt privé des profils, même mécanisme que les mots de passe utilisateurs), basculement depuis `ADMIN_SECRET`, invalidation des jetons existants, garde-fou contre l'enfermement dehors.
2. Séance SÉCURITÉ sur l'ancien registre des profils : date à fixer.
3. Mardi 3 novembre, 12h : « Lance TANDEM ».
4. Tests SETI (Agency Agents, AutoClip) : à lancer quand PRÉSIDENCE le décide.

---

*Session 26/10/2026 · Tranquility Suite · RENDEZVOUS*
