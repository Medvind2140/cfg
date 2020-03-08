# ALIASES
alias rm='rm -i'
alias ll='ls -al'
alias la='ls -a'
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias vlist='vifm ~/Desktop/_sync/lists'
alias vide='vifm ~/Desktop/_sync/ideas'
alias vwrite='vifm ~/Desktop/_sync/write'
alias vl='vifm ~/Desktop/_sync/learn'
alias vld='vifm ~/Desktop/_sync/learn/dev'
alias vfam='vifm ~/Desktop/_sync/fam'
alias vfin='vifm ~/Desktop/_sync/fin'
alias vnote='vifm ~/Desktop/_sync/notes'
alias vdd='vd ~/d'
alias vdt='vd ~/d/t'
alias vdj='vd ~/d/t/js'
alias cdd='cd ~/d'
alias cdt='cd ~/d/t'
alias cdj='cd ~/d/t/js'
alias cdtt='cd ~/d/test'
alias cld='cd ~/Desktop/_sync/learn/dev'
alias vview='vifm ~/.vim/view'

alias g='git'
alias ginit='echo "node_modules" >> .gitignore && git init && git adds && git commit -m "Initial" && git checkout -b "test" && git vlog'
alias grm='rm .gitignore && rm -rf .git'
alias ga='gatsby'
alias gab='rm -rf ~/d/t/gatsby/hello/public && g build'
alias a='amplify'
alias aa='export a=$(pwd) && echo $a'
alias bb='export b=$(pwd) && echo $b'
alias aaa='echo a:$a && echo b:$b'

alias v='vifmVisit'
alias vd='vifmDest'
alias v.='vifm .'
alias vi='nvim'
alias vvim='nvim ~/.vimrc'
alias vbash='nvim ~/.bash_profile'
alias valias='nvim ~/.bash_aliases'
alias vfzf='nvim ~/.fzf.bash'
alias vtmux='nvim ~/.tmux.conf'
alias vvifm='nvim ~/.vifm/vifmrc'
alias vvsc='nvim ~/Library/Application\ Support/Code/User/settings.json'
alias sbash='source ~/.bash_profile'

alias vtodo='nvim ~/Desktop/_sync/notes/TODO'
alias vtolearn='nvim ~/Desktop/_sync/notes/TOLEARN'
alias vbacklog='nvim ~/Desktop/_sync/notes/BACKLOG'
alias vgoals='nvim ~/Desktop/_sync/notes/GOALS'
alias vstatus='nvim ~/Desktop/_sync/notes/STATUS'
alias vhabits='nvim ~/Desktop/_sync/notes/HABITS'
alias vnote='nvim ~/Desktop/_sync/notes/NOTE'

alias vinvest='nvim ~/Desktop/_sync/learn/fin/invest'
alias vwords='nvim ~/Desktop/_sync/learn/words'
alias vterms='nvim ~/Desktop/_sync/learn/dev/terms'
alias vdevops="nvim ~/Desktop/_sync/learn/dev/devops"
alias vsecurity="nvim ~/Desktop/_sync/learn/dev/security"
alias vgo='nvim ~/Desktop/_sync/learn/dev/go'
alias vworkflow='nvim ~/Desktop/_sync/learn/dev/workflow'

alias pack="cat package.json"
alias vars="set | sed -n 148,158p"
alias c="pbcopy"


alias vu="vultr-cli"

alias k="kubectl"
	complete -F __start_kubectl k

alias ka="kubectl api-resources"
alias ki="kubectl cluster-info"

alias kc="kubectl config"
alias kcg="kubectl config get-contexts"
alias kcu="kubectl config use-context"
alias kcc="kubectl config current-context"
alias kcv="kubectl config view" 

alias kga="kubectl get all"
alias kgd="kubectl get deploy"
alias kgp="kubectl get pod"
alias kgn="kubectl get no"
alias kgs="kubectl get svc"
alias kgi="kubectl get ing"
alias kgns="kubectl get ns"
alias eslint="./node_modules/.bin/eslint"
alias n="cat <<EOT >> ~/d/NOTES.md"
alias nv="vim ~/d/NOTES.md"
alias d="docker"
	complete -F __start_docker d
alias di="docker images"
alias dc="docker container"
alias dcr="docker rm -f"
alias dn="docker network"
alias dv="docker volume"
alias dps="docker ps -a -n9 --format 'table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dma="docker-machine"
alias dco="docker-compose"
alias dcoe="docker-compose exec app /bin/bash"
alias ad="az devops"

alias sshw='ssh -v -p 3140 f@81.191.57.16'


