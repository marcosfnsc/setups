#!/usr/bin/env bash

if test -f "$HOME/.zshrc"; then
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

if [ ! -f "$HOME/.bashrc-old" ]; then
  mv $HOME/.bashrc $HOME/.bashrc-old
fi
echo "exec zsh" > $HOME/.bashrc
