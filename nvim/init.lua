vim.opt.clipboard = 'unnamed,unnamedplus' -- use system clipboard
vim.opt.expandtab = true                  -- insert spaces when tab pressd
vim.opt.hidden = true                     -- allow hiding the buffer without saving changes
vim.opt.inccommand = 'split'
vim.opt.number = true                     -- show number of lines
vim.opt.relativenumber = true             -- show relative distance in lines
vim.opt.shiftwidth = 2                    -- how many columns text will be indented when using indent operations (>> or <<)
vim.opt.tabstop = 2                       -- number of visual spaces per TAB
vim.opt.termguicolors = true              -- 24 bit color supoort
vim.opt.updatetime = 100

if (os.getenv("TERMUX_VERSION") == nil) then -- check if run in termux
    vim.opt.wrap = true
else
    vim.opt.wrap = false
end

-- 4 spaces of indent for python and rust, 2 by default
vim.cmd([[
autocmd FileType lua setlocal shiftwidth=4 tabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType rust setlocal shiftwidth=4 tabstop=4
]])

-- fix json to jsonc
--vim.cmd([[ autocmd FileType json set filetype=jsonc ]])

-- natural split
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.foldmethod = 'manual'
-- vim.opt.nofoldenable = true

-- go to definition
vim.cmd([[ nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>]])
-- coc-explorer
vim.cmd([[ nnoremap <space>e :CocCommand explorer<CR>]])
--escape from insert mode using jj
vim.cmd([[ inoremap jj <Esc>]])
--save buffer
vim.cmd([[ noremap <Leader>s :update<CR>]])

vim.cmd([[
call plug#begin()
"Plug 'HerringtonDarkholme/yats.vim' "syntax highlighting for TypeScript, includes react project
"Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for javascript, includes react project
Plug 'bfrg/vim-cpp-modern' "syntax highlighting c/c++
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale', {'for': ['python']}
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinoid/vim-jsonc'
Plug 'lewis6991/gitsigns.nvim',
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'
call plug#end()
]])

-- theme
vim.cmd([[ colorscheme onedark]])

vim.g['python_highlight_all'] = 1 -- enable highlight for python
vim.g['airline#extensions#tabline#enabled'] = 1 -- vim-airline tabline
vim.g['airline_theme'] = 'deus'

-- ale config
vim.g['ale_linters'] = {
    python = {'pylint'},
}

vim.g['coc_global_extensions'] = {
    'coc-clangd',
    'coc-emmet',
    'coc-explorer',
    'coc-html',
    'coc-jedi',
    'coc-pairs',
    'coc-rust-analyzer',
    'coc-sh',
    'coc-tsserver',
}
--    'coc-java',
--    'coc-css',
--    'coc-json',

vim.cmd([[let g:indentLine_setColors = 0]])

-- remove trailing whitespace
vim.cmd([[ command RmTrailingWhitespaces :%s/\s\+$//e | :noh ]])

require('gitsigns').setup()

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#353d44 gui=nocombine]]
require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}
