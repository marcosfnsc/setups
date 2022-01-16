set clipboard=unnamed,unnamedplus "use system clipboard
set expandtab                     "insert spaces when tab pressd
set hidden                        "allow hiding the buffer without saving changes
set inccommand=split
set number                        "show number of lines
set relativenumber                "show relative distance in lines
set shiftwidth=2                  "how many columns text will be indented when using indent operations (>> or <<)
set tabstop=2                     "number of visual spaces per TAB
set termguicolors                 "24 bit color supoort
set updatetime=100
syntax on

" 4 spaces of indent for python and rust, 2 by default
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType rust setlocal shiftwidth=4 tabstop=4

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
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale', {'for': ['python']}
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-python/python-syntax'
call plug#end()

" theme
colorscheme one
set background=dark

let g:python_highlight_all = 1 " enable highlight for python
let g:airline#extensions#tabline#enabled = 1 " vim-airline tabline

" ale config
let g:ale_linters = {
  \ 'python': ['pylint'],
  \}

let g:coc_global_extensions = [
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
"  \ 'coc-clangd',
"  \ 'coc-java',
"  \ 'coc-css',


" remove trailing whitespace
command RmTrailingWhitespaces :%s/\s\+$//e | :noh
