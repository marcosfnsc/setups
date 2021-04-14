syntax on
set clipboard=unnamed,unnamedplus " use system clipboard
set expandtab         " insert space when tab pressd
set hidden " hiddne a buffer
set number
set shiftwidth=2      " number of spaces inserts when tab pressd
set smarttab
set softtabstop=0
set tabstop=8

" natural split
set splitbelow
set splitright

set foldmethod=indent
set nofoldenable

" 24 bit color supoort
set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale', {'for': ['python']}
Plug 'HerringtonDarkholme/yats.vim' "syntax highlighting for TypeScript, includes react project
Plug 'joshdick/onedark.vim'
Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for javascript, includes react project
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

colorscheme onedark

let g:airline#extensions#tabline#enabled = 1 " vim-airline tabline
set updatetime=100 "gitgutter config
let NERDTreeShowHidden=1 " show hidden files

" ale config
let g:ale_linters = {
  \ 'python': ['pylint'],
  \}

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
