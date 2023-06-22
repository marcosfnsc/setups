#!/usr/bin/env bash

# oh-my-zsh setup
if [ ! -d "$HOME/.oh-my-zsh/" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

{
  ln -f zshrc $HOME/.zshrc 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f zshrc $HOME/.zshrc
}

{
  ln -f shell_functions $HOME/.shell_functions 2>/dev/null
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f shell_functions $HOME/.shell_functions
}

echo "setup zsh sucess"
