#!/usr/bin/env bash

if test -f "$HOME/.zshrc"; then
  rm $HOME/.zshrc
fi

if test -f "$HOME/.shell_functions"; then
  rm $HOME/.zshrc
fi

# oh-my-zsh setup
if [ ! -d "$HOME/.oh-my-zsh/" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

{
  ln zshrc $HOME/.zshrc 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp zshrc $HOME/.zshrc
}

{
  ln shell_functions $HOME/.shell_functions 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp zshrc $HOME/.shell_functions
}
