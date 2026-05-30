# Protocole Git — Mac Switching
## Tranquility Suite · Martin Pavloff

*Version 1.1 — 30 mai 2026*

---

## La règle d'or

> **Pull avant de toucher quoi que ce soit.**
> **Push avant de fermer le Mac.**
> Un oubli de push = une session perdue sur l'autre Mac.

---

## Dossier de travail — identique sur tous les Mac

```
~/Documents/GitHub/
```

Tous les repos actifs vivent dans ce dossier. Même structure, même emplacement, sur Mac Maison et Mac Bureau.

---

## Repos actifs — à cloner sur chaque nouveau Mac

```bash
cd ~/Documents/GitHub && git clone https://github.com/RealCoolclint/tranquility-plan-directeur && git clone https://github.com/RealCoolclint/tranquility-core && git clone https://github.com/RealCoolclint/Launcher && git clone https://github.com/RealCoolclint/Manifest && git clone https://github.com/RealCoolclint/Reviewer && git clone https://github.com/RealCoolclint/launcher-profiles
```

> À faire une seule fois par Mac. Ensuite, le protocole Pull/Push suffit.

---

## 🟢 DÉBUT DE SESSION — obligatoire

Avant de toucher quoi que ce soit dans Cursor ou Terminal :

```bash
cd ~/Documents/GitHub/NOM_DU_REPO && git pull
```

Exemples :

```bash
cd ~/Documents/GitHub/Launcher && git pull
```

```bash
cd ~/Documents/GitHub/Manifest && git pull
```

```bash
cd ~/Documents/GitHub/tranquility-plan-directeur && git pull
```

---

## 🔴 FIN DE SESSION — obligatoire

Avant de fermer le Mac ou de changer de machine :

```bash
cd ~/Documents/GitHub/NOM_DU_REPO && git add . && git commit -m "Description courte" && git push
```

Exemples :

```bash
cd ~/Documents/GitHub/Launcher && git add . && git commit -m "Fix bouton Installer + handler Resend" && git push
```

```bash
cd ~/Documents/GitHub/tranquility-plan-directeur && git add . && git commit -m "Plan Directeur V5.9" && git push
```

---

## ⚠️ Si tu as oublié de pusher sur l'autre Mac

Ne jamais forcer. Toujours résoudre proprement :

```bash
cd ~/Documents/GitHub/NOM_DU_REPO && git pull --rebase
```

Si conflit : appeler JARVIS avant de toucher quoi que ce soit.

---

## Cursor — intégration

Cursor lit le repo Git du dossier ouvert. Il peut committer et pusher depuis son panneau Source Control (icône branche, colonne gauche) — exactement comme VS Code.

**Workflow recommandé :**
- Le `git pull` de début de session → toujours en Terminal
- Les commits/push en cours de session → depuis Cursor (panneau Source Control) ou Terminal
- Le `git push` de fin de session → Terminal pour être sûr

---

## Repos dormants — à cloner si on y revient

```bash
cd ~/Documents/GitHub && git clone https://github.com/RealCoolclint/BackUpFlow
```

```bash
cd ~/Documents/GitHub && git clone https://github.com/RealCoolclint/Transporter
```

```bash
cd ~/Documents/GitHub && git clone https://github.com/RealCoolclint/ARK
```

```bash
cd ~/Documents/GitHub && git clone https://github.com/RealCoolclint/tranquility-suite
```

---

## Checklist mentale — avant de changer de Mac

- [ ] J'ai pushé tous les repos que j'ai modifiés
- [ ] Mon message de commit décrit ce que j'ai fait
- [ ] Je n'ai pas de fichiers non suivis importants (`git status` pour vérifier)

```bash
cd ~/Documents/GitHub/NOM_DU_REPO && git status
```

---

## Hazel — Mac Maison uniquement (martinpavloff)

Hazel tourne en permanence sur Mac Maison et intercepte automatiquement les fichiers dès qu'ils arrivent dans ~/Downloads. Règles actives vérifiées le 30 mai 2026 :

| Règle | Condition | Destination |
|-------|-----------|-------------|
| MarkDowns | Extension .md | ~/Downloads/Markdowns/ |
| Claude Skills | Extension .skill | ~/Downloads/Skills/ |
| Tranquility Files | Nom contient TRANQUILITY, APOLLO, GEMINI, MERCURY, Backupflow, ARK, Reviewer, Transporter, Launcher, Covenant | ~/Downloads/Tranquility files/ |
| Vidéos | Extension vidéo | ~/Downloads/Vidéos/ |
| Images | Extension image | ~/Downloads/Images/ |
| PDF | Extension .pdf | ~/Downloads/PDF/ |

Conséquence directe pour JARVIS : quand un fichier est téléchargé depuis Claude sur Mac Maison, il n'est jamais dans ~/Downloads/ directement. Il faut chercher dans le bon sous-dossier selon son extension ou son nom.

Commande de secours si on ne sait pas où Hazel a mis un fichier :
find ~/Downloads -name "NOM_DU_FICHIER" 2>/dev/null

Mac Bureau (mpavloff) : pas de Hazel confirmé — les fichiers restent dans ~/Downloads/ directement.

---

*Protocole Git Mac Switching · Tranquility Suite · V1.0 · 30 mai 2026*
*S'applique sur Mac Maison (martinpavloff) et Mac Bureau (mpavloff)*
