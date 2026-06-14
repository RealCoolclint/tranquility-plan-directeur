# TRANQUILITY_VEILLE_IA
## Tranquility Suite · Cellule Vidéo L'Étudiant

*Version 1.0 — 14 juin 2026*
*Document fondateur — complément de `TRANQUILITY_IA_STRATEGIE.md`*

---

## Rôle de ce document

Ce document est la mémoire IA de la Tranquility Suite. Il contient le panorama de référence des technologies IA gratuites pertinentes pour notre activité, les familles surveillées, les outils de référence actifs, les points d'entrée actés dans chaque app, et l'historique des revues mensuelles.

Il est mis à jour lors de chaque revue mensuelle et lors de chaque audit semestriel. Il est poussé sur `tranquility-plan-directeur` à chaque mise à jour.

**JARVIS consulte ce document silencieusement à chaque démarrage de session Tranquility Suite.**

---

## Process de veille — 3 niveaux

### Niveau 1 — Veille passive (permanente, automatisée par JARVIS)

À chaque démarrage de session Tranquility Suite, JARVIS lance une recherche web ciblée sur les 5 familles surveillées et signale en 3 lignes maximum : *"RAS"* ou *"Signal détecté sur [famille] — [résumé en une phrase]"*. Aucune action requise de Martin sauf si un signal est mentionné.

**Sources de référence :**
- simonwillison.net — tracker d'outils IA open source, haut signal/bruit
- huggingface.co/blog — nouveaux modèles open source dès leur sortie
- The Batch (deeplearning.ai) — synthèse hebdomadaire orientée pratique

### Niveau 2 — Revue mensuelle (premier lundi du mois, 15 minutes)

Déclencheur : Martin dit *"revue IA du mois"*. JARVIS lance les recherches sur les 5 familles, compare avec l'état documenté ici, et produit le rapport en format fixe ci-dessous. Martin valide, corrige, ou déclenche une action.

**Format fixe de la revue mensuelle :**
```
REVUE IA — [mois année]

1. NOUVEAUTÉS PERTINENTES
   Quoi de neuf dans nos familles depuis le mois dernier ?

2. IMPACT SUR LES DÉCISIONS ACTÉES
   Est-ce que quelque chose change une décision qu'on a prise ?

3. IMPACT SUR LES POINTS D'ENTRÉE
   Est-ce qu'un point d'entrée doit être mis à jour ?

4. À SURVEILLER LE MOIS PROCHAIN
   Un signal faible à confirmer.
```

Output : 10 lignes max. Intégré au Plan Directeur si une décision change.

### Niveau 3 — Audit semestriel (janvier et juillet, session dédiée)

Deux fois par an, révision complète du panorama. On vérifie que les familles sont à jour, que les technos choisies sont toujours les bonnes, que rien de majeur n'a été raté. C'est la session où on peut décider d'ouvrir un chantier Apollo ou de modifier un point d'entrée.

---

## Règle d'intégration — non négociable

Avant d'intégrer une technologie IA dans la suite :

1. **Stabilité :** la technologie doit être stable depuis au moins 3 mois — pas un projet GitHub d'une semaine
2. **Intégration :** elle doit avoir un binding Node.js ou une interface Electron documentée — pas juste Python
3. **Valeur :** elle doit apporter une valeur mesurable sur un usage réel de l'équipe — pas une démonstration technique
4. **Traçabilité :** elle est versionnée dans `TRANQUILITY_SERVICES_TIERS.md` au moment de l'intégration

---

## Les 5 familles surveillées

### Famille 1 — Transcription audio/vidéo

**Outil de référence :** Whisper (OpenAI, open source)
**Version de référence :** medium — bon équilibre précision/vitesse sur Apple Silicon
**Intégration Electron :** `whisper-node-addon` — binding Node.js pré-compilé, zéro compilation manuelle
**Statut :** Surveillé — candidat prioritaire pour intégration Apollo (ROVER, ARK)

**Signal d'alerte :** nouvelle version majeure de Whisper, mise à jour du binding Node.js, nouveau modèle plus léger avec même précision.

**Variantes à connaître :**
- `faster-whisper` — 4x plus rapide, Python uniquement
- `sherpa-onnx` — streaming temps réel, latence réduite
- `macOS Speech Recognition` — natif Apple, moins précis en français

---

### Famille 2 — LLM locaux (raisonnement texte → texte)

**Outil de référence :** Ollama + Mistral 7B
**Version de référence :** Ollama 0.19+ (moteur MLX sur Apple Silicon depuis mars 2026)
**API :** REST locale `http://localhost:11434` — compatible OpenAI
**Statut :** Surveillé — Approche C (serveur local, dépendance déclarée)

**Signal d'alerte :** nouveau modèle français plus léger et plus précis que Mistral 7B, Apple Foundation Models accessible depuis Node.js.

**Modèles à connaître :**
- Mistral 7B — excellent français, rapide, choix par défaut
- Phi-3 Mini (3.8B) — très léger, MacBook avec peu de RAM
- LLaMA 3.1 8B — bon généraliste, fort en raisonnement structuré
- Apple Foundation Models (3B) — Neural Engine, Swift uniquement pour l'instant

---

### Famille 3 — Séparation et nettoyage audio

**Outil de référence :** Demucs (Meta, open source)
**Intégration :** Python (Approche B) — Mac Studio uniquement
**Statut :** Surveillé — usage interne Martin/Antoine, pas distribué à l'équipe

**Signal d'alerte :** version MLX Apple Silicon accélérée disponible, binding Node.js émergent.

**Variantes à connaître :**
- RNNoise — suppression bruit temps réel, léger, Node.js disponible
- Ultimate Vocal Remover — app graphique open source, plus simple

---

### Famille 4 — Apple Foundation Models

**Outil de référence :** Apple Foundation Models framework (macOS 26)
**Statut :** Surveillé — Swift uniquement aujourd'hui, pont Node.js en développement par la communauté
**Intérêt :** Neural Engine, zéro consommation GPU, zéro batterie, zéro coût, offline

**Signal d'alerte :** pont Swift ↔ Node.js stable et documenté disponible.

---

### Famille 5 — Vision multimodale

**Outil de référence :** moondream2 (1.8B, léger, CPU)
**Statut :** Surveillance légère — usage potentiel ARK (description automatique de frames)
**Contrainte :** Lourd dès qu'on monte en qualité (LLaVA, Qwen2.5-VL nécessitent 8GB+)

**Signal d'alerte :** modèle léger (<2B) atteignant une précision suffisante pour décrire des contenus vidéo courants sans GPU.

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

*Document fondateur · TRANQUILITY_VEILLE_IA · V1.0 · Tranquility Suite · Cellule Vidéo L'Étudiant · 14 juin 2026*
*Poussé sur `tranquility-plan-directeur` — branche `main`*
