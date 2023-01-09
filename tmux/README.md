dicas tmux:
=========

atalhos:
--------
* <kbd>prefix</kbd><kbd>!</kbd>: cria uma nova janela com o painel que estava em foco
* <kbd>prefix</kbd><kbd>$</kbd>: permite reonomear a sessão
* <kbd>prefix</kbd><kbd>&</kbd>: fecha a janela atual e tudo que estiver nela
* <kbd>prefix</kbd><kbd>(</kbd> ou <kbd>prefix</kbd><kbd>)</kbd>: alterna de uma sessão pra outra
* <kbd>prefix</kbd><kbd>,</kbd>: permite renomear a janela
* <kbd>prefix</kbd><kbd>:</kbd>: entra modo de comando
* <kbd>prefix</kbd><kbd>[</kbd>: entra no modo copia
* <kbd>prefix</kbd><kbd>[</kbd>: entrar no modo copia
* <kbd>prefix</kbd><kbd>]</kbd>: colar a partir do buffer do tmux
* <kbd>prefix</kbd><kbd>c</kbd>: cria uma nova janela
* <kbd>prefix</kbd><kbd>ctrol</kbd><kbd>o</kbd>: trocar posição dos paineis
* <kbd>prefix</kbd><kbd>d</kbd>: sai da sessão atual sem fechar ela (fica rodando em background)
* <kbd>prefix</kbd><kbd>s</kbd>: listar todas as sessões
* <kbd>prefix</kbd><kbd>space</kbd>: muda o layout dos paineis na janela atual
* <kbd>prefix</kbd><kbd>w</kbd>: listar todas as janelas
* <kbd>prefix</kbd><kbd>x</kbd>: fecha o oaine atual
* <kbd>prefix</kbd><kbd>z</kbd>: aplica zoom em um painel
* <kbd>prefix</kbd><kbd>N</kbd>: alterna para a janela correspondente ao numero N

comandos dentro do tmux:
------------------------
* `swap-window -t n`: troca a posição da janela atual, sendo `n` a posição desejada
* `join-pane -t :N`: move o painel em foco para a janela `N`
* `join-pane -t :N -v`: move o painel em foco para a janela `N` e divide os paineis na vertical
* `join-pane -t :N -h`: move o painel em foco para a janela `N` e divide os paineis na horizontal
* `break-pane -t :`: move o painel em foco para uma nova janela
* `setw synchronise-panes`: envia simultaneamente entrada do teclado de um painel para o resto dos painéis na mesma janela, para desativar o comando basta digita-lo novamente

comandos da cli:
----------------
* `tmux attach -t nome_da_sessao`: permite entrar dentro de uma determinada sessão do tmux
* `tmux kill-session -t nome_da_sessao`: encerra uma sessão
* `tmux new -d -s nome_da_sessao`: permite criar uma nova sessão sem entrar dentro dela, util quando se ja está em uma sessão do tmux e deseja criar outra
