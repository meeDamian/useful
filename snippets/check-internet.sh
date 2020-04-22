#!/usr/bin/env sh

# Check for internet access by attempting connection to two DNS servers
internet() {
	# Return success on the first successful connection
	nc -zdnw3 1.1.1.1 443 && return 0 # CloudFlare DNS
	nc -zdnw3 8.8.8.8 443 && return 0 # Google DNS

	# Return fail if both connections failed
	return 1
}


## Usage
if ! internet; then
	echo "no internet"
fi
