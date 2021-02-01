set clipboard=unnamed " use system clipboard
set expandtab         " insert space when tab pressd
set number
set shiftwidth=2      " number of spaces inserts when tab pressd
set smarttab
set softtabstop=0
set tabstop=8

"enable 24-bit support
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

syntax on

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" nerdtree plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-go',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-pyright',
  \ 'coc-rust-analyzer',
  \ 'coc-tsserver',
  \ ]

colorscheme onedark

"gitgutter config
set updatetime=100

" show hidden files
let NERDTreeShowHidden=1

