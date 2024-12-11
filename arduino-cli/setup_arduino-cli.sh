#!/usr/bin/env bash

set -o errexit

# install arduino-cli
INSTALL_PATH=~/.arduino-cli_bin
mkdir $INSTALL_PATH
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=$INSTALL_PATH sh

# install core plataform support
~/.arduino-cli_bin/arduino-cli config init
~/.arduino-cli_bin/arduino-cli config set board_manager.additional_urls http://arduino.esp8266.com/stable/package_esp8266com_index.json https://dl.espressif.com/dl/package_esp32_index.json
~/.arduino-cli_bin/arduino-cli core update-index
~/.arduino-cli_bin/arduino-cli core install arduino:avr
~/.arduino-cli_bin/arduino-cli core install esp32:esp32
~/.arduino-cli_bin/arduino-cli core install esp8266:esp8266

# install libraries
## AsyncTCP for esp32
## ESPAsyncTCP for esp8266
## ESPAsyncUDP for esp8266
~/.arduino-cli_bin/arduino-cli config set library.enable_unsafe_install true
~/.arduino-cli_bin/arduino-cli lib install "Arduinojson@7.0.4"
~/.arduino-cli_bin/arduino-cli lib install "AsyncTCP@1.1.4"
~/.arduino-cli_bin/arduino-cli lib install "ESPAsyncTCP@1.2.4"
~/.arduino-cli_bin/arduino-cli lib install "FastLED@3.7.0"
~/.arduino-cli_bin/arduino-cli lib install --git-url https://github.com/devyte/ESPAsyncDNSServer.git
~/.arduino-cli_bin/arduino-cli lib install --git-url https://github.com/me-no-dev/ESPAsyncUDP.git
~/.arduino-cli_bin/arduino-cli lib install --git-url https://github.com/me-no-dev/ESPAsyncWebServer.git

echo "setup arduino-cli sucess"
