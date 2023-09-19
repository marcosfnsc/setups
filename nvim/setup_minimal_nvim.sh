mkdir -p ~/.config/nvim/lua
cat << EOF > ~/.config/nvim/init.lua
vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.expandtab = true
vim.opt.foldmethod = 'manual'
vim.opt.hidden = true
vim.opt.inccommand = 'split'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.updatetime = 100

vim.cmd([[
autocmd FileType lua    setlocal shiftwidth=4 tabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType rust   setlocal shiftwidth=4 tabstop=4
]])

vim.g.mapleader = '\\\'
local opts = { remap = false, silent = true }
local mappings = {
  { 'i', 'jj', [[<ESC>]], opts },
  { 'n', '<leader>s', [[<Cmd>update<CR>]], opts },
}

for _, map in pairs(mappings) do
  vim.keymap.set(unpack(map))
end
EOF
