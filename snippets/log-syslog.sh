#!/usr/bin/env sh

TAG=my-script

# Useful for scripts that perform a series of steps

log() {
  >&2 echo "$*" | logger --tag  "$TAG"
}
log_ok() {
  log "\t-> ${*:-ok}" # if nothing passed, write "ok"
}
log_err() {
  log "\t-> ERR: $*"
}


_usage() {
	log "Starting some step…"
	# …
	log_ok # default "ok" response
	log_ok "specific status update"

	log "Starting something that will fail…"
	# …
	log_err "that thing went wrong"
}
#_usage

## Output:
#	Starting some step…
#		-> ok
#		-> specific status update
#	Starting something that fails…
#		-> ERR: that thing went wrong

