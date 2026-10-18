#!/usr/bin/env bash
# Rebuild the local Hoogle database used by <localleader>H in Neovim.
#
# Hoogle indexes a package by downloading its Haddock documentation, so the seed
# list here is the set of packages cabal has already built on this machine: the
# cabal store's package db (see `ghc-pkg --package-db=... list`). The database
# lands in ~/.hoogle, which is a symlink to /data/share/hoogle on this box, and
# a full rebuild takes well under a minute.
#
# Re-run it after pulling in new dependencies, otherwise type searches won't
# know about them. Extra package names can be passed to widen the index:
#
#   ./scripts/hoogle-generate.sh servant pandoc
set -euo pipefail

store_db=$(ls -d "$HOME"/.local/state/cabal/store/ghc-*/package.db 2>/dev/null | head -1 || true)
if [[ -z ${store_db} ]]; then
  echo "no cabal store package db found under ~/.local/state/cabal/store" >&2
  exit 1
fi

pkgs=$(
  ghc-pkg --package-db="$store_db" list --simple-output 2>/dev/null |
    tr ' ' '\n' |
    sed -E 's/-[0-9]+(\.[0-9]+)*$//' |
    grep -E '^[A-Za-z][A-Za-z0-9.-]*$' |
    grep -vE '^(ghc|rts|system-cxx-std-lib)(-|$)|^z-' |
    sort -u
)

echo "indexing $(grep -c '' <<<"$pkgs") packages from $store_db"
# shellcheck disable=SC2086 # the package list is space separated on purpose
hoogle generate $pkgs "$@"
db=$(readlink -f "$HOME/.hoogle")
echo "database: $(du -sh "$db" | cut -f1) in $db"
