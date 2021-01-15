#!/bin/bash

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# install coc.vim extension
nvim +PlugInstall +q
nvim "+CocInstall coc-rust-analyzer" +q
nvim "*CocInstall coc-pyright" +q

