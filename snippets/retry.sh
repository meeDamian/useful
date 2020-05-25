#!/usr/bin/env sh

## Retry any command until exit=0
#
# Defaults behavior is:
#   RET_COUNT=3 RET_DELAY=10 retry <COMMAND>

# shellcheck disable=SC2048
retry() {
	delay=${RET_DELAY:-10} # seconds
	count=${RET_COUNT:-3}

	_s=s
	until $*; do
		>&2 printf "'%s' failed (exit=%s)" "$1" "$?"
		if [ $((count-=1)) = 0 ]; then
			>&2 printf "\n"
			return 1
		fi

		[ "$count" = 1 ] && _s=
		>&2 printf ", retry in %ss (%s more time%s)…\n\n" "$delay" "$count" "$_s"
		sleep "$delay"
	done
}

_usage() {
	retry ls /bin/nonexisting-file

	RET_DELAY=3 retry ls /etc/that-also-doesnt-exist

	RET_COUNT=100 retry cat /var/log/guess/what/that/doesn/t/exist.either
}
#_usage
