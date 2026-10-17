# TRANQUILITY_VEILLE_IA
## Tranquility Suite · Cellule Vidéo L'Étudiant

*Version 2.0 — 17 octobre 2026 · remplace la V1.0 du 14 juin 2026*
*Document fondateur — complément de `TRANQUILITY_IA_STRATEGIE.md`*

---

## Rôle de ce document

Depuis le 17 octobre 2026 (D156), la veille IA ne vit plus ici. Toute la veille, l'analyse et la consignation des outils open source et des solutions IA sont réunies dans un seul endroit : le repo privé `RealCoolclint/tranquility-rd` (laboratoire R&D). Ce document ne garde que ce qui n'est pas de la R&D : les **points d'entrée IA actés dans les apps** et la fiche de l'app **SIGNAL**.

**Consultation :** JARVIS consulte ce document quand un chantier touche ROVER, ARK, READBACK ou BackUpFlow (au mini-plan), et non plus à chaque démarrage de session. La recherche web automatique de démarrage (ancien niveau 1) est supprimée (D157).

---

## Où est passé le contenu de la V1.0

| Contenu de la V1.0 | Où le trouver |
|---|---|
| Les 5 familles surveillées (transcription, LLM locaux, audio, Apple Foundation Models, vision) | Une fiche chacune dans `tranquility-rd/fiches/` : `RD_WHISPER_V1`, `RD_OLLAMA_V1`, `RD_DEMUCS_V1`, `RD_APPLE_FOUNDATION_MODELS_V1`, `RD_MOONDREAM_V1`. La famille est portée par le mot-clé `famille-...` |
| Règle d'intégration en 4 critères (stabilité, intégration, valeur, traçabilité) | README du labo, section « Règle d'intégration » |
| Revue mensuelle (« revue IA du mois ») et audit semestriel | README du labo, section « Revue du labo » |
| Variantes et modèles à connaître | Section « Alternatives et comparaison » de chaque fiche. Les listes de modèles de juin 2026 (Phi-3 Mini, LLaMA 3.1 8B, Apple Foundation Models 3B) ne sont pas reprises : à revérifier à la prochaine revue |

**Attention :** les technologies cibles du tableau ci-dessous datent du 14 juin 2026. Leur état réel au 17 octobre 2026 est dans les fiches (binding Node.js de Whisper inactif depuis juillet 2025, Ollama passé en v0.40, dépôt de Demucs déplacé, Moondream 3 sous licence restrictive, SDK Python d'Apple).

---

## Points d'entrée actés — État au 14 juin 2026

Ce tableau recense les portes ouvertes dans les apps existantes pour une connexion IA future. Ces points d'entrée existent dans le code mais ne font rien aujourd'hui. Ils n'affectent pas le comportement actuel des apps.

| App | Fonction | Technologie cible | Approche | Statut |
|-----|----------|------------------|----------|--------|
| **ROVER** | `postProcess(videoPath)` — après compression HandBrake | Whisper | A | À implémenter en V2 |
| **ROVER** | Colonne `transcript_path TEXT` dans SQLite historique | Whisper | A | À implémenter en V2 |
| **ROVER** | Badge `TRANSCRIPT` sur entrées historique | UI | — | À implémenter en V2 |
| **ARK** | `enrichArchive(projectPath, archivePath)` — avant finalisation ZIP | Whisper + Ollama | A + C | À implémenter en V2 |
| **ARK** | Toggle `Générer les transcriptions` dans UI — désactivé par défaut | UI | — | À implémenter en V2 |
| **READBACK** | `processIncomingText(rawText)` — au collage du script | Ollama | C | À implémenter en V1 ou V2 |
| **READBACK** | Zone `OUTILS TEXTE` dans UI MacBook — désactivée si Ollama absent | UI | — | À implémenter en V1 ou V2 |
| **BackUpFlow** | `generateMailBody(data)` — composition du corps du mail Resend | Ollama | C | À implémenter en V2 |

**Règle :** un point d'entrée ne change jamais le comportement de l'app en l'absence d'IA. Si Ollama n'est pas lancé, si Whisper n'est pas disponible — l'app fonctionne exactement comme aujourd'hui.

---

## App nouvelle actée — SIGNAL

**Statut :** En idée — Phase Apollo
**Problème résolu :** Martin n'a pas de vue agrégée de ce qui se passe dans la flotte en temps réel
**Technologie :** Événements JSON émis par chaque app + Ollama pour résumé hebdomadaire
**Architecture à valider :** les apps web (COVENANT, Reviewer, Manifest) ne peuvent pas écrire en local — transit par email structuré à une boîte dédiée, lue par SIGNAL via IMAP
**Devise proposée :** *OMNIA CONSPICUA · Tout est visible*

**Écart documentaire arbitré (17/10/2026) :** le Plan Directeur (D136) fixe SIGNAL comme une app Electron, lancée juste après la V1 de RENDEZVOUS et construite sur Surveyor et son radar : cette décision prime. Le transit par e-mail structuré lu en IMAP, décrit plus haut, est requalifié en hypothèse non retenue, à retrancher à la conception de SIGNAL (piste notée en regard : événements déposés dans GitHub, cohérent avec « GitHub = seul cloud de travail » ; faisabilité pour COVENANT, Reviewer et Manifest non vérifiée).

---

## Historique des revues

### Session fondatrice — 14 juin 2026

Première session de réflexion IA — panorama complet établi. 11 familles cartographiées. Croisement avec la flotte complète réalisé. Décisions actées dans `TRANQUILITY_IA_STRATEGIE.md`. Points d'entrée définis pour ROVER, ARK, READBACK, BackUpFlow. SIGNAL validée comme nouvelle app Apollo. TRANSCRIPT, DEBRIEF, CLEAN évalués et rejetés (doublons avec Premiere ou usage trop rare).

**Décisions majeures de la session :**
- IA gratuite uniquement — post-Apollo si modèle économique
- Architecture en trois approches (A/B/C) actée
- Veille IA intégrée au process permanent de la suite
- 4 points d'entrée ouverts dans les apps existantes

---

### Migration vers le laboratoire R&D — 17 octobre 2026

La veille IA (ce document) et la veille outils (`TRANQUILITY_VEILLE_OUTILS.md`) ont été réunies dans le repo `tranquility-rd` (D156). Le déclencheur est unique : consultation du labo au mini-plan de chaque chantier, ou à la demande (D157).

---

*Document fondateur · TRANQUILITY_VEILLE_IA · V2.0 · Tranquility Suite · Cellule Vidéo L'Étudiant · 17 octobre 2026*
*Poussé sur `tranquility-plan-directeur` — branche `main`*
