#!/usr/bin/env sh

##

# shellcheck source=./deps.sh
. "./$(dirname "$0")/deps.sh"


# Restarts provided service, using available service manager
# shellcheck disable=SC2086
restart() {
	service="$1"

	exists brew        && brew services restart "$service"  && return 0
	exists systemctl   && systemctl     restart "$service"  && return 0
	exists rc-service  && rc-service   "$service" restart   && return 0

	>&2 echo "ERR: unable to find supported package manager"
	return 1
}

setup_tor_ssh() {
	if [ "$(id -u)" != "0" ]; then
		>&2 "ERR: This script needs to be run as root"
		exit 1
	fi

	exists tor || install tor || exit 1

	T=/etc/tor/torrc
	if [ ! -f "$T" ]; then
		>&2 echo "ERR: Tor configuration file missing at '$T'"
		return 1
	fi

	HS=/var/lib/tor/ssh/
	if [ -f "$HS/hostname" ]; then
		>&2 echo "ERR: Hidden Service for ssh seems to already exist at '$HS/'"
		return 1
	fi

	cp "$T" "$T.bak"

	cat <<EOF >>"$T"
HiddenServiceDir /var/lib/tor/ssh/
HiddenServiceVersion 2
HiddenServicePort 22 127.0.0.1:22
HiddenServiceAuthorizeClient stealth ssh
EOF

		restart tor || true
		restart tor@default || true

		sleep 16

	for delay in $(seq 8); do
		>&2 printf '.'
		sleep "$delay"

		if [ -f "$HS/hostname" ]; then
			break
		fi
	done

	>&2 echo ''

	if [ ! -f "$HS/hostname" ]; then
		>&2 echo "ERR: Failed to get hostname, restoring…"
		cp "$T" "$T.ssh-over-tor.bak"
		cp "$T.bak" "$T"

		restart tor || true
		restart tor@default || true

		>&2 echo "ERR: Operation failed successfully ;)."
		return 1
	fi

	>&2 printf "Success! Add the following to the torrc file on the device you'll be connecting FROM:\n\t"
	awk '{ print "HidServAuth", $1, $2 }' "$HS/hostname"
}

setup_tor_ssh

