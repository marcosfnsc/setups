#!/usr/bin/env bash

REPO_ROOT=$PWD/../..
_USERNAME=marcos

# config sudoers
echo "add user in sudoers"
visudo

# config hostmane
hostnamectl set-hostname note

# config swap
echo "vm.swappiness=10" >> /etc/sysctl.d/99-sysctl.conf


# run other scripts
cd $REPO_ROOT/environ/any_linux              &&                    ./disable_webcam.sh
cd $REPO_ROOT/environ/any_linux/kde_dotfiles && sudo -u $_USERNAME ./setup_dotfiles.sh
cd $REPO_ROOT/flatpak                        && sudo -u $_USERNAME ./setup_flatpak.sh
cd $REPO_ROOT/fzf                            && sudo -u $_USERNAME ./setup_fzf.sh
cd $REPO_ROOT/git_config                     && sudo -u $_USERNAME ./setup_git.sh
cd $REPO_ROOT/kitty                          && sudo -u $_USERNAME ./setup_kitty.sh
cd $REPO_ROOT/nvim                           && sudo -u $_USERNAME ./setup_nvim.sh
cd $REPO_ROOT/tmux                           && sudo -u $_USERNAME ./setup_tmux.sh
cd $REPO_ROOT/zsh                            && sudo -u $_USERNAME ./setup_zsh.sh

sudo -u $_USERNAME chsh -s $(which zsh)
