#!/usr/bin/env sh

# Useful for scripts that perform a series of steps

log() {
  >&2 echo "$*"
}
log_err() {
  log "\n\t-> ERR: $*\n"
}
log_ok() {
  log "\t-> ${*:-ok}" # if nothing passed, write "ok"
}


## Usage:
log "Starting some step…"
# …
log_ok # default ok response
log_ok "specific status update"

log "Starting something that will fail…"
# …
log_err "that thing went wrong"


## Output:
#	Starting some step…
#		-> ok
#		-> specific status update
#	Starting something that fails…
#
#		-> ERR: that thing went wrong
