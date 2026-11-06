# Session de travail — 6 novembre 2026 (après-midi)
## Tranquility Suite — CAPCOM (ex-VOXLOOP) : intégration documentaire, polish de sécurité, reconnexion, renommage

*Type de session : hybride (documentation + technique + gouvernance de flotte) · Mac Maison*

---

## Chantiers traités

### 1. Démarrage et audit court Surveyor
- Radar court (Plan V5.131, Carnet V74, registre présent, dernier rapport SURVEYOR_20261020).
- Alertes de niveau 4 : VOXLOOP absent du Plan et du registre de flotte, absent de RENDEZVOUS (assumé en V0), session du 31/10 jamais consignée, copies du projet Claude périmées (Plan 5.89 sous le nom V5_90, Carnet V59). Rappel niveau 1 : la séance SÉCURITÉ sur l'ancien registre de profils (D211) n'a toujours pas de date.

### 2. Intégration documentaire (Plan V5.132, Carnet V75)
- Plan V5.132 réécrit depuis le texte exact de GitHub : D213 à D223 (VOXLOOP), D221 (codes d'erreur), section dédiée, inventaire Gemini et flotte, rattrapage du 31/10, référence au Carnet corrigée (restée sur V71 depuis trois versions).
- Registre des codes validé en bloc (option A) avec quatre corrections : CPT retiré (CAPITAL hors Suite), SGN retiré (SIGNAL dans RENDEZVOUS), « Scripter » rayé (ancien nom de CODEX), READBACK en RBK (RDB trop proche de RDV à l'oral).
- Registre de flotte : VOXLOOP ajouté. Carnet V75 (+22 pièges). Commits `adb7f63` (Plan) et `ecddfe3` (Carnet).

### 3. Polish de sécurité de la régie (`regie.html`)
- Relâchement de souris perdu rattrapé au premier mouvement (bit 1 de `e.buttons`, bouton fantôme ignoré).
- Chrono d'antenne et alerte CPC-205 toutes les 30 s, sans coupure (option A).
- VERROU remis à zéro au micro perdu et au hors-service ; désactiver le VERROU ramène l'antenne à ce qui est réellement tenu (trou présent depuis la V0, trouvé en relisant le rapport Cursor).
- Messages codés en tons neutres : CPC-202, 203, 204, 206, 207, 304, 999. Commit `98acce9`.
- Tests : VERROU, alerte à 30 s, seconde régie refusée (CPC-203).

### 4. Reconnexion sans perte de place (serveur, écoute, régie)
- Serveur : jeton facultatif dans le join, sursis de 30 s, reprise du même id, ancienne socket remplacée proprement, champ `besoinOffre` transmis à la régie.
- Écoute : jeton de 32 caractères gardé dans sessionStorage (survit au rechargement de page), `besoinOffre` seulement si aucun pair utilisable, voyant prudent après reconnexion, escalade de CPC-105, CPC-999.
- Régie : sur reprise, recréation immédiate du pair si `besoinOffre`, sinon vérification à 4 s.
- Tests sur iPhone : deux reprises parfaites (même numéro c6), puis le « fantôme » d'un rechargement Safari, corrigé et revérifié (« revenu sans son », même numéro c3). Commits `6f77dba` et `e5746de`.

### 5. Renommage VOXLOOP en CAPCOM
- Coût jugé 3 sur 10, le vrai coût étant le module Premiere déjà nommé CAPCOM.
- Code renommé par Cursor en mode agent (titres, codes VXL en CPC, clés `capcom.*`, catalogue `docs/CAPCOM_CODES.md`), archives de `docs/` laissées intactes. Commit `feffd68`.
- Dépôt GitHub `voxloop` renommé `capcom` (privé), dossier local `~/Documents/GitHub/capcom`, remote mis à jour. Contrôle : CAPCOM affiché des deux côtés, son reçu.
- Catalogue CPC V0.2. Commit `c594b30`.

### 6. Idées et exigences recueillies
- La régie doit devenir une console de pilotage (voyants permanents, régie hors service grisée).
- Récepteurs dédiés : petits appareils Android peu coûteux comme récepteurs CAPCOM du studio (idée n° 12, piste V2).

---

## Décisions actées

- **D224** — VOXLOOP devient **CAPCOM** (préfixe **CPC**, devise *ALTA ET CLARA*). L'ancien CAPCOM, module Premiere de statuts Monday, devient **DOWNLINK** (devise *FIDE ET NUNTIA*). Les archives ne sont pas réécrites : une note d'homonymie en tête du Plan, au registre de flotte et dans `archives/` donne la clé de lecture.
- **D225** — La régie CAPCOM est une console de pilotage : chaque système a un voyant permanent, un état qui dure reste affiché tant qu'il dure, une régie hors service est grisée et inutilisable. Conception (systèmes, couleurs, maquette validée) avant tout code.
- **D226** — Antenne ouverte longtemps sans VERROU : alerte CPC-205, jamais de coupure automatique.
- **D227** — Un téléphone qui perd sa connexion garde sa place 30 s grâce à un jeton d'onglet ; s'il revient sans pair audio, la régie en recrée un aussitôt.
- Registre des codes de la Suite : V1.1 validée (13 préfixes), puis V1.2 (VXL devient CPC).
- Sur un téléphone en tournage, recharger la page est un dernier recours (le son ne revient qu'après un toucher sur ÉCOUTER).

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `TRANQUILITY_PLAN_DIRECTEUR_V5_132.md` | Plan Directeur (intégration VOXLOOP) | ✅ Poussé `adb7f63` |
| `CARNET_PIEGES_V75.md` | Carnet (+22) | ✅ Poussé `ecddfe3` |
| `REGISTRE_FLOTTE.md` + `TRANQUILITY_CODES_ERREUR.md` V1.1 | Registres | ✅ Poussés `adb7f63` |
| Dépôt `capcom` : régie, serveur, écoute, catalogue | Code et catalogue | ✅ `98acce9` → `c594b30` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_133.md` | Plan Directeur (clôture, D224 → D227) | 🟡 À pousser |
| `CARNET_PIEGES_V76.md` | Carnet (+7) | 🟡 À pousser |
| `REGISTRE_FLOTTE.md` (renommage) + `TRANQUILITY_CODES_ERREUR.md` V1.2 | Registres | 🟡 À pousser |
| `archives/LISEZ-MOI_HOMONYMIE_CAPCOM.md` | Clé de lecture des archives | 🟡 À pousser |
| Ce récap | Récap de session | 🟡 À pousser (`actuel/`) |

---

## Commandes Terminal produites

```bash
# Lancer CAPCOM (prototype), depuis le nouveau dossier
cd ~/Documents/GitHub/capcom && npm start

# Renommer un dépôt et son dossier local (serveur arrêté, Cursor fermé)
cd ~/Documents/GitHub/voxloop && gh repo rename capcom --yes && cd ~/Documents/GitHub && mv voxloop capcom && cd capcom && git remote set-url origin https://github.com/RealCoolclint/capcom.git && git fetch

# Retrouver un fichier livré par son empreinte (évite les homonymes renommés par Hazel en -1, -2)
find ~/Downloads -name "NOM*.md" -mmin -60 -exec shasum -a 256 {} \; | grep "^<début d'empreinte>"
```

---

## Pièges découverts

- Voir `CARNET_PIEGES_V75.md` (bloc VOXLOOP, 22 entrées) et `CARNET_PIEGES_V76.md` (7 entrées). Les principaux de l'après-midi : Safari iOS recharge la page pendant une coupure Wi-Fi (fantôme de 30 s) ; désactiver le VERROU laissait l'antenne ouverte ; Hazel renomme les homonymes en -1, -2 et une recherche par nom attrape l'ancienne version ; renommer un dépôt exige d'arrêter le serveur et de fermer Cursor ; renommer les clés de mémoire efface les réglages des téléphones.

---

## Liste de polish CAPCOM (non bloquante)

- Paliers de l'alerte CPC-205 qui sautent si l'onglet régie dort.
- Délai de 4 s peut-être court sur un Wi-Fi lent ; minuteurs de recréation (1,2 s et 4 s) qui peuvent se croiser.
- État `sursis` non lu à l'ouverture de la régie (à afficher dans la console).
- Onglet dupliqué : deux pages avec le même jeton.
- Jeton en clair sur le Wi-Fi local (à revoir en V1).
- Retard visé : environ 0,5 s. Faux « micro perdu » possible si macOS renomme le micro. `tranquility-core.css` à embarquer en local.
- Dossier `docs/a-integrer/` du dépôt `capcom` : ses blocs sont intégrés, il peut être archivé.

---

## Prochaines étapes

1. **Console de régie (D225)** : conception (liste des systèmes et voyants, code couleur, maquette validée par PRÉSIDENCE), puis construction.
2. **Premier test au studio** : plusieurs téléphones, micro débranchable (CPC-202), Wi-Fi de L'Étudiant.
3. **Cadrage V1** : Electron, QR code, canaux libres, parole individuelle, 3 Macs de régie.
4. **Fiche produit** `FICHE_PRODUIT_CAPCOM_V1.md`, puis **identité visuelle** (vérifier le patch CAPCOM existant).
5. **Intégration à RENDEZVOUS.**
6. Hors CAPCOM, toujours en attente : date de la séance SÉCURITÉ sur l'ancien registre de profils (D211, niveau 1) ; audit Surveyor complet vers le 20/11 (registre de flotte encore porteur de CAPITAL et SIGNAL comme apps en projet).

---

*Session du 6 novembre 2026 (après-midi) · Tranquility Suite · CAPCOM (ex-VOXLOOP) · Mac Maison*
