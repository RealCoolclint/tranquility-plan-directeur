# Session de travail — 20 octobre 2026
## Tranquility Suite — Laboratoire R&D : fiches Posta et Vercel Skills

*Session courte — Bloc A (veille, labo R&D) · Mac Maison (martinpavloff) · compte Claude Team, mode C (D177)*

---

## Chantiers traités

### Évaluation critique de deux pistes soumises au labo
Deux demandes d'évaluation rédigées en dehors de la session (Posta pour COVENANT, Vercel Skills pour le workflow Claude + Cursor) ont été lues à la manière du README du labo (quatre niveaux de lecture, fraîcheur du dépôt, règle 13), à partir des sources publiques uniquement, sans aucune installation ni exécution.

- **Posta** (`goposta/posta`) : plateforme d'e-mail auto-hébergée en Go (API, tableau de bord, worker), avec PostgreSQL et Redis, version 0.x (v0.15.0 du 06/09/2026), mainteneur quasi unique, licence passée en AGPL-3.0 en août 2026. Constat décisif : l'envoi sortant passe par un fournisseur SMTP externe, Posta ne remplace donc pas un service d'acheminement. Le brief présentait Resend comme « envisagé » pour COVENANT : en réalité Resend est en production dans toute la Suite (RENDEZVOUS, BackUpFlow, Launcher, COVENANT) avec le domaine vérifié `mail.tranquilitysuite.com` (D10, B14). Posta exigerait un serveur, donc un nouveau paiement : abandon d'office (règle 13).
- **Vercel Skills** (`vercel-labs/skills`) : CLI MIT (`npx skills`) qui installe des skills `SKILL.md` dans les dossiers de plus de 70 agents, dont Cursor (`.agents/skills/`) et Claude Code (`.claude/skills/`) ; claude.ai n'est pas une cible. Risques relevés : télémétrie active par défaut, mise à jour automatique en mode lien symbolique, installation globale possible. Le catalogue officiel `vercel-labs/agent-skills` vise surtout React, Next.js et l'hébergement Vercel. Le gestionnaire n'apporte presque rien ; l'idée de fond est retenue : un skill maison `tranquility-design-reference` posé à la main dans les repos, pour que Cursor vérifie lui-même la charte.

### Dépôt des deux fiches dans `tranquility-rd`
Contrôle des doublons (Anatomy, HyperFrames et Lathe citaient le mot « skill » sans traiter le sujet ; la fiche Anatomy préférait déjà `git clone` à `npx skills`). Chaque fiche montrée à PRÉSIDENCE et validée avant écriture, écrite par Cursor (un prompt, un fichier), contrôlée en lecture (en-tête complet, 9 sections du gabarit, zéro commentaire HTML, présence dans la recherche par verdict, un seul fichier dans `git status`), puis commitée et poussée par Martin.

### Question de PRÉSIDENCE : JARVIS doit-il surveiller le repo R&D ?
Réponse initiale de JARVIS erronée (« oui, relions-le »). Vérification faite dans le Plan V5.119 et dans les ressources du projet : `tranquility-rd` est déjà relié au projet par l'Intégration GitHub depuis D178 (19/10). Le seul geste nécessaire est un « Sync now » sur cette source, avant d'ouvrir la conversation. Aucune nouvelle décision à numéroter.

### Clôture V2.1
Plan Directeur V5.120 et Carnet V62 réécrits à partir des textes complets fournis par Martin (Plan V5.119, Carnet V61), la copie du Carnet visible dans le projet s'arrêtant à V60.

---

## Décisions actées

- Posta : abandon (règle 13, D158) ; Resend reste le service d'envoi de toute la Suite. Idées conservées dans la fiche : formulaire web relié à une boîte de réception, réception d'e-mails entrants (piste future pour COVENANT).
- Vercel Skills : veille pour le gestionnaire. Idée retenue : skill maison `tranquility-design-reference` côté Cursor, à concevoir en session dédiée avec un pilote sur une seule app, dans un dossier isolé, sans installation globale.
- Le repo `tranquility-rd` est consulté par les ressources du projet (D178), jamais par une demande de fichier à Martin tant qu'une recherche n'a pas été faite.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `tranquility-rd/fiches/RD_POSTA_V1.md` | Fiche R&D, verdict abandon | ✅ Poussée, commit `d52c6d0` |
| `tranquility-rd/fiches/RD_VERCEL_SKILLS_V1.md` | Fiche R&D, verdict veille | ✅ Poussée, commit `68e183e` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_120.md` | Plan Directeur, réécriture complète | 🟡 À pousser (rotation `actuel/` → `archives/`) |
| `CARNET_PIEGES_V62.md` | Carnet de pièges, réécriture complète (+4) | 🟡 À pousser (rotation `actuel/` → `archives/`) |
| `SESSION_TRAVAIL_20261020_TRANQUILITY_RD_POSTA_VERCEL_SKILLS.md` | Récap de session | 🟡 À pousser avec le Plan |

---

## Commandes Terminal produites

```bash
# Contrôle d'une fiche avant commit (guillemets simples : zsh)
cd ~/Documents/GitHub/tranquility-rd && head -12 fiches/RD_VERCEL_SKILLS_V1.md && grep '^## ' fiches/RD_VERCEL_SKILLS_V1.md && grep -c '<!--' fiches/RD_VERCEL_SKILLS_V1.md; grep -l '^verdict: veille' fiches/*.md && git status --short
```

```bash
# Commit et push d'une fiche
cd ~/Documents/GitHub/tranquility-rd && git add fiches/RD_POSTA_V1.md && git commit -m "Fiche R&D Posta : verdict abandon (règle 13, Resend déjà en production)" && git push
```

---

## Pièges découverts

- zsh : un `!` entre guillemets doubles déclenche le rappel d'historique (« event not found ») et bloque toute la commande avant exécution → guillemets simples pour tout motif contenant `!` (ex. `'<!--'`).
- JARVIS a demandé à Martin le gabarit et le README d'un repo privé déjà relié au projet (D178), puis a recommandé de relier ce repo → chercher d'abord dans les ressources du projet avant toute demande de fichier ; la section « Accès au repo » du skill `tranquility-rd` ne mentionne pas ce lien.
- Un brief d'évaluation rédigé ailleurs peut décrire un état faux de la Suite (Resend « envisagé » alors qu'en production) → confronter le brief au Plan Directeur avant d'évaluer.
- L'API GitHub anonyme répond « rate limit exceeded » depuis la session cloud (adresse partagée) → lire les pages GitHub (README, releases) ou faire lancer le `curl` sur le Mac.

---

## Prochaines étapes

1. Avant la prochaine conversation : « Sync now » sur les sources `tranquility-rd` et `tranquility-carnet-pieges/actuel/` du projet.
2. Retirer des ressources du projet les copies manuelles périmées (`CARNET_PIEGES_V59.md`, `TRANQUILITY_PLAN_DIRECTEUR_V5_90.md` et autres copies de documents vivants), conformément à D178.
3. Mettre à jour la section « Accès au repo » du skill `tranquility-rd` : repo relié au projet (D178), recherche dans les ressources du projet en premier.
4. Reprendre RENDEZVOUS : refonte mobile du lobby (D180), premier chantier de la prochaine session RENDEZVOUS.
5. Plus tard, session de conception dédiée : skill `tranquility-design-reference` côté Cursor (pilote sur une seule app, comparaison avec et sans skill).
6. Restent ouverts au labo : prototype HyperFrames (D161), session REA (D159), fiche AutoClip à déposer (prototype validé le 19/10).

---

*Session 20 octobre 2026 · Tranquility Suite, labo R&D · Mac Maison (martinpavloff)*
