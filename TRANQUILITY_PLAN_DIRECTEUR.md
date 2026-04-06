# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 3.4 — 6 avril 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Principe central :** GitHub = cloud de la Tranquility Suite.

---

## Phase Mercury — État du programme

**Progression : 99%**

| État | Définition |
|------|-----------|
| **En projet** | Idée de projet, pas de construction lancée |
| **Lancement** | Chantier en cours — développement actif |
| **En orbite** | Version buildée, testée, alignée suite, utilisable par l'équipe |

---

## Conditions de sortie Mercury

Mercury est terminée quand ces 6 apps sont **parfaitement opérationnelles et alignées** :

| # | App | Type | Condition minimale | État |
|---|-----|------|--------------------|------|
| 1 | **Launcher** | Desktop | Hub opérationnel, MASTER Équipe, Session V1.1 writer | 🟣 En orbite |
| 2 | **BackUpFlow** | Desktop | Workflow complet, Session V1.1 ✅, build ✅ | 🟣 En orbite |
| 3 | **Transporter** | Desktop | Workflow valise complet, Session V1.1 ✅, design aligné | 🟣 En orbite |
| 4 | **ARK** | Desktop | Session V1.1 ✅, tests ✅, build ✅ | 🟣 En orbite |
| 5 | **Reviewer** | Web | WebProfileSelector ✅, localStorage ✅, profiles-public.json ✅ | 🟣 En orbite |
| 6 | **Manifest** | Web | WebProfileSelector à implémenter | 🔵 Lancement |

---

## Inventaire de la flotte — 17 outils

### En orbite 🟣

| # | Outil | Version | Notes |
|---|-------|---------|-------|
| 1 | **Launcher V2** | v1.02.04.26 | Session V1.1 ✅, MASTER ✅, CSP avatars ✅, profils propres ✅ |
| 2 | **Transporter** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, 1440×1050 ✅ |
| 3 | **BackUpFlow** | v1.01.04.26 | Session V1.1 ✅, ProfileSelector ✅, build ✅, 1440×1050 ✅ |
| 4 | **ARK** | v1.02.04.26 | Session V1.1 ✅, tests ✅, build ✅, Monday État Rushs ✅ |
| 5 | **Reviewer** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, tranquility-core.css ✅ |
| 6 | **Manifest** | v1.30.03.26 | Mercury Design ✅ — WebProfileSelector à implémenter |

### En projet Gemini/Apollo ⚫

| # | Outil | Notes |
|---|-------|-------|
| 7 | Payload | Desktop + Mobile, Monday DB |
| 8 | Rover | Spec complète dans `ROVER_DOCUMENTATION_PROJET.md` |
| 9 | Cargo | — |
| 10 | Hatch | — |
| 11 | Guidance | — |
| 12 | Beacon | Web |
| 13 | Debrief | Web |
| 14 | Telemetry | Extension Premiere |
| 15 | CAPCOM | Extension Premiere |
| 16 | DATAPAD | Extension Premiere |
| 17 | BLACKBOX | Extension Premiere |

---

## Feuille de route Mercury — Phases

| Phase | Chantier | État |
|-------|----------|------|
| 1 | Module unifié `session-profile.js` | ✅ Terminée |
| 2 | Launcher — Session V1.1 | ✅ Terminée |
| 3 | BackUpFlow — Session V1.1 + build | ✅ Terminée |
| 4 | Transporter — Session V1.1 | ✅ Terminée |
| 5 | ARK — Session V1.1 + tests + build | ✅ Terminée |
| 6 | Reviewer + Manifest — sessions web | 🔵 En cours — Reviewer ✅ · Manifest à faire |
| 7 | Tests d'intégration | En attente |
| 8 | Documentation équipe + clôture Mercury | En attente |

> **Prochaine session :** Phase 6 — Manifest WebProfileSelector localStorage

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.02.04.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.01.04.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | v1.30.03.26 | 🔵 Lancement |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ + profiles-public.json |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 6 profils |
| Profiles public | `RealCoolclint/tranquility-core` | `profiles-public.json` | ✅ 6 profils allégés |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V3.4 |

---

## Points ouverts — à traiter

### 🔴 Prioritaire
1. **Phase 6 — Manifest** — WebProfileSelector localStorage (prochaine session)

### 🟠 À ne pas oublier
2. **BackUpFlow `appSettings` couche `_machine`** — SSD1 + NAS via `spLoadSettings`
3. **`session-reader.js`** dans BackUpFlow/modules/ — peut être supprimé
4. **ARK splash** — `<img>` → `<video>` MP4 quand ambiance générée

### 🔵 Gemini — priorité haute
5. **`session-profile.js` + Keychain** — enrichir pour lire les clés API directement depuis le Keychain macOS
6. **Reviewer UI** — amélioration générale de l'interface
7. **Système d'équipes** dans le sélecteur de profil (scalabilité)
8. **Modale RGPD** à la première connexion (consentement profils publics)

### 🔵 Gemini — ARK UX
9. **Barre de progression** — améliorer mise en forme, gamification
10. **Liste Monday** — meilleure présentation + filtre/recherche rapide
11. **Écran bilan** — écran dédié post-archivage avec résumé
12. **Nommage fichier archivé** — utiliser le nom normé Monday

---

## Décision architecturale actée — 6 avril 2026

**profiles-public.json — séparation données publiques / privées :**
- `launcher-profiles/profiles.json` (privé) — source de vérité complète avec emails
- `tranquility-core/profiles-public.json` (public) — version allégée sans nom complet ni email
- Les apps web fetchent uniquement la version publique
- Génération via script Python depuis le repo privé
- Compatible Gemini/Supabase Auth — pas de dette architecturale
- RGPD : modale de consentement à ajouter lors de la première connexion

**Pattern WebProfileSelector — validé sur Reviewer :**
- `show()` appelé AVANT `await syncProfiles()` — jamais d'écran blanc
- Badge ADMIN en style inline dans le template JS — seule solution stable contre `.dark-theme *`
- `cloneNode` pour reset les listeners du bouton avatar à chaque session
- Clé localStorage : `ts_session_[appname]`

---

## Patron de migration — WebProfileSelector web

Validé sur Reviewer. À appliquer sur Manifest (et futures apps web).

**Fichiers à modifier :**
1. `index.html` (ou fichier principal) — CSP, tranquility-core.css, bloc HTML sélecteur, top-bar-profile, onMercuryComplete
2. `styles.css` — bloc WebProfileSelector complet
3. `app.js` / `script.js` — WebProfileSelector IIFE + window.onMercuryComplete

**URL profiles-public.json :**
```
https://realcoolclint.github.io/tranquility-core/profiles-public.json
```

**Clés localStorage par app :**
- Reviewer → `ts_session_reviewer`
- Manifest → `ts_session_manifest`

---

## Patron de migration Session V1.1 — validé

Le patron est documenté dans `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md`.

**Apps migrées :** Launcher ✅ · Transporter ✅ · BackUpFlow ✅ · ARK ✅
**Toutes les apps desktop Mercury sont migrées.**

---

## Leçon clé — Nettoyage profils Launcher

Le nettoyage de profils dans Launcher doit toujours passer par le **MASTER panel**. Sources à nettoyer simultanément si nettoyage manuel requis :
1. `profiles.json` GitHub (`launcher-profiles`)
2. `config.json` dans `~/Library/Application Support/launcher-v2/`
3. `profiles-cache.json` dans `~/Library/Application Support/launcher-v2/`

---

## Standard fenêtre Tranquility Suite

| Paramètre | Valeur |
|---|---|
| `width` | `1440` |
| `height` | `1050` |
| `minWidth` | `1440` |
| `minHeight` | `1050` |
| `center` | `true` |
| `backgroundColor` | `'#0a0f1e'` |
| `resizable` | `true` |

---

## Ressources du projet

| Document | Rôle | Version |
|----------|------|---------|
| `TRANQUILITY_SESSION_PROFILS_SPEC.md` | Session & profils — source de vérité | V1.1 ✅ |
| `TRANQUILITY_PATRON_MIGRATION_SESSION_V1.md` | Patron de migration Session V1.1 | V1.0 ✅ |
| `TRANQUILITY_SUITE_DESIGN_REFERENCE.md` | Charte design complète | V2.1 |
| `TRANQUILITY_PROFIL_PASSEPORT_SPEC.md` | Format Passeport V1 | V1.0 |
| `TRANQUILITY_LAUNCHER_SESSION_SPEC.md` | Protocole session Launcher | V1.0 |
| `TRANQUILITY_SSO_SPEC.md` | SSO cross-machine — Phase Gemini | V1.0 |
| `TRANQUILITY_SUITE_ELECTRON_SKILL.md` | Patterns backend Electron | V1.0 |
| `TRANQUILITY_SUITE_MERCURY_OPENING.md` | Norme splash screen | V1.0 |
| `TRANQUILITY_SUITE_MISSION_PATCHES_STATUT.md` | État des patches | V1.0 |

---

## Phase Gemini — Horizon

- **`session-profile.js` + Keychain** — autonomie clés API sans Launcher (priorité haute)
- SSO cross-machine — sync activité via GitHub
- Reviewer V2 — Supabase Auth, commentaires timestampés, modèle Frame.io
- Payload — Desktop + Mobile, Mode 2 (checkout QR), Mode 3 (état matériel)
- Extensions Premiere — CAPCOM, DATAPAD, BLACKBOX, Telemetry
- PIN / authentification renforcée sur le sélecteur de profil
- Manifest — API Monday directe, historique, templates par format
- ARK UX — écran bilan, filtre Monday, gamification progression, nommage normé
- Système d'équipes dans le sélecteur de profil
- Modale RGPD première connexion

---

*Plan Directeur V3.4 — 6 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V3.3*
*Prochaine mise à jour : après Phase 6 Manifest*
