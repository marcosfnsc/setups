#!/bin/bash

if test -f "/etc/modprobe.d/wecam-blacklist.conf"; then
  rm /etc/modprobe.d/wecam-blacklist.conf
fi

cp wecam-blacklist.conf /etc/modprobe.d/wecam-blacklist.conf
