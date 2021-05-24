#!/bin/bash

if test -f "/etc/modprobe.d/wecam-blacklist.conf"; then
  rm /etc/modprobe.d/wecam-blacklist.conf
fi

{
  ln wecam-blacklist.conf /etc/modprobe.d/wecam-blacklist.conf 2>/dev/null
} || {
  echo "erro ao criar link simbolico do script de modulo"
}
