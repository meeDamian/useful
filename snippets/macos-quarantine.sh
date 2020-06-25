#!/usr/bin/env sh

# Make it possible to run binary downloaded via browser

unquarantine() { xattr -d com.apple.quarantine "$1"; }
