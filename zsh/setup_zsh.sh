#!/bin/bash

# oh-my-zsh setup
sudo -u $username sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln .zshrc $HOME/.zshrc

