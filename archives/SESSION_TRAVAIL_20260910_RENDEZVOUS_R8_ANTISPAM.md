# Session de travail — 10 septembre 2026
## RENDEZVOUS R8 — Sous-chantier 1 : Anti-spam formulaire d'inscription

**Mac :** Bureau
**Postes actifs :** CODE · INFRASTRUCTURE · QUALITÉ · UX ET UI · COM

---

## Décisions actées

**D96 — Anti-spam formulaire d'inscription, rate limiting réutilisé + honeypot**
Deux couches de protection sur `submit-inscription.js` :
- Rate limiting (réutilise `_shared/rate-limiter.js`, D32) : 3 req/15min par IP, 2 req/15min par email normalisé
- Honeypot : champ caché `siteWeb` (`index.html`, masqué hors écran + `aria-hidden` + `tabindex="-1"`), lu et transmis par `inscription.js`, si rempli côté serveur → réponse 200 silencieuse sans écriture GitHub ni notification Resend

## Livré et testé en production

- `netlify/functions/submit-inscription.js` (repo `rendezvous-proxy`) — commit `4d8b0e5`
- `index.html` + `inscription.js` (repo `RENDEZVOUS`) — commit `5721410`
- Test réel en deux temps : soumission avec honeypot rempli (aucune entrée créée) puis soumission normale (entrée `pending` créée) — les deux comportements confirmés dans `profiles-private.json`
- Entrée de test nettoyée via `gh api` (le repo étant privé et l'accès web bloqué ce jour-là) — commit `cda01df`

## Trouvailles

- **B23 (nouvelle dette, non traitée)** : l'écran admin RENDEZVOUS n'offre aucune action de rejet/suppression sur un profil `pending` — seul VALIDER existe. Le nettoyage de test a dû passer par une édition GitHub directe.
- **Piège Carnet V45** : le rate limit par email est vérifié avant le filtre de domaine `@letudiant.fr` — consomme un quota pour des adresses qui seraient de toute façon rejetées. Impact négligeable, noté pour ne pas se répéter ailleurs.

## Documents mis à jour

- Plan Directeur : V5.95 → **V5.96** (commit `77603f7`, repo `tranquility-plan-directeur`) — D96, roadmap R8, B23
- Carnet de Pièges : V44 → **V45** (commit `3fb604b`, repo `tranquility-carnet-pieges`) — nouvelle entrée BLOC 3 RENDEZVOUS

## Reste à faire sur R8

1. Polish visuel des cartes (D49 — direction déjà actée)
2. Heartbeat bloquant optionnel (D6 — bascule à décider par Martin)
3. Tests multi-devices + communication + lancement

---

*Session close le 10/09/2026 — Mac Bureau*
