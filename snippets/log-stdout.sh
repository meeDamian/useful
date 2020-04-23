#!/usr/bin/env sh

# Useful for scripts that perform a series of steps

log() {
  >&2 echo "$*"
}
log_err() {
  log  "\n\t-> ERR: $*\n"
}
log_ok() {
  log "\t-> ${*:-ok}" # if nothing passed, write "ok"
}


## Usage:
log "Starting some step…"
# Some command doing it's stuff…
log_ok # default ok response
log_ok "specific status update"

log "Starting something that fails…"
# fail occurs here
log_err "that thing went wrong"


