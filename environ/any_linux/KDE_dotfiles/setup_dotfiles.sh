#!/usr/bin/env bash

check_and_rm() {
  if test -f $1; then
    rm $1
  fi
}

# baloo
echo "exclude folders[\$e]=\$HOME/code_space,$HOME/.config,$HOME/.local" >> ~/.config/baloofilerc

# dolphin
check_and_rm $HOME/.config/dolphinrc
ln dolphinrc $HOME/.config/dolphinrc

# kglobalshortcutsrc
check_and_rm $HOME/.config/kglobalshortcutsrc
ln kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc

# konsole
check_and_rm $HOME/.config/konsolerc
ln konsolerc $HOME/.config/konsolerc 
