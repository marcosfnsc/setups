set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
syntax on

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme onedark

"gitgutter config
set updatetime=100

