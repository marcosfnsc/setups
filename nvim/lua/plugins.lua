local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
    'christoomey/vim-tmux-navigator',
    'editorconfig/editorconfig-vim',
    'junegunn/fzf.vim',
    'tpope/vim-surround',
    {'junegunn/fzf', build = './install --all'},
    {'sindrets/diffview.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                on_highlights = function(hl, colors)
                    hl.LineNr = {
                        fg = colors.white
                    }
                    hl.LineNrAbove = {
                        fg = colors.white
                    }
                    hl.LineNrBelow = {
                        fg = colors.white
                    }
                end
            })
            vim.cmd[[colorscheme tokyonight]]
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function ()
            require('colorizer').setup()
        end
    },
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function ()
            require('fidget').setup()
        end
    },
    {
        'iamcco/markdown-preview.nvim',
        ft = { 'markdown' },
        build = 'cd app && npm install && cd - && git restore .',
        config = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            local cmp = require'cmp'
            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-j>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                },
                sources = {
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'nvim_lsp' },
                }
            }
        end
    },
    {
        'L3MON4D3/LuaSnip',
        version = '*',
        dependencies = {
            'rafamadriz/friendly-snippets'
        },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load({ paths = { '~/.local/share/nvim/lazy/friendly-snippets' } })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local function trailing_whitespace()
                local space = vim.fn.search([[\s\+$]], 'nwc')
                return space ~= 0 and "TW:"..space or ""
            end

            require('lualine').setup({
                options = {
                    icons_enabled = false,
                    theme = 'onedark'
                },
                sections = {
                    lualine_z = {'location', trailing_whitespace}
                }
            })
        end
    },
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function()
            require('mason').setup{ PATH = 'append' }
            require('lspconfig').clangd.setup{}
            require('lspconfig').intelephense.setup{}
            require('lspconfig').jdtls.setup{}
            require('lspconfig').lua_ls.setup{}
            require('lspconfig').pyright.setup{}
            require('lspconfig').texlab.setup{}
            require('lspconfig').ts_ls.setup{}
            require('lspconfig').volar.setup({
                init_options = {
                    typescript = {
                        tsdk = os.getenv('HOME') .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/"
                    },
                },
            })
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            local parsers = {
                'intelephense',
                'jdtls',
                'pyright',
                'ts_ls',
                'volar',
            }

            if (os.getenv("TERMUX_VERSION") == nil) then -- check if run in termux
                local other_parsers = {
                    'clangd',
                    'lua_ls',
                    'rust_analyzer',
                    'texlab',
                }
                for idx=1, #other_parsers do
                    parsers = vim.fn.add(parsers, other_parsers[idx])
                end
            end

            require('mason-lspconfig').setup({
                ensure_installed = parsers,
                automatic_installation = true,
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require('treesitter-context').setup{
                enable = true,
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
                zindex = 20, -- The Z-index of the context window
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'bash',
                    'c',
                    'cmake',
                    'cpp',
                    'css',
                    'html',
                    'java',
                    'javascript',
                    'latex',
                    'lua',
                    'php',
                    'python',
                    'rust',
                    'sql',
                    'typescript',
                    'vue',
                },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        'ray-x/lsp_signature.nvim',
        config = function()
            cfg = {}
            require('lsp_signature').setup(cfg)
        end
    },
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({ map_cr = true })
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
    {
        'nvim-flutter/flutter-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
        config = function()
            require("ibl").setup()
        end
    },
    {
        'kyazdani42/nvim-tree.lua',
        commit = '8b8d457e07d279976a9baac6bbff5aa036afdc5f', -- adiar atualização da nova api de mapemanetos
        config = function()
            require('nvim-tree').setup({
                update_focused_file = {
                    enable = true,
                },
                sort_by = 'case_sensitive',
                view = {
                    adaptive_size = true,
                    mappings = {
                        list = {
                            { key = 'h', action = 'open_file' },
                            { key = 'l', action = 'open_file' },
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
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        config = function()
            require('bufferline').setup {
                options = {
                    show_buffer_close_icons = false,
                }
            }
        end
    },
    {
        'folke/trouble.nvim',
        config = function() require('trouble').setup({ icons = false }) end
    },
})
