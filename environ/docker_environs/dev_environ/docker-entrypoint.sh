#!/usr/bin/env bash

set -o errexit

if [ "$EUID" -eq 0 ]; then
  # run this as root

  chown -R marcos:marcos /var/run/docker.sock
  exec sudo -u marcos sh -c "/docker-entrypoint.sh"
fi

CONTAINER_FIRST_STARTUP="$HOME/.CONTAINER_FIRST_STARTUP"
if [ ! -f $CONTAINER_FIRST_STARTUP ]; then
  touch $CONTAINER_FIRST_STARTUP

  git clone --depth 1 https://github.com/marcosfnsc/setups.git $HOME/setups \
    && PATH_DIR_SETUPS="$HOME/setups" \
    && cd $PATH_DIR_SETUPS/git_config && ./setup_git.sh \
    && cd $PATH_DIR_SETUPS/nvim       && ./setup_nvim.sh \
    && cd $PATH_DIR_SETUPS/tmux       && ./setup_tmux.sh \
    && cd $PATH_DIR_SETUPS/zsh        && ./setup_zsh.sh \
    && cd $PATH_DIR_SETUPS/fzf        && ./setup_fzf.sh \
    && cd $PATH_DIR_SETUPS/.. && rm -rf setups

  echo "exec zsh" > /home/marcos/.bashrc
fi

tail -f /dev/null
