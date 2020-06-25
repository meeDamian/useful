#!/usr/bin/env sh

# If `gsed` is available in the system, then use it instead as the available `sed` might not be too able (MacOS)…

# shellcheck disable=SC2086,SC2048
[ -x "$(command -v gsed)" ] && sed() { gsed $*; }

## Usage:
# sed  -i  -e "…"  "$file"
