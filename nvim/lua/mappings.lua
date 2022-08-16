vim.cmd([[
"coc shortcuts
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

"file explorer
nnoremap <space>e :NvimTreeToggle <CR>

"escape from insert mode using jj
inoremap jj <Esc>

"save buffer
noremap <Leader>s :update<CR>


"hack for coc autocomplete bug
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])
