(neo)vim
=============

atalhos:
------------------------------------
* <kbd>c</kbd><kbd>i</kbd><kbd>"</kbd> no modo normal: na linha onde
está o cursor, apaga o conteudo que estiver entre aspas duplas, coloca
o curso entre as aspas e entre no modo insert
onde está o cursor
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>=</kbd> no modo normal: corrige o tamanho de todas as janelas
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>-</kbd> no modo normal: diminue a altura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>+</kbd> no modo normal: almenta a altura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd><</kbd> no modo normal: diminue a largura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>></kbd> no modo normal: aumenta a largura da janela
* <kbd>ctrol</kbd><kbd>w</kbd> <kbd>r</kbd> no modo normal: troca a posição das janelas
* <kbd>c</kbd><kbd>g</kbd><kbd>n</kbd> no modo normal: ao buscar uma palavra no vim usando o comando `/palavra`,
digitar a combinação de comandos vai deletar a palavra, voce digita algo e muda para o modo normal,
em seguida "atualiza" as outras ocorrencias da palavra apertando <kbd>.</kbd>
* <kbd>ctrol</kbd><kbd>w</kbd>+<kbd>c</kbd> no modo normal: fecha uma janela
* <kbd>w</kbd> no modo normal: saltar palavras
* <kbd>I</kbd> no modo normal: atalho para <kbd>^</kbd><kbd>i</kbd>
* <kbd>a</kbd> no modo normal: entrar no modo insert do lado direito do caractere
* <kbd>A</kbd> no modo normal: atalho para <kbd>$</kbd><kbd>a</kbd>
* <kbd>b</kbd> no modo normal: saltar retrocedendo palavras
* <kbd>e</kbd> no modo normal: saltar retrocedendo palavras mantendo o cursor no ultimo caractere
* <kbd>$</kbd> no modo normal: ir para o final da linha
* <kbd>0</kbd> no modo normal: ir para o começo da linha
* <kbd>^</kbd> no modo normal: ir para o primeiro caractere da linha
* <kbd>o</kbd> no modo normal: insere uma linha abaixo, move o cursos para nova linha e entra no modo insert
* <kbd>O</kbd> no modo normal: insere uma linha acima, move o cursos para nova linha e entra no modo insert
* <kbd>\*</kbd> no modo normal: pesquisa a palavra que esta sob o cursor
* <kbd>g\*</kbd> no modo normal: pesquisa a palavra que esta sob o cursor com combinacao parcial
* <kbd>ctrol</kbd><kbd>v</kbd> no modo normal: entra no modo visual com seleção em modo bloco
* <kbd>>></kbd> ou <kbd><<</kbd> no modo normal: altera recuo da linha
* <kbd>f</kbd>{caractere} no modo normal: saltar para a proxima ocorrencia do caractere
* <kbd>g</kbd><kbd>u</kbd><kbd>i</kbd><kbd>w</kbd> no modo normal: mudar letras das palavras para minusculas
* <kbd>g</kbd><kbd>U</kbd><kbd>i</kbd><kbd>w</kbd> no modo normal: mudar letras das palavras para maiusculas
* <kbd>g</kbd><kbd>u</kbd><kbd>u</kbd> no modo normal: mudar todas as palavras da linha para minusculas
* <kbd>g</kbd><kbd>U</kbd><kbd>U</kbd> no modo normal: mudar todas as palavras da linha para maiusculas
* <kbd>g</kbd><kbd>g</kbd><kbd>=</kbd><kbd>G</kbd> no modo normal: corrigir indentação do codigo inteiro
* <kbd>"</kbd><kbd>a</kbd> no modo normal: digitar `"` representa uma entrada de registro e a letra seria
o slot do registro, pode outra letra alem de `a`, apos isso basta digitar algum comando de corte

comandos:
---------
* `:help digraph-table`: mostra a lista de digrafos
* `:retab`: transforma tabulações em caracteres de espaço
* `:s/pattern/replace/g`: substituir "pattern" por "replace" na linha onde esta o cursor
* `:%s/pattern/replace/g`: substituir "pattern" por "replace" no arquivo inteiro
* `set ignorecase`: todas as pesquisas nao farao distincao entre letras maiusculas e minusculas
