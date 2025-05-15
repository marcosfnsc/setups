#!/usr/bin/env bash

mkdir -p $HOME/.config/nix
ln -f nix.conf $HOME/.config/nix/nix.conf

mkdir -p $HOME/.config/home-manager
ln -f home.nix $HOME/.config/home-manager/home.nix
