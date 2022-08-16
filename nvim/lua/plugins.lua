
vim.cmd([[
call plug#begin()
Plug 'OmniSharp/omnisharp-vim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale', {'for': ['python']}
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kevinoid/vim-jsonc'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim',
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
]])

vim.cmd([[ colorscheme onedark]]) -- theme
vim.g['airline_theme'] = 'deus' --
vim.g['ale_linters'] = {python = {'pylint'}} -- ale config
vim.g['coc_global_extensions'] = {
    'coc-emmet',
    'coc-html',
    'coc-pairs',
    'coc-rust-analyzer',
    'coc-tsserver',
}
--    'coc-clangd',
--    'coc-css',
--    'coc-java',
--    'coc-jedi',

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

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cpp",
    "css",
    "html",
    "java",
    "javascript",
    "lua",
    "python",
    "rust",
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
        list = {
            { key = "l", action = "open_file" },
        },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
