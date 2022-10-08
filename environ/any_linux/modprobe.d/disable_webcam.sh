#!/usr/bin/env bash

echo -e "blacklist uvcvideo\nalias uvcvideo off" > /etc/modprobe.d/webcam-blacklist.conf
modprobe -r uvcvideo
