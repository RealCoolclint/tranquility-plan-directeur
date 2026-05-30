# TRANQUILITY_WORKFLOW_ASSIST
*Skill actif — Tranquility Suite · Cellule Vidéo L'Étudiant*
*Créé le 30 mai 2026 — Mis à jour le 30 mai 2026 (soir) — I3 Launcher*

---

## CE QUE CE FICHIER FAIT

Ce skill active trois automatismes JARVIS permanents :

1. **Le mini-plan** — généré avant chaque prompt Cursor
2. **Le carnet de pièges** — mis à jour après chaque session, consulté avant chaque chantier
3. **Le contexte par app** — chargé au démarrage de chaque session

Martin n'intervient jamais sur ce fichier sauf s'il veut reprendre la main.

---

## AUTOMATISME 1 — LE MINI-PLAN

### Règle
Avant tout prompt Cursor qui touche à du code, JARVIS génère un mini-plan et le soumet à Martin. Si Martin ne le corrige pas dans les 2 échanges, JARVIS considère que c'est validé et avance.

### Format — 4 lignes maximum

```
OBJECTIF — ce qu'on veut obtenir
FICHIERS — les fichiers qui vont être touchés
RISQUES — ce qui pourrait mal se passer
QUESTIONS — ce qui doit être confirmé avant de coder
```

### Règle d'application
- Obligatoire pour tout chantier qui touche à plus d'un fichier
- Facultatif pour une correction chirurgicale sur un seul bug isolé
- Jamais plus de 4 lignes — si c'est plus long, le chantier est trop gros et doit être découpé

---

## AUTOMATISME 2 — LE CARNET DE PIÈGES

### Règle
JARVIS consulte ce carnet au démarrage de chaque session et avant chaque mini-plan. Il l'enrichit automatiquement en fin de session, intégré au récap `.md`. Martin ne gère jamais ce carnet directement.

### Format d'une entrée
```
[APP] Symptôme observé → Solution appliquée
```

### Entrées actives

#### Transverse — toutes les apps
- `[SYSTEME] Claude Desktop bloqué au démarrage → Trust evaluate failure: leaf TemporalValidity → fix : sudo codesign --force --deep --sign - /Applications/Claude.app`
- `[SYSTEME] Cowork tourne dans un sandbox Linux isolé — ne peut pas exécuter gh CLI ni les outils macOS — toujours passer par Terminal macOS pour gh`

- `[SUITE] tranquility-core.css doit être importé en premier dans <head> — jamais de tokens redéfinis localement`
- `[SUITE] .screen { opacity: 0 } par défaut → ajouter .screen.active { opacity: 1 !important; animation: none; } dans chaque app`
- `[SUITE] onSessionReady doit utiliser setTimeout(0) → évite les ReferenceErrors sur fonctions définies plus bas`
- `[SUITE] Zéro alert() / confirm() natif — toasts et modales uniquement`
- `[SUITE] Zéro emoji dans l'UI — texte ou SVG uniquement`
- `[SUITE] Toutes les couleurs via variables CSS — jamais de valeur en dur`
- `[SUITE] Animated patches Mercury Opening : toujours <video> MP4, jamais <img>`
- `[SUITE] Build → codesign ad-hoc → hdiutil, dans cet ordre — jamais sauter la signature`
- `[SUITE] electron en devDependencies, jamais en dependencies`
- `[SUITE] API keys dans macOS Keychain via keytar — jamais dans un fichier local ou le code source`
- `[SUITE] tranquility-core repo : branche master, pas main`
- `[SUITE] Son au démarrage : toujours spawn('afplay') en première ligne de main.js — jamais new Audio() dans le renderer`

#### Launcher
- `[LAUNCHER] Fichiers hors src/ lus par main.js → asarUnpack + path conditionnel app.asar → app.asar.unpacked`
- `[LAUNCHER] Root-level files → app.getAppPath() pour résolution machine-indépendante`
- `[LAUNCHER] spSaveSettings gère toute la persistance GitHub pour les sessions Launcher — jamais updateProfile local`
- `[LAUNCHER] Profil cleanup : modifier simultanément GitHub profiles.json + local config.json + profiles-cache.json, Launcher fermé`
- `[LAUNCHER] APPS_CATALOG dans src/renderer/app.js — dmgUrl doit être présent pour que le bouton Installer fonctionne`
- `[LAUNCHER] Double handler sur .btn-reveal → cibler précisément #modalAdmin .btn-reveal vs #master-tab-trousseau .btn-reveal[data-target]`
- `[LAUNCHER] Citations figées → sessionStorage non vidé entre lancements Electron — supprimer sessionStorage, index aléatoire direct`
- `[LAUNCHER] index.html est dans src/renderer/, pas à la racine — toujours utiliser src/renderer/index.html dans les commandes git add`
- `[LAUNCHER] npm install requis sur tout nouveau clone — dotenv absent par défaut → erreur "Cannot find module 'dotenv'" au démarrage`
- `[LAUNCHER] ARK absent de APPS_CATALOG — présent dans une liste séparée (TRANQUILITY_TOOLS ou équivalent) — ne pas confondre les deux`
- `[LAUNCHER] Clé Resend dans config.json (champ resendKey) — fallback pour tous les profils non-admin — à saisir dans Réglages > Notifications`


#### Manifest
- `[MANIFEST] Chrome fetch profils fragile → passer fetch() en { cache: 'no-cache' }`
- `[MANIFEST] Valider Array.isArray(data) && data.length > 0 après res.json()`
- `[MANIFEST] Safari autocomplete contacts Mac → renommer name="managerName" en name="manager-contact" — Webkit ignore autocomplete="off" si name contient un mot de champ contact`

#### Reviewer
- `[REVIEWER] localStorage.setItem('reviewerDefaultOverlay') persiste tout PNG importé comme overlay par défaut — ne pas l'utiliser pour le patch`
- `[REVIEWER] Safari fond blanc → ajouter background: #000 sur #videoPlayer et background: #0a0a0a sur .player-row`
- `[REVIEWER] Safari vitesse native Apple → remplacer 'SF Pro Display', -apple-system par 'Lato', sans-serif + -webkit-appearance: none sur .speed-selector`
- `[REVIEWER] Bords arrondis clips la vidéo → border-radius: 0 sur #videoPlayer, .player-row .video-container, .player-section.player-block`

#### BackUpFlow
- `[BACKUPFLOW] ssdPersoPath et ssdStudioPath peuvent pointer au même endroit → vérifier path.resolve() avant copie`
- `[BACKUPFLOW] compress === false → archiveResult reste null → le bloc NAS ne s'exécute jamais — placer le guard avant le bloc NAS`
- `[BACKUPFLOW] HandBrake toujours séquentiel avant upload Gofile — jamais Promise.all avec les deux`
- `[BACKUPFLOW] NAS via WiFi peut déclencher de fausses alertes de déconnexion — tester en RJ45`

#### Transporter
- `[TRANSPORTER] ZIP level 0 = pas de compression — copie rapide (~20.3 Mo/s), utiliser archive.directory(sourceFolder, false)`

#### Patron de migration session
- `[SESSION] Ancien session.json format V1 → écran vide — supprimer ~/Library/Application Support/tranquility-suite/session.json`
- `[SESSION] loadProfiles() peut écraser le nom après onSessionReady → guard if (!window._activeSession) + ré-application après loadProfiles`
- `[SESSION] ProfileSelector.init() sur "changer de profil" ne fonctionne pas si session valide → utiliser ProfileSelector.changeProfile()`
- `[SESSION] profiles.json format tableau → json.profiles undefined — Array.isArray(json) ? json : json.profiles`

---

## AUTOMATISME 3 — CONTEXTE PAR APP

### Règle
Au démarrage d'une session sur une app spécifique, JARVIS charge le contexte de cette app avant tout autre chose. Le bloc transverse s'applique toujours en plus — jamais à la place.

---

### RÈGLES TRANSVERSES — s'appliquent à toutes les apps

- Design system : `tranquility-core.css` importé en premier, jamais de tokens locaux
- Dark theme uniquement — fond `#0a0f1e`, texte `#f0f4ff`
- Typographie : Lato (UI) + Space Mono (labels techniques uniquement)
- Tout en `text-transform: uppercase` — titres, labels, boutons, noms d'app
- Zéro emoji dans l'UI
- Transitions via `var(--transition)` — jamais de valeur en dur
- Couleurs via variables CSS — `var(--accent)`, `var(--border)`, etc.
- Build : `CSC_IDENTITY_AUTO_DISCOVERY=false npx electron-builder --mac dir` → codesign ad-hoc → hdiutil
- Versioning : format `V1.JJ.MM.AA`
- Un seul push GitHub par opération, toujours via `saveConfig()` dans le renderer
- Toujours lire les fichiers avant d'écrire un prompt Cursor

---

### LAUNCHER
**Repo :** `RealCoolclint/Launcher`
**Chemin local :** `/Volumes/BACKUP PRO/Outils/App Persos/Launcher-v2/`
**Nature :** App Electron — hub central de la suite
**Rôle :** Authentification, gestion des profils, distribution des apps, Retriever (clés API)

**Particularités :**
- `APPS_CATALOG` dans `src/renderer/app.js` — source de vérité des apps distribuées
- Profils : `profiles.json` sur repo privé `launcher-profiles` + cache local `profiles-cache.json`
- Session écrite par `session-writer.js` format V2 — champs plats, `expiresAt` ISO
- Retriever : chiffrement AES-256-GCM, clé SHA-256 du mot de passe admin, fichier `retriever.enc` sur GitHub
- `spSaveSettings` gère toute persistence GitHub pour sessions connectées
- MASTER = interface admin — postes, synchronisation, Retriever, Plan Directeur en ligne

**Bugs ouverts :**
- Bouton "Installer" ouvre Finder au lieu de télécharger le DMG → `dmgUrl` absent dans `APPS_CATALOG`
- "Signaler un problème" Resend broken → handler IPC dans `src/main/main.js` à vérifier

**Fragilités connues :**
- Toute modification d'APPS_CATALOG peut affecter l'affichage de toutes les apps
- Les fichiers hors `src/` nécessitent `asarUnpack`

---

### BACKUPFLOW
**Repo :** `RealCoolclint/BackUpFlow` (? — à confirmer)
**Nature :** App Electron — backup des rushes vidéo
**Rôle :** Copie vers SSD Perso + SSD Studio + NAS + Gofile, compression HandBrake, mail Resend
**Devise :** *NULLA DATA PEREUNT*

**Particularités :**
- Deux destinations SSD peuvent pointer au même endroit → protection doublons obligatoire
- Compression HandBrake toujours avant upload Gofile — jamais en parallèle
- Upload Gofile : dossier originals + dossier `_compressed` avec suffixe, structure plate
- NAS via SMB — stable en RJ45, WiFi peut générer de fausses alertes
- Mail admin `mpavloff@letudiant.fr` toujours en copie, même si ce n'est pas lui qui lance

**Fragilités connues :**
- `archiveResult` reste null si `compress === false` — le bloc NAS ne s'exécute pas sans guard
- `zipNasEnabled = false` → pas de ZIP forcé, copie directe du dossier

---

### TRANSPORTER
**Repo :** `RealCoolclint/Transporter` (? — à confirmer)
**Nature :** App Electron — envoi de fichiers
**Rôle :** ZIP et upload vers Gofile, notification Monday
**Devise :** *RECTE ET CELERITER*

**Particularités :**
- ZIP level 0 = pas de compression réelle, juste encapsulation rapide (~20.3 Mo/s)
- `archive.directory(sourceFolder, false)` — structure plate, pas de sous-dossier ZIP
- Logos sonores au démarrage selon heure : 4 plages (matin/après-midi/soir/nuit)
- Son toujours via `spawn('afplay')` en première ligne de `main.js`

---

### ARK
**Repo :** `RealCoolclint/ARK`
**Nature :** App Electron — archivage et mémoire
**Rôle :** Conservation et consultation des archives de la cellule
**Devise :** *MEMORIA MANET*

**Particularités :**
- Migration session V2 appliquée (1 avril 2026)
- Architecture session : `session-reader.js` module commun

---

### REVIEWER
**Repo :** `RealCoolclint/Reviewer`
**Nature :** App web (GitHub Pages) — validation de montages vidéo
**Rôle :** Lecture vidéo + overlay patch + prise de notes horodatées
**Devise :** *NIHIL NISI PROBATUM*

**Particularités :**
- App web, pas Electron — localStorage uniquement, pas de session Electron
- Overlay patch : ne jamais persister en localStorage comme overlay par défaut
- Mémoire de session : sauvegarde auto toutes les 5s (nom fichier + position + notes)
- Restauration silencieuse au re-dépôt d'une vidéo avec le même nom

**Fragilités connues :**
- Safari : fond blanc, vitesse native Apple, bords arrondis — trois bugs distincts, tous résolus en V post-Mercury

---

### MANIFEST
**Repo :** `RealCoolclint/Manifest`
**Nature :** App web (GitHub Pages) — fiche de production vidéo
**Rôle :** Création et gestion des fiches projet vidéo
**Devise :** *ANTE OMNIA PARARE*

**Particularités :**
- App web — fetch profiles depuis `tranquility-core` (GitHub Pages)
- Managers stockés en localStorage par navigateur — isolation par design, export/import CSV disponible
- Chantier I5 Gemini ouvert : migrer `managers.json` vers `tranquility-core`

**Fragilités connues :**
- Chrome fetch agressif → toujours `{ cache: 'no-cache' }` sur le fetch profils
- Safari autocomplete Mac Contacts → attributs `name` à nommer avec des tirets (ex: `manager-contact`)

---

## PROTOCOLE DE MISE À JOUR

JARVIS met ce fichier à jour en fin de session, au même moment que le récap `.md` et le Plan Directeur.

**Ce qui est mis à jour automatiquement :**
- Nouvelles entrées dans le carnet de pièges
- Contexte app si une particularité ou fragilité a été découverte ou résolue
- Bugs ouverts — fermés quand résolus, ajoutés quand découverts

**Ce que Martin peut faire à tout moment :**
- `"Montre-moi le carnet de pièges"` → JARVIS affiche les entrées
- `"Cette entrée est fausse"` → JARVIS corrige immédiatement
- `"Supprime le contexte Transporter"` → JARVIS l'archive ou le supprime

---

*TRANQUILITY_WORKFLOW_ASSIST · Skill actif · Tranquility Suite*
*Ne pas modifier manuellement — géré par JARVIS*
