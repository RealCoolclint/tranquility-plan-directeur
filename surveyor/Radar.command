#!/bin/bash
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
# Radar.command — lanceur Finder pour surveyor/radar.sh (double-clic macOS).
# Compatible /bin/bash 3.2. Ne modifie pas radar.sh.

# Résoudre l'emplacement réel du script même via un lien symbolique (Bureau, etc.).
# Sans readlink -f (absent sur macOS) : boucle readlink + pwd -P.
resolve_self_dir() {
  local source dir
  source="$1"
  while [ -L "$source" ]; do
    dir="$(cd -P "$(dirname "$source")" && pwd)"
    source="$(readlink "$source")"
    case "$source" in
      /*) ;;
      *) source="$dir/$source" ;;
    esac
  done
  cd -P "$(dirname "$source")" && pwd
}

SCRIPT_DIR="$(resolve_self_dir "${BASH_SOURCE[0]:-$0}")"
RADAR_SH="$SCRIPT_DIR/radar.sh"
LATEST="$HOME/Documents/Surveyor/RADAR_latest.txt"
# Même compte / limite que radar.sh (OWNER + --limit 300).
GH_OWNER="RealCoolclint"
GH_LIST_LIMIT=300

wait_close() {
  echo ""
  echo "Appuie sur une touche pour fermer."
  # shellcheck disable=SC2034
  read -r -n 1 _key
}

fail() {
  echo "$1"
  wait_close
  exit 1
}

if ! command -v gh >/dev/null 2>&1; then
  fail "ERREUR : l'outil gh est introuvable (PATH : $PATH)."
fi
if ! command -v git >/dev/null 2>&1; then
  fail "ERREUR : l'outil git est introuvable (PATH : $PATH)."
fi

if [ ! -f "$RADAR_SH" ]; then
  fail "ERREUR : radar.sh introuvable à côté de ce lanceur ($RADAR_SH)."
fi

echo "TRANQUILITY SURVEYOR — RADAR"
echo "1. Audit court (par défaut)"
echo "2. Audit complet"
echo "3. Audit d'une app"
printf "Choix [Entrée = 1] : "
read -r CHOIX

# Entrée vide = audit court
if [ -z "$CHOIX" ]; then
  CHOIX="1"
fi

MODE=""
APP_NOM=""

case "$CHOIX" in
  1)
    MODE="court"
    ;;
  2)
    MODE="complet"
    ;;
  3)
    MODE="app"
    printf "Nom de l'app : "
    read -r APP_NOM
    APP_NOM="$(printf '%s' "$APP_NOM" | sed -E 's/^[[:space:]]+//; s/[[:space:]]+$//')"
    if [ -z "$APP_NOM" ]; then
      fail "ERREUR : nom d'app vide. Relance et saisis le nom du dépôt."
    fi

    # Même source que radar.sh : gh repo list OWNER --limit 300 --json name
    REPO_NAMES=$(mktemp /tmp/radar-repos.XXXXXX)
    if ! gh repo list "$GH_OWNER" --limit "$GH_LIST_LIMIT" --json name \
      --jq '.[].name' > "$REPO_NAMES" 2>/dev/null; then
      rm -f "$REPO_NAMES"
      fail "ERREUR : impossible de lister les dépôts GitHub ($GH_OWNER)."
    fi

    APP_LOWER=$(printf '%s' "$APP_NOM" | tr '[:upper:]' '[:lower:]')
    MATCH_COUNT=0
    MATCHES_FILE=$(mktemp /tmp/radar-matches.XXXXXX)
    : > "$MATCHES_FILE"
    while IFS= read -r repo || [ -n "$repo" ]; do
      [ -n "$repo" ] || continue
      repo_lower=$(printf '%s' "$repo" | tr '[:upper:]' '[:lower:]')
      if [ "$repo_lower" = "$APP_LOWER" ]; then
        echo "$repo" >> "$MATCHES_FILE"
        MATCH_COUNT=$((MATCH_COUNT + 1))
      fi
    done < "$REPO_NAMES"

    if [ "$MATCH_COUNT" -eq 0 ]; then
      echo "Dépôt introuvable"
      echo "Dépôts disponibles :"
      sort -f "$REPO_NAMES"
      rm -f "$REPO_NAMES" "$MATCHES_FILE"
      wait_close
      exit 1
    fi

    if [ "$MATCH_COUNT" -gt 1 ]; then
      echo "Plusieurs dépôts correspondent (aucune sélection automatique) :"
      cat "$MATCHES_FILE"
      rm -f "$REPO_NAMES" "$MATCHES_FILE"
      wait_close
      exit 1
    fi

    APP_NOM=$(head -1 "$MATCHES_FILE")
    rm -f "$REPO_NAMES" "$MATCHES_FILE"
    echo "Dépôt retenu : $APP_NOM"
    ;;
  *)
    fail "ERREUR : choix invalide ($CHOIX). Relance et choisis 1, 2 ou 3."
    ;;
esac

# Mémoriser mtime avant lancement (secondes epoch, syntaxe macOS).
MTIME_BEFORE=""
if [ -f "$LATEST" ]; then
  MTIME_BEFORE=$(stat -f %m "$LATEST")
fi

echo ""
if [ "$MODE" = "app" ]; then
  echo "Lancement : bash radar.sh app $APP_NOM"
  bash "$RADAR_SH" app "$APP_NOM"
  EC=$?
else
  echo "Lancement : bash radar.sh $MODE"
  bash "$RADAR_SH" "$MODE"
  EC=$?
fi

if [ "$EC" -ne 0 ]; then
  fail "ERREUR : radar.sh a échoué (code de sortie $EC). Le rapport n'a pas été ouvert."
fi

if [ ! -f "$LATEST" ]; then
  fail "ERREUR : fichier de sortie introuvable après exécution : $LATEST"
fi

MTIME_AFTER=$(stat -f %m "$LATEST")
if [ -n "$MTIME_BEFORE" ] && [ "$MTIME_AFTER" = "$MTIME_BEFORE" ]; then
  fail "ERREUR : le rapport n'a pas été mis à jour ($LATEST). Ouverture annulée."
fi

echo "Rapport prêt : $LATEST"
open -R "$LATEST"
wait_close
exit 0
