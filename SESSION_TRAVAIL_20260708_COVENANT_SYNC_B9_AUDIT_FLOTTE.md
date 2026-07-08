# Session du 8 juillet 2026 — Resynchronisation COVENANT + B9 étendu à la flotte

## Contexte
Reprise de session RENDEZVOUS (R7 complet, protocole clôture V2.0 actif). Chantier B9 avait une portée restante non traitée : vérifier la contamination CSS transverse sur Reviewer, Manifest, COVENANT, BackUpFlow.

## Incident découvert — COVENANT
Le clone local COVENANT (Mac Bureau) était resté 1 mois derrière origin/master (3 commits de retard, tous déjà actés au Plan Directeur : PWA/Service Worker, offline queue C9, fix double-envoi C9), avec en parallèle des modifications locales légitimes jamais commitées :
- `resolveEmailFunctionUrl()` — URL de la fonction email adaptée selon l'hébergement (netlify.app vs domaine perso)
- fix probable d'un bug de stack overflow sur les gros PDF (`bytesToBase64` remplace `btoa(String.fromCharCode(...pdfBytes))`)
- fix d'une référence cassée (`Wizard.wizardState` → `wizardState`, la bonne variable locale)
- contact interviewé toujours affiché dans le récap email (au lieu d'être omis si vide)
- ajout d'un `netlify.toml` manquant

Résolu par `git stash` → `git pull` → `git stash pop`, fusion automatique propre (aucun marqueur de conflit, vérifié). Commit `1bc3903` poussé.

## B9 — portée étendue (D53)
Audit CSS en lecture seule (Cursor mode agent, un prompt par repo, même méthode que B8/B9 originaux) sur Reviewer, Manifest, COVENANT, BackUpFlow.

Résultat principal : **aucune contamination inter-apps trouvée** — le problème historique (résidu Reviewer→RENDEZVOUS) reste isolé et déjà purgé.

Résultat secondaire : décalage confirmé avec `tranquility-core.css` sur les 4 apps, à des degrés variables :
- BackUpFlow : la plus alignée (13 tokens identiques au core, 9 divergences)
- Manifest : intermédiaire (4 divergences, 0 doublon)
- COVENANT : intermédiaire (13 divergences, même pattern que Reviewer)
- Reviewer : la plus éloignée (15 divergences) + volume important de classes potentiellement mortes (285) signalé par Cursor lui-même comme non-exhaustif — à valider avec un outillage dédié avant toute suppression

## Nouveau chantier identifié
**B21 — Alignement des tokens core à l'échelle de la flotte**, non cadré. Distinct de R8 (qui ne concerne que le polish visuel de RENDEZVOUS).

## Repo BackUpFlow clarifié
`BackUpFlow` (public) confirmé comme le vrai repo actif (commits récents, remote local aligné). `backupflow-studio` est un repo mort (commit unique du 19/03/2026) — à archiver un jour.

## Nouveaux pièges
1. Un clone local peut dériver silencieusement d'un mois sans aucune alerte — toujours `git status`/`git pull` avant diagnostic, même sur un repo rarement ouvert.
2. Un audit "classes non référencées" à fort volume est une piste, pas un verdict — une détection statique peut signaler un pourcentage implausible de sélecteurs comme morts sur une app pourtant utilisée en production.
3. Un renommage de casse d'un repo GitHub (`covenant` → `COVENANT`) casse silencieusement le remote local — avertissement "This repository moved" à chaque push tant que l'URL n'est pas corrigée, sans bloquer le push.

## Prochaine étape
R7-C reste ouvert sur RENDEZVOUS (suppression validate-profile.js). B21 à cadrer une autre session.
