#!/usr/bin/env bash

if test -f "/etc/modprobe.d/webcam-blacklist.conf"; then
  rm /etc/modprobe.d/webcam-blacklist.conf
fi

modprobe -r uvcvideo
cp webcam-blacklist.conf /etc/modprobe.d/webcam-blacklist.conf
