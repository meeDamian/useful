#!/usr/bin/env sh

## Check for internet access by attempting connection to two DNS servers

has_internet() {
	# Suppress `nc` output on macOS
	exec 2>/dev/null

	# `nc` timeout flag on Linux is `-w`, but `-G` on macOS
	[ "$(uname)" = "Darwin" ] && T=G || T=w

	# Return success on the first successful connection
	nc -$T 3 -zdn 1.1.1.1 443 && return 0 # CloudFlare DNS
	nc -$T 3 -zdn 8.8.8.8 443 && return 0 # Google DNS

	# Return fail if both attempts failed
	return 1
}


_usage() {
	if ! has_internet; then
		>&2 echo "no internet" && exit 1
	fi
}
#_usage
