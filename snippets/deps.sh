#!/usr/bin/env sh

exists() {
	test -x "$(command -v "$1")"
}

has_deps() {
	fmt='ERR: Required dependency "%s" is missing\n'

	# shellcheck disable=SC2059
	for c in "$@"; do
		exists "$c" || { >&2 printf "$fmt" "$c"; return 1; }
	done
}

# Install provided packages, using available package manager
# shellcheck disable=SC2086
install() {
	packages="$*"

	exists brew && brew install            $packages  && return 0
	exists apt  && apt  install --yes      $packages  && return 0
	exists apk  && apk  add     --no-cache $packages  && return 0

	>&2 echo "ERR: unable to find supported package manager"
	return 1
}


_usage() {
	if ! exists foobar; then
		>&2 echo 'Binary "foobar" is missing'
	fi

	echo
	if ! has_deps cat jq foobar; then
		>&2 echo "At least one of the dependencies is missing"
	fi

	echo
	if ! has_deps jq foobar 2>/dev/null; then
		>&2 echo "At least one of the dependencies is missing"
	fi

	echo
	#	has_deps cat sed ls foobar || exit 1

	if ! install jq; then
		exit 1
	fi

	# install jq || exit 1

	# optional check
	if ! exists jq; then
		>&2 echo "jq not installed, or available"
		exit 1
	fi

	>&2 echo "jq installed & available"
}
#_usage

