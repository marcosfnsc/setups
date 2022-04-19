
vim.cmd([[
call plug#begin()
"Plug 'HerringtonDarkholme/yats.vim' "syntax highlighting for TypeScript, includes react project
"Plug 'maxmellon/vim-jsx-pretty' "syntax highlighting for javascript, includes react project
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
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

vim.cmd([[ colorscheme onedark]]) -- theme
vim.g['airline_theme'] = 'deus' --
vim.g['ale_linters'] = {python = {'pylint'}} -- ale config
vim.g['python_highlight_all'] = 1 -- enable highlight for python
vim.g['coc_global_extensions'] = {
    'coc-emmet',
    'coc-explorer',
    'coc-html',
    'coc-jedi',
    'coc-pairs',
    'coc-rust-analyzer',
    'coc-sh',
    'coc-tsserver',
}
--    'coc-clangd',
--    'coc-java',
--    'coc-css',

require('bufferline').setup {
  options = {
    show_buffer_close_icons = false,
  }
}
require('gitsigns').setup()

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#353d44 gui=nocombine]]
require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}
