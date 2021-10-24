dicas tmux:
=========

atalhos:
--------
* <kbd>prefix</kbd><kbd>:</kbd>: entra modo de comando
* <kbd>prefix</kbd><kbd>d</kbd>: sai da sessão atual sem fechar ela (fica rodando em background)
* <kbd>prefix</kbd><kbd>space</kbd>: muda o layout dos paineis na janela atual
* <kbd>prefix</kbd><kbd>(</kbd> ou <kbd>prefix</kbd><kbd>)</kbd>: alterna de uma sessão pra outra
* <kbd>prefix</kbd><kbd>&</kbd>: fecha a janela atual e tudo que estiver nela
* <kbd>prefix</kbd><kbd>!</kbd>: cria uma nova janela com o painel que estava em foco
* <kbd>prefix</kbd><kbd>c</kbd>: cria uma nova janela
* <kbd>prefix</kbd><kbd>[</kbd>: entra no modo copia
* <kbd>prefix</kbd><kbd>z</kbd>: aplica zoom em um painel
* <kbd>prefix</kbd><kbd>w</kbd>: listar todas as janelas
* <kbd>prefix</kbd><kbd>$</kbd>: permite reonomear a sessão
* <kbd>prefix</kbd><kbd>s</kbd>: listar todas as sessões
* <kbd>prefix</kbd><kbd>,</kbd>: permite renomear a janela
* <kbd>prefix</kbd><kbd>ctrol</kbd><kbd>o</kbd>: trocar paineis
* <kbd>prefix</kbd><kbd>[</kbd>: entrar no modo copia
* <kbd>prefix</kbd><kbd>]</kbd>: colar a partir do buffer do tmux

comandos dentro do tmux:
---------
* `swap-window -t n`: troca a posição da janela atual, sendo `n` a posição desejada
* `join-pane -t N:N`: move o painel em foco para o painel definido na posição `N:N`
* `join-pane -t N:N -v`: move o painel em foco para o painel definido na posição `N:N` e os painei divididos na vertical
* `join-pane -t N:N -h`: move o painel em foco para o painel definido na posição `N:N` e os painei divididos na horizontal
* `break-pane -t :`: move o painel em foco para uma nova janela
* `setw synchronise-panes`: envia simultaneamente entrada do teclado de um painel para o resto dos painéis na mesma janela, para desativar o comando basta digita-lo novamente
