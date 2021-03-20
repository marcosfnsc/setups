#!/bin/bash

check_and_rm() {
  if test -f $1; then
    rm $1
  fi
}

# dolphin
check_and_rm $HOME/.config/dolphinrc
ln dolphinrc $HOME/.config/dolphinrc

# kglobalshortcutsrc
check_and_rm $HOME/.config/kglobalshortcutsrc
ln kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc

# konsole
check_and_rm $HOME/.config/konsolerc
ln konsolerc $HOME/.config/konsolerc 
