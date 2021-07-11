#!/bin/bash

## fedora
# install repository
dnf  install dnf-plugins-core -y
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# install docker engine and compose
dnf install docker-ce docker-ce-cli containerd.io docker-compose -y


# configure to init with system
systemctl enable docker.service
systemctl enable containerd.service
