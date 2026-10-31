#!/bin/sh
# check.sh: verify the site before a commit. Run from anywhere: sh scripts/check.sh
#   1. every .html file is well-formed XML (closed tags, escaped ampersands, uppercase DOCTYPE)
#   2. every relative href/src points to an existing file; no root-relative path (the site lives under /dletmeapps-legal/)
#   3. every privacy page carries the eight required sections, by id
#   4. every page shows the support address; every support page shows the name
set -u
cd "$(dirname "$0")/.." || exit 2

NAME='Davy Ushaka Ishimwe'
MAIL='aadlm.ergonomic338@passmail.net'
IDS='updated data collection purposes third-parties retention consent contact'

fail=0
ko() { fail=1; printf 'KO  %s\n' "$*"; }

pages=$(find . -name '*.html' -not -path './.git/*' | sort)
count=$(printf '%s\n' "$pages" | grep -c . || true)
[ "$count" -gt 0 ] || ko "no .html page found"

for f in $pages; do
  # 1. well-formed
  if ! err=$(xmllint --noout "$f" 2>&1); then
    ko "$f: not well-formed: $(printf '%s' "$err" | head -1)"
  fi

  # 2. links
  dir=$(dirname "$f")
  for link in $(grep -oE '(href|src)="[^"]*"' "$f" | sed -E 's/^(href|src)="//; s/"$//'); do
    case $link in
      http://*|https://*|mailto:*|'#'*) continue ;;
      /*) ko "$f: root-relative link $link" ; continue ;;
    esac
    target=${link%%#*}
    [ -n "$target" ] || continue
    [ -f "$dir/$target" ] || ko "$f: broken link $link"
  done

  # 3. required sections on privacy pages
  case $(basename "$f") in
    privacy*.html)
      for id in $IDS; do
        grep -q "id=\"$id\"" "$f" || ko "$f: missing section id=\"$id\""
      done ;;
  esac

  # 4. contact
  grep -q "$MAIL" "$f" || ko "$f: support address missing"
  case $(basename "$f") in
    support*.html) grep -q "$NAME" "$f" || ko "$f: name missing" ;;
  esac
done

if [ "$fail" -eq 0 ]; then
  printf 'OK  %s pages: well-formed, links resolve, sections and contact present\n' "$count"
  exit 0
fi
exit 1
