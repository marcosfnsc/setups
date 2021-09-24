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
  </UL>
</details>

<details>
  <summary><b>movimento</b></summary>
  <UL>
  <LI> <kbd>$</kbd> no modo normal: ir para o final da linha </LI>
  <LI> <kbd>0</kbd> no modo normal: ir para o começo da linha </LI>
  <LI> <kbd>H</kbd> no modo normal: mover cursor para o topo da janela </LI>
  <LI> <kbd>L</kbd> no modo normal: mover cursor para a parte inferior da janela </LI>
  <LI> <kbd>M</kbd> no modo normal: mover cursor para o centro da janela </LI>
  <LI> <kbd>^</kbd> no modo normal: ir para o primeiro caractere da linha </LI>
  <LI> <kbd>b</kbd> no modo normal: saltar retrocedendo palavras </LI>
  <LI> <kbd>ctrol</kbd><kbd>i</kbd> no modo normal: saltar para a proxima posicao do cursor </LI>
  <LI> <kbd>ctrol</kbd><kbd>o</kbd> no modo normal: saltar para a posicao anterior do cursor </LI>
  <LI> <kbd>e</kbd> no modo normal: saltar retrocedendo palavras mantendo o cursor no ultimo caractere </LI>
  <LI> <kbd>f</kbd>{caractere} no modo normal: saltar para a proxima ocorrencia do caractere e deixar o cursor sobre o caractere encontado </LI>
  <LI> <kbd>t</kbd>{caractere} no modo normal: saltar para a proxima ocorrencia do caractere e deixar o cursor no lado esquerdo do caractere encontado </LI>
  <LI> <kbd>w</kbd> no modo normal: saltar palavras </LI>
  <LI> <kbd>z</kbd><kbd>b</kbd> no modo normal: mover linha para a parte inferior da janela </LI>
  <LI> <kbd>z</kbd><kbd>t</kbd> no modo normal: mover linha para o topo da janela </LI>
  <LI> <kbd>z</kbd><kbd>z</kbd> no modo normal: mover linha para o centro da janela </LI>
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
  <LI> <kbd>"</kbd><kbd>a</kbd> no modo normal: digitar `"` representa uma entrada de registro e a letra seria o slot do registro, pode outra letra alem de `a`, apos isso basta digitar algum comando de corte </LI>
  <LI> <kbd>Z</kbd><kbd>Z</kbd> no modo normal: salva e sai, atalho para `:wq` </LI>
  <LI> <kbd>\*</kbd> no modo normal: pesquisa a palavra que esta sob o cursor </LI>
  <LI> <kbd>c</kbd><kbd>g</kbd><kbd>n</kbd> no modo normal: ao buscar uma palavra no vim usando o comando `/palavra`, digitar a combinação de comandos vai deletar a palavra, voce digita algo e muda para o modo normal, em seguida "atualiza" as outras ocorrencias da palavra apertando <kbd>.</kbd> </LI>
  <LI> <kbd>ctrol</kbd><kbd>v</kbd> no modo normal: entra no modo visual com seleção em modo bloco </LI>
  <LI> <kbd>g\*</kbd> no modo normal: pesquisa a palavra que esta sob o cursor com combinacao parcial </LI>
  <LI> <kbd>z</kbd><kbd>M</kbd> no modo normal: fecha todas as dobras </LI>
  <LI> <kbd>z</kbd><kbd>R</kbd> no modo normal: abre todas as dobras </LI>
  <LI> <kbd>z</kbd><kbd>c</kbd> no modo normal: fecha uma dobra </LI>
  <LI> <kbd>z</kbd><kbd>f</kbd>{movimento} no modo normal: permite criar uma dobra a partir de um movimento </LI>
  <LI> <kbd>z</kbd><kbd>o</kbd> no modo normal: abre uma dobra </LI>
  </UL>
</details>

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
