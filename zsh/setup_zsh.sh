#!/usr/bin/env bash

set -o errexit

# oh-my-zsh setup
if [ ! -d "$HOME/.oh-my-zsh/" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

symbol_link_or_copy() {
  {
    ln -f $1 $2 2>/dev/null
  } || {
    echo "erro ao criar link fisico do arquivo $1, copiando arquivo ..."
    cp -f $1 $2
  }
}

symbol_link_or_copy shell_functions $HOME/.shell_functions
symbol_link_or_copy zshrc           $HOME/.zshrc

echo "setup zsh sucess"
