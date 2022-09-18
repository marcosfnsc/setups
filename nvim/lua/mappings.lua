-- based on https://github.com/ellisonleao/neovimfiles/blob/main/plugin/keymaps.lua

local opts = { remap = false, silent = true }
local mappings = {
  { 'i', 'jj', [[<ESC>]], opts },                         -- escape from insert mode using jj
  { 'n', '<leader>s', [[<Cmd>update<CR>]], opts },        -- save buffer
  { 'n', '<space>e', [[<Cmd>NvimTreeToggle<CR>]], opts }, -- file explorer
}

for _, map in pairs(mappings) do
  vim.keymap.set(unpack(map))
end
