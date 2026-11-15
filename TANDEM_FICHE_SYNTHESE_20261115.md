# TANDEM — Fiche de synthèse (premier temps : veille)

*Protocole D209 · Tranquility Suite · 15 novembre 2026 · Mac Maison*
*Base du tour de table de l'Agence (second temps, nouvelle conversation). Cette fiche ne décide rien : PRÉSIDENCE tranche.*

---

## En clair

Le multi-agents, c'est faire travailler plusieurs IA en même temps sur un même chantier, comme plusieurs monteurs sur un même projet. Nos deux outils, Claude Code et Cursor, savent déjà le faire. C'est encore jeune, ça consomme vite les crédits, et tous les spécialistes de la sécurité disent la même chose : un humain doit vérifier avant que le travail entre dans le projet.

La vraie question n'est pas « multi-agents ou pas » : on en fait déjà « en pensée » avec le Council (23 postes). La question est : **passe-t-on à des IA qui agissent, et jusqu'où ?**

---

## 1. Ce que dit le labo (sommaire du 15/11/2026, 81 fiches)

Sept pistes touchent au sujet (quatre le 24/10, trois de plus depuis) : le sujet revient environ une fois par semaine.

| Piste | Statut | Ce qu'elle propose | Idée retenue |
|-------|--------|--------------------|--------------|
| Munder Difflin | REJETÉ | Plusieurs IA qui codent ensemble sous un chef IA | Renvoyer à l'humain toute dépense, tout changement de périmètre, toute action destructrice |
| OpenHands | REJETÉ | Poste de pilotage de plusieurs IA qui codent | Choix entre agent libre et agent enfermé dans un dossier précis |
| PRAXIST | REJETÉ | Équipe d'IA qui optimise un problème chiffré | — |
| Agency Agents | À TESTER | Fiches de rôle d'IA, proches de nos 23 postes | Enrichir les fiches de l'Agence (séance de lecture d'une heure) |
| PawWork (03/11) | REJETÉ | Collègue IA de bureau sur le Mac | — |
| OpenWorker (15/11) | REJETÉ | Collègue IA de bureau | Garde-fous en quatre niveaux d'autorisation |
| cogit (15/11) | EN RÉSERVE | Trace de la demande derrière chaque ligne de code écrite par une IA | Repérer les tâches non finies à la clôture |

**Les rejets reposent toujours sur trois raisons :** une IA qui décide sans humain, un accès trop large aux fichiers du Mac, un coût caché (clé payante, quotas qui fondent).
**Les idées retenues vont toutes dans le même sens :** contrôle, isolement, traçabilité. Jamais la vitesse.

---

## 2. Ce que dit la veille (recherche web du 15/11/2026)

### Est-ce mûr ? À moitié.

- **Claude Code, sous-agents** : une IA principale envoie des assistants faire une tâche et ils lui rendent compte. Disponible pour tous depuis 2025. [vérifié 15/11]
- **Claude Code, équipes d'agents** : des IA qui se partagent une liste de tâches et se parlent directement. Expérimental depuis février 2026, désactivé par défaut ; la documentation reconnaît des limites sur la reprise de session, la coordination et l'arrêt. [vérifié 15/11]
- **Cursor** : travail en parallèle depuis la version 2.0 (octobre 2025). Commande /multitask depuis la 3.2 (avril 2026). Chaque IA travaille sur sa propre copie du dépôt (un « worktree »), sans écraser celle des autres. Les tâches qui dépendent l'une de l'autre restent à enchaîner à la main. [vérifié 15/11]

### Combien ça coûte ? Pas de nouvel abonnement, mais des crédits qui fondent.

- Chaque IA a sa propre mémoire de travail : la consommation est à peu près proportionnelle au nombre d'IA, et une IA inactive continue de consommer tant qu'on ne ferme pas l'équipe. [vérifié 15/11, documentation Claude Code]
- Les fonctions de Cursor arrivent par mise à jour de l'abonnement existant. [vérifié 15/11]
- La règle 13 du labo (aucun nouveau paiement) n'est pas franchie d'office. Le compte Claude Team appartient à l'IT de L'Étudiant : ses quotas seraient vite entamés. [déduit, à vérifier]

### Est-ce sûr ? C'est le point faible.

- **Le « trio fatal »** : une IA qui lit des données privées, lit du contenu extérieur et peut envoyer des données peut être retournée par une seule consigne piégée cachée dans un fichier ou une page. [vérifié 15/11]
- **Entre IA, le piège se transmet** : les échanges entre agents sont en général tenus pour fiables et ne sont pas filtrés. [vérifié 15/11]
- **L'isolement existe mais n'est pas activé par défaut** chez la plupart des outils. [vérifié 15/11]
- **Consensus des spécialistes** : la relecture humaine avant d'intégrer le code reste le dernier garde-fou fiable. Anthropic conseille de commencer les équipes par de la recherche et de la relecture, pas par de l'écriture : c'est l'écriture en parallèle qui pose problème. [vérifié 15/11]

**La veille extérieure confirme exactement les trois raisons de rejet du labo.**

---

## 3. Les options sur la table

Trois options, de la plus prudente à la plus ambitieuse. Elles ne s'excluent pas : on peut ouvrir une porte puis la suivante.

| Option | Ce que ça veut dire | Ce que ça change pour Martin | Risque principal |
|--------|---------------------|------------------------------|------------------|
| **A — Rien ne change** | Le duo JARVIS + Cursor reste tel quel ; on fixe seulement les déclencheurs qui rouvriraient le sujet | Rien | Le sujet revient chaque semaine sans réponse |
| **B — Porte basse : des IA qui lisent** | Plusieurs IA en parallèle, mais en lecture seule : chercher, relire, auditer (ex. Surveyor ou relecture de code outillés) | Des audits plus rapides et plus complets ; toujours rien n'est écrit sans lui | Consommation de crédits ; consigne piégée dans un fichier lu |
| **C — Écriture encadrée** | Plusieurs IA qui écrivent du code, chacune sur sa copie (worktree), avec fusion validée par Martin | Des chantiers qui avancent en parallèle ; plus de relecture à faire | Écrasements, dérive silencieuse, consommation forte, relecture « tampon » |

Hors table d'office (leçons du labo et de la veille) : toute IA qui fusionne ou publie seule, tout accès au-delà d'un dépôt précis, toute nouvelle clé payante.

---

## 4. Les trois questions de D209, pour le tour de table

1. **Quel besoin réel ?** Quel chantier de la Suite ou de la Cellule a souffert, ces dernières semaines, d'aller trop lentement à un seul agent ?
2. **Qu'est-ce que ça change au duo JARVIS et Cursor ?** Qui orchestre, qui relit, où passe la validation de Martin ?
3. **Quelles règles non négociables ?** Pour toute option retenue : périmètre de fichiers, isolement, validation humaine, coût, traçabilité.

Postes du tour de table (D209) : PRÉSIDENCE (écoute et tranche), NAVIGATION, PROSPECTIVE, SÉCURITÉ, CODE.

---

## 5. Points à vérifier avant ou pendant le tour de table

- Quotas réels du compte Claude Team de L'Étudiant (question à l'IT si l'option B ou C est retenue).
- Version de Cursor installée sur Mac Maison et Mac Bureau.
- Disponibilité de Claude Code sur le compte Team.

---

## Sources

- Documentation Claude Code, équipes d'agents : https://code.claude.com/docs/en/agent-teams
- Documentation Claude Code, coûts : https://code.claude.com/docs/en/costs
- Cursor 3.2 (avril 2026), /multitask et worktrees : https://doolpa.com/news/cursor-3-2-multitask-worktrees-multi-root-workspaces-april-24-2026
- Cursor 2.0, agents en parallèle : https://medium.com/towards-data-engineering/parallel-ai-agents-in-cursor-2-0-a-practical-guide-e808f89cffb9
- Risques des agents de code, « trio fatal » : https://www.stride.build/blog/security-risks-of-ai-coding-agents
- Défense contre l'injection dans les chaînes multi-agents : https://www.agentpatterns.ai/security/code-injection-multi-agent-defence/
- Sécurité multi-agents en entreprise : https://www.augmentcode.com/guides/multi-agent-ai-security-risks-compliance-fixes
- Retour d'expérience sur les équipes d'agents (octobre 2026) : https://andyleonard.blog/2026/10/experimenting-with-claude-code-experimental-agent-teams/

---

*TANDEM · premier temps · 15/11/2026 · fiche préparée par SETI pour le tour de table de l'Agence*
