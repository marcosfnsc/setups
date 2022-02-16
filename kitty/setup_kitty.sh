
#!/usr/bin/env bash

mkdir -p $HOME/.config/kitty

if test -f "$HOME/.config/kitty/kitty.conf"; then
  rm $HOME/.config/kitty/kitty.conf
fi

ln kitty.conf $HOME/.config/kitty/kitty.conf
