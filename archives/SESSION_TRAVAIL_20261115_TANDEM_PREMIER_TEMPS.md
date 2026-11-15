# Session de travail — 15 novembre 2026
## Tranquility Suite — [SETI] TANDEM, premier temps (veille multi-agents)

*Session stratégique · Mac Maison, soir · Protocole D209*

---

## Postes actifs

SETI (R&D, PROSPECTIVE, BENCHMARK) · SÉCURITÉ · NAVIGATION · MISSION CONTROL · MÉMOIRE · PRÉSIDENCE (écoute et tranche)

---

## Chantiers traités

### Ouverture
- Rappel de ce qu'est TANDEM (D209), à la demande de PRÉSIDENCE.
- Choix du jour : TANDEM plutôt qu'une session de tests SETI. Raison : le tour de table décide si le multi-agents a sa place, donc si la piste Agency Agents mérite un test (ordre logique, constructif, sécurisé).
- Démarrage : `git pull` des trois dépôts (Plan, Carnet, labo), tous déjà à jour. Plan V5.147, sommaire du labo à 81 fiches, Carnet V89 synchronisés.

### État du labo
- 81 fiches : 0 EN TEST, 9 À TESTER, 35 EN RÉSERVE, 3 ADOPTÉ, 34 REJETÉ.
- Sept pistes touchent au multi-agents (quatre le 24/10) : Munder Difflin, OpenHands, PRAXIST, PawWork, OpenWorker (rejetées), Agency Agents (À TESTER), cogit (EN RÉSERVE).
- Trois raisons de rejet constantes : IA qui décide sans humain, accès trop large aux fichiers, coût caché. Idées retenues : contrôle, isolement, traçabilité.

### Veille ciblée (15/11/2026)
- **Maturité** : sous-agents de Claude Code disponibles depuis 2025 ; équipes d'agents expérimentales depuis février 2026, désactivées par défaut. Cursor en parallèle depuis la 2.0 ; /multitask et copies de travail séparées (worktrees) depuis la 3.2.
- **Coût** : pas de nouvel abonnement ; consommation proportionnelle au nombre d'agents. Quotas du compte Team de L'Étudiant à vérifier.
- **Sécurité** : consigne piégée transmissible d'un agent à l'autre ; isolement rarement actif par défaut ; la relecture humaine avant intégration reste le dernier garde-fou ; Anthropic conseille de commencer par la recherche et la relecture.

### Fiche de synthèse
`TANDEM_FICHE_SYNTHESE_20261115.md`, validée par PRÉSIDENCE, sans recommandation (volontaire) :
- Option A : rien ne change.
- Option B : agents en lecture seule (recherche, relecture, audit).
- Option C : écriture encadrée, une copie par agent, fusion validée par PRÉSIDENCE.
- Hors table d'office : fusion ou publication autonome, accès au-delà d'un dépôt, nouvelle clé payante.

---

## Décisions actées

- Aucune nouvelle décision (pas de D-number). D209 complétée : premier temps tenu, second temps à venir.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|-------------------|--------|------|
| `TANDEM_FICHE_SYNTHESE_20261115.md` | Fiche de synthèse, racine du dépôt `tranquility-plan-directeur` | 🟡 à pousser |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_148.md` | Plan Directeur (D209 complétée, lignes du Carnet, récap, ressources, note de version) | 🟡 à pousser |
| `CARNET_PIEGES_V90.md` | Carnet (V89 + 1 piège), construit par concaténation sur le Mac | 🟡 à pousser |
| Ce récap | Récap | 🟡 à pousser |

---

## Pièges découverts

- `[MÉTHODE / rendez-vous daté] TANDEM, fixé au 03/11 à 12h, a glissé de douze jours : les sessions courtes ouvertes par des liens collés sautent le démarrage V2.1, donc personne ne relit les échéances du dernier prompt de continuation, et SETI ne se déclenche jamais seul → au début de toute session, même ouverte par un lien, JARVIS vérifie dans le dernier récap s'il existe une échéance datée dépassée et la signale en une ligne`

---

## Prochaines étapes

1. **TANDEM, second temps** : tour de table de l'Agence (PRÉSIDENCE, NAVIGATION, PROSPECTIVE, SÉCURITÉ, CODE) sur la fiche de synthèse, dans une nouvelle conversation ; décision au Plan (D-number) ; déclencheurs des sept fiches liées mis à jour.
2. CAPCOM : tour de table « Flow, oui ou non ? », puis patch animé et splash.
3. Labo : choisir les deux premières pistes à passer EN TEST (aucune en test aujourd'hui) ; ATEM en écoute au prochain passage au studio.
4. Audit Surveyor complet vers le 20/11.

---

## Dettes

- Inchangées depuis le récap du 15/11 (tri de six liens).

---

## Prompt de continuation

```
[SETI] TANDEM — second temps : tour de table de l'Agence.

Démarrage : demande-moi sur quel Mac je suis, puis donne-moi la commande git pull des dépôts tranquility-plan-directeur, tranquility-carnet-pieges et tranquility-rd.

Lis ensuite, sur GitHub : le Plan Directeur en vigueur (actuel/), la décision D209 et la fiche TANDEM_FICHE_SYNTHESE_20261115.md à la racine du dépôt tranquility-plan-directeur.

Puis lance le tour de table (mode Conseil) : NAVIGATION, PROSPECTIVE, SÉCURITÉ, CODE, chacun depuis son propre filtre, sur les trois questions de D209 (quel besoin réel, ce que ça change au duo JARVIS et Cursor, quelles règles non négociables) et sur les options A, B, C de la fiche. Synthèse : convergences, tensions, points d'arbitrage. Je tranche ensuite.

À la clôture : la décision reçoit un D-number au Plan, et les déclencheurs des fiches liées (Munder Difflin, OpenHands, PRAXIST, Agency Agents, PawWork, OpenWorker, cogit) sont mis à jour dans tranquility-rd.
```

---

*Session 15/11/2026 · Tranquility Suite · SETI · TANDEM premier temps · Mac Maison*
