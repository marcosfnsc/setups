#!/usr/bin/env bash

if [ ! "$EUID" -ne 0 ];then
  echo "Please run this script as non root"
  exit 1
fi

git clone --depth 1 --branch stable https://github.com/flutter/flutter.git ~/.flutter

cd ~/.flutter/bin
./flutter precache
./flutter config --no-analytics # desativar coleta de dados do google
./flutter config --no-enable-linux-desktop
