comandos interessantes:
-----------------------

### gerenciamento de branches
- `git branch -a`: listar todas as branches, inclusive remotas
- `git branch -d <nome da branch>`: deletar branch local
- `git branch -m <novo nome da branch>`: mudar o nome da branch atual para outro nome
- `git checkout -b <nome da branch>`: cria uma nova branch e alterna para ela
- `git remote prune origin`: remove branches locais que não existem no repo remoto

### url do repositorio
- `git config --get remote.origin.url`: mostra a url do repo remoto
- `git remote set-url origin url_do_repo`: alterar url do repo rempto
- `git remote show origin`: mostra a url dos repos remotos e outros detalhes

### historico do git
- `git clone --depth 1 url_do_repo`: permite realizar um clone superficial onde baixa apenas os commits mais recentes e não todo o historico, o `1` refere ao nivel de profundidade e pode trocado por valores positivos mais altos
- `git clone --depth 1 url_do_repo --no-single-branch`: por padrão o clone superficial so baixa uma branch, com esse subcomando permite baixar tambem as outras branches especificando o nivel de profundade para todas elas
- `git pull --unshallow`: ao clonar um repo no modo superficial, esse comando permite baixar todo o historico como um clone normal
- `git log --diff-filter=A --summary | grep 'create mode'`: mostra todos os arquivos que foram adicionados ao historico do git, esse subcomando `--diff-filter=` possui muitas opções e a saida indica os modos de cada ação sobre os arquivos (ex: create, modified etc), mais informações em [doc git](https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---diff-filterACDMRTUXB82308203)

### outros comandos
- `git push -u origin nome_da_branch`: dar push em uma branch pela primeira vez, esse parametro `-u` é um atalho para `--set-upstream`
- `git tag <nome da tag>`: cria um tag leve local
- `git tag`: lista as tags
