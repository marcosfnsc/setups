# (neo)vim

## atalhos:
<details>
  <summary><b>edicao</b></summary>
  <UL>
  <LI> <kbd>>></kbd> ou <kbd><<</kbd> no modo normal: altera recuo da linha </LI>
  <LI> <kbd>A</kbd> no modo normal: atalho para <kbd>$</kbd><kbd>a</kbd> </LI>
  <LI> <kbd>I</kbd> no modo normal: atalho para <kbd>^</kbd><kbd>i</kbd> </LI>
  <LI> <kbd>O</kbd> no modo normal: insere uma linha acima, move o cursos para nova linha e entra no modo insert </LI>
  <LI> <kbd>a</kbd> no modo normal: entrar no modo insert do lado direito do caractere </LI>
  <LI> <kbd>c</kbd><kbd>i</kbd><kbd>"</kbd> no modo normal: na linha onde está o cursor, apaga o conteudo que estiver entre aspas duplas, coloca o curso entre as aspas e entre no modo insert onde está o cursor </LI>
  <LI> <kbd>g</kbd><kbd>U</kbd><kbd>U</kbd> no modo normal: mudar todas as palavras da linha para maiusculas </LI>
  <LI> <kbd>g</kbd><kbd>U</kbd><kbd>i</kbd><kbd>w</kbd> no modo normal: mudar letras das palavras para maiusculas </LI>
  <LI> <kbd>g</kbd><kbd>g</kbd><kbd>=</kbd><kbd>G</kbd> no modo normal: corrigir indentação do codigo inteiro </LI>
  <LI> <kbd>g</kbd><kbd>u</kbd><kbd>i</kbd><kbd>w</kbd> no modo normal: mudar letras das palavras para minusculas </LI>
  <LI> <kbd>g</kbd><kbd>u</kbd><kbd>u</kbd> no modo normal: mudar todas as palavras da linha para minusculas </LI>
  <LI> <kbd>o</kbd> no modo normal: insere uma linha abaixo, move o cursos para nova linha e entra no modo insert </LI>
  <LI> <kbd>s</kbd> no modo normal: apaga o caractere sobre o cursor e entra no modo insert </LI>
  <LI> <kbd>ctrl</kbd><kbd>a</kbd> no modo normal: incrementa um numero onde o cursor esta localizado </LI>
  <LI> <kbd>ctrl</kbd><kbd>x</kbd> no modo normal: decrementa um numero onde o cursor esta localizado </LI>
  <LI> <kbd>ctrol</kbd><kbd>u</kbd> no modo insert: esclua tudo que estiver antes do cursor no modo insert </LI>
  <LI> <kbd>ctrol</kbd><kbd>d</kbd> no modo insert: recue a indentação da linha atual no modo insert </LI>
  <LI> <kbd>ctrol</kbd><kbd>t</kbd> no modo insert: aumente a indentação da linha atual no modo insert </LI>
  <LI> <kbd>ctrol</kbd><kbd>o</kbd> no modo insert: alterna para o modo normal e apos algima ação, automaticamente volta para o modo insert </LI>
  <LI> <kbd>ctrol</kbd><kbd>R</kbd><code>reg</code> no modo insert: permite adicionar ao buffer o conteudo do registro especificado em <code>reg</code> </LI>
  </UL>
</details>

<details>
  <summary><b>movimento</b></summary>
  <UL>
  <LI> <kbd>$</kbd> no modo normal: ir para a ultima coluna da linha </LI>
  <LI> <kbd>0</kbd> ou <kbd>|</kbd> no modo normal: ir para a primeira coluna da linha </LI>
  <LI> <kbd>H</kbd> no modo normal: mover cursor para o topo da janela </LI>
  <LI> <kbd>L</kbd> no modo normal: mover cursor para a parte inferior da janela </LI>
  <LI> <kbd>M</kbd> no modo normal: mover cursor para o centro da janela </LI>
  <LI> <kbd>^</kbd> no modo normal: ir para o primeiro caractere da linha </LI>
  <LI> <kbd>b</kbd> no modo normal: saltar retrocedendo palavras </LI>
  <LI> <kbd>ctrol</kbd><kbd>i</kbd> no modo normal: saltar para a proxima posicao do cursor </LI>
  <LI> <kbd>ctrol</kbd><kbd>o</kbd> no modo normal: saltar para a posicao anterior do cursor </LI>
  <LI> <kbd>e</kbd> no modo normal: saltar retrocedendo palavras mantendo o cursor no ultimo caractere </LI>
  <LI> <kbd>f</kbd>{caractere} no modo normal: saltar para a proxima ocorrencia do caractere e deixar o cursor sobre o caractere encontado </LI>
  <LI> <kbd>F</kbd>{caractere} no modo normal: faz a mesma coisa do atalho <kbd>f</kbd> porém de forma reversa </LI>
  <LI> <kbd>g_</kbd> no modo normal: ir para o ultimo caractere da linha </LI>
  <LI> <kbd>t</kbd>{caractere} no modo normal: saltar para a proxima ocorrencia do caractere e deixar o cursor no lado esquerdo do caractere encontado </LI>
  <LI> <kbd>T</kbd>{caractere} no modo normal: faz a mesma coisa do atalho <kbd>T</kbd> porém de forma reversa</LI>
  <LI> <kbd>w</kbd> no modo normal: saltar palavras </LI>
  <LI> <kbd>z</kbd><kbd>b</kbd> no modo normal: mover linha para a parte inferior da janela </LI>
  <LI> <kbd>z</kbd><kbd>t</kbd> no modo normal: mover linha para o topo da janela </LI>
  <LI> <kbd>z</kbd><kbd>z</kbd> no modo normal: mover linha para o centro da janela </LI>
  <LI> <kbd>ctrol</kbd><kbd>x</kbd><kbd>ctrol</kbd><kbd>y</kbd> no modo insert: mover a tela para cima sem sair do modo insert </LI>
  <LI> <kbd>ctrol</kbd><kbd>x</kbd><kbd>ctrol</kbd><kbd>e</kbd> no modo insert: mover a tela para baixo sem sair do modo insert </LI>
  </UL>
</details>

<details>
  <summary><b>gerenciamento de janela</b></summary>
  <UL>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd> <kbd>+</kbd> no modo normal: almenta a altura da janela </LI>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd> <kbd>-</kbd> no modo normal: diminue a altura da janela </LI>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd> <kbd><</kbd> no modo normal: diminue a largura da janela </LI>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd> <kbd>=</kbd> no modo normal: corrige o tamanho de todas as janelas </LI>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd> <kbd>></kbd> no modo normal: aumenta a largura da janela </LI>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd> <kbd>r</kbd> no modo normal: troca a posição das janelas </LI>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd>+<kbd>c</kbd> no modo normal: fecha uma janela </LI>
  <LI> <kbd>ctrol</kbd><kbd>w</kbd>+{<kbd>H</kbd>,<kbd>J</kbd>,<kbd>K</kbd>,<kbd>L</kbd>} no modo normal: move a janela em destaque para um dos cantos da tela </LI>
  <LI> <kbd>g</kbd><kbd>T</kbd> no modo normal: alterna para a guia anterior </LI>
  <LI> <kbd>g</kbd><kbd>t</kbd> no modo normal: alterna para a proxima guia </LI>
  </UL>
</details>

<details>
  <summary><b>outros atalhos</b></summary>
  <UL>
  <LI> <kbd>"</kbd><kbd>a</kbd> no modo normal: digitar <kbd>"</kbd> representa uma entrada de registro e a letra seria o slot do registro, pode outra letra alem de <kbd>a</kbd>, apos isso basta digitar algum comando de corte </LI>
  <LI> <kbd>Z</kbd><kbd>Z</kbd> no modo normal: salva e sai, atalho para <code>:wq</code> </LI>
  <LI> <kbd>&#42;</kbd> no modo normal: pesquisa a palavra que esta sob o cursor </LI>
  <LI> <kbd>c</kbd><kbd>g</kbd><kbd>n</kbd> no modo normal: ao buscar uma palavra no vim usando o comando <code>/palavra</code>, digitar a combinação de comandos vai deletar a palavra, voce digita algo e muda para o modo normal, em seguida "atualiza" as outras ocorrencias da palavra apertando <kbd>.</kbd> </LI>
  <LI> <kbd>ctrol</kbd><kbd>v</kbd> no modo normal: entra no modo visual com seleção em modo bloco </LI>
  <LI> <kbd>g</kbd><kbd>&#42;</kbd> no modo normal: pesquisa a palavra que esta sob o cursor com combinacao parcial </LI>
  <LI> <kbd>z</kbd><kbd>M</kbd> no modo normal: fecha todas as dobras </LI>
  <LI> <kbd>z</kbd><kbd>R</kbd> no modo normal: abre todas as dobras </LI>
  <LI> <kbd>z</kbd><kbd>c</kbd> no modo normal: fecha uma dobra </LI>
  <LI> <kbd>z</kbd><kbd>f</kbd>{movimento} no modo normal: permite criar uma dobra a partir de um movimento </LI>
  <LI> <kbd>z</kbd><kbd>o</kbd> no modo normal: abre uma dobra </LI>
  <LI> <kbd>esc</kbd> ou <kbd>ctrol</kbd><kbd>c</kbd> ou <kbd>ctrol</kbd><kbd>[</kbd> em qualquer outro modo: ir para o modo normal </LI>
  </UL>
</details>

## registros:
### tipos de registros:
* registro sem nome ("): Contém o último conteúdo excluído, alterado ou retirado, mesmo se um registro foi especificado.
* registros numerados (0-9):
    * 0: conteḿ o ultimo conteudo arrancado
    * 1-9: é uma pilha que conteḿ o ultimo conteudo que foi excluido ou alterado

cada vez que alterar ou exluir um conteudo ele sera adicionado ao registro 1, quandoo outro conteudo
é adicionado ao registro 1, o que havia nele é transferido para o proximo registro, que neste caso é
o 2, o conteudo vai saltando de um registro para outro até chegar no registro 9, quando outro conteudo
for movido para o registro 9, o que havia antes nele é perdido

* registro de exclusao: Contém qualquer conteúdo excluído ou alterado menor que uma linha

Nenhum desses registros mensionados acima é escrito se você especificou um antes com o pressionamento de tecla <kbd>"</kbd>

* registros nomeados (a-z):
    * o editor so vai sobrescrever se esse tipo de registro for especificado
    * colocar a letra em maiscula vai anexar o conteudo ao registro, em vez de sobrescrever
* registro de buraco negro (\_): tudo que for escrito lá sera perdido
* registro do ultimo padrão de epsquisa (/): contem o ultimo conteudo pesquisado

## comandos:
* `:%s/pattern/replace/g`: substituir "pattern" por "replace" no arquivo inteiro
* `:help digraph-table`: mostra a lista de digrafos
* `:jumps`: mostra uma lista com todos os saltos
* `:retab`: transforma tabulações em caracteres de espaço
* `:s/pattern/replace/g`: substituir "pattern" por "replace" na linha onde esta o cursor
* `:set ignorecase`: todas as pesquisas nao farao distincao entre letras maiusculas e minusculas
* `:tabclose` ou `:tac`: fecha uma nova guia
* `:tabnew` ou `:tabe`: abre uma nova guia
* `:tabonly` ou `:tao`: fecha todas as guias menos a atual
* `:x`: atalho para `:wq`
