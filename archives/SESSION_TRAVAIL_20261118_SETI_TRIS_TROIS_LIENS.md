# Session de travail — 18 novembre 2026
## [SETI] Tri de trois liens (agentic-ai-starters, Mailflare, awesome-design-md)

*Session courte, ouverte directement par des liens collés : démarrage V2.1 non déroulé. Mac Maison.*

---

## Chantiers traités

### Tri flash de trois liens
Quatre liens collés sans commentaire, dont un en double (awesome-design-md), soit trois dépôts. Sources lues sur clone superficiel (README, LICENSE, date du dernier changement, liste des starters), sans rien installer ni exécuter. Sommaire du labo vérifié avant le tri (généré le 16/11, 83 fiches). Trois propositions validées telles quelles par PRÉSIDENCE :

| Piste | Statut | En bref |
|---|---|---|
| agentic-ai-starters (cporter202) | REJETÉ | Plans de construction d'agents IA commerciaux, textes seulement ; MIT, mais vitrine d'APIMesa (paiement à l'appel) et liens Apify affiliés : règle 13 ; quatrième dépôt de cet auteur au labo ; Agency Agents (À TESTER) couvre le besoin |
| Mailflare | REJETÉ | Suite de bureau auto-hébergée sur Cloudflare (mails sur domaine, agenda, stockage, IA) ; AGPL-3.0, v0.5.5 ; aucun besoin ouvert (Outlook en place) ; clé Cloudflare aux droits larges sur le domaine des mails de RENDEZVOUS et COVENANT ; idée retenue : candidat gratuit si un besoin de réception apparaît (déclencheur de Posta) |
| awesome-design-md (VoltAgent) | EN RÉSERVE | 84 fichiers DESIGN.md de sites connus ; MIT ; contenu inutile (identité d'autres marques), idée retenue : un DESIGN.md Tranquility tiré de la Design Reference, posé dans chaque repo ; à traiter avec le skill Design Reference de la fiche Vercel Skills |

### Création des fiches
Trois fiches courtes rédigées, montrées en entier, validées, puis créées par Cursor. Relecture de Cursor : quatre écarts relevés sans correction ; deux corrigés par un second prompt (marque [vérifié 18/11] manquante sur une puce, guillemets inutiles autour de `AGPL-3.0`) ; deux laissés tels quels (quatre puces au lieu de trois, précédents dans le labo ; fiche Vercel Skills restée au gabarit long, hors de cette session).

### Enregistrement
Un seul enregistrement, les trois fiches et le sommaire régénéré : 86 fiches lues, 0 alerte, commit `eaad94f` (repo `tranquility-rd`).

---

## Décisions actées

Aucune décision nouvelle (pas de D-number). Trois statuts tranchés par PRÉSIDENCE.

---

## Livrables produits

| Fichier / Élément | Nature | État |
|---|---|---|
| `fiches/RD_AGENTIC_AI_STARTERS_V1.md` | Fiche R&D | ✅ `eaad94f` |
| `fiches/RD_MAILFLARE_V1.md` | Fiche R&D | ✅ `eaad94f` |
| `fiches/RD_AWESOME_DESIGN_MD_V1.md` | Fiche R&D | ✅ `eaad94f` |
| `SOMMAIRE.md` | Sommaire régénéré | ✅ `eaad94f` |
| `TRANQUILITY_PLAN_DIRECTEUR_V5_154.md` | Plan Directeur | 🟡 À pousser |
| Ce récap | Récap | 🟡 À pousser |

État du labo : 86 fiches, 9 À TESTER, aucune EN TEST, 37 EN RÉSERVE, 3 ADOPTÉ, 37 REJETÉ.

---

## Commandes Terminal produites

```bash
# Mettre le labo à jour et l'ouvrir dans Cursor
cd ~/Documents/GitHub/tranquility-rd && git pull && cursor ~/Documents/GitHub/tranquility-rd
```

```bash
# Régénérer le sommaire et enregistrer les trois fiches
cd ~/Documents/GitHub/tranquility-rd && git pull && node scripts/generer-sommaire.js && git add fiches/RD_AGENTIC_AI_STARTERS_V1.md fiches/RD_MAILFLARE_V1.md fiches/RD_AWESOME_DESIGN_MD_V1.md SOMMAIRE.md && git commit -m "Fiches R&D : agentic-ai-starters (rejete), Mailflare (rejete), awesome-design-md (en-reserve)" && git push
```

---

## Pièges découverts

- [LABO R&D / SETI] La case « Déjà vu » d'awesome-design-md cite Vercel Skills mais pas Hallmark (EN RÉSERVE depuis le 16/11), dont l'idée retenue repose justement sur un DESIGN.md à la racine : la recherche par mots-clés dans les sources du projet n'a pas remonté la fiche, repérée seulement à la clôture en lisant les entrées SETI du Plan → avant d'écrire « Déjà vu », chercher aussi le terme central de la piste (ici DESIGN.md) dans les dernières entrées SETI du Plan Directeur, lu sur un clone du dépôt public ; récidive de l'entrée du 03/11 sur la case « Déjà vu ».

---

## Prochaines étapes

1. Audit Surveyor complet du ~20/11, en essai TANDEM (D285).
2. Préparer cet essai avec la séance de lecture d'Agency Agents (À TESTER, déclencheur arrivé).
3. Session de conception du skill Design Reference (fiche Vercel Skills) : y traiter ensemble Hallmark et awesome-design-md, et remettre la fiche Vercel Skills au gabarit court.

---

*Session du 18/11/2026 · SETI, labo R&D · Mac Maison*
