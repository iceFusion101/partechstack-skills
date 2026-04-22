#!/usr/bin/env bash
# Rebuild .skill zip artifacts from source directories.
# Usage: ./build.sh [skill-name]   (no arg = build all)

set -euo pipefail

cd "$(dirname "$0")"

build_one() {
  local dir="$1"
  local name="${dir%/}"
  local out="${name}.skill"
  if [[ ! -f "${dir}/SKILL.md" ]]; then
    echo "skip ${name}: no SKILL.md" >&2
    return
  fi
  rm -f "${out}"
  zip -qr "${out}" "${name}" -x "*.DS_Store"
  echo "built ${out}"
}

if [[ $# -gt 0 ]]; then
  build_one "$1"
else
  for d in */; do
    [[ -f "${d}SKILL.md" ]] && build_one "${d}"
  done
fi
