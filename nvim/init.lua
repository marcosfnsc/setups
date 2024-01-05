vim.opt.clipboard = 'unnamed,unnamedplus' -- use system clipboard
vim.opt.expandtab = true                  -- insert spaces when tab pressd
vim.opt.foldmethod = 'manual'
vim.opt.hidden = true                     -- allow hiding the buffer without saving changes
vim.opt.inccommand = 'split'
vim.opt.number = true                     -- show number of lines
vim.opt.relativenumber = true             -- show relative distance in lines
vim.opt.shiftwidth = 2                    -- how many columns text will be indented when using indent operations (>> or <<)
vim.opt.splitbelow = true                 -- natural split
vim.opt.splitright = true                 -- natural split
vim.opt.tabstop = 2                       -- number of visual spaces per TAB
vim.opt.termguicolors = true              -- 24 bit color supoort
vim.opt.updatetime = 100

if (os.getenv("TERMUX_VERSION") == nil) then -- check if run in termux
    vim.opt.wrap = true
else
    vim.opt.wrap = false
end

-- 4 spaces of indent for some languages, 2 by default
vim.cmd([[
autocmd FileType lua    setlocal shiftwidth=4 tabstop=4
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType rust   setlocal shiftwidth=4 tabstop=4
]])

vim.cmd([[ command RmTrailingWhitespaces :%s/\s\+$//e | :noh ]]) -- remove trailing whitespace
vim.cmd([[ command TtyModeOff :colorscheme tokyonight ]])
vim.cmd([[ command TtyModeOn :colorscheme default ]])

require("mappings")
require("plugins")
