# Récap de session — [RENDEZVOUS] Séance SÉCURITÉ D211 (partielle) et Authentification ADMIN, étape 3

*16 novembre 2026, matinée (environ 8 h 30 → 13 h), Mac Maison*
*Plan Directeur V5.149 → V5.150 · Carnet de pièges V91 → V92 · Décisions D286 → D290*

---

## Démarrage

- Question d'ouverture de PRÉSIDENCE : « RENDEZVOUS est-il bien le chantier prioritaire ? » Réponse : oui (D211, D205), sous réserve de la séance SÉCURITÉ D211, prévue le 13/11 et non tenue. Elle est traitée en premier.
- Plan Directeur lu sur GitHub (V5.149) ; les ressources du projet Claude dataient de juillet (V5.90) et n'ont pas servi de base.
- Incident JARVIS : appel à l'API GitHub anonyme au démarrage (quota dépassé), quatrième occurrence malgré les entrées du Carnet. Noté au Carnet V92.

## Partie 1 — Séance SÉCURITÉ D211 sur l'ancien registre des profils (partielle)

- Inventaire en lecture seule des dépôts du Mac Maison : seule l'app Launcher lit l'ancien registre et son coffre de clés chiffré ; BackUpFlow et ARK ne sont pas clonés sur ce Mac, l'inventaire reste donc incomplet sur le point le plus sensible (BackUpFlow lit les profils au quotidien).
- Lecture du module de coffre de Launcher : mécanisme conforme au diagnostic du Carnet (détail au Carnet, dépôt privé).
- Vérification locale, sans que le mot de passe soit jamais affiché ni enregistré : le mot de passe administrateur du coffre est long, d'origine aléatoire, et absent de tous les fichiers texte des dépôts et des Téléchargements du Mac Maison.
- Verdict SÉCURITÉ : risque d'ouverture du coffre jugé faible ; l'alerte passe d'« urgence » à « ménage à faire proprement ». Le trombinoscope (coordonnées de collègues) reste exposé tant qu'il n'est pas retiré.
- **D286** : séance arrêtée par PRÉSIDENCE (option B), plan en trois points (voir Décisions).

## Partie 2 — Authentification ADMIN, étape 3 : changer le secret depuis l'admin

### Construction

| Marche | Contenu | Commit |
|---|---|---|
| 1 (+ 1 bis, 1 ter) | La serrure lit le secret dans un fichier d'empreinte du dépôt privé, avec repli sur la variable Netlify uniquement si l'absence du fichier est prouvée ; une seule lecture GitHub par requête ; aucune information sur la source sans pièce d'identité ; premiers codes RDV | `rendezvous-proxy` `2f1d1cf` (publié et testé) |
| 2 (+ 2 bis, 2 ter) | Nouvelle fonction `admin-change-secret` : session + secret actuel retapé + nouveau secret deux fois ; bcrypt coût 12 ; règle de D288 ; nouvelle session rendue, anciennes coupées | `9786f4d`, `1ebfb7a`, `a6cf1a6` |
| 3 (+ 3 bis) | Bouton SÉCURITÉ dans la barre de l'admin, panneau latéral à trois champs, messages avec codes, `admin.js?v=6` | `RENDEZVOUS` `046479b` |
| Catalogue | `docs/RENDEZVOUS_CODES.md` (11 codes RDV) | `RENDEZVOUS` `0b18140` |

Publication conjointe serveur puis écran (règle de D212) : `rendezvous-proxy` `main` = `a6cf1a6`, `RENDEZVOUS` `main` = `0b18140`. Les deux dépôts restent sur la branche locale `auth-admin`, alignée sur `main`.

### Trois pièges d'enfermement dehors déjoués avant la mise en ligne

1. **Badge expiré pris pour un tiroir vide** (signalé par Cursor) : GitHub répond « introuvable » aussi bien pour un fichier absent que pour un jeton sans droit. Parade : l'absence n'est admise que si le serveur prouve qu'il sait lire le contenu du dépôt.
2. **Espace invisible** (repéré par JARVIS à la lecture de l'écran) : la connexion retire les espaces en bordure, le guichet de changement ne le faisait pas. Parade : refus des espaces en bordure.
3. **Accents** (signalé par Cursor) : le secret voyage dans un en-tête HTTP qui ne transporte pas les caractères accentués. Parade : nouveau secret limité aux caractères du clavier sans accent.

### Tests en production (Opera et Safari)

- Marche 1 : session existante, connexion neuve, mauvais secret → OK.
- Étape complète : mauvais secret actuel → RDV-401 ✓ ; changement réel → message de succès ✓ ; session propre conservée après rechargement ✓ ; ancien secret refusé dans Safari ✓ ; nouveau secret accepté dans Safari ✓.
- **Test du témoin (coupure des autres sessions) invalidé** : les deux fenêtres privées d'Opera partageaient le même stockage, le témoin a donc reçu la nouvelle session. Le code a été relu (comparaison de la marque correcte) et testé en simulation par Cursor ; le test réel est reporté au prochain changement de secret, témoin dans un autre navigateur.
- Nouveau secret généré par une commande Terminal (tirage aléatoire, jamais affiché), rangé par PRÉSIDENCE dans Bitwarden ; l'ancien conservé comme clé de secours, sa note décrit la procédure.

## Décisions

| N° | Décision |
|---|---|
| **D286** | Séance SÉCURITÉ D211 tenue en partie (16/11/2026) : risque du coffre jugé faible ; plan en trois points : (1) renouvellement des clés du coffre, sans urgence, la clé GitHub d'abord ; (2) retrait des coordonnées et fermeture de l'ancien registre, après lecture de BackUpFlow sur le Mac Bureau, dans le chantier B24 (D190) ; (3) JURIDIQUE : décider s'il faut informer le délégué à la protection des données de L'Étudiant. Reprise immédiate de RENDEZVOUS (option B). |
| **D287** | Architecture de l'étape 3 : l'empreinte du secret admin vit dans un fichier à part du dépôt privé (option B, le registre des profils n'est jamais réécrit). La variable Netlify devient une clé de secours, valable seulement si ce fichier est absent ; jamais de repli si le fichier est illisible ou si GitHub ne répond pas. Procédure de secours documentée dans Bitwarden. |
| **D288** | Règle du secret admin (standard de PRÉSIDENCE, une lettre ajoutée sur recommandation) : 8 à 64 caractères, au moins une lettre, un chiffre et un symbole ; caractères du clavier sans accent ; pas d'espace au début ni à la fin. |
| **D289** | Le changement de secret se fait par un bouton SÉCURITÉ dans la barre du haut de l'admin, qui ouvre un panneau latéral (option A, contre une section permanente ou un onglet). Le panneau pourra accueillir Touch ID (étape 5). |
| **D290** | Premiers codes RDV en service (101, 102, 401 à 405, 501, 601, 602, 901) et catalogue `docs/RENDEZVOUS_CODES.md` dans le dépôt RENDEZVOUS ; les anciens messages de RENDEZVOUS seront codés au fil de l'eau. |

## Liste de polish et dettes ouvertes

- Durée de session admin (7 jours) écrite à deux endroits du serveur.
- Police Open Sans déclarée avant Lato dans les champs de saisie de tout le site (écart Design Reference ancien).
- Transition des toasts de l'admin en durée écrite en dur (écart Design Reference ancien).
- Anciens messages de RENDEZVOUS sans code RDV.
- Fichiers `.DS_Store` dans `rendezvous-proxy`, à faire ignorer.
- Fichiers égarés à la racine de `~/Documents/GitHub` du Mac Maison (anciens Plan, Carnet, registre, récap).
- Coffre de Launcher : un échec de déchiffrement se comporte comme un coffre vide, sans message (règle des messages lisibles).
- Test réel du témoin de session à refaire au prochain changement de secret.
- D286 : les trois points du plan.

## Suite

Étape 4 de l'authentification ADMIN : secret oublié par lien e-mail (Resend, durée de validité, usage unique), puis étape 5 (Touch ID). Audit Surveyor complet prévu vers le 20/11 (essai TANDEM, D285).
