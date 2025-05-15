#!/usr/bin/env bash

mkdir -p $HOME/.config/nix
ln -f nix.conf $HOME/.config/nix/nix.conf

mkdir -p $HOME/.config/home-manager
ln -f home.nix $HOME/.config/home-manager/home.nix

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

home-manager switch
