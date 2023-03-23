dicas tmux:
=========

atalhos:
--------
atalho padr]ao para `prefix`: <kbd>ctrol</kbd><kbd>b</kbd>
* `prefix`<kbd>!</kbd>: cria uma nova janela com o painel que estava em foco
* `prefix`<kbd>$</kbd>: permite reonomear a sessão
* `prefix`<kbd>&</kbd>: fecha a janela atual e tudo que estiver nela
* `prefix`<kbd>(</kbd> ou `prefix`<kbd>)</kbd>: alterna de uma sessão pra outra
* `prefix`<kbd>,</kbd>: permite renomear a janela
* `prefix`<kbd>:</kbd>: entra modo de comando
* `prefix`<kbd>[</kbd>: entra no modo copia
* `prefix`<kbd>[</kbd>: entrar no modo copia
* `prefix`<kbd>]</kbd>: colar a partir do buffer do tmux
* `prefix`<kbd>c</kbd>: cria uma nova janela
* `prefix`<kbd>ctrol</kbd><kbd>o</kbd>: trocar posição dos paineis
* `prefix`<kbd>d</kbd>: sai da sessão atual sem fechar ela (fica rodando em background)
* `prefix`<kbd>s</kbd>: listar todas as sessões
* `prefix`<kbd>space</kbd>: muda o layout dos paineis na janela atual
* `prefix`<kbd>w</kbd>: listar todas as janelas
* `prefix`<kbd>x</kbd>: fecha o oaine atual
* `prefix`<kbd>z</kbd>: aplica zoom em um painel
* `prefix`<kbd>N</kbd>: alterna para a janela correspondente ao numero N

comandos dentro do tmux:
------------------------
* `break-pane -t :`: move o painel em foco para uma nova janela
* `join-pane -t :N -h`: move o painel em foco para a janela `N` e divide os paineis na horizontal
* `join-pane -t :N -v`: move o painel em foco para a janela `N` e divide os paineis na vertical
* `join-pane -t :N`: move o painel em foco para a janela `N`
* `select-layout nome_do_layout` ou `selectl nome_do_layout`: permite escolher um layout para os paineis, os disponiveis são `even-horizontal`, `even-vertical`, `main-horizontal`, `main-vertical` e `tiled`
* `setw synchronise-panes`: envia simultaneamente entrada do teclado de um painel para o resto dos painéis na mesma janela, para desativar o comando basta digita-lo novamente
* `split-window -fbh`: cria um painel no lado esquerdo da tela, indepedente dos outros paineis
* `split-window -fbv`: cria um painel no lado superior da tela, indepedente dos outros paineis
* `split-window -fh`: cria um painel no lado direito da tela, indepedente dos outros paineis
* `split-window -fv`: cria um painel no lado inferior da tela, indepedente dos outros paineis
* `swap-window -t n`: troca a posição da janela atual, sendo `n` a posição desejada

comandos da cli:
----------------
* `tmux attach -t nome_da_sessao`: permite entrar dentro de uma determinada sessão do tmux
* `tmux kill-session -t nome_da_sessao`: encerra uma sessão
* `tmux new -d -s nome_da_sessao`: permite criar uma nova sessão sem entrar dentro dela, util quando se ja está em uma sessão do tmux e deseja criar outra
