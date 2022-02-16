
#!/usr/bin/env bash

mkdir -p ~/.config/kitty

if test -f "~/.config/kitty/kitty.conf"; then
  rm ~/.config/kitty/kitty.conf
fi

ln kitty.conf ~/.config/kitty/kitty.conf
