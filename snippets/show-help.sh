#!/usr/bin/env sh

## Handy way to quickly add help screen to a script.
#    Best, if located on top of the file

show_help() {
  cat << EOF >&2
SCRIPT-FILENAME vX.Y.Z

BRIEF_ONELINE_DESCRIPTION

Usage: SCRIPT-FILENAME [OPTIONAL] REQUIRED

[Where EXPLANATION_OF_ABOVE_IF_NEEDED]

Options:

  -h, --help, help      Show this help message
  -L, --LIST_ALL        LIST OF FLAGS THE SCRIPT TAKES
  -v, --version         Download to a specified dir (will be created, if doesn't exist)

Examples:

  SCRIPT-FILENAME EXAMPLE-CMD                     # Explanation
  SCRIPT-FILENAME --FLAG ANOTHER-CMD              # Another explanation
  SCRIPT-FILENAME --WOW-IT DOES-3-THINGS          # This explanation, on the other hand is longer than a single
                                                  #    line, and had to be wrapped to another!

github: GITHUB_URL

EOF
}

_usage() {
	# If no arguments passed, show help and exit
	if [ "$#" -le 0 ]; then
		show_help
		exit 1
	fi
}
#_usage
