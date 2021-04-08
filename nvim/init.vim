set clipboard=unnamed,unnamedplus " use system clipboard
set expandtab         " insert space when tab pressd
set number
set shiftwidth=2      " number of spaces inserts when tab pressd
set smarttab
set softtabstop=0
set tabstop=8

set foldmethod=indent
set nofoldenable

" 24 bit color supoort
set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"

syntax on

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale', {'for': ['python']}
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" nerdtree plugins
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-pyright',
  \ 'coc-rust-analyzer',
  \ 'coc-tsserver',
  \ ]

" ale config
let g:ale_linters = {
  \ 'python': ['pylint'],
  \}

colorscheme onedark

"gitgutter config
set updatetime=100

" show hidden files
let NERDTreeShowHidden=1

" vim-airline tabline
let g:airline#extensions#tabline#enabled = 1
