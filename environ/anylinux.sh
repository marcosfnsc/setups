#!/usr/bin/env bash

# config sudoers
usermod -aG wheel $username

# config hostmane
hostnamectl set-hostname note

# config swap
echo "vm.swappiness=10" >> /etc/sysctl.conf

# install pyenv
sudo -u $username curl https://pyenv.run | bash

# rust environpment
sudo -u $username curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# -----------------------
