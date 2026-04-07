# Tranquility Suite — Plan Directeur
## Cellule Vidéo L'Étudiant · Direction Martin Pavloff

*Version 3.5 — 7 avril 2026*

---

## Vision

La Tranquility Suite est un écosystème d'outils internes pour la Cellule Vidéo de L'Étudiant. Chaque outil répond à un besoin précis de production, de post-production ou d'organisation. L'ensemble forme un système cohérent, maintenu par Martin Pavloff, utilisé quotidiennement par l'équipe.

**Principe central :** GitHub = cloud de la Tranquility Suite.

---

## Phase Mercury — État du programme

**Progression : 100% — En attente de clôture officielle**

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
| 6 | **Manifest** | Web | WebProfileSelector ✅, localStorage ✅, CSP ✅ | 🟣 En orbite |

**✅ Les 6 conditions de sortie Mercury sont remplies.**

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
| 6 | **Manifest** | GitHub Pages | WebProfileSelector ✅, localStorage ✅, CSP ✅, patch PNG ✅ |

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
| 6 | Reviewer + Manifest — sessions web | ✅ Terminée |
| 7 | Tests d'intégration | 🔵 Prochaine étape |
| 8 | Documentation équipe + clôture Mercury | 🔵 Prochaine étape |

> **Prochaine session :** Phase 7 — Tests d'intégration · puis clôture Mercury officielle

---

## Infrastructure GitHub

| App | Repo | Release | État |
|-----|------|---------|------|
| Launcher V2 | `RealCoolclint/Launcher` | v1.02.04.26 | 🟣 En orbite |
| Transporter | `RealCoolclint/Transporter` | v1.01.04.26 | 🟣 En orbite |
| BackUpFlow | `RealCoolclint/BackUpFlow` | v1.01.04.26 | 🟣 En orbite |
| ARK | `RealCoolclint/ARK` | v1.02.04.26 | 🟣 En orbite |
| Reviewer | `RealCoolclint/Reviewer` | GitHub Pages | 🟣 En orbite |
| Manifest | `RealCoolclint/Manifest` | GitHub Pages | 🟣 En orbite |
| tranquility-core | `RealCoolclint/tranquility-core` | GitHub Pages | ✅ + profiles-public.json |
| Profiles | `RealCoolclint/launcher-profiles` | `profiles.json` | ✅ 9 profils |
| Profiles public | `RealCoolclint/tranquility-core` | `profiles-public.json` | ✅ 9 profils allégés |
| Avatars | `RealCoolclint/tranquility-avatars` | 28 avatars | ✅ |
| Plan Directeur | `RealCoolclint/tranquility-plan-directeur` | `TRANQUILITY_PLAN_DIRECTEUR.md` | ✅ V3.5 |

---

## Points ouverts — à traiter

### 🔴 Prioritaire
1. **Phase 7 — Tests d'intégration** — vérifier la cohérence du flux Launcher → apps desktop + web
2. **Phase 8 — Documentation équipe + clôture Mercury officielle**

### 🟠 À ne pas oublier
3. **BackUpFlow `appSettings` couche `_machine`** — SSD1 + NAS via `spLoadSettings`
4. **`session-reader.js`** dans BackUpFlow/modules/ — peut être supprimé
5. **ARK splash** — `<img>` → `<video>` MP4 quand ambiance générée
6. **Antoine sans initiales** — à corriger dans Launcher (MASTER panel)
7. **Bug Launcher : suppressions de profils ne se propagent pas sur GitHub** — à investiguer en session dédiée

### 🔵 Gemini — priorité haute
8. **`session-profile.js` + Keychain** — enrichir pour lire les clés API directement depuis le Keychain macOS
9. **Reviewer UI** — amélioration générale de l'interface
10. **Système d'équipes** dans le sélecteur de profil (scalabilité)
11. **Modale RGPD** à la première connexion (consentement profils publics)

### 🔵 Gemini — ARK UX
12. **Barre de progression** — améliorer mise en forme, gamification
13. **Liste Monday** — meilleure présentation + filtre/recherche rapide
14. **Écran bilan** — écran dédié post-archivage avec résumé
15. **Nommage fichier archivé** — utiliser le nom normé Monday

---

## Décision architecturale actée — 6 avril 2026

**profiles-public.json — séparation données publiques / privées :**
- `launcher-profiles/profiles.json` (privé) — source de vérité complète avec emails
- `tranquility-core/profiles-public.json` (public) — version allégée sans nom complet ni email
- Les apps web fetchent uniquement la version publique
- Génération via script Python depuis le repo privé
- Compatible Gemini/Supabase Auth — pas de dette architecturale
- RGPD : modale de consentement à ajouter lors de la première connexion

---

## Patron WebProfileSelector — validé sur Reviewer + Manifest

**Règles définitives :**
- `show()` appelé AVANT `syncProfiles()` — jamais d'écran blanc
- Badge ADMIN en style inline dans le template JS — seule solution stable contre `.dark-theme *`
- `cloneNode(false)` (shallow) + déplacement manuel des enfants pour reset les listeners — plus sûr que `cloneNode(true)`
- `changeProfile()` doit toujours appeler `_syncProfiles()` — sinon grille vide
- Clé localStorage : `ts_session_[appname]`
- Le champ `avatar` dans `profiles-public.json` contient l'URL complète — **ne jamais préfixer**
- CSP obligatoire : `img-src` doit contenir `https://raw.githubusercontent.com`
- CSP obligatoire : `connect-src` doit contenir `https://realcoolclint.github.io`
- Inline style `#profile-selector-screen` : une seule déclaration `display` — toujours `display:none` (le JS gère l'affichage)
- Patch dans `.app-header` : toujours `<img>` PNG fixe — jamais `<video>` (la vidéo est réservée au Mercury Opening)

**Fichiers à modifier :**
1. `[fichier principal].html` — CSP, tranquility-core.css, bloc HTML sélecteur, bouton avatar header, onMercuryComplete
2. `styles.css` — bloc WebProfileSelector complet
3. `[script principal].js` — WebProfileSelector IIFE + window.onMercuryComplete

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
- Manifest — API Monday directe, historique, templates par format, champ videoManager branché sur profil connecté
- ARK UX — écran bilan, filtre Monday, gamification progression, nommage normé
- Système d'équipes dans le sélecteur de profil
- Modale RGPD première connexion

---

*Plan Directeur V3.5 — 7 avril 2026 — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Remplace V3.4*
*Prochaine mise à jour : après Phase 7 Tests d'intégration*
