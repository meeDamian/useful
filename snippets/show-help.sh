#!/usr/bin/env sh

## Handy way to quickly add help screen to a script.
#    Best, if located on top of the file

VERSION=vX.Y.Z
NAME="$(basename "$0")"
BLNK="$(echo "$NAME" | sed "s|.| |g")"

GH_URL=https://github.com/meeDamian/useful

show_version() { echo "$NAME $VERSION"; }
show_help() {
  cat << EOF >&2
$(show_version)

BRIEF_ONELINE_DESCRIPTION

Usage: $NAME [OPTIONAL] REQUIRED

[Where EXPLANATION_OF_ABOVE_IF_NEEDED]

Options:

  -h, --help, help        Show this help message
  -<L>, --<LIST_ALL>      <LIST OF FLAGS THE SCRIPT TAKES>
  -v, --version, version  Show version, and exit

Examples:

  $NAME EXAMPLE-CMD                     # Explanation
  $NAME --FLAG ANOTHER-CMD              # Another explanation
  $NAME --WOW-IT DOES-3-THINGS          # This explanation, on the other hand is longer than a single
  $BLNK                                 #    line, and had to be wrapped to another!

github: $GH_URL

EOF
}

_usage() {
	case "${1#--}" in
	'')         show_help;    exit 1 ;;
	-h|h[ea]lp) show_help;    exit 0 ;; # help and halp :)
	-v|version) show_version; exit 0 ;;
	esac
}

# shellcheck disable=SC2048,SC2086
_usage $*
