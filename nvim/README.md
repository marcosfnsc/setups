# (neo)vim

## atalhos:
### edição:
* <kbd>>></kbd> ou <kbd><<</kbd> no modo normal: altera recuo da linha
* <kbd>A</kbd> no modo normal: atalho para <kbd>$</kbd><kbd>a</kbd>
* <kbd>C</kbd>,<kbd>S</kbd> ou <kbd>c</kbd><kbd>c</kbd> no modo normal: exclue o conteudo da linha atual e entra no modo normal
* <kbd>D</kbd> no modo normal: apaga que estiver entre o cursor e o ultimo caractereda linha, atalho para <kbd>d</kbd><kbd>g</kbd><kbd>&lowbar;</kbd>
* <kbd>I</kbd> no modo normal: atalho para <kbd>^</kbd><kbd>i</kbd>
* <kbd>O</kbd> no modo normal: insere uma linha acima, move o cursos para nova linha e entra no modo insert
* <kbd>R</kbd> no modo normal: entra no modo replace
* <kbd>V</kbd> no modo normal: modo visual de linha
* <kbd>X</kbd> no modo normal: apaga que estiver a direita do cursor
* <kbd>a</kbd> no modo normal: entrar no modo insert do lado direito do caractere
* <kbd>c</kbd><kbd>i</kbd><kbd>"</kbd> no modo normal: na linha onde está o cursor, apaga o conteudo que estiver entre aspas duplas, coloca o curso entre as aspas e entre no modo insert onde está o cursor
* <kbd>ctrl</kbd><kbd>a</kbd> no modo normal: incrementa um numero onde o cursor esta localizado
* <kbd>ctrl</kbd><kbd>x</kbd> no modo normal: decrementa um numero onde o cursor esta localizado
* <kbd>ctrol</kbd><kbd>R</kbd><code>reg</code> no modo insert: permite adicionar ao buffer o conteudo do registro especificado em <code>reg</code>
* <kbd>ctrol</kbd><kbd>d</kbd> no modo insert: recue a indentação da linha atual no modo insert
* <kbd>ctrol</kbd><kbd>o</kbd> no modo insert: alterna para o modo normal e após alguma ação, automaticamente volta para o modo insert
* <kbd>ctrol</kbd><kbd>r</kbd> no modo normal: refaz as mudanças desfeitas pelo comando <kbd>u</kbd>
* <kbd>ctrol</kbd><kbd>t</kbd> no modo insert: aumente a indentação da linha atual no modo insert
* <kbd>ctrol</kbd><kbd>u</kbd> no modo insert: exclui tudo que estiver antes do cursor no modo insert
* <kbd>g</kbd><kbd>U</kbd><kbd>U</kbd> no modo normal: mudar todas as palavras da linha para maiusculas
* <kbd>g</kbd><kbd>U</kbd><kbd>i</kbd><kbd>w</kbd> no modo normal: mudar letras das palavras para maiusculas
* <kbd>g</kbd><kbd>g</kbd><kbd>=</kbd><kbd>G</kbd> no modo normal: corrigir indentação do codigo inteiro
* <kbd>g</kbd><kbd>u</kbd><kbd>i</kbd><kbd>w</kbd> no modo normal: mudar letras das palavras para minusculas
* <kbd>g</kbd><kbd>u</kbd><kbd>u</kbd> no modo normal: mudar todas as palavras da linha para minusculas
* <kbd>o</kbd> no modo normal: insere uma linha abaixo, move o cursos para nova linha e entra no modo insert
* <kbd>s</kbd> no modo normal: apaga o caractere sobre o cursor e entra no modo insert
* <kbd>u</kbd> no modo normal: desfaz as mudanças
* <kbd>x</kbd> no modo normal: apaga que estiver sub o cursor
* <kbd>~</kbd> no modo normal: altera o caractere sub o cursor para maiusculo ou minusculo

### movimento:
* <kbd>$</kbd> no modo normal: ir para a ultima coluna da linha (incluindo o caractere de quebra de linha)
* <kbd>%</kbd> no modo normal: acha o proximo parêntese, colchete, chave etc
* <kbd>+</kbd> no modo normal: atalho para <kbd>j^</kbd>
* <kbd>0</kbd> ou <kbd>|</kbd> no modo normal: ir para a primeira coluna da linha
* <kbd>F</kbd>{caractere} no modo normal: faz a mesma coisa do atalho <kbd>f</kbd> porém de forma reversa, permite usar tambem <kbd>;</kbd> e <kbd>,</kbd>
* <kbd>H</kbd> no modo normal: mover cursor para o topo da janela
* <kbd>L</kbd> no modo normal: mover cursor para a parte inferior da janela
* <kbd>M</kbd> no modo normal: mover cursor para o centro da janela
* <kbd>T</kbd>{caractere} no modo normal: faz a mesma coisa do atalho <kbd>T</kbd> porém de forma reversa, permite usar tambem <kbd>;</kbd> e <kbd>,</kbd>
* <kbd>^</kbd> no modo normal: ir para o primeiro caractere da linha
* <kbd>b</kbd> no modo normal: saltar retrocedendo palavras
* <kbd>ctrol</kbd><kbd>d</kbd> no modo normal: mover metade da janela para baixo
* <kbd>ctrol</kbd><kbd>e</kbd> no modo normal: mover janela uma linha para baixo
* <kbd>ctrol</kbd><kbd>i</kbd> no modo normal: saltar para a proxima posicao do cursor
* <kbd>ctrol</kbd><kbd>o</kbd> ou <kbd>g</kbd><kbd>;</kbd> no modo normal: saltar para a posicao anterior do cursor
* <kbd>ctrol</kbd><kbd>u</kbd> no modo normal: mover metade da janela para cima
* <kbd>ctrol</kbd><kbd>x</kbd><kbd>ctrol</kbd><kbd>e</kbd> no modo insert: mover a tela para baixo sem sair do modo insert
* <kbd>ctrol</kbd><kbd>x</kbd><kbd>ctrol</kbd><kbd>y</kbd> no modo insert: mover a tela para cima sem sair do modo insert
* <kbd>ctrol</kbd><kbd>y</kbd> no modo normal: mover janela uma linha para cima
* <kbd>e</kbd> no modo normal: saltar palavras mantendo o cursor no ultimo caractere
* <kbd>f</kbd>{caractere} no modo normal: saltar para a proxima ocorrencia do caractere e deixar o cursor sobre o caractere encontado
* <kbd>g&lowbar;</kbd> no modo normal: ir para o ultimo caractere da linha
* <kbd>ge</kbd> no modo normal: saltar retrocedendo palavras mantendo o cursor no ultimo caractere
* <kbd>t</kbd>{caractere} no modo normal: saltar para a proxima ocorrencia do caractere e deixar o cursor no lado esquerdo do caractere encontado, permite usar tambem <kbd>;</kbd> e <kbd>,</kbd>
* <kbd>w</kbd> no modo normal: saltar palavras
* <kbd>z</kbd><kbd>b</kbd> no modo normal: mover a janela para que a linha sob o cursor fique na parte inferior da janela
* <kbd>z</kbd><kbd>h</kbd> no modo normal: mover a janela para a esquerda
* <kbd>z</kbd><kbd>l</kbd> no modo normal: mover a janela para a direita
* <kbd>z</kbd><kbd>t</kbd> no modo normal: mover a janela para que a linha sob o cursor fique no topo da janela
* <kbd>z</kbd><kbd>z</kbd> no modo normal: mover a janela para que a linha sob o cursor fique no centro da janela

### gerenciamento de janela:
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>+</kbd> no modo normal: almenta a altura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>-</kbd> no modo normal: diminue a altura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd><</kbd> no modo normal: diminue a largura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>=</kbd> no modo normal: corrige o tamanho de todas as janelas
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>></kbd> no modo normal: aumenta a largura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>r</kbd> no modo normal: troca a posição das janelas
* <kbd>ctrol</kbd><kbd>w</kbd>+<kbd>c</kbd> no modo normal: fecha uma janela
* <kbd>ctrol</kbd><kbd>w</kbd>+{<kbd>H</kbd>,<kbd>J</kbd>,<kbd>K</kbd>,<kbd>L</kbd>} no modo normal: move a janela em destaque para um dos cantos da tela
* <kbd>g</kbd><kbd>T</kbd> no modo normal: alterna para a guia anterior
* <kbd>g</kbd><kbd>t</kbd> no modo normal: alterna para a proxima guia

### outros atalhos:
* <kbd>"</kbd><kbd>a</kbd> no modo normal: digitar <kbd>"</kbd> representa uma entrada de registro e a letra seria o slot do registro, pode usar outra letra alem de <kbd>a</kbd>, apos isso basta digitar algum comando de corte
* <kbd>#</kbd> no modo normal: pesquisa para tras a palavra que esta sob o cursor
* <kbd>&ast;</kbd> no modo normal: pesquisa a palavra que esta sob o cursor
* <kbd>Z</kbd><kbd>Q</kbd> no modo normal: sai sem salvar alterações, atalho para <code>:q!</code>
* <kbd>Z</kbd><kbd>Z</kbd> no modo normal: salva e sai, atalho para <code>:wq</code>
* <kbd>c</kbd><kbd>g</kbd><kbd>n</kbd> no modo normal: ao buscar uma palavra no vim usando o comando <code>/palavra</code>, digitar a combinação de comandos vai deletar a palavra, voce digita algo e muda para o modo normal, em seguida "atualiza" as outras ocorrencias da palavra apertando <kbd>.</kbd>
* <kbd>ctrol</kbd><kbd>v</kbd> no modo normal: entra no modo visual com seleção em modo bloco
* <kbd>esc</kbd> ou <kbd>ctrol</kbd><kbd>c</kbd> ou <kbd>ctrol</kbd><kbd>[</kbd> em qualquer outro modo: ir para o modo normal
* <kbd>g</kbd><kbd>&ast;</kbd> no modo normal: pesquisa a palavra que esta sob o cursor com combinacao parcial
* <kbd>g</kbd><kbd>a</kbd> no modo normal: mostra a o valor do caractere ASCII em diferentes bases numericas
* <kbd>g</kbd><kbd>f</kbd> no modo normal: abrir o arquivo ou caminho que está sob o cursor
* <kbd>g</kbd><kbd>r</kbd>{caractere} no modo normal: substituir o caractere sob o cursor pelo caractere indicado no atalho
* <kbd>o</kbd> no modo visual: troca a posição do cursor para o final da seleção ou o começo da seleção
* <kbd>z</kbd><kbd>M</kbd> no modo normal: fecha todas as dobras
* <kbd>z</kbd><kbd>R</kbd> no modo normal: abre todas as dobras
* <kbd>z</kbd><kbd>c</kbd> no modo normal: fecha uma dobra
* <kbd>z</kbd><kbd>f</kbd>{movimento} no modo normal: permite criar uma dobra a partir de um movimento
* <kbd>z</kbd><kbd>o</kbd> no modo normal: abre uma dobra

### modo comando:
* <kbd>control</kbd><kbd>b</kbd> no modo comando: move o cursor para o começo da linha
* <kbd>control</kbd><kbd>e</kbd> no modo comando: move o cursor para o fim da linha
* <kbd>control</kbd><kbd>f</kbd> no modo comando: abre uma janela de linha de comando, onde você tem qualquer poder de edição do Vim em suas mãos
* <kbd>control</kbd><kbd>h</kbd> no modo comando: remove um caractere que está no lado esquerdo do cursor
* <kbd>control</kbd><kbd>u</kbd> no modo comando: apaga todos os caracteres que estão entre o cursor e o começo da linha
* <kbd>control</kbd><kbd>w</kbd> no modo comando: remove uma palavra que está no lado esquerdo do ursor
* <kbd>q</kbd><kbd>:</kbd> no modo normal: abre uma janela dos comandos executados no modo comando e permite usar os atalhos do modo normal nessa janela, e quando terminar basta apertar enter sobre o comando digitado

## registros:
### tipos de registros:
* registro sem nome (`"`): Contém o último conteúdo excluído, alterado ou retirado, mesmo se um registro foi especificado.
* registros numerados (0-9):
    * 0: contém o ultimo conteudo arrancado
    * 1-9: é uma pilha que contém o ultimo conteudo que foi excluido ou alterado

      cada vez que alterar ou exluir um conteudo ele sera adicionado ao registro 1, quando outro conteudo
      é adicionado ao registro 1, o que havia nele é transferido para o proximo registro, que neste caso é
      o 2, o conteudo vai saltando de um registro para outro até chegar no registro 9, quando outro conteudo
      for movido para o registro 9, o que havia antes nele é perdido

* registro de exclusao: Contém qualquer conteúdo excluído ou alterado menor que uma linha

Nenhum desses registros mensionados acima é escrito se você especificou um antes com o pressionamento de tecla <kbd>"</kbd>

* registros nomeados (a-z):
    * o editor so vai sobrescrever se esse tipo de registro for especificado
    * colocar a letra em maiscula vai anexar o conteudo ao registro, em vez de sobrescrever
* registro de buraco negro (`&lowbar;`): tudo que for escrito lá sera perdido
* registro do ultimo padrão de epsquisa (/): contem o ultimo conteudo pesquisado

## comandos:
* `:%bd|e#|bd#`: apaga todos os buffers menos o atual
* `:%s/pattern/"&"/g`: comando de substituição onde `&` assume o valor valor de "pattern"
* `:%s/pattern/replace/g`: substituir "pattern" por "replace" no arquivo inteiro
* `:g!/string/d` ou `:v/string/d`: apaga todas as linhas que não contenham "string"
* `:g/string/d`: apaga todas as linhas que contenham "string", cada linha deletada é antes copiada para o registro padrão, é possivel especificar o registtro de buraco negro para otimizar o processo: `:g/string/d _`
* `:help digraph-table`: mostra a lista de digrafos
* `:jumps`: mostra uma lista com todos os saltos
* `:retab`: transforma tabulações em caracteres de espaço
* `:s/pattern/replace/g`: substituir "pattern" por "replace" na linha onde esta o cursor
* `:set ignorecase`: todas as pesquisas nao farao distincao entre letras maiusculas e minusculas
* `:set rightleft`: altera a ordem das colulas, deixa o texto invertido, execute novamente para o estado anterior
* `:tabclose` ou `:tac`: fecha uma nova guia
* `:tabnew` ou `:tabe`: abre uma nova guia
* `:tabonly` ou `:tao`: fecha todas as guias menos a atual
* `:x`: atalho para `:wq`
* `sort u`: ordena as linhas selecionadas e remove duplicatas
* `sort!`: ordena de forma inversa as linhas selecionadas
* `sort`: ordena as linhas selecionadas
* `virtualedit=all`: permite o cursor percorrer livremente pela tela, isso é conveniente ao usar ao fazer uma seleção em bloco

## Truques:
#### substituição de palavras em todos os arquivos
digitar no modo comando `:args **` para adicionar todos os arquivos em um direitorio de forma
recursiva e por fim executar o comando de substituição em todos os arquivos usando o comando
`:argdo %s/palavra_antiga/palavra_nova/g`

o comando `argdo` vai executar o subcomando em cada arquivo presente no args do vim

## macros:
é um recurso que permite gravar uma sequencia de comandos e salvar para ser usado de
novo qantas vezes por necessario

#### sintaxe:
* para gravar uma macro: `q<reg><comandos>q`
* para executar uma macro: `@<reg>`

como a macro em gravada nos registros, é possivel colar uma macro usando<kbd>p</kbd>
e depois copiando para o mesmo registro usando algum movimento de corte
