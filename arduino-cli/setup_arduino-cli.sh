#!/usr/bin/env bash

set -o errexit

# install arduino-cli
ARDUINO_PATH=~/.arduino-cli_bin
if [ ! -d ~/.arduino-cli_bin/ ]; then
  mkdir $ARDUINO_PATH
  curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=$ARDUINO_PATH sh
fi

# install core plataform support
$ARDUINO_PATH/arduino-cli config init
$ARDUINO_PATH/arduino-cli config set board_manager.additional_urls \
  http://arduino.esp8266.com/stable/package_esp8266com_index.json \
  https://dl.espressif.com/dl/package_esp32_index.json
$ARDUINO_PATH/arduino-cli config set library.enable_unsafe_install true
$ARDUINO_PATH/arduino-cli core update-index
$ARDUINO_PATH/arduino-cli core install arduino:avr
$ARDUINO_PATH/arduino-cli core install esp32:esp32
$ARDUINO_PATH/arduino-cli core install esp8266:esp8266

echo "cores installed"
$ARDUINO_PATH/arduino-cli core list

# install libraries
## AsyncTCP for esp32
## ESPAsyncTCP for esp8266
## ESPAsyncUDP for esp8266
$ARDUINO_PATH/arduino-cli lib install "Arduinojson@7.0.4"
$ARDUINO_PATH/arduino-cli lib install "AsyncTCP@1.1.4"
$ARDUINO_PATH/arduino-cli lib install "ESPAsyncTCP@1.2.4"
$ARDUINO_PATH/arduino-cli lib install "FastLED@3.7.0"
$ARDUINO_PATH/arduino-cli lib install --git-url https://github.com/devyte/ESPAsyncDNSServer.git
$ARDUINO_PATH/arduino-cli lib install --git-url https://github.com/me-no-dev/ESPAsyncUDP.git
$ARDUINO_PATH/arduino-cli lib install --git-url https://github.com/me-no-dev/ESPAsyncWebServer.git

echo "setup arduino-cli sucess"
