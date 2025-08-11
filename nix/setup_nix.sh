#!/usr/bin/env bash

set -o errexit

mkdir -p $HOME/.config/nix
ln -f nix.conf $HOME/.config/nix/nix.conf

mkdir -p $HOME/.config/home-manager
ln -f home.nix $HOME/.config/home-manager/home.nix
ln -f flake.nix $HOME/.config/home-manager/flake.nix
ln -f flake.lock $HOME/.config/home-manager/flake.lock

if ! command -v nix &> /dev/null; then
  sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon # multi user install
fi

if ! command -v home-manager &> /dev/null; then
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
fi

#home-manager switch
nix run ~/.config/home-manager#homeConfigurations.marcos.activationPackage

ln -f $HOME/.config/home-manager/flake.lock flake.lock
