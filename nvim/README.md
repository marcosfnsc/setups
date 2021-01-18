setup neovim
============

execute o script setup-vim.sh, ele vai instalar o vim-plug e os plugins principais, ele vai tentar criar um hardlink do arquivo
de configuracao do neovim, dependendo do sistema esse processo pode dar erro e neste caso ele vai simplesmete copiar
o arquivo de configuracao para o local adequado

alguns plugins extras:
----------------------
a instalacao de alguns plugins não pôde ser automatizada, neste caso é preciso entrar no neovim e executar os comandos
```console
:CocInstall nome-da-extensao
```
extensoes:
* coc-pyright
* coc-rust-analyzer
instalar coc-pyright seria assim
```console
CocInstall coc-pyright
```
