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

nix run nixpkgs#home-manager -- switch

ln -f $HOME/.config/home-manager/flake.lock flake.lock
