#!/usr/bin/env sh

# If `gsed` is available in the system, then use it instead as the available `sed` might not be too able (MacOS)…

SED="sed"
if [ -x "$(command -v gsed)" ]; then
  SED=gsed
fi


## Usage:
# ${SED} -i  -e "…"  "${file}"
