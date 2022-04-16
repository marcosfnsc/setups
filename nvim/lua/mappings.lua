-- coc shortcuts
vim.cmd([[
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
]])
-- coc-explorer
vim.cmd([[ nnoremap <space>e :CocCommand explorer<CR>]])
--escape from insert mode using jj
vim.cmd([[ inoremap jj <Esc>]])
--save buffer
vim.cmd([[ noremap <Leader>s :update<CR>]])
