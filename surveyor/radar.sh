#!/bin/bash
# radar.sh — inventaire en lecture seule de la flotte Tranquility Suite.
# Compatible /bin/bash 3.2 (macOS). Ne modifie aucun dépôt (sauf git pull du Plan Directeur).

OWNER="RealCoolclint"
PLAN_DIR="$HOME/Documents/GitHub/tranquility-plan-directeur"
OUT_DIR="$HOME/Documents/Surveyor"
REGISTRE="$PLAN_DIR/surveyor/REGISTRE_FLOTTE.md"

MODE=""
APP_NOM=""
ERRORS=0
REPOS_SCANNED=0

usage() {
  echo "Usage :"
  echo "  bash $0 court"
  echo "  bash $0 complet"
  echo "  bash $0 app NOM"
  exit 1
}

# --- arguments ---
if [ $# -lt 1 ]; then
  usage
fi

case "$1" in
  court|complet)
    MODE="$1"
    if [ $# -ne 1 ]; then
      usage
    fi
    ;;
  app)
    if [ $# -ne 2 ] || [ -z "$2" ]; then
      usage
    fi
    MODE="app"
    APP_NOM="$2"
    ;;
  *)
    usage
    ;;
esac

# --- authentification GitHub ---
if ! gh auth status >/dev/null 2>&1; then
  echo "ERREUR : gh n'est pas authentifié. Lancez 'gh auth login' puis réessayez."
  exit 1
fi

# --- dossier de sortie et fichiers temporaires ---
mkdir -p "$OUT_DIR"

STAMP=$(date +%Y%m%d_%H%M)
REPORT="$OUT_DIR/RADAR_${STAMP}_${MODE}.txt"
LATEST="$OUT_DIR/RADAR_latest.txt"

WORK=$(mktemp -d /tmp/radar.XXXXXX)
RDV_TMP=""
REPO_LIST="$WORK/repos.txt"
HORS_LIST="$WORK/hors.txt"
ARCHIVED_LIST="$WORK/archived.txt"
RETAINED_34="$WORK/retained_34.txt"
RETAINED_478="$WORK/retained_478.txt"
ASSETS_RAW="$WORK/assets.txt"
: > "$HORS_LIST"
: > "$ARCHIVED_LIST"
: > "$RETAINED_34"
: > "$RETAINED_478"
: > "$ASSETS_RAW"
: > "$REPORT"

cleanup() {
  if [ -n "$RDV_TMP" ] && [ -d "$RDV_TMP" ]; then
    rm -rf "$RDV_TMP"
  fi
  if [ -n "$WORK" ] && [ -d "$WORK" ]; then
    rm -rf "$WORK"
  fi
}
trap cleanup EXIT

err_line() {
  # $1 = dépôt, $2 = raison
  echo "ERREUR [$1] : $2" >> "$REPORT"
  ERRORS=$((ERRORS + 1))
}

is_in_file() {
  # $1 = nom, $2 = fichier
  grep -qxF "$1" "$2" 2>/dev/null
}

# Compare deux versions Vmaj_min : retourne 0 si ($1,$2) > ($3,$4)
version_gt() {
  # maj1 min1 maj2 min2
  if [ "$1" -gt "$3" ]; then
    return 0
  fi
  if [ "$1" -eq "$3" ] && [ "$2" -gt "$4" ]; then
    return 0
  fi
  return 1
}

extract_version() {
  # extrait maj/min (Vn_m) ou version simple (Vn. / Vn en fin de nom) ; écrit "maj min" ou rien
  _s="$1"
  if echo "$_s" | grep -qE 'V[0-9]+_[0-9]+'; then
    echo "$_s" | sed -nE 's/.*V([0-9]+)_([0-9]+).*/\1 \2/p' | head -1
  elif echo "$_s" | grep -qE 'V[0-9]+(\.|$)'; then
    echo "$_s" | sed -nE 's/.*V([0-9]+)(\.|$).*/\1 0/p' | head -1
  fi
}

# =============================================================================
# 1. CONTEXTE
# =============================================================================
echo "=== 1. CONTEXTE ===" >> "$REPORT"

NOW=$(date '+%Y-%m-%d %H:%M:%S')
USER_NAME=$(whoami)
COMPUTER_NAME=$(scutil --get ComputerName 2>/dev/null || echo "(inconnu)")

PULL_OUT=$(git -C "$PLAN_DIR" pull 2>&1)
PULL_EC=$?
if [ $PULL_EC -ne 0 ]; then
  PULL_STATUS="ÉCHEC (code $PULL_EC) : $PULL_OUT"
else
  PULL_STATUS="$PULL_OUT"
fi

# Plan Directeur le plus récent (tri numérique maj/min, pas par date ni sort -V)
BEST_PD=""
BEST_MAJ=-1
BEST_MIN=-1
for f in "$PLAN_DIR"/TRANQUILITY_PLAN_DIRECTEUR_V*_*.md; do
  [ -e "$f" ] || continue
  base=$(basename "$f")
  ver=$(extract_version "$base")
  [ -n "$ver" ] || continue
  maj=$(echo "$ver" | awk '{print $1}')
  min=$(echo "$ver" | awk '{print $2}')
  if [ "$BEST_MAJ" -lt 0 ] || version_gt "$maj" "$min" "$BEST_MAJ" "$BEST_MIN"; then
    BEST_MAJ=$maj
    BEST_MIN=$min
    BEST_PD=$base
  fi
done
if [ -z "$BEST_PD" ]; then
  BEST_PD="(aucun trouvé)"
fi

{
  echo "Date/heure : $NOW"
  echo "Mode : $MODE"
  echo "Utilisateur : $USER_NAME"
  echo "Machine : $COMPUTER_NAME"
  echo "git pull : $PULL_STATUS"
  echo "Plan Directeur le plus récent : $BEST_PD"
  echo ""
} >> "$REPORT"

# =============================================================================
# Chargement du registre (hors Tranquility)
# =============================================================================
if [ -f "$REGISTRE" ]; then
  # Tableau markdown : 2e colonne = dépôt, 3e = catégorie
  # Lignes | ... | ... | ... |
  while IFS= read -r line || [ -n "$line" ]; do
    case "$line" in
      \|*)
        ;;
      *)
        continue
        ;;
    esac
    # Ignorer séparateurs |---|---|
    echo "$line" | grep -qE '^\|[[:space:]]*[-:]+[[:space:]]*\|' && continue
    # Colonnes séparées par |
    col2=$(echo "$line" | awk -F'|' '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $3); print $3}')
    col3=$(echo "$line" | awk -F'|' '{gsub(/^[[:space:]]+|[[:space:]]+$/, "", $4); print $4}')
    # Sauter en-tête probable
    echo "$col2" | grep -qiE '^(dépôt|depot|repo|repository|name)$' && continue
    [ -n "$col2" ] || continue
    if echo "$col3" | grep -qi 'hors Tranquility'; then
      echo "$col2" >> "$HORS_LIST"
    fi
  done < "$REGISTRE"
fi

# =============================================================================
# 2. DÉPÔTS
# =============================================================================
echo "=== 2. DÉPÔTS ===" >> "$REPORT"

REPO_JSON_ERR="$WORK/repo_err.txt"
if ! gh repo list "$OWNER" --limit 300 \
  --json name,visibility,pushedAt,isArchived,description \
  --jq '.[] | [.name, .visibility, (.pushedAt // "")[0:10], (if .isArchived then "oui" else "non" end), ((.description // "") | gsub("\t"; " ") | gsub("\n"; " "))] | @tsv' \
  > "$REPO_LIST.raw" 2>"$REPO_JSON_ERR"; then
  err_line "liste" "impossible de lister les dépôts : $(cat "$REPO_JSON_ERR")"
  : > "$REPO_LIST"
else
  # TSV -> lignes formatées + fichiers annexes
  : > "$REPO_LIST"
  while IFS="$(printf '\t')" read -r name vis pushed archived desc || [ -n "$name" ]; do
    [ -n "$name" ] || continue
    REPOS_SCANNED=$((REPOS_SCANNED + 1))
    echo "$name|$vis|$pushed|$archived|$desc" >> "$REPO_LIST"
    echo "$name | $vis | $pushed | archivé $archived | $desc" >> "$REPORT"

    if [ "$archived" = "oui" ]; then
      echo "$name" >> "$ARCHIVED_LIST"
    fi

    hors=0
    if is_in_file "$name" "$HORS_LIST"; then
      hors=1
    fi

    # Section 4 : exclus hors Tranquility seulement
    if [ "$hors" -eq 0 ]; then
      echo "$name" >> "$RETAINED_34"
    fi

    # Sections 3, 7, 8 : exclus hors Tranquility + archivés
    if [ "$hors" -eq 0 ] && [ "$archived" != "oui" ]; then
      echo "$name" >> "$RETAINED_478"
    fi
  done < "$REPO_LIST.raw"
fi

# Mode app : vérifier que NOM existe (avant d'écrire la suite du rapport)
if [ "$MODE" = "app" ]; then
  found_app=0
  if [ -f "$REPO_LIST" ]; then
    while IFS='|' read -r rname _rest || [ -n "$rname" ]; do
      if [ "$rname" = "$APP_NOM" ]; then
        found_app=1
        break
      fi
    done < "$REPO_LIST"
  fi
  if [ "$found_app" -eq 0 ]; then
    rm -f "$REPORT"
    echo "ERREUR : le dépôt '$APP_NOM' n'existe pas dans la liste $OWNER."
    exit 1
  fi
fi

echo "" >> "$REPORT"

# =============================================================================
# 3. ASSETS IDENTITAIRES
# =============================================================================
echo "=== 3. ASSETS IDENTITAIRES ===" >> "$REPORT"

while IFS= read -r depot || [ -n "$depot" ]; do
  [ -n "$depot" ] || continue

  tree_err="$WORK/tree_err.txt"
  tree_out="$WORK/tree_out.txt"
  if ! gh api "repos/$OWNER/$depot/git/trees/HEAD?recursive=1" \
    --jq '"TRUNCATED=\(.truncated // false)", (.tree[]? | select(.type=="blob") | [.path, .sha, (.size // 0)] | @tsv)' \
    < /dev/null > "$tree_out" 2>"$tree_err"; then
    reason=$(tr '\n' ' ' < "$tree_err")
    [ -n "$reason" ] || reason="dépôt vide, inaccessible ou sans branche HEAD"
    err_line "$depot" "$reason"
    continue
  fi

  # truncated ?
  trunc_line=$(head -1 "$tree_out")
  if echo "$trunc_line" | grep -q 'TRUNCATED=true'; then
    echo "[$depot] truncated=true (arborescence tronquée par l'API GitHub)" >> "$REPORT"
  fi

  # Parcourir les blobs (ignorer la 1re ligne TRUNCATED=...)
  tail -n +2 "$tree_out" | while IFS="$(printf '\t')" read -r path sha size || [ -n "$path" ]; do
    [ -n "$path" ] || continue
    lower=$(echo "$path" | tr '[:upper:]' '[:lower:]')

    case "$lower" in
      *node_modules/*|*dist/*|*build/*|*vendor/*)
        continue
        ;;
    esac

    if ! echo "$lower" | grep -qE 'patch|ambiance|splash|icon|favicon|logo|manifest\.json|apple-touch'; then
      continue
    fi

    lfs_mark=""
    case "$lower" in
      *.mp4|*.webm|*.mov|*.png|*.jpg|*.jpeg)
        if [ "$size" -lt 300 ] 2>/dev/null; then
          lfs_mark=" [POINTEUR LFS ?]"
        fi
        ;;
    esac

    base=$(basename "$path")
    echo "$depot | $path | $sha | $size$lfs_mark" >> "$REPORT"
    echo "$sha|$depot|$path|$base" >> "$ASSETS_RAW"
  done
done < "$RETAINED_478"

# SHA partagés entre plusieurs dépôts
echo "" >> "$REPORT"
echo "--- SHA présents dans plusieurs dépôts ---" >> "$REPORT"
if [ -s "$ASSETS_RAW" ]; then
  # sha|depot uniques, puis sha avec >1 dépôt
  awk -F'|' '{print $1 "|" $2}' "$ASSETS_RAW" | sort -u > "$WORK/sha_depot.txt"
  cut -d'|' -f1 "$WORK/sha_depot.txt" | sort | uniq -d > "$WORK/shared_shas.txt"
  if [ -s "$WORK/shared_shas.txt" ]; then
    while IFS= read -r sha || [ -n "$sha" ]; do
      [ -n "$sha" ] || continue
      deps=$(grep -F "$sha|" "$WORK/sha_depot.txt" | cut -d'|' -f2 | sort -u | tr '\n' ',' | sed 's/,$//')
      paths=$(grep -F "$sha|" "$ASSETS_RAW" | cut -d'|' -f3 | sort -u | tr '\n' ',' | sed 's/,$//')
      echo "$sha | dépôts: $deps | chemins: $paths" >> "$REPORT"
    done < "$WORK/shared_shas.txt"
  else
    echo "(aucun)" >> "$REPORT"
  fi
else
  echo "(aucun asset collecté)" >> "$REPORT"
fi

# Même nom de base, SHA différents
echo "" >> "$REPORT"
echo "--- Même nom de base, SHA différents ---" >> "$REPORT"
if [ -s "$ASSETS_RAW" ]; then
  awk -F'|' '{print $4 "|" $1}' "$ASSETS_RAW" | sort -u > "$WORK/base_sha.txt"
  cut -d'|' -f1 "$WORK/base_sha.txt" | sort | uniq -d > "$WORK/multi_base.txt"
  if [ -s "$WORK/multi_base.txt" ]; then
    while IFS= read -r base || [ -n "$base" ]; do
      [ -n "$base" ] || continue
      echo "nom: $base" >> "$REPORT"
      awk -F'|' -v b="$base" '$4 == b { print "  " $2 " | " $3 " | " $1 }' "$ASSETS_RAW" >> "$REPORT"
    done < "$WORK/multi_base.txt"
  else
    echo "(aucun)" >> "$REPORT"
  fi
else
  echo "(aucun)" >> "$REPORT"
fi
echo "" >> "$REPORT"

# =============================================================================
# 4. INTÉGRATION RENDEZVOUS
# =============================================================================
echo "=== 4. INTÉGRATION RENDEZVOUS ===" >> "$REPORT"

RDV_TMP=$(mktemp -d /tmp/radar-rdv.XXXXXX)
RDV_DIR="$RDV_TMP/RENDEZVOUS"
PROXY_DIR="$RDV_TMP/rendezvous-proxy"

if ! gh repo clone "$OWNER/RENDEZVOUS" "$RDV_DIR" -- --depth 1 >/dev/null 2>"$WORK/clone_rdv.err"; then
  err_line "RENDEZVOUS" "clone impossible : $(tr '\n' ' ' < "$WORK/clone_rdv.err")"
fi
if ! gh repo clone "$OWNER/rendezvous-proxy" "$PROXY_DIR" -- --depth 1 >/dev/null 2>"$WORK/clone_proxy.err"; then
  err_line "rendezvous-proxy" "clone impossible : $(tr '\n' ' ' < "$WORK/clone_proxy.err")"
fi

count_mentions() {
  # $1 = dépôt recherché, $2 = répertoire clone
  _dep="$1"
  _dir="$2"
  if [ ! -d "$_dir" ]; then
    echo 0
    return
  fi
  # grep -rilw : mot entier, insensible à la casse ; exclure assets/, .git/, node_modules/
  _n=$(grep -rilw --exclude-dir=assets --exclude-dir=.git --exclude-dir=node_modules \
    "$_dep" "$_dir" 2>/dev/null | wc -l | tr -d ' ')
  echo "$_n"
}

while IFS= read -r depot || [ -n "$depot" ]; do
  [ -n "$depot" ] || continue
  n_front=$(count_mentions "$depot" "$RDV_DIR")
  n_proxy=$(count_mentions "$depot" "$PROXY_DIR")
  mark=""
  if [ "$n_front" -eq 0 ] && [ "$n_proxy" -eq 0 ]; then
    mark=" [ABSENT DES DEUX]"
  fi
  echo "$depot | fichiers front RENDEZVOUS: $n_front | fichiers rendezvous-proxy: $n_proxy$mark" >> "$REPORT"
done < "$RETAINED_34"
echo "" >> "$REPORT"

# =============================================================================
# 5. CARNET DE PIÈGES
# =============================================================================
echo "=== 5. CARNET DE PIÈGES ===" >> "$REPORT"

CARNET="tranquility-carnet-pieges"
carnet_err="$WORK/carnet.err"
if ! gh api "repos/$OWNER/$CARNET/git/trees/HEAD?recursive=1" \
  --jq '.tree[]? | select(.type=="blob") | .path' \
  > "$WORK/carnet_files.txt" 2>"$carnet_err"; then
  err_line "$CARNET" "impossible de lister les fichiers : $(tr '\n' ' ' < "$carnet_err")"
  echo "Fichier de version : (indisponible)" >> "$REPORT"
else
  BEST_CF=""
  BEST_CMAJ=-1
  BEST_CMIN=-1
  while IFS= read -r cpath || [ -n "$cpath" ]; do
    [ -n "$cpath" ] || continue
    cbase=$(basename "$cpath")
    ver=$(extract_version "$cbase")
    [ -n "$ver" ] || continue
    maj=$(echo "$ver" | awk '{print $1}')
    min=$(echo "$ver" | awk '{print $2}')
    if [ "$BEST_CMAJ" -lt 0 ] || version_gt "$maj" "$min" "$BEST_CMAJ" "$BEST_CMIN"; then
      BEST_CMAJ=$maj
      BEST_CMIN=$min
      BEST_CF=$cbase
    fi
  done < "$WORK/carnet_files.txt"
  if [ -z "$BEST_CF" ]; then
    BEST_CF="(aucun fichier versionné trouvé)"
  fi
  echo "Fichier de version le plus élevé : $BEST_CF" >> "$REPORT"
fi

if ! last_commit=$(gh api "repos/$OWNER/$CARNET/commits?per_page=1" \
  --jq '.[0].commit.committer.date // .[0].commit.author.date // ""' 2>"$carnet_err"); then
  err_line "$CARNET" "impossible d'obtenir le dernier commit : $(tr '\n' ' ' < "$carnet_err")"
  echo "Date du dernier commit : (indisponible)" >> "$REPORT"
else
  last_day=$(echo "$last_commit" | cut -c1-10)
  echo "Date du dernier commit : $last_day" >> "$REPORT"
fi
echo "" >> "$REPORT"

# =============================================================================
# 6. SURVEYOR
# =============================================================================
echo "=== 6. SURVEYOR ===" >> "$REPORT"

if [ -f "$REGISTRE" ]; then
  echo "surveyor/REGISTRE_FLOTTE.md : présent" >> "$REPORT"
else
  echo "surveyor/REGISTRE_FLOTTE.md : absent" >> "$REPORT"
fi

BEST_SURVEYOR=""
BEST_SURVEYOR_DATE=0
REF_DATE_SURVEYOR=""
for sf in "$PLAN_DIR"/surveyor/SURVEYOR_*.md; do
  [ -e "$sf" ] || continue
  sbase=$(basename "$sf")
  sdate=$(echo "$sbase" | sed -nE 's/.*SURVEYOR_([0-9]{8}).*/\1/p')
  [ -n "$sdate" ] || continue
  if [ "$sdate" -gt "$BEST_SURVEYOR_DATE" ] 2>/dev/null; then
    BEST_SURVEYOR_DATE=$sdate
    BEST_SURVEYOR=$sbase
    REF_DATE_SURVEYOR=$sdate
  fi
done

if [ -n "$BEST_SURVEYOR" ]; then
  echo "Rapport surveyor le plus récent : $BEST_SURVEYOR" >> "$REPORT"
else
  echo "Rapport surveyor le plus récent : (aucun)" >> "$REPORT"
fi
echo "" >> "$REPORT"

# =============================================================================
# 7. ACTIVITÉ RÉCENTE (mode court)
# =============================================================================
if [ "$MODE" = "court" ]; then
  echo "=== 7. ACTIVITÉ RÉCENTE ===" >> "$REPORT"

  if [ -n "$REF_DATE_SURVEYOR" ] && [ "$REF_DATE_SURVEYOR" -gt 0 ]; then
    # AAAAMMJJ -> AAAA-MM-JJ
    y=$(echo "$REF_DATE_SURVEYOR" | cut -c1-4)
    m=$(echo "$REF_DATE_SURVEYOR" | cut -c5-6)
    d=$(echo "$REF_DATE_SURVEYOR" | cut -c7-8)
    REF_DAY="$y-$m-$d"
  else
    REF_DAY=$(date -v-14d +%Y-%m-%d)
  fi
  SINCE_ISO="${REF_DAY}T00:00:00Z"
  echo "Date de référence : $REF_DAY" >> "$REPORT"
  echo "" >> "$REPORT"

  while IFS='|' read -r name vis pushed archived desc || [ -n "$name" ]; do
    [ -n "$name" ] || continue
    is_in_file "$name" "$RETAINED_478" || continue
    # ne sauter que si le dernier push est strictement antérieur à REF_DAY
    [ -n "$pushed" ] || continue
    if [ "$pushed" \< "$REF_DAY" ]; then
      continue
    fi

    echo "--- $name (push $pushed) ---" >> "$REPORT"
    commits_err="$WORK/commits.err"
    if ! gh api "repos/$OWNER/$name/commits?since=${SINCE_ISO}&per_page=30" \
      --jq '.[] | [( .commit.author.date // .commit.committer.date // "" )[0:10], .sha[0:7], ((.commit.message // "") | split("\n")[0])] | @tsv' \
      < /dev/null > "$WORK/commits_out.txt" 2>"$commits_err"; then
      err_line "$name" "commits inaccessibles : $(tr '\n' ' ' < "$commits_err")"
      continue
    fi
    if [ ! -s "$WORK/commits_out.txt" ]; then
      echo "(aucun commit depuis $REF_DAY)" >> "$REPORT"
    else
      while IFS="$(printf '\t')" read -r cday csha cmsg || [ -n "$cday" ]; do
        [ -n "$cday" ] || continue
        echo "$cday | $csha | $cmsg" >> "$REPORT"
      done < "$WORK/commits_out.txt"
    fi
  done < "$REPO_LIST"
  echo "" >> "$REPORT"
fi

# =============================================================================
# 8. HISTORIQUE D'ACTIVITÉ (complet / app)
# =============================================================================
if [ "$MODE" = "complet" ] || [ "$MODE" = "app" ]; then
  echo "=== 8. HISTORIQUE D'ACTIVITÉ ===" >> "$REPORT"

  HIST_LIST="$WORK/hist_list.txt"
  : > "$HIST_LIST"

  if [ "$MODE" = "complet" ]; then
    cat "$RETAINED_478" > "$HIST_LIST"
  else
    # NOM + RENDEZVOUS + rendezvous-proxy + tranquility-core (dédupliqué)
    {
      echo "$APP_NOM"
      echo "RENDEZVOUS"
      echo "rendezvous-proxy"
      echo "tranquility-core"
    } | awk 'NF && !seen[$0]++' > "$HIST_LIST"
  fi

  SINCE_12=$(date -v-12m -u +%Y-%m-%dT%H:%M:%SZ)
  echo "Période : depuis $SINCE_12 (12 mois)" >> "$REPORT"
  echo "" >> "$REPORT"

  while IFS= read -r name || [ -n "$name" ]; do
    [ -n "$name" ] || continue
    echo "--- $name ---" >> "$REPORT"

    commits_err="$WORK/commits.err"
    if ! gh api --paginate \
      "repos/$OWNER/$name/commits?since=${SINCE_12}&per_page=100" \
      --jq '.[] | [( .commit.author.date // .commit.committer.date // "" )[0:10], .sha[0:7], ((.commit.message // "") | split("\n")[0])] | @tsv' \
      < /dev/null > "$WORK/hist_commits.txt" 2>"$commits_err"; then
      err_line "$name" "historique inaccessible : $(tr '\n' ' ' < "$commits_err")"
      continue
    fi

    if [ ! -s "$WORK/hist_commits.txt" ]; then
      echo "Jours d'activité : (aucun commit sur 12 mois)" >> "$REPORT"
      echo "5 derniers commits : (aucun)" >> "$REPORT"
      echo "" >> "$REPORT"
      continue
    fi

    echo "Jours d'activité :" >> "$REPORT"
    cut -f1 "$WORK/hist_commits.txt" | sort | uniq -c | sort -k2 | while read -r cnt day; do
      echo "$day : $cnt" >> "$REPORT"
    done

    echo "5 derniers commits :" >> "$REPORT"
    head -5 "$WORK/hist_commits.txt" | while IFS="$(printf '\t')" read -r cday csha cmsg || [ -n "$cday" ]; do
      [ -n "$cday" ] || continue
      echo "$cday | $csha | $cmsg" >> "$REPORT"
    done
    echo "" >> "$REPORT"
  done < "$HIST_LIST"
fi

# =============================================================================
# Finalisation
# =============================================================================
cp "$REPORT" "$LATEST"
pbcopy < "$REPORT"

echo "$REPORT"
echo "Dépôts scannés : $REPOS_SCANNED | Erreurs : $ERRORS"
echo "Rapport copié dans le presse-papiers"
