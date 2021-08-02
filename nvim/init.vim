syntax on
set clipboard=unnamed,unnamedplus " use system clipboard
set expandtab                     " insert space when tab pressd
set hidden                        " hiddne a buffer
set number
set shiftwidth=2                  " number of spaces inserts when tab pressd
set smarttab
set softtabstop=0
set tabstop=8
set relativenumber
set updatetime=100
set inccommand=nosplit

" natural split
set splitbelow
set splitright

set foldmethod=manual
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

" go to definition
nmap <silent> gd <Plug>(coc-definition)

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
Plug 'Yggdroot/indentLine'
Plug 'bfrg/vim-cpp-modern'
call plug#end()

colorscheme one
set background=dark

let g:airline#extensions#tabline#enabled = 1 " vim-airline tabline

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
  \ 'coc-jedi',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-rust-analyzer',
  \ 'coc-sh',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ ]
