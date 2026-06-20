# Registre des activités de traitement — RGPD
## L'Étudiant · Cellule Vidéo · Tranquility Suite

*Document établi conformément à l'article 30 du RGPD*
*Responsable de traitement : L'Étudiant*
*Tenu par : Martin Pavloff, Directeur Cellule Vidéo*
*Version 1.1 — 20 juin 2026*

---

## INFORMATIONS GÉNÉRALES

| | |
|---|---|
| **Organisme** | L'Étudiant |
| **Forme juridique** | SASU |
| **Effectif** | < 250 salariés |
| **Responsable de traitement** | L'Étudiant — représenté par Martin Pavloff |
| **Fonction** | Directeur Cellule Vidéo |
| **Email de contact** | mpavloff@letudiant.fr |
| **DPO désigné** | Non — non obligatoire (< 250 salariés, traitement non à grande échelle de données sensibles) |
| **Date de création du registre** | 18 juin 2026 |
| **Dernière mise à jour** | 20 juin 2026 |

---

## FICHE DE TRAITEMENT N°1

### Gestion des accès aux outils internes de production vidéo (Tranquility Suite — RENDEZVOUS)

---

### 1. IDENTIFICATION DU TRAITEMENT

| | |
|---|---|
| **Nom du traitement** | Gestion des accès — Tranquility Suite |
| **Référence interne** | TREAT-001 |
| **Outil support** | RENDEZVOUS (portail web interne) |
| **Date de création** | 18 juin 2026 (conception) — lancement prévu T3 2026 |
| **Responsable opérationnel** | Martin Pavloff |
| **Nature du traitement** | Non occasionnel — traitement récurrent et permanent |

---

### 2. FINALITÉS DU TRAITEMENT

**Finalité principale :**
Gérer les droits d'accès des collaborateurs de L'Étudiant aux outils internes de la Cellule Vidéo (suite logicielle Tranquility). Permettre l'identification des utilisateurs autorisés et l'attribution de niveaux d'accès adaptés à leur rôle.

**Finalités secondaires :**
- Tracer les consentements et horodatages liés aux accès accordés
- Notifier les demandes d'accès et les validations par email
- Maintenir un historique d'audit des activations et désactivations de profils
- Assurer la révocation rapide des accès en cas de départ ou de changement de rôle

**Ce traitement n'est pas utilisé pour :**
- Le suivi de l'activité individuelle des collaborateurs
- L'évaluation ou la notation des employés
- La prise de décision automatisée à portée individuelle

---

### 3. BASE LÉGALE

| | |
|---|---|
| **Base légale retenue** | Intérêt légitime du responsable de traitement (article 6.1.f RGPD) |
| **Justification** | L'Étudiant a un intérêt légitime à gérer et sécuriser les accès à ses outils internes de production. Ce traitement est nécessaire à l'exercice de l'activité professionnelle. Il ne porte pas atteinte de manière disproportionnée aux droits et libertés des personnes concernées, qui sont des collaborateurs dans un cadre professionnel. |
| **Pourquoi pas le consentement** | En contexte de relation employeur/employé, le consentement n'est pas librement donné au sens RGPD — l'intérêt légitime est la base légale la plus robuste et adaptée. |

---

### 4. PERSONNES CONCERNÉES

| Catégorie | Description | Volume estimé |
|---|---|---|
| N1 — Opérateurs | Membres de la Cellule Vidéo — usage quotidien des outils | ~10 personnes |
| N2 — Périphériques | Collaborateurs touchant à la vidéo par ricochet | ~20 personnes |
| N3 — Observateurs | Direction, IT, développeurs — accès supervision | ~10 personnes |
| N4 — Institutionnels | Juridique, RH, direction générale — vitrine uniquement | ~10 personnes |
| **Total estimé** | | **~50 personnes** (capacité maximale : 120) |

**Population concernée :** exclusivement des collaborateurs de L'Étudiant (salariés, alternants, prestataires internes). Aucun tiers externe.

---

### 5. DONNÉES PERSONNELLES TRAITÉES

#### Données collectées et conservées

| Donnée | Justification | Sensibilité |
|---|---|---|
| Prénom | Identification dans les outils — affichage interface | Standard |
| Nom de famille | Identification administrative à l'inscription + notification admin (email RENDEZVOUS) | Standard |
| Email professionnel (@letudiant.fr) | Authentification lien magique + notifications | Standard |
| Rôle déclaré dans l'entreprise | Validation de la légitimité d'accès | Standard |
| Rapport déclaré à la vidéo | Critère de filtrage à l'inscription | Standard |
| Niveau d'accès (N1/N2/N3/N4) | Attribution des droits applicatifs | Standard |
| Statut du profil (pending/active/inactive/deleted) | Gestion du cycle de vie | Standard |
| Horodatage consentement | Traçabilité RGPD | Standard |
| Date de création / activation / désactivation | Audit et conformité | Standard |
| Type de poste (bureau/perso/partagé) — N1 uniquement | Configuration daemon Launcher | Standard |

#### Données NON collectées

| Donnée | Raison de l'exclusion |
|---|---|
| Numéro de téléphone | Non requis pour le traitement |
| Données RH (contrat, salaire, etc.) | Hors périmètre |
| Géolocalisation | Non requis |
| Données de navigation dans les outils | Non collectées à ce stade |
| Données biométriques | Non collectées |

**Principe de minimisation respecté :** seules les données strictement nécessaires à la finalité sont collectées.

---

### 6. DESTINATAIRES DES DONNÉES

| Destinataire | Nature | Données transmises | Localisation |
|---|---|---|---|
| Martin Pavloff | Responsable opérationnel interne | Toutes (admin) | France |
| Resend | Sous-traitant — service d'envoi email transactionnel | Email, prénom, nom, rôle déclaré, lien vidéo (notification admin — nouvelle inscription pending) | USA — DPA disponible |
| GitHub (Microsoft) | Sous-traitant — hébergement des fichiers de profils | Profils complets (repo privé) + profils allégés (repo public) | USA — DPA + clauses contractuelles types |
| Netlify | Sous-traitant — hébergement proxy backend | Transit des données lors des écritures | USA — DPA disponible |

**Aucune communication à des tiers non listés ci-dessus.**
**Aucune vente ou partage commercial des données.**

---

### 7. TRANSFERTS HORS UNION EUROPÉENNE

| Sous-traitant | Pays | Garantie encadrant le transfert |
|---|---|---|
| GitHub (Microsoft) | USA | Clauses contractuelles types (CCT) approuvées par la Commission européenne + Data Processing Agreement (DPA) Microsoft |
| Resend | USA | Data Processing Agreement (DPA) Resend + Clauses contractuelles types |
| Netlify | USA | Data Processing Agreement (DPA) Netlify + Clauses contractuelles types |

**Action requise :** conserver les DPA signés avec chaque sous-traitant dans les archives de L'Étudiant.

---

### 8. DURÉES DE CONSERVATION

| Donnée | Durée de conservation | Justification |
|---|---|---|
| Profil actif | Durée d'activité dans l'outil | Nécessité opérationnelle |
| Profil désactivé — données fonctionnelles | 30 jours (délai de grâce avant suppression définitive) | Possibilité de réactivation en cas d'erreur |
| Horodatage consentement + dates d'audit | Durée d'activité + 1 an après désactivation | Obligations de traçabilité RGPD |
| Données supprimées | Suppression atomique immédiate des deux fichiers (profiles-public + profiles-private) | Article 17 RGPD — droit à l'effacement |

**Procédure de suppression :** la désactivation d'un profil déclenche automatiquement la suppression des données sensibles dans les deux fichiers de stockage (opération atomique). L'identifiant révoqué est ajouté à une liste de révocation (denylist) pour empêcher toute réutilisation du token.

---

### 9. MESURES DE SÉCURITÉ

#### Mesures techniques

| Mesure | Description |
|---|---|
| Séparation des données | Données sensibles (email, nom, RGPD) dans un repo GitHub **privé** — données non sensibles dans un repo public allégé |
| Chiffrement en transit | HTTPS obligatoire sur toutes les communications (GitHub Pages, Netlify, API) |
| Authentification sans mot de passe | Lien magique par email — pas de mot de passe stocké |
| Tokens à durée limitée | JWT signés HMAC SHA-256 — durée courte (4h) — renouvelables |
| Révocation d'urgence | Denylist CDN versionnée — vérifiée au démarrage des apps même hors ligne |
| Accès admin unique | Back-office réservé à Martin Pavloff — token de niveau ADMIN distinct |
| Proxy dédié | Netlify Function dédiée RENDEZVOUS — seul point d'écriture autorisé sur les profils |
| PAT GitHub sécurisé | Token d'accès GitHub stocké dans les variables d'environnement Netlify — jamais dans le code |

#### Mesures organisationnelles

| Mesure | Description |
|---|---|
| Accès par défaut minimal | Principe de moindre privilège — apps invisibles si non autorisées |
| Validation admin obligatoire | Aucun accès accordé sans validation manuelle de Martin Pavloff |
| Traçabilité des opérations | Toute modification de profil est horodatée et versionnée via Git |
| Suppression atomique | Désactivation = suppression simultanée dans les deux fichiers — pas de données orphelines |
| Revue périodique | Revue annuelle des profils actifs recommandée |

---

### 10. DROITS DES PERSONNES CONCERNÉES

Les personnes concernées disposent des droits suivants, exercés par email auprès de Martin Pavloff (mpavloff@letudiant.fr) :

| Droit | Modalité d'exercice | Délai de réponse |
|---|---|---|
| **Droit d'accès** (art. 15) | Email à mpavloff@letudiant.fr | 1 mois maximum |
| **Droit de rectification** (art. 16) | Email à mpavloff@letudiant.fr | 1 mois maximum |
| **Droit à l'effacement** (art. 17) | Email à mpavloff@letudiant.fr — suppression atomique via back-office | 1 mois maximum |
| **Droit d'opposition** (art. 21) | Email à mpavloff@letudiant.fr | 1 mois maximum |
| **Droit à la limitation** (art. 18) | Email à mpavloff@letudiant.fr | 1 mois maximum |
| **Droit à la portabilité** (art. 20) | Sur demande — export JSON du profil | 1 mois maximum |

**Information des personnes :** une mention d'information RGPD est intégrée au formulaire d'inscription dans RENDEZVOUS. Le consentement est recueilli via une case à cocher obligatoire, horodatée et tracée.

---

### 11. ANALYSE DE RISQUE SIMPLIFIÉE

| Risque | Probabilité | Impact | Mesure de mitigation |
|---|---|---|---|
| Accès non autorisé aux profils privés | Faible | Élevé | Repo privé GitHub + PAT sécurisé + proxy dédié |
| Fuite email collaborateur | Faible | Moyen | Données sensibles jamais dans le repo public |
| Usurpation d'identité (token volé) | Faible | Élevé | Tokens courts + denylist + révocation immédiate |
| Perte de données | Très faible | Moyen | Versionnage Git — historique conservé |
| Non-respect droit à l'effacement | Faible | Élevé | Suppression atomique automatique à désactivation |

**Analyse d'impact (AIPD) requise ?** Non — le traitement ne porte pas sur des données sensibles au sens de l'article 9 RGPD, ne concerne pas un large volume de personnes, et ne comporte pas de décision automatisée à portée individuelle.

---

### 12. SOUS-TRAITANTS — CONTRATS

| Sous-traitant | Contrat de sous-traitance | DPA disponible | Lien |
|---|---|---|---|
| GitHub (Microsoft) | Conditions générales GitHub + DPA | Oui | https://github.com/customer-terms |
| Resend | CGU Resend + DPA | Oui | https://resend.com/legal/dpa |
| Netlify | CGU Netlify + DPA | Oui | https://www.netlify.com/legal/data-processing-agreement |

**Action Martin :** vérifier que L'Étudiant a bien accepté les DPA de chaque sous-traitant et conserver les confirmations dans les archives légales.

---

## HISTORIQUE DES MISES À JOUR

| Version | Date | Modifications |
|---|---|---|
| V1.0 | 18/06/2026 | Création — traitement RENDEZVOUS (gestion accès Tranquility Suite) |
| V1.1 | 20/06/2026 | Correction : le nom de famille était listé par erreur en « donnée NON collectée » alors que `submit-inscription.js` le requiert depuis l'origine — déplacé en donnée collectée. Mise à jour du périmètre Resend (section 6) : la notification admin R4 transmet désormais email, prénom, nom, rôle déclaré et lien vidéo — au lieu de email + prénom uniquement. |

*Ce registre doit être mis à jour à chaque modification substantielle du traitement : nouveau sous-traitant, nouvelle catégorie de données, changement de base légale, modification des durées de conservation.*

---

## NOTE À AUDREY WEISS

Ce document constitue le registre des activités de traitement de la Tranquility Suite, conformément à l'article 30 du RGPD.

**Points d'attention pour validation :**

1. **Base légale — intérêt légitime** : le choix de l'intérêt légitime plutôt que le consentement est justifié par le contexte employeur/employé. À valider avec le service juridique si L'Étudiant a une position institutionnelle différente sur ce point.

2. **Sous-traitants américains** : GitHub, Resend et Netlify sont des entreprises américaines. Les transferts sont encadrés par des clauses contractuelles types. À vérifier que L'Étudiant a bien formalisé ces relations de sous-traitance.

3. **Mention d'information** : une mention d'information RGPD sera intégrée au formulaire d'inscription de RENDEZVOUS. Elle devra être validée avant la mise en production (prévue T3 2026).

4. **Revue annuelle** : ce registre doit être revu annuellement ou à chaque modification substantielle du traitement.

5. **Mise à jour V1.1 (20/06/2026)** : correction du statut du nom de famille (collecté depuis l'origine, mal classé en V1.0) et précision du périmètre des données transmises à Resend pour les notifications admin. Aucun changement de base légale ni de nouveau sous-traitant — la correction est documentaire, pas un changement de traitement.

*Document produit par Martin Pavloff — Cellule Vidéo L'Étudiant — 18 juin 2026*
*Mis à jour le 20 juin 2026*
*Pour toute question : mpavloff@letudiant.fr*

---

*Registre des activités de traitement · V1.1 · L'Étudiant · Tranquility Suite · 20 juin 2026*
*Établi conformément à l'article 30 du RGPD · Tenu par Martin Pavloff*
