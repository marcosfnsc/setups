#!/bin/bash

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

rm $HOME/.config/nvim/init.vim
ln init.vim $HOME/.config/nvim/init.vim

# install coc.vim extension
nvim +PlugInstall +qa
nvim "+CocInstall coc-rust-analyzer" +qa
nvim "*CocInstall coc-pyright" +qa

