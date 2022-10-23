vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'christoomey/vim-tmux-navigator'
    use 'editorconfig/editorconfig-vim'
    use 'junegunn/fzf.vim'
    use 'tpope/vim-surround'
    use { 'junegunn/fzf', run = './install --all' }
    use {'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'}
    use {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify')
        end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
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
    }
    use {
        'L3MON4D3/LuaSnip',
        tag = '*',
        requires = {
            'rafamadriz/friendly-snippets'
        },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load({ paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' } })
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = false,
                    theme = 'onedark'
                }
            })
        end
    }
    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'clangd',
                    'csharp_ls',
                    'pyright',
                    'rust_analyzer',
                    'sumneko_lua',
                    'tsserver',
                },
                automatic_installation = true,
            })
        end
    }
    use {
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
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    'bash',
                    'c',
                    'c_sharp',
                    'cmake',
                    'cpp',
                    'css',
                    'html',
                    'java',
                    'javascript',
                    'lua',
                    'python',
                    'rust'
                },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    }
    use {
        'ray-x/lsp_signature.nvim',
        config = function()
            cfg = {}
            require('lsp_signature').setup(cfg)
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({ map_cr = true })
        end
    }
    use {
        'simrat39/rust-tools.nvim',
        config = function() require('rust-tools').setup() end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').clangd.setup{}
            require('lspconfig').pyright.setup{}
            require('lspconfig').sumneko_lua.setup{}
            require('lspconfig').tsserver.setup{}
            require('lspconfig').csharp_ls.setup{}
        end
    }
    use {
        'folke/tokyonight.nvim',
        config = function() vim.cmd[[colorscheme tokyonight]] end
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup{}
        end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup({
                sort_by = 'case_sensitive',
                view = {
                    adaptive_size = true,
                    mappings = {
                        list = {
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
    }
    use {
        'akinsho/bufferline.nvim',
        tag = '*',
        config = function()
            require('bufferline').setup {
                options = {
                    show_buffer_close_icons = false,
                }
            }
        end
    }
    use {
        'folke/trouble.nvim',
        config = function() require('trouble').setup({ icons = false }) end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
