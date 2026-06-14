# TRANQUILITY_IA_STRATEGIE
## Tranquility Suite · Cellule Vidéo L'Étudiant

*Version 1.0 — 14 juin 2026*
*Document fondateur — décisions PRESIDENCE actées*

---

## Rôle de ce document

Ce document fixe les décisions fondamentales sur l'IA dans la Tranquility Suite. Il ne change pas souvent — seulement quand une décision de fond est révisée par la PRESIDENCE. Il est lu par JARVIS au démarrage de toute session qui touche à l'IA.

**Ce n'est pas un document de veille.** La veille est dans `TRANQUILITY_VEILLE_IA.md`. Ce document fixe le cap — pas l'état du monde.

---

## Décision 1 — IA gratuite uniquement en phase Gemini et Apollo

**Acté le :** 14 juin 2026
**Par :** PRESIDENCE (Martin Pavloff)

La Tranquility Suite n'intègre aucune IA à coût variable (API OpenAI, Anthropic, ElevenLabs, etc.) tant qu'elle n'a pas de modèle économique propre. Toute IA dans la suite est soit open source, soit locale, soit native (Apple), soit gratuite sans limite d'usage.

**Horizon de révision :** Phase Apollo — quand un modèle économique est associé à la suite.

**Ce que ça exclut :**
- Whisper API (OpenAI) — payant à l'usage
- GPT-4o, Claude API — payant à l'usage
- ElevenLabs — payant à l'usage
- AssemblyAI, Deepgram — payant à l'usage

**Ce que ça autorise :**
- Whisper local (open source, offline)
- Ollama + modèles open source (Mistral, LLaMA, Phi)
- Apple Foundation Models (macOS 26, gratuit, offline)
- Demucs (Meta, open source)
- Tesseract, PaddleOCR (open source)
- PySceneDetect, OpenCV (open source)

---

## Décision 2 — Architecture en trois approches

**Acté le :** 14 juin 2026
**Par :** PRESIDENCE (Martin Pavloff)

Toute intégration IA dans la suite suit l'une des trois approches suivantes. Le choix de l'approche est acté avant le développement — pas pendant.

### Approche A — Binding Node.js natif (embarqué dans le DMG)
Tout est dans la boîte. L'utilisateur installe l'app, la feature IA fonctionne.
Disponible pour : Whisper, Tesseract, OpenCV, RNNoise.
Contexte d'usage : features IA destinées à toute l'équipe.

### Approche B — Processus Python externe
L'app Electron spawn un script Python. Python doit être installé sur le Mac.
Disponible pour : Demucs, diarization, analyse vidéo lourde.
Contexte d'usage : usage interne Martin/Antoine sur Mac Studio uniquement. Jamais distribué à l'équipe.

### Approche C — Ollama comme serveur local
Ollama tourne en tâche de fond sur le Mac. L'app lui parle via API REST locale.
Installé une fois, disponible pour toutes les apps de la suite.
Contexte d'usage : LLM (résumé, reformulation, extraction, génération de texte). Toute l'équipe si Ollama est installé sur leurs Macs.

**Règle :** si Ollama n'est pas lancé ou si le binding est absent, l'app fonctionne exactement comme sans IA. Aucune feature IA n'est bloquante.

---

## Décision 3 — La règle des points d'entrée

**Acté le :** 14 juin 2026
**Par :** PRESIDENCE (Martin Pavloff)

Dans chaque app où l'IA a une valeur identifiée, on nomme une fonction qui fait aujourd'hui le travail mécanique — et qui demain pourra appeler une IA. Cette fonction existe dès la V1 de chaque app concernée. Elle ne change pas le comportement actuel. Elle ouvre une porte.

**Ce que ça signifie concrètement :**
- La fonction existe dans le code dès maintenant
- Elle retourne aujourd'hui le résultat mécanique (texte brut, données telles quelles)
- En Phase Apollo, elle appellera l'IA appropriée selon l'Approche définie
- Si l'IA est absente ou non configurée, elle retourne le résultat mécanique — comportement identique à aujourd'hui

**Points d'entrée actés :** voir `TRANQUILITY_VEILLE_IA.md` — section "Points d'entrée actés".

---

## Décision 4 — Pas de doublon avec les outils de production existants

**Acté le :** 14 juin 2026
**Par :** PRESIDENCE (Martin Pavloff)

La Tranquility Suite n'implémente pas d'IA pour reproduire ce que les outils de production font déjà, sauf si elle le fait significativement mieux dans le contexte spécifique de la cellule.

**Applications de cette règle :**
- TRANSCRIPT rejeté — la transcription est native dans Premiere Pro et le dépouillement est systématiquement réalisé dans Premiere
- CLEAN rejeté — le nettoyage audio existe dans Premiere (Enhance Speech) et dans des apps gratuites externes
- DEBRIEF rejeté — usage trop rare, ne correspond pas aux pratiques actuelles de l'équipe

**Test à appliquer avant toute nouvelle idée d'app IA :**
> Est-ce que l'équipe fait déjà cette tâche dans un outil existant ? Si oui, la valeur ajoutée de la suite est-elle suffisamment forte pour justifier une app dédiée ?

---

## Décision 5 — La veille IA est un process permanent

**Acté le :** 14 juin 2026
**Par :** PRESIDENCE (Martin Pavloff)

La veille IA est intégrée au process de fabrication et d'entretien de la Tranquility Suite. Elle n'est pas optionnelle.

**Trois niveaux :**
- Veille passive automatisée par JARVIS à chaque session
- Revue mensuelle : premier lundi du mois, 15 minutes, format fixe
- Audit semestriel : janvier et juillet, session dédiée

**Document de référence :** `TRANQUILITY_VEILLE_IA.md`

---

## Décision 6 — SIGNAL comme nouvelle app Apollo

**Acté le :** 14 juin 2026
**Par :** PRESIDENCE (Martin Pavloff)

SIGNAL est validée comme nouvelle app Phase Apollo. Elle agrège les événements émis par les apps de la suite et produit une vue de pilotage pour Martin, avec résumé hebdomadaire généré par Ollama.

**Architecture à valider avant développement :** gestion des signaux des apps web (COVENANT, Reviewer, Manifest) — transit par email structuré ou autre mécanisme à définir.

**Devise :** *OMNIA CONSPICUA · Tout est visible*

---

## Ce qui n'a pas encore été décidé

Ces sujets ont été identifiés mais pas encore arbitrés. Ils attendent une décision PRESIDENCE.

| Sujet | Contexte | Horizon |
|-------|----------|---------|
| Apple Foundation Models via Node.js | Technologie pas encore disponible — pont Swift ↔ Node.js en développement communautaire | Apollo, quand disponible |
| Ollama installé sur les Macs de l'équipe | Qui installe, comment, quel modèle, quel protocole de mise à jour | Avant premier déploiement IA vers l'équipe |
| Protocole de révocation (offboarding) | Si un membre quitte l'équipe — checklist de révocation des accès suite | À formaliser avant que la flotte grossisse encore |

---

*Document fondateur · TRANQUILITY_IA_STRATEGIE · V1.0 · Tranquility Suite · Cellule Vidéo L'Étudiant · 14 juin 2026*
*Poussé sur `tranquility-plan-directeur` — branche `main`*
