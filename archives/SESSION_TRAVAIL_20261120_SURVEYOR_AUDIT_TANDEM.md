# Session de travail — 20 et 21 novembre 2026
## Surveyor — Audit complet de la flotte n°3 et essai TANDEM (D285)

*Session d'audit · Mac Maison (20/11 après-midi, clôture le 21/11)*

---

## Chantiers traités

### Démarrage
- Tous les dépôts du Mac Maison tirés par une seule boucle (`git pull --ff-only`) : tout à jour, `rendezvous-proxy` `851d572` et `RENDEZVOUS` `f4886ce` conformes. `covenant-proxy` muet : dépôt archivé sur GitHub, fausse alerte.
- Lus sur un clone du dépôt public : Plan V5.156, récap du 20/11, `SURVEYOR_20261020.md`, `TANDEM_FICHE_SYNTHESE_20261115.md`, registre de flotte. Carnet V98 : « Sync now » fait, mais lu par extraction ciblée (non lisible par JARVIS).
- Radar complet du 20/11, 15 h 19 (32 dépôts).
- Postes actifs : MISSION CONTROL, NAVIGATION, QUALITÉ, MÉMOIRE, SÉCURITÉ, avec CODE pour l'essai TANDEM.

### Essai TANDEM — non tenu (D315)
- Cursor 3.30.14 sur le Mac Maison. Une question posée à Cursor lui-même (réponse « TANDEM-VERIF ») : Ask serait le mode sans écriture, mais il pourrait encore aller sur internet ; parade possible par un mode personnalisé.
- À l'écran : Cursor s'ouvre sur la fenêtre « Agents ». Pas de menu des modes, pas de mode Ask ; Customize propose Plugins, MCPs, Skills, Subagents, Rules, Commands, Hooks ; un sous-agent se crée avec un nom et une description seulement ; un nouvel agent part en Cloud par défaut.
- Limite fixée avec PRÉSIDENCE (option A, puis C si échec) atteinte : écriture, terminal et web ne pouvaient pas être coupés tous les trois. Sous-agent d'essai `tandem-lecture` créé puis supprimé.
- Bilan (règle 7) : aucun temps gagné, aucun coût nouveau. PRÉSIDENCE retient l'**option B** : nouvel essai au prochain audit (~20/12), préparé à l'avance, en commençant par l'éditeur classique (bouton « IDE ») sur un dossier jetable.

### Outillage de Cursor (D316)
- Aucun connecteur déclaré par Martin (`~/.cursor/mcp.json` absent). Computer Use (pilotage du Mac, arrivé avec une mise à jour le 27/10) et Origin (accès étendu aux dépôts GitHub) sont fournis par Cursor et branchés d'office dans chaque dépôt.
- Coupés tous les deux dans Customize → MCPs. Computer Use n'avait aucune autorisation macOS (Accessibilité, Enregistrement de l'écran). claude-video-vision (montage assisté par IA, 31/10) gardé.

### Hygiène Git du Mac Maison (D253, D317)
- Liste noire globale `.DS_Store` en place. Un seul dépôt suivait encore un `.DS_Store` : COVENANT, retiré (`c021b14`). D253 soldée sur le Mac Maison.
- Fichiers en attente : READBACK portait depuis le 20/07 20 lignes d'instrumentation « temporaire » jamais enregistrées, retirées (dépôt revenu à `a35f1d8`, app intacte) ; capcom portait deux exceptions Impeccable du lot 2.5, enregistrées (`87a0d8d`) ; `covenant-proxy` (archivé) garde un `.gitignore` non suivi, sans effet.
- Branches `lot4-ecran-principal` et `mobile-d180` de RENDEZVOUS supprimées par suppression douce (déjà incluses dans `main`).
- Dix dépôts sans `.gitignore` : sans effet tant que la liste noire globale est posée sur le Mac utilisé.

### Visibilité des dépôts (D314)
- `cellule-video-ao` (réponses à quatre appels d'offres et budgets) était public. PRÉSIDENCE : aucun intérêt à le garder public. Passé en privé dans la séance, vérifié `PRIVATE`.
- `Presentations-Tranquility-suite` : scripts de présentation, public, sans enjeu.

### Constats complémentaires
- Ambiance CODEX encore sur fond bleu nuit dans RENDEZVOUS et CODEX (coin mesuré à 9, 16, 29) : la version noire de D149 n'a jamais été substituée. À confirmer à l'œil.
- CAPCOM absent de RENDEZVOUS : assumé tant que la V2 n'est pas livrée.
- Fraîcheur : Transporter (236 j) et ARK (232 j) dépassent les deux seuils, déjà tranchés le 20/10 ; pas de nouvelle interview.

### Rapport
`surveyor/SURVEYOR_20261120.md`, rapport n°3, poussé (`da0a1a8`, 163 lignes).

---

## Décisions actées

- **D314** — `cellule-video-ao` passé en privé ; le crible de visibilité couvre tout dépôt de la Cellule qui contient des données.
- **D315** — TANDEM : essai non tenu, bilan, option B (nouvel essai préparé au prochain audit, sinon retour à A).
- **D316** — Connecteurs Computer Use et Origin de Cursor coupés ; outillage de Cursor ajouté au crible de Surveyor ; agent toujours en local.
- **D317** — Ménage d'audit sur le Mac Maison (READBACK, capcom, COVENANT, branches RENDEZVOUS).

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `surveyor/SURVEYOR_20261120.md` | Rapport Surveyor n°3 | ✅ `da0a1a8` |
| `cellule-video-ao` | Visibilité | ✅ privé |
| READBACK, capcom, COVENANT, RENDEZVOUS | Ménage Git | ✅ `a35f1d8`, `87a0d8d`, `c021b14`, branches supprimées |
| Cursor : Computer Use, Origin | Outillage | ✅ coupés |
| `surveyor/REGISTRE_FLOTTE.md` | Registre remis à niveau, section Visibilité | ✅ produit en clôture |
| Plan Directeur V5.157, Carnet V99 (bloc), ce récap | Documentation | ✅ produits en clôture |

---

## Commandes Terminal produites

```bash
# Tirer tous les dépôts du Mac d'un coup, sans fusion risquée
cd ~/Documents/GitHub && for d in */; do if [ -d "$d/.git" ]; then printf '\n== %s ==\n' "${d%/}"; git -C "$d" pull --ff-only 2>&1 | tail -1; fi; done
```

```bash
# État Git de tous les dépôts (lecture seule) : .DS_Store suivis, .gitignore, fichiers en attente, branches
cd ~/Documents/GitHub && for d in */; do [ -d "$d/.git" ] || continue; r="${d%/}"; echo "$r | DS_Store: $(git -C "$r" ls-files | grep -c DS_Store) | gitignore: $([ -f "$r/.gitignore" ] && echo oui || echo NON) | en attente: $(git -C "$r" status --short | wc -l | tr -d ' ') | branches: $(git -C "$r" branch --format='%(refname:short)' | grep -vxE 'main|master' | tr '\n' ' ')"; done
```

```bash
# Passer un dépôt en privé et vérifier
gh repo edit RealCoolclint/<depot> --visibility private --accept-visibility-change-consequences && gh repo view RealCoolclint/<depot> --json visibility --jq .visibility
```

```bash
# Supprimer de vieilles branches sans rien perdre (refus si travail absent de main)
git checkout -q main && git branch -d <branche>
```

---

## Pièges découverts (Carnet V99, +8)

Fenêtre Agents de Cursor sans mode Ask ; connecteurs branchés d'office par Cursor ; agent en Cloud par défaut ; dépôt hors Suite échappant au crible de visibilité ; code de diagnostic oublié quatre mois ; registre lu en partie par JARVIS ; accès au dossier du Mac refusé ; ligne de version du Carnet non reprise au Plan.

---

## Prochaines étapes

1. **Polish RENDEZVOUS** : d'abord les textes trop prudents depuis D309 (« Touch ID fonctionne dans Safari », RDV-201, 202, 204), puis la liste consolidée du récap du 20/11 ; y ajouter l'ambiance CODEX sur noir pur (D149), après confirmation à l'œil.
2. **Suite de la séance SÉCURITÉ D211** (D286) : clés du coffre de Launcher, lecture de BackUpFlow au Mac Bureau, décision JURIDIQUE sur le délégué à la protection des données.
3. **Reste du palier 1 de D205.**
4. **Au prochain passage sur le Mac Bureau et le Mac Studio** : liste noire `.DS_Store`, branche `auth-admin` (Mac Bureau), inventaire et coupure des connecteurs de Cursor.
5. **~20/12/2026** : audit Surveyor complet n°4 avec le nouvel essai TANDEM préparé (D315).

---

*Session du 20 au 21/11/2026 · Surveyor · Mac Maison*
