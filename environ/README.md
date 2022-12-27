principais comandos para archlinux:
===================================
* `pacman -Fy nome_do_binario`: achar qual o pacote pertence o arquivo
* `pacman -Q`: listar todos os pacotes e depedencias instalados, `-Qq` faz com que ele não mostre a versão dos pacotes
* `pacman -Qdt`: listar pacotes orfãos instalados
* `pacman -Qe`: listar pacotes instalados mas não mostrar os pacotes instalados como depedencias
* `pacman -Qi nome_do_pacote`: mostra informações de um pacote instalado
* `pacman -Ql nome_do_pacote`: listar arquivos instalados por um pacote
* `pacman -Rs nome_do_pacote`: remover o pacote e depedencias não usadas por outros pacotes
* `pacman -S nome_do_pacote`: instalar pacote
* `pacman -Sc`: remover do cache arquivos de pacotes que não estão instalados
* `pacman -Scc`: remover do cache todos os arquivos de pacotes
* `pacman -Si nome_do_pacote`: mostra informações de um pácote disponivel no repositorio
* `pacman -Ss nome_do_pacote`: pesquisar pacote
* `pacman -Sw nome_do_pacote`: baixar pacotes mas sem instalar
