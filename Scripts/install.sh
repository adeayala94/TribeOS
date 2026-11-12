#!/bin/sh
# Build TribeOS in release mode and install the `tribeos` command.
# Usage: Scripts/install.sh            installs to ~/.local/bin
#        PREFIX=/usr/local Scripts/install.sh
set -eu

cd "$(dirname "$0")/.."
PREFIX="${PREFIX:-$HOME/.local}"

swift build -c release
mkdir -p "$PREFIX/bin"
install -m 755 "$(swift build -c release --show-bin-path)/tribeos" "$PREFIX/bin/tribeos"

echo "Installed $PREFIX/bin/tribeos"
case ":$PATH:" in
  *":$PREFIX/bin:"*) ;;
  *) echo "Add $PREFIX/bin to your PATH to run it as 'tribeos'." ;;
esac
