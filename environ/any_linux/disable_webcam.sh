#!/usr/bin/env bash

if [ "$EUID" -ne 0 ];then
  echo "Please run this script as root"
  exit 1
fi

echo -e "blacklist uvcvideo\nalias uvcvideo off" > /etc/modprobe.d/webcam-blacklist.conf
modprobe -r uvcvideo
