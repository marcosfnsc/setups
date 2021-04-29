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

"learn to use hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"coc-explorer
nnoremap <space>e :CocCommand explorer<CR>

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale', {'for': ['python']}
Plug 'HerringtonDarkholme/yats.vim' "syntax highlighting for TypeScript, includes react project
Plug 'rakr/vim-one'
Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for javascript, includes react project
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

colorscheme one
set background=dark

let g:airline#extensions#tabline#enabled = 1 " vim-airline tabline
set updatetime=100 "gitgutter config

" ale config
let g:ale_linters = {
  \ 'python': ['pylint'],
  \}

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-explorer',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-jedi',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-rust-analyzer',
  \ 'coc-tsserver',
  \ ]
