#### principais comandos do pacman:
* `pacman -Fy nome_do_binario`: achar qual o pacote pertence o arquivo
* `pacman -Q`: listar todos os pacotes e depedencias instalados, `-Qq` faz com que ele não mostre a versão dos pacotes
* `pacman -Qdt`: listar pacotes orfãos instalados
* `pacman -Qe`: listar pacotes instalados de forma explicita
* `pacman -Qi nome_do_pacote`: mostra informações de um pacote instalado
* `pacman -Ql nome_do_pacote`: listar arquivos instalados por um pacote
* `pacman -Qm`: listar todos os pacotes estrangeiros (instalados manualmente ou pacotes removidos dos repositórios)
* `pacman -Qo nome_do_arquivo`: descobrir a qual pacote pertence o arquivo
* `pacman -Qs regex`: listar pacotes por regex
* `pacman -Rs nome_do_pacote`: remover o pacote e depedencias não usadas por outros pacotes
* `pacman -S nome_do_pacote --overwrite "*"`: o parametro `overwrite` é util quando há arquivos no sistema não rastreados pelo gerenciador de pacotes que estão causando conflito, provavelmente de instalações problematicas
* `pacman -S nome_do_pacote`: instalar pacote
* `pacman -Sc`: remover do cache arquivos de pacotes que não estão instalados
* `pacman -Scc`: remover do cache todos os arquivos de pacotes
* `pacman -Sg nome_do_grupo`: listar pacotes que fazem parte de um determinado grupo
* `pacman -Si nome_do_pacote`: mostra informações de um pácote disponivel no repositorio
* `pacman -Ss nome_do_pacote`: pesquisar pacote
* `pacman -Sw nome_do_pacote`: baixar pacotes mas sem instalar
* `pacman -Syyu`: força a atualização do banco de dados e atualiza o sistema caso tenha atualização disponivel

#### principais comandos do apt-get/apt:
* `apt clean`: apaga o cache de pacotes baixadoa
* `apt show nome_do_pacote`: mostra informações sobre um determinado pacote
* `apt-cache depends nome_do_pacote`: mostra quais pacotes um determinado pacote depende
