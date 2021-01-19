set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
syntax on

"enable 24-bit support
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

"use system clipboard
set clipboard=unnamed

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme onedark

"gitgutter config
set updatetime=100

