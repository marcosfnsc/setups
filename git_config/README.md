comandos interessantes e dicas:
-----------------------

### pacotes git
- `git bundle create nome_do_arquivo.bundle --all`: permite criar um arquivo compactado do repositorio, o parametro `--all` indica que é para capturar todos os dados como branches e tags
- `git bundle create nome_do_arquivo.bundle -5 main`: caso seja um repo grande e deseja criar um pacote de apenas uma certa parte, esse comando cria a partir dos 5 ultimos commits da branch `main`
- `git clone nome_do_arquivo.bundle`: clonar repo a partir de um pacote git
- `git pull nome_do_arquivo.bundle`: puxar a partir de um pacote git

### git stash
- `git stash apply numero_do_stash`: aplica as alterações nos arquivos do stash especificado mas sem remover ele da "area de trabalho" do stash
- `git stash apply`: aplica as alterações nos arquivos do stash mais recente mas sem remover ele da "area de trabalho" do stash
- `git stash clear`: remove o stash especifico mas não aplica as alterações no arquivos
- `git stash drop numero_do_stash`: remove o stash especifico mas não aplica as alterações no arquivos
- `git stash drop`: remove o stash mais recente mas não aplica as alterações no arquivos
- `git stash list`: lista os os "stashes" ativos no momento
- `git stash pop numero_do_stash`: remove o stash especificado e aplica as alterações nos arquivos
- `git stash pop`: remove o stash mais recente da pilha e aplica as alterações nos arquivos
- `git stash push nome_do_arquivo`: selecionar um arquivo em especifico para ser enviado para o stash
- `git stash push`: envia todas as novas alterações de arquivos rastreados para a "area de trabalho" do stash
- `git stash save "uma descrição simples"`: permite criar uma descrição que será listada no comando `git stash list`
- `git stash show -p numero_do_stash`: mostra um diff das alterações de cada arquivo guardado em um determinado "stash"
- `git stash show numero_do_stash`: permite ver quais arquivos estão guardados em um determinado "stash"
- `git stash`: atalho para `git stash push`

### worktrees
- `git worktree add caminho_do_novo_worktree -b nome_da_nova_branch`: cria uma copia vinculada do repositorio no caminho especificado e essa cria uma nova branch nessa nova copia vinculada
- `git worktree add caminho_do_novo_worktree`: cria uma copia vinculada do repositorio no caminho especificado
- `git worktree remove caminho_do_novo_worktree`: deleta a copia vinculada do repositorio

### submodulos git
- `git clone --depth 1 --recursive --shallow-submodules`: clone superficial do repo e clone superficial de todos os submodulos
- `git clone --recursive url_do_repo`: clonar um repo e clontar tambem todos os submodulos dele
- `git submodule add url_do_repo nome_do_diretorio`: adicionar um submodulo a um repo, e além disso especificar um nome diferente para o submodulo
- `git submodule add url_do_repo`: adicionar um submodulo a um repo


### gerenciamento de branches
- `git branch -a`: listar todas as branches, inclusive remotas
- `git branch -d nome da branch`: deletar branch local
- `git branch -m novo nome da branch`: mudar o nome da branch atual para outro nome
- `git checkout -b nome da branch`: cria uma nova branch e alterna para ela
- `git clone --branch nome_da_branch url_do_repo`: clonar uma branch especifica de um repo
- `git fetch -p`: remove referencias de branches que não existem no repo remoto, `-p` é a versão curta de `--prune`
- `git push origin --delete nome_da_branch`: apaga a branch remota
- `git switch -c nome da branch`: cria uma nova branch e alterna para ela
- `git switch nome da branch`: alterna para a branch especificada

### gerenciamento de tags
- `git show v1.0`: mostra informações de uma determinada tag
- `git tag nome da tag`: cria um tag leve local
- `git tag`: lista as tags

### historico do git
- `git clone --depth 1 url_do_repo --no-single-branch`: por padrão o clone superficial so baixa uma branch, com esse subcomando permite baixar tambem as outras branches especificando o nivel de profundade para todas elas
- `git clone --depth 1 url_do_repo`: permite realizar um clone superficial onde baixa apenas os commits mais recentes e não todo o historico, o `1` refere ao nivel de profundidade e pode trocado por valores positivos mais altos
- `git filter-branch --index-filter 'git rm --cached --ignore-unmatch path/to/file' --tag-name-filter cat -- --all && git push --force --all`: remove um determinado arquivo do historico do git, faz rebase do historico mas não cria novos commits, aproveita os dados que estavam, mais informações em https://stackoverflow.com/a/8741530
- `git pull --unshallow`: ao clonar um repo no modo superficial, esse comando permite baixar todo o historico como um clone normal
- `git rebase -i --root`: realizar rebase no modo interativo, `--root` quer dizer para realizar rebase em todos os commits

### logs
- `git log --diff-filter=A --summary | grep 'create mode'`: mostra todos os arquivos que foram adicionados ao historico do git, esse subcomando `--diff-filter=` possui muitas opções e a saida indica os modos de cada ação sobre os arquivos (ex: create, modified etc), mais informações em [doc git](https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---diff-filterACDMRTUXB82308203)
- `git log --follow nome_do_arquivo`: mostra todos os commits referentes ao um determinado arquivo
- `git log --oneline --graph`: mostrar o log com uma representação das branches, o `--oneline` serve para resumir os dados mostrados dos commits
- `git log -p nome_do_arquivo`: mostra os logs em relação a um arquivo especifico
- `git log branch1:branch2 -- nome_do_arquivo`: mostra as os commits que diferem uma branch da outra em relação a um determinado arquivo
- `git log branch1:branch2`: mostra as os commits que diferem uma branch da outra
- `git shortlog -sn`: classifica todos os contribuidores com base na contagem de commits

### url do repositorio
- `git config --get remote.origin.url`: mostra a url do repo remoto
- `git remote set-url origin url_do_repo`: alterar url do repo remoto
- `git remote show origin`: mostra a url dos repos remotos e outros detalhes

### outros comandos
- `git blame nome_do_arquivo`: mostra informações como autor, numero de commit e outras informações para cada linha do ultimo estado do arquivo especificado
- `git commit --allow-empty -m 'Empty commit'`: cria um commit vazio, sem alterações de arquivo, util para acionar pipelines CI/CD
- `git commit --amend`: abre o editor e permite editar a mensagem do ultimo commit
- `git commit -a`: mesmo comportamento de digitar `git add .` e depois `git commit`
- `git commit -am`: mesmo comportamento de digitar `git add .` e depois `git commit -m mensagem_do_commit`
- `git config --list`: mostra as configurações do repositorio onde foi executado esse comando
- `git diff branch1:branch2 -- nome_do_arquivo`: mostra as diferenças em um determinado arquivo
- `git diff branch1:branch2`: mostra as diferenças entre as duas branches especificadas
- `git init --bare`: criar um repo local especial para usar como repo central, um repo local para usar como repo remoto
- `git log --grep "string`: procurar string nos textos dos commits
- `git log -p -G my_func`: procurar string nos textos dos diffs de commit
- `git pull --rebase`: usado para sobrescrever repo local com alterações do repo remoto apos um rebase
- `git push -u origin nome_da_branch`: dar push em uma branch pela primeira vez, esse parametro `-u` é um atalho para `--set-upstream`
- `git reset --hard hash_do_commit`: remove o commit referente ao hash, o parametro `--hard` remove os commits e alterações nos arquivos, deixam o repositorio em um estado antes dos tais commits
- `git reset --hard HEAD~N`: remove commits `N` contando do mais recente e voltando, o parametro `--hard` remove os commits e alterações nos arquivos, deixam o repositorio em um estado antes dos tais commits
- `git reset --soft hash_do_commit`: remove o commit referente ao hash, o parametro `--soft` remove os commits mas mantém alterações na area `stage` do git
- `git reset --soft HEAD~N`: remove commits `N` contando do mais recente e voltando, o parametro `--soft` remove os commits mas mantém alterações na area `stage` do git
- `git rev-list --all | xargs git grep "string"`: procurar string em todos os arquivos em todos os commits
- `git show nome_da_branch:nome_do_arquivo`: permite visualizar arquivos de outras branches sem precisar mudar de branch
- `GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_custom" git clone git@github.com:user/repo.git`: executar um `git clone` usando uma chave ssh especifica
- `GIT_SSH_COMMAND='ssh -o ProxyCommand="nc -X 5 -x 127.0.0.1:1080 %h %p"' git subcomando_git`: configuração para usar o git via proxy socks5

### adicionar arquivo/alteração ao ultimo commit:
```console
git add .
git commit --amend --no-edit
```
> remover o parametro `--no-edit` permite editar a mensagem do ultimo commit
