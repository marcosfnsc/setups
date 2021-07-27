#!/usr/bin/env bash

REPO_ROOT=$PWD/..
_USERNAME=marcos

# config sudoers
echo "add user in sudoers"
visudo

# config hostmane
hostnamectl set-hostname note

# config swap
echo "vm.swappiness=10" >> /etc/sysctl.conf

# install pyenv
sudo -u $_USERNAME curl https://pyenv.run | bash

# rust environpment
sudo -u $_USERNAME curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# -----------------------

# run other scripts
#cd docker                       &&                   ./setup_docker.sh
cd $REPO_ROOT/alacritty          && sudo -u $_USERNAME ./setup_alacritty.sh
cd $REPO_ROOT/environ/dotfiles   && sudo -u $_USERNAME ./setup_dotfiles.sh
cd $REPO_ROOT/environ/modprobe.d &&                    ./setup_modprobe.sh
cd $REPO_ROOT/flatpak            && sudo -u $_USERNAME ./setup_flatpak.sh
cd $REPO_ROOT/fzf                && sudo -u $_USERNAME ./setup_fzf.sh
cd $REPO_ROOT/git_config         && sudo -u $_USERNAME ./setup_git.sh
cd $REPO_ROOT/nvim               && sudo -u $_USERNAME ./setup_nvim.sh
cd $REPO_ROOT/tmux               && sudo -u $_USERNAME ./setup_tmux.sh
cd $REPO_ROOT/zsh                && sudo -u $_USERNAME ./setup_zsh.sh
