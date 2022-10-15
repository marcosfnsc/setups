#!/usr/bin/env bash

if [ "$EUID" -ne 0 ];then
  echo "Please run this script as root"
  exit 1
fi

if test -f "/etc/modprobe.d/webcam-blacklist.conf"; then
  rm /etc/modprobe.d/webcam-blacklist.conf
fi

modprobe uvcvideo
