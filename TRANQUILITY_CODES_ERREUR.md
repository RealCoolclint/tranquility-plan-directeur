# Tranquility Suite — Codes d'erreur
## Convention commune à toute la flotte · V1.2

*6 novembre 2026 · Règle posée par la PRÉSIDENCE en session VOXLOOP (aujourd'hui CAPCOM) · Validée en bloc le 06/11/2026 (D221) · V1.2 : VXL devenu CPC (D224) · Rangée dans `tranquility-plan-directeur`*

---

## Le principe

> Tout comportement prévu par le système, panne prévue comprise, s'affiche en clair pour un profane, avec un code de référence catalogué. On ne devine pas, on n'appelle pas le fabricant pour une panne simple. Seuls les vrais angles morts (bugs imprévus) échappent à la règle, par nature.

C'est le principe des codes d'erreur d'un système d'exploitation, appliqué à la Suite. Il prolonge la **Loi 3 du Workflow Captif** : tout écart est visible et traçable.

---

## Format

**`[PRÉFIXE]-[NNN]`** : 3 lettres propres à l'app, un tiret, 3 chiffres.

Exemple : `CPC-103`, `BKF-501`.

- Le message visible est en français simple, en majuscules (Design Reference), avec le code en mention discrète.
- Chaque app tient son catalogue `docs/[APP]_CODES.md` dans son propre repo : code, ce qu'on voit, ce qui se passe, que faire.
- Un code n'est jamais réattribué à un autre sens. Un code retiré reste dans le catalogue, marqué « retiré ».
- Martin peut demander à JARVIS n'importe quel code : JARVIS lit le catalogue de l'app concernée.

---

## Familles (premier chiffre, commun à toutes les apps)

| Famille | Domaine | Exemples |
|---|---|---|
| **1xx** | Liaison et réseau | serveur injoignable, Wi-Fi, session expirée |
| **2xx** | Poste de travail et périphériques | micro, caméra, disque, lecteur de cartes |
| **3xx** | Appareil et système | permission refusée par macOS ou iOS, fonction indisponible |
| **4xx** | Saisie et réglages | champ invalide, configuration incohérente |
| **5xx** | Fichiers et données | fichier introuvable, copie incomplète, somme de contrôle |
| **6xx** | Services tiers | GitHub, Monday, Resend, Netlify |
| **9xx** | Imprévu | `XXX-999` = erreur inconnue, toujours accompagnée de « PRÉVENEZ L'ADMIN » |

*CAPCOM utilise déjà 1xx, 2xx, 3xx, 4xx et 9xx dans ce sens.*

---

## Registre des préfixes (validé le 06/11/2026, D221)

| Préfixe | App | Statut |
|---|---|---|
| **BKF** | BackUpFlow | ✅ validé |
| **TRP** | Transporter | ✅ validé |
| **RVW** | Reviewer | ✅ validé |
| **MNF** | Manifest | ✅ validé |
| **LCH** | Launcher | ✅ validé (app en pause, D77) |
| **ARK** | ARK | ✅ validé |
| **ROV** | ROVER | ✅ validé |
| **CVN** | COVENANT | ✅ validé |
| **RBK** | READBACK | ✅ validé (remplace RDB, trop proche de RDV à l'oral) |
| **PLD** | PAYLOAD | ✅ validé |
| **RDV** | RENDEZVOUS | ✅ validé — couvre aussi SIGNAL, fonction de l'admin de RENDEZVOUS (D200) |
| **CDX** | CODEX | ✅ validé |
| **CPC** | CAPCOM *(ex-VOXLOOP, ex-préfixe VXL)* | ✅ en service (V0, 06/11/2026) |

*Apps en projet (Cargo, Hatch, logiciel de livraison, boîte à outils Premiere et ses modules, dont DOWNLINK, ex-CAPCOM) : préfixe attribué à la création de leur fiche produit. Toute nouvelle app entre dans ce registre en même temps que dans le registre de flotte.*

**Retirés à la validation (V1.1) :** CPT (CAPITAL, sorti de la Suite, D199) · SGN (SIGNAL, devenu une fonction de RENDEZVOUS, D200) · « Scripter » rayé des apps en projet (ancien nom de CODEX, déjà CDX) · RDB remplacé par RBK.

**Renommé en V1.2 (D224) :** VXL devient CPC (numéros inchangés), VOXLOOP ayant pris le nom CAPCOM. Le préfixe VXL n'est pas réattribué.

**Règle d'attribution :** 3 lettres en majuscules, uniques dans la flotte, lisibles à l'oral, sans collision avec un préfixe existant.

---

## Mise en œuvre

- **Nouvelle app :** le préfixe est attribué dans la fiche produit, et le catalogue est créé avec le premier message d'erreur.
- **Apps existantes :** pas de refonte en bloc. Chaque app adopte la convention au fil de ses chantiers (Loi 2 : une seule convention, appliquée progressivement mais sans exception).
- **Audit Surveyor :** la présence d'un catalogue et la conformité des messages entrent dans la grille.

---

*Tranquility Suite · Cellule Vidéo L'Étudiant · S'applique en complément du Workflow Captif et de la Design Reference*
