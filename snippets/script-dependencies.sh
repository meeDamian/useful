#!/usr/bin/env sh

check_dependencies() {
  for  cmd  in  "$@"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      >&2 echo "This script requires \"$cmd\" to be installed"
      exit 1
    fi
  done
}


## Usage:
check_dependencies sed curl pup
