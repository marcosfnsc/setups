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

### outros comandos
- `git push -u origin nome_da_branch`: dar push em uma branch pela primeira vez, esse parametro `-u` é um atalho para `--set-upstream`
- `git tag <nome da tag>`: cria um tag leve local
- `git tag`: lista as tags
