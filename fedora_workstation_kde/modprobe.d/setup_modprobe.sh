#!/bin/bash

if test -f "/etc/modprobe.d/webcam-blacklist.conf"; then
  rm /etc/modprobe.d/webcam-blacklist.conf
fi

sudo modprobe -r uvcvideo

cp webcam-blacklist.conf /etc/modprobe.d/webcam-blacklist.conf
