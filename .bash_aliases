

	complete -F __start_docker d
	complete -F __start_kubectl k
# ALIASES
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .alias='nvim ~/.bash_aliases'
alias .bash='nvim ~/.bash_profile'
alias .fzf='nvim ~/.fzf.bash'
alias .git='nvim ~/.gitconfig'
alias .tmux='nvim ~/.tmux.conf'
alias .vifm='nvim ~/.vifm/vifmrc'
alias .vim='nvim ~/.vimrc'
alias a="amplify"
alias aa='export a=$(pwd) && echo $a'
alias aaa='echo a:$a && echo b:$b'
alias azd="az devops"
alias bb='export b=$(pwd) && echo $b'
alias c="pbcopy"
alias cdd='cd ~/d'
alias cdj='cd ~/d/t/js'
alias cdt='cd ~/d/t'
alias cdtt='cd ~/d/test'
alias cld='cd ~/Desktop/_sync/learn/dev'
alias dots='config dots && config commit -m "dots" && config push'
alias d="docker"
alias dc="docker container"
alias dco="docker-compose"
alias dcoe="docker-compose exec app /bin/bash"
alias dcr="docker rm -f"
alias di="docker images"
alias dma="docker-machine"
alias dn="docker network"
alias dps="docker ps -a -n9 --format 'table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dv="docker volume"
alias eslint="./node_modules/.bin/eslint"
alias g='git'
alias gab='rm -rf ~/d/t/gatsby/hello/public && g build'
alias gat='gatsby'
alias gc='git checkout $(git branch | fzf) | ls'
alias gcb='git checkout -b'
alias gcom='git add . && git commit -m'
alias ginit='echo "node_modules" >> .gitignore && git init && git adds && git commit -m "Initial" && git checkout -b "test" && git vlog'
alias grm='rm .gitignore && rm -rf .git'
alias gs='git status'
alias h='htop'
alias k="kubectl"
alias ka="kubectl api-resources"
alias kc="kubectl config"
alias kcc="kubectl config current-context"
alias kcg="kubectl config get-contexts"
alias kcu="kubectl config use-context"
alias kcv="kubectl config view" 
alias kga="kubectl get all"
alias kgd="kubectl get deploy"
alias kgi="kubectl get ing"
alias kgn="kubectl get no"
alias kgns="kubectl get ns"
alias kgp="kubectl get pod"
alias kgs="kubectl get svc"
alias ki="kubectl cluster-info"
alias la='ls -a'
alias ll='ls -al'
alias no="cat <<EOT >> ~/d/NOTES.md"
alias nv="vim ~/d/NOTES.md"
alias pack="cat package.json"
alias rm='rm -i'
alias sbash='source ~/.bash_profile'
alias sshw='ssh -v -p 3140 f@81.191.57.16'
alias t="tig --all"
alias tr="tig reflog"
alias v.='vifm .'
alias v='vifm'
alias vars="set | sed -n 148,158p"
alias vd='vifmDest'
alias vdd='vd ~/d'
alias vdj='vd ~/d/t/js'
alias vdt='vd ~/d/t'
alias vfam='vifm ~/Desktop/_sync/fam'
alias vfin='vifm ~/Desktop/_sync/fin'
alias vhabits='nvim ~/Desktop/_sync/notes/HABITS'
alias vi='nvim'
alias vide='vifm ~/Desktop/_sync/ideas'
alias vld='vifm ~/Desktop/_sync/learn/dev'
alias vlist='vifm ~/Desktop/_sync/lists'
alias vnote='vifm ~/Desktop/_sync/notes'
alias vtodo='nvim ~/Desktop/_sync/notes/TODO'
alias vu="vultr-cli"
alias vview='vifm ~/.vim/view'
alias vvsc='nvim ~/Library/Application\ Support/Code/User/settings.json'
alias vwrite='vifm ~/Desktop/_sync/write'
