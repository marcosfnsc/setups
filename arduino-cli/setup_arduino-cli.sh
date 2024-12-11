#!/usr/bin/env bash

set -o errexit

# install arduino-cli
INSTALL_PATH=~/.arduino-cli_bin
mkdir $INSTALL_PATH
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=$INSTALL_PATH sh

echo "setup arduino-cli sucess"
