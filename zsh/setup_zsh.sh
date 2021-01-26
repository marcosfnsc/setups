#!/bin/bash

# oh-my-zsh setup
if [ ! -d "$HOME/.oh-my-zsh/" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if test -f "$HOME/.zshrc"; then
  rm $HOME/.zshrc
fi

ln zshrc $HOME/.zshrc

