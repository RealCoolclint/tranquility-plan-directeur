# TRANQUILITY_MACHINES.md
## Référence des machines de travail — Cellule Vidéo L'Étudiant

> À jour au 4 juillet 2026 — réécriture complète (remplace la version du 28 mars 2026, obsolète depuis l'abandon du SSD le 30/05/2026).

---

## ⚠️ Historique — pourquoi ce document a été entièrement réécrit

**Le SSD externe BACKUP PRO n'est plus utilisé, depuis le 30 mai 2026.**

Décision actée en session (`SESSION_TRAVAIL_20260530_GIT_TRUEME.md`) : abandon du workflow SSD, bascule vers un workflow 100% GitHub. Chaque Mac clone les repos actifs localement, avec `git pull` en début de session et `git push` en fin de session (protocole détaillé dans `PROTOCOLE_GIT_MAC_SWITCHING.md`).

**Ce que cette correction du 4 juillet 2026 répare :** la décision du 30 mai n'avait jamais été répercutée dans ce document, ni dans les instructions permanentes du projet Claude — qui continuaient de mentionner le SSD comme point commun aux machines, plus d'un mois après son abandon. Un recap de session documente une décision ; il ne met pas à jour, à lui seul, les documents de référence qui en dépendent. C'est cet écart précis qui est corrigé ici.

**Mécanique retenue pour éviter que ça se reproduise :** toute décision d'infrastructure qui touche un document fondateur (ce fichier, le Plan Directeur, les specs) doit se traduire par une réécriture explicite de ce document dans la foulée — pas seulement par un recap de session qui la mentionne au passage. Le recap raconte ce qui s'est passé ; le document fondateur doit rester la vérité utilisable telle quelle, sans avoir à remonter l'historique des sessions pour la retrouver.

---

## Dossier de travail commun — GitHub, pas de disque physique

Le point commun entre les trois machines n'est plus un disque externe, mais un dossier local identique sur chaque Mac, alimenté par clone Git :

```
~/Documents/GitHub/
```

Tous les repos actifs de la Tranquility Suite vivent à cet emplacement, sur les trois machines. Le compte GitHub est unique : **RealCoolclint**.

**Règle d'or (voir `PROTOCOLE_GIT_MAC_SWITCHING.md`) :**
> Pull avant de toucher quoi que ce soit.
> Push avant de fermer le Mac.
> Un oubli de push = une session perdue sur l'autre Mac.

---

## Machine 1 — Mac Maison

| Propriété | Valeur |
|-----------|--------|
| **Nom** | Mac Maison |
| **Username** | `martinpavloff` |
| **Hostname** | `MBP-de-User` |
| **Home** | `/Users/martinpavloff/` |
| **Repos** | `/Users/martinpavloff/Documents/GitHub/` |
| **Hazel** | Actif — voir table de routage ci-dessous |

---

## Machine 2 — Mac Bureau

| Propriété | Valeur |
|-----------|--------|
| **Nom** | Mac Bureau |
| **Username** | `mpavloff` |
| **Hostname** | *(à compléter)* |
| **Home** | `/Users/mpavloff/` |
| **Repos** | `/Users/mpavloff/Documents/GitHub/` |
| **Hazel** | Actif — même routage que Mac Maison |
| **Particularité** | Le repo `rendezvous-profiles-private` n'est pas toujours cloné ici — vérifier et `gh repo clone` si absent |

---

## Machine 3 — Mac Studio

| Propriété | Valeur |
|-----------|--------|
| **Nom** | Mac Studio |
| **Username** | `studiovideo` |
| **Hostname** | *(à compléter)* |
| **Home** | `/Users/studiovideo/` |
| **Repos** | `/Users/studiovideo/Documents/GitHub/` |
| **Hazel** | Non confirmé actif |
| **Particularité** | Poste partagé — voir mode `ephemeral` dans `SPEC_TECHNIQUE_RENDEZVOUS_V1_2.md` pour la gestion de session |

---

## Hazel — règles de routage (Mac Maison et Mac Bureau)

Les fichiers téléchargés depuis Claude ne tombent jamais directement dans `~/Downloads/` sur ces deux machines — Hazel les trie automatiquement :

| Règle | Condition | Destination |
|-------|-----------|-------------|
| MarkDowns | Extension `.md` | `~/Downloads/Markdowns/Tranquility files/` |
| Claude Skills | Extension `.skill` | `~/Downloads/Skills/` |
| Vidéos | Extension vidéo | `~/Downloads/Vidéos/` |
| Images | Extension image | `~/Downloads/Images/` |
| PDF | Extension `.pdf` | `~/Downloads/PDF/` |

Commande de secours si un fichier semble introuvable :
```bash
find ~/Downloads -name "NOM_DU_FICHIER" 2>/dev/null
```

---

## Convention pour les sessions JARVIS

Au début de chaque session, Martin indique sur quelle machine il travaille. JARVIS adapte tous les chemins en conséquence — et ne demande jamais si un SSD est présent, cette notion n'existe plus dans le workflow.

| Machine | Phrase de référence |
|---------|---------------------|
| Mac Maison | "Je suis sur le Mac maison" |
| Mac Bureau | "Je suis sur le Mac bureau" |
| Mac Studio | "Je suis sur le Mac studio / studiovideo" |

---

## Convention pour les prompts Cursor

Chaque prompt Cursor qui référence un chemin absolu doit utiliser la structure suivante (à adapter selon la machine active) :

```
# Machines de travail
# Mac Maison  → username: martinpavloff | home: /Users/martinpavloff/
# Mac Bureau  → username: mpavloff      | home: /Users/mpavloff/
# Mac Studio  → username: studiovideo   | home: /Users/studiovideo/
# Repos       → ~/Documents/GitHub/ (commun aux trois machines, un clone local par Mac)
```

**Rappel — règle du 4 juillet 2026 :** quand deux prompts Cursor consécutifs ne portent pas sur le même repo, toujours intercaler `cursor ~/Documents/GitHub/[NOM-DU-REPO]` entre les deux, dans un bloc Terminal séparé.

---

*TRANQUILITY_MACHINES.md — Ressources JARVIS — Cellule Vidéo L'Étudiant*
*Créé le 28 mars 2026 · Réécrit intégralement le 4 juillet 2026 (abandon SSD du 30/05/2026 enfin répercuté)*
