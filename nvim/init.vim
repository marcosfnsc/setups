set clipboard=unnamed,unnamedplus "use system clipboard
set expandtab                     "insert spaces when tab pressd
set hidden                        "allow hiding the buffer without saving changes
set inccommand=split
set number                        "show number of lines
set relativenumber                "show relative distance in lines
set shiftwidth=4                  "how many columns text will be indented when using indent operations (>> or <<)
set smarttab                      "transform tab into spaces in insert mode
set tabstop=4                     "number of visual spaces per TAB
set termguicolors                 "24 bit color supoort
set updatetime=100
syntax on

" natural split
set splitbelow
set splitright

set foldmethod=manual
set nofoldenable

"go to definition
nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>
"coc-explorer
nnoremap <space>e :CocCommand explorer<CR>

call plug#begin()
"Plug 'HerringtonDarkholme/yats.vim' "syntax highlighting for TypeScript, includes react project
"Plug 'bfrg/vim-cpp-modern' "syntax highlighting c/c++
"Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for javascript, includes react project
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale', {'for': ['python']}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

" theme
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
  \ 'coc-java',
  \ 'coc-jedi',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-rust-analyzer',
  \ 'coc-sh',
  \ 'coc-tsserver',
  \ 'coc-vimlsp',
  \ ]
