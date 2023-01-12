-- based on https://github.com/ellisonleao/neovimfiles/blob/main/plugin/keymaps.lua

vim.g.mapleader = '\\'

local opts = { remap = false, silent = true }
local mappings = {
    { 'i', 'jj', [[<ESC>]], opts },                                                       -- escape from insert mode using jj
    { 'n', '<leader>ca', [[<Cmd>lua vim.lsp.buf.code_action()<CR>]], opts },              -- call code actions
    { 'n', '<leader>gd', [[<Cmd>lua vim.lsp.buf.definition()<CR>]], opts },               -- jump to definition
    { 'n', '<leader>gt', [[<Cmd>lua vim.lsp.buf.hover()<CR>]], opts },                    -- show hover
    { 'n', '<leader>L', [[<Cmd>call clearmatches()<CR>]], opts },                         -- clear arbitrary lines selected
    { 'n', '<leader>l', [[<Cmd>call matchadd('Search', '\%'.line('.').'l')<CR>]], opts }, -- select arbitrary lines
    { 'n', '<leader>s', [[<Cmd>update<CR>]], opts },                                      -- save buffer
    { 'n', '<space>e', [[<Cmd>NvimTreeToggle<CR>]], opts },                               -- file explorer
}

for _, map in pairs(mappings) do
    vim.keymap.set(unpack(map))
end
