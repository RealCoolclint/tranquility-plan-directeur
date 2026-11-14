# SESSION DE TRAVAIL — 14/11/2026 (soir) — [CAPCOM] Construction de la V2, Lot 4 : QR code de connexion — Lot 4 terminé

*Mac Maison · Plan Directeur V5.143 → V5.144 · Carnet V86 → V87 · Décisions D271 → D274 · version de l'app V2.14.11.26 (inchangée, D274) · catalogue CPC V0.6*

---

## 1. Démarrage

- **Mac Maison** (`martinpavloff`), session ouverte le 14/11 vers 17 h 20, close vers 18 h 30, juste après la clôture du Lot 3.
- Plan lu sur un clone du dépôt public (`1dd1ac5`, **V5.143**) avec le récap du Lot 3, partie 2 ; aucune session intercalée : numérotation des décisions à partir de **D271**.
- `git pull` de `capcom` (`c1c3f4c`) et de `tranquility-carnet-pieges` (V86) ; **radar court réel** (31 dépôts) : aucune alerte nouvelle. Alertes connues inchangées : CAPCOM hors RENDEZVOUS (assumé en construction), pointeur LFS de `launcher-tray@2x.png`, deux versions de `patch-transporter.png`, dépôt des instructions JARVIS figé depuis le 05/07, audit complet attendu vers le 20/11. Verdict : on peut y aller. SETI : aucun signal.
- Lecture de `server.js` (adresses, fichiers servis, aiguillage des messages), `regie.html` (en-tête, fenêtre micro, clavier, Échap) et `package.json` avant le premier prompt.

## 2. Placement des options son (D271)

Trois options : A options son tout de suite, B QR code d'abord puis options son puis studio, C QR code puis studio puis options son. **B retenue** : le QR est petit, sans risque et indispensable au test studio ; les options son ouvrent le cœur du système et arrivent sur une base stable ; un seul passage au studio teste tout. Recommandation de JARVIS du 07/11 (options son avant le Lot 4) révisée.

## 3. Lot 4 — QR code

- **4.1 serveur** (`4d848b8`, `server.js` seul) : nouveau message réservé à la régie `adresse-demander`, réponse `adresse` avec les URL d'écoute **relues à chaque demande** (rien en cache, le QR suit un changement de réseau) ; adresses triées : interfaces `en` (Wi-Fi et Ethernet) d'abord, autres ensuite, tunnels et VPN en dernier, privées devant, `169.254` écartées, sans doublon ; même ordre pour les lignes « Écoute : » du démarrage. Contrôle par comparaison : conforme. Au test, une seule adresse, `192.168.1.89` : **l'adresse du câble**, le Mac de Martin ayant le Wi-Fi coupé (remarque de PRÉSIDENCE : ce qui compte est le même réseau, pas le même Wi-Fi).
- **4.2 outil QR** (`b859750`, D272) : `qrcode-generator` 2.0.4 (Kazuhiko Arase, MIT, aucune dépendance) récupéré par `npm pack` dans un dossier jetable, **empreinte SHA-256 vérifiée** avant copie, déposé sous `public/qrcode-generator-2.0.4.js` (nom avec version). Rien installé sur le Mac, `package.json` inchangé, marche sans Internet, sécurité de la page (CSP) inchangée.
- **4.3 fenêtre** (`2262cc2`, `regie.html` seul, D273) : bouton **QR CODE** dans l'en-tête ; appel **AUCUN TÉLÉPHONE CONNECTÉ · AFFICHER LE QR CODE** au-dessus du pupitre, visible seulement sans aucune fiche ; fenêtre **QR CODE DE CONNEXION** sur le modèle de « ACTIVER LE MICRO ? » : QR sur carré blanc (D232), consigne « CONNECTEZ LE TÉLÉPHONE AU MÊME RÉSEAU QUE LA RÉGIE, PUIS SCANNEZ », adresse courte en minuscules, AUTRE ADRESSE au-delà d'une adresse, compteur en direct, AFFICHER EN GRAND / RÉDUIRE, FERMER, Échap, CPC-107 et CPC-108 ; raccourcis d'antenne actifs fenêtre ouverte. **Défaut trouvé au test** : en grand format, RÉDUIRE et FERMER étaient poussés sous l'écran (QR à taille fixe) ; corrigé avant l'enregistrement (le QR prend la place restante). Test sur iPhone : tout OK (QR lu, compteur en direct, grand format, sortie au clic et à Échap, antenne fenêtre ouverte). Titre du commit avec la coquille « RESUIRE » (laissé tel quel, commit publié).
- **4.4 catalogue V0.6** (`666138f`) rédigé par JARVIS : CPC-107 (AUCUN RÉSEAU) et CPC-108 (ADRESSE INDISPONIBLE), section « Fenêtre QR CODE DE CONNEXION », « réseau » au lieu de « Wi-Fi » (famille 1xx, CPC-101), dépannage « le QR se lit mais la page ne s'ouvre pas » (réseaux séparés). Déposé en le reconnaissant à son contenu ; 21 ajouts, 4 retraits, conforme à l'attendu. Version inchangée (D274).
- **Lot 4 terminé.**

## 4. Décisions

| N° | Objet |
|---|---|
| **D271** | Ordre après le Lot 3 (tranche D239) : Lot 4 QR code, puis lot options son, puis un seul passage au studio pour tout tester |
| **D272** | Outil QR : `qrcode-generator` 2.0.4 (MIT, sans dépendance), copié dans l'app sous un nom versionné, empreinte vérifiée ; fiche R&D ADOPTÉ |
| **D273** | Un seul QR pour toute la régie ; bouton d'en-tête toujours là ; appel au-dessus du pupitre seulement sans aucune fiche ; consigne « même réseau » ; adresse courte en minuscules (exception à la règle des majuscules, chemin sensible à la casse) ; AUTRE ADRESSE ; grand format qui garde ses boutons visibles ; adresse relue à chaque ouverture ; CPC-107 et CPC-108 |
| **D274** | Version inchangée (`V2.14.11.26`) quand un second lot est livré le même jour : la version est une date de fraîcheur, pas un compteur de lots |

## 5. Livré et testé (dépôt `capcom`, Mac Maison)

| Commit | Contenu |
|---|---|
| `4d848b8` | 4.1 — le serveur donne l'adresse d'écoute sur demande, adresses triées |
| `b859750` | 4.2 — outil QR copié, empreinte vérifiée |
| `2262cc2` | 4.3 — fenêtre QR, appel du pupitre, grand format corrigé |
| `666138f` | 4.4 — catalogue CPC V0.6, Lot 4 terminé |

**Non vus à l'écran** : CPC-107 (Mac hors réseau), CPC-108 (serveur arrêté), AUTRE ADRESSE (un seul réseau à la maison).

## 6. Commandes Terminal produites

```bash
# Récupérer une bibliothèque npm sans l'installer, vérifier son empreinte, la copier dans l'app
cd ~/Documents/GitHub/capcom && t=$(mktemp -d) && (cd "$t" && npm pack qrcode-generator@2.0.4 --silent && tar xzf qrcode-generator-2.0.4.tgz) && [ "$(shasum -a 256 "$t/package/dist/qrcode.js" | cut -d' ' -f1)" = "79ec86f82856005b1c887905cfccfcfbec3821ca61c7fd5a952faa5f778f791c" ] && cp "$t/package/dist/qrcode.js" public/qrcode-generator-2.0.4.js && rm -rf "$t"
```

```bash
# Écrire une comparaison avant / après dans un fichier à glisser dans la conversation
cd ~/Documents/GitHub/capcom && git --no-pager diff --stat && git --no-pager diff public/regie.html > ~/Desktop/capcom_diff.txt && open -R ~/Desktop/capcom_diff.txt
```

## 7. Liste de polish (cumul V2)

Toutes les entrées des récaps précédents restent valables. **Ajouts du 14/11 (Lot 4) :** consigne « SCANNEZ » affichée pendant la recherche et les erreurs CPC-107 et CPC-108 ; réponse tardive d'une ouverture précédente prise pour la nouvelle si l'on rouvre en moins de 3 s (pas de numéro de demande) ; grand format coupé en bas dans une fenêtre de navigateur très basse (plus de défilement) ; vide sous les boutons sur un écran très haut (QR plafonné à 70 vh).

## 8. Dettes et points ouverts

- **Design Reference** : ajouter l'exception « adresse en minuscules » (D273) au report de D265 (couleur dérivée, repli par `@supports`) et de la police des toasts, avec l'audit Surveyor du ~20/11.
- **Test studio** : AUTRE ADRESSE et réseaux séparés (Mac câblé au réseau des bureaux, téléphones sur un Wi-Fi invités), isolement des appareils sur le Wi-Fi de L'Étudiant, CPC-107 et CPC-108 à provoquer, en plus de la liste du Lot 3.
- **`.impeccable/config.json`** toujours à faire ignorer par Git dans `capcom`.
- Messages en attente perdus au rechargement de la régie ; fiche « TEST » au démarrage du 14/11 : inchangés.
- Hors CAPCOM : séance SÉCURITÉ (D211) ; audit Surveyor complet vers le 20/11.

## 9. Prochaines étapes

1. **Conception du lot « options son »** (D239, D271) : questions sur le besoin réel (niveau d'entrée, mélange de deux entrées), lecture du chemin du micro dans `regie.html`, mini-plan.
2. **Construction du lot options son.**
3. **Test intermédiaire au studio** : plusieurs téléphones et QR, réseaux du studio, vrai casque et options son, fiches compactes et mini avec bande de messages et BIP, SANS SON provoqué, CPC-411, CPC-107 et CPC-108, bip par le haut-parleur, retard audio avec et sans Bluetooth ; test ATEM (bloc 0, D240) dans le même passage.
4. **Lot 5 — Electron**, puis **Lot 6 — PARAMÈTRES et `.capcom`** ; puis fiche produit, patch, intégration à RENDEZVOUS.

## 10. Pièges

Onze entrées ajoutées au Carnet V87 : commande corrigée par un second bloc ; grand format qui cache ses boutons ; Échap intercepté par deux écouteurs sur la même cible ; adresses multiples d'un Mac ; « même Wi-Fi » faux pour un Mac câblé ; adresse en capitales qui mène à une page introuvable ; raccourci vers un objet unique placé dans un conteneur multiple ; dépendance copiée par `npm pack` et empreinte ; promesse « les touches PARLER restent utilisables » non vérifiée ; `grep -o` et `sed` sur des fichiers de la Suite ; message dicté brouillé.

---

*Récap · Tranquility Suite · CAPCOM · 14 novembre 2026 (soir) · Mac Maison*
