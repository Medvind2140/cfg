# DOTFILES
alias .a='nvim ~/.bash_aliases'
alias .b='nvim ~/.bashrc'
alias .e='nvim ~/.eslintrc'
alias .f='nvim ~/.fzf.bash'
alias .g='nvim ~/.gitconfig'
alias .p='nvim ~/.bash_profile'
alias .t='nvim ~/.tmux.conf'
alias .v='nvim ~/.vimrc'
alias .vifm='nvim ~/.vifm/vifmrc'
alias .vsc='nvim ~/Library/Application\ Support/Code/User/settings.json'
alias .z='nvim ~/.zshrc'
alias .as='nvim ~/.ssh/.bash_aliases'
alias .vs='nvim ~/.ssh/.vimrc'

# DOTFILES BACKUP TO GITHUB/GITEA REMOTES 
# Track only manually added files
# Always stay in home folder as it works as your git folder 
# "config" alias works as "git"

# echo ".cfg" >> .gitignore_global
# git clone --bare <repo urgl> $HOME/.cfg
# config config -local status.showUntracketFiles no 

# config status
# config add -u  // NOTE to add a new tracked file/folder, do it individually
# config commit -m "added"
# config push gitea/github // Always check for secrets before pushing
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias dots='config dots && config commit -m "dots" && config push'

# WRITE
alias notes='nvim ~/d/NOTES.md'
alias note='cat <<EOT >> ~/d/NOTES.md'
alias vi='nvim'

# INFO
alias is="cat /proc/device-tree/model"

# NAV
# kill -9 + tab = list processes to kill
# ctrl+t = list files from current directory 
# cd ctrl+r = FZF list last cd commands
# cd ~/**+tab = list files from root directory
# ssh, unset, export, unalias
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias la='ls -a'
alias ll='ls -al'
alias ld='ls -d */'
alias aa='export a=$(pwd) && echo $a'
alias aaa='echo a:$a && echo b:$b'
alias bb='export b=$(pwd) && echo $b'
alias fp='ps aux | fzf'
alias vld='vv ~/Desktop/_sync/learn/dev' 
alias vdt='vv ~/d/t'
alias vds='vv ~/d/st'
alias cld='cd ~/Desktop/_sync/learn/dev'
alias cdt='cd ~/d/t'
alias cds='cd ~/d/st' 
alias v='vpipe .'
alias vv='vpipe '
alias vs='vv ~/.ssh/'
alias vview='vv ~/.vim/view'
### vpipe: access from current shell folder, exit from last vifm folder
function vpipe() {
  local dst="$(command vifm --choose-dir - "$@")"
  if [ -z "$dst" ]; then
    echo 'directory picking cancelled/failed'
    return 1
  fi
  cd $dst
}
alias vsync='vv ~/Desktop/_sync/'
 
# NET
alias lsp="sudo lsof -PiTCP -sTCP:LISTEN"

# MANAGE
alias rm='rm -i'
alias co='copy'
alias swap='v ~/.vim/swapfiles/'
alias swapr='rm -f ~/.vim/swapfiles/*.*'
function mcd () { mkdir -p "$1" && cd "$1"; }
function del () { command mv "$@" ~/.Trash; }
function dcl () { cd "$1" && ls -al | more; }

## COPY PREV COMMAND TO CLIPBOARD
function pb () { echo "$@" | pbcopy; }
# $ history (identify line ni)
# $  !221
# $  old command (press enter to copy to clipboard)
# - Past in vim...

# DOCKER
alias d="docker"
alias dc="docker container"
alias dce="docker container exec -it"
alias dca="docker container attach"
alias doc="docker-compose"
alias doce="docker-compose exec app /bin/bash"
alias di="docker image"
alias dv="docker volume"
alias dn="docker network"
alias dncr="docker network create"
alias dnc="docker network connect"
alias dnd="docker network disconnect"
alias dni="docker network inspect"
alias dps="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dm="docker-machine"
alias dip="di inspect --format='{{.ContainerConfig.ExposedPorts}}' $1"
alias dall="dil && dps && dvl && dnl"

### dil: list images better
function dil() {
  docker image ls | awk '{printf "%-13s %-7s %-10s %s\n", $3, $7, $2, "| " $1}' | sed 1d
}
### dir: run image fzf selector
function dir() {
  local cid
  cid=$(docker images -a | sed 1d | fzf -q "$1" | awk '{print $1}')
  [ -n "$cid" ] && docker run --detach "$cid"
}
### dirm: remove images fzf selector
function dirm() {
  docker images | sed 1d | fzf -m | awk '{print $3}' | xargs docker rmi -f
}
### dvrm: remove volumes fzf selector
function dvrm() {
  docker volume ls | sed 1d | fzf -m | awk '{print $2}' | xargs docker volume rm
}
### dnrm: remove networks fzf selector
function dnrm() {
  docker network ls | sed 1d | fzf -m | awk '{print $1}' | xargs docker network rm
}
### ds: docker stats fzf selector
function ds() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker stats
}
### dcs: start containers fzf selector
function dcs() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container start
} 
### dcst: stop running containers fzf selector
function dcst() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container stop
}
### dcrm: remove stopped containers fzf selector
function dcrm() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container rm
}
### dcsr: stop+remove running containers fzf selector
function dcsr() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container stop | xargs docker container rm
}

## DOCKER LOCAL REGISTRY
### Enable access 
function passdock(){
  passenv DOCKREG dockreg;
  passenv DOCKLOGIN docklogin;
  bl='\033[0;34m'
  yl='\033[0;33m'
  nc='\033[0m'
  echo -e "${bl}LOCAL DOCKER REGISTRY READY${nc}"
  echo "Open new bash-session and use these commands..."
  echo "---------------------------------------------------"
  echo -e "${yl}dri${nc} = list docker images"
  echo -e "${yl}drit <image>${nc} = list docker image's tag"
  echo -e "${yl}drpull <image:tag>${nc} = pull image:tag"
  echo -e "${yl}drtag <image1> <image2:tag>${nc} = tag existing image"
  echo -e "${yl}drpush <image:tag>${nc} = push image:tag"
}
### Disable access
function lockdock(){
  tmux setenv -r DOCKREG;
  tmux setenv -r DOCKLOGIN;
  unset DOCKREG;
  unset DOCKLOGIN;
  echo -e "\033[0;31mLOCAL DOCKER REGISTRY ACCESS REMOVED\033[0m";
  echo $DOCKREG;
  echo $DOCKLOGIN;
}
### Registry commands
function dri(){
  curl -u $DOCKLOGIN --request GET $DOCKREG/v2/_catalog;
}
function drit(){
  curl -u $DOCKLOGIN --request GET $DOCKREG/v2/"$1"/tags/list
}
function drpull(){
  docker pull $DOCKREG/"$1"
}
function drpush(){
  docker push $DOCKREG/"$1"
}
function drtag(){
  docker tag "$1" $DOCKREG/"$2"
}

## SECRETS
function passenv(){
  # export $1=$( pass show "$2");
  tmux setenv $1 $(pass show "$2")
  # eval "export $(tmux setenv $1 $2)";
}
# CODE
alias eslint="./node_modules/.bin/eslint"
alias gab='rm -rf ~/d/t/gatsby/hello/public && g build'
alias ga='gatsby'
alias y='yarn'
alias yw='yarn workspace'
alias yws='yarn workspaces'
alias pack="cat package.json"
alias vpack="vi package.json"
alias azd="az devops"
alias vu="vultr-cli"
alias sshw='ssh -v -p 3140 f@81.191.57.16'
alias nodeinit="cp -r ~/d/t/node/template $1"

# GIT
alias g='git'
alias gitignore='touch .gitignore && echo -e "node_modules \ndist \n*.log \n" >> .gitignore && echo "created .gitignore"'
alias gdc='git diff --cached' 
alias gs='git status'
alias gl='git log'
alias gbl='git branch -l'
alias gb='git checkout $(git branch --sort=-committerdate | fzf)'
alias gcb='git checkout -b'
alias gadd='git add .'
alias gcom='git add . && git commit -m'
alias ginit='touch .gitignore && echo -e "node_modules \ndist \n*.log \n" >> .gitignore && git init && git add . && git commit -m "Initial commit" && git checkout -b "test" && git log --decorate'
alias grm='rm .gitignore && rm -rf .git'

# SSH
# list keys
alias vs='vv ~/.ssh'
# View signatures of remote hosts
alias ssk='ssh-keygen -lv -f ~/.ssh/known_hosts | less'
# list unique keys
alias ssu='for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq'
# ssh config
alias ssc='vi ~/.ssh/config'
# list agents
alias ssa="ps aux | grep ssh-agent | awk '/\?\?/{print $1;}'"
# add ips
alias ips="source ~/.ssh/./ips"
# agent0 = stop ALL ssh agents
function ss0() {
  kill -9 $( ps ax | grep ssh-agent | awk '/\?\?/{print $1;}')
  agents 
  echo "All agents and $SSH_AGENT_PID ssh-agent is now stopped"
}

# agent1 = start ssh agent 
function ss1 () {
  if ps -p $SSH_AGENT_PID > /dev/null
    then 
      echo "$SSH_AGENT_PID ssh-agent is already running"
      else
    eval `ssh-agent -s`
  fi
}

# scp. = copy aliases permanently in a new ssh session.
function scp.() {
  scp ~/.ssh/.bash_aliases ~/.ssh/.vimrc ~/.ssh/vifmrc $1:
}

# ssh. = copy aliases temporary in a new ssh session.
function ssh.() {
  scp ~/.ssh/.bash_aliases ~/.ssh/.vimrc ~/.ssh/vifmrc $1: 
  ssh -t $1 "bash --rcfile ~/.bash_aliases; mv vifmrc .vifm/ ;rm ~/.bash_aliases ~/.vimrc"
}

alias up="bin/upload.sh"

# DEVOPS 
## CONCOURSE
## ANSIBLE
## TERRAFORM

## KUBERNETES
alias h="helm"
alias m="minikube"
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
### get namespaces
alias kgns="kubectl get ns"
alias kgp="kubectl get pod"
alias kgs="kubectl get svc"
alias ki="kubectl cluster-info"
### kgnsp: GET NAMESPACES PODS
kgnsp() {
  kgns | sed 1d | fzf -m | awk '{print $1}' | kubectl --namespace $1 get pods
} 

# OTHER
alias lessn='less -N'
alias sbash='source ~/.bash_profile'
alias ht='htop'
alias t='tig'
alias tl='tig reflog'
alias z='zsh'
alias vars='set | sed -n 148,158p'
alias qf='fortune ~/quotes | cowsay'
function qff(){
  vi ~/quotes;
  strfile ~/quotes;
}

# FIND
### ff
function ff () {
    local str=$2
    local file=$1
    local line
    if [ -z "$file" ]; then
      file=`ls | fzf`
      if [ -z "$file" ]; then
        echo "stop"
      else	
        nvim $file
      fi
    elif [ -z "$str" ]; then
      file=`find * -name $file\* | fzf`
      if [ -z "$file" ]; then
        echo "stop"
      else
        nvim $file
      fi
    else
      line=`rg -n --smart-case $str $file | fzf | awk -F: '{print $1}'`
      if [ -z "$line" ]; then
        echo "stop"
      else
        nvim $file +"$line|norm! zv zz"
      fi
    fi
    cd -
  }

### fl, select file in learning
function fl () {
  cd ~/Desktop/_sync/learn/dev
  local str=$2
  local file=$1
  local line
  if [ -z "$file" ]; then
    file=`ls | fzf`
    if [ -z "$file" ]; then
      echo "stop"
    else	
      nvim $file
    fi
  elif [ -z "$str" ]; then
    file=`find * -name $file\* | fzf`
    if [ -z "$file" ]; then
      echo "stop"
    else
      nvim $file
    fi
  else
    line=`rg -n --smart-case $str $file | fzf | awk -F: '{print $1}'`
    if [ -z "$line" ]; then
      echo "stop"
    else
      nvim $file +"$line|norm! zv zz"
    fi
  fi
  cd -
}

### fw <word>, select file : fuzzy ripgrep, content in anyfile, open in vim
function fw () {
  local file=$2
  local line=$1
  read -r file line <<<"$(rg --smart-case --vimgrep $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"
  if [[ -n $file ]]
  then
     nvim $file +"$line|norm! zv zz"
  fi
}

### fv: search current folder with fzf, open in vim
  # fv()	{
  # local file=$1
  # file=`ls | fzf`
  # if [ -z "$file" ]; then
  #   echo "stop"
  # else
  #   nvim $file
  # fi
  # }

# LOGS
alias l='lnav'

