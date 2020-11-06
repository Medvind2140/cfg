complete -F __start_docker d
complete -F __start_kubectl k

# DOTFILES
  alias .sa='nvim ~/.ssh/.bash_aliases'
  alias .sv='nvim ~/.ssh/.vimrc'
  alias .a='nvim ~/.bash_aliases'
  alias .profile='nvim ~/.bash_profile'
  alias .b='nvim ~/.bashrc'
  alias .zshrc='nvim ~/.zshrc'
  alias .fzf='nvim ~/.fzf.bash'
  alias .gitconfig='nvim ~/.gitconfig'
  alias .tmux='nvim ~/.tmux.conf'
  alias .vifmrc='nvim ~/.vifm/vifmrc'
  alias .v='nvim ~/.vimrc'
  alias .eslintrc='nvim ~/.eslintrc'
  alias .vsc='nvim ~/Library/Application\ Support/Code/User/settings.json'
  # DOTFILES BACKUP > GITHUB
  # Atlassian
  # Track only manually added files
  # Always stay in home folder as it works as your git folder 
  # "config" alias works as "git"

  # echo ".cfg" >> .gitignore_global
  # git clone --bare <repo urgl> $HOME/.cfg
  # config config -local status.showUntracketFiles no 
  #
  # config status
  # config add -u  // NOTE to add a new tracked file/folder, do it individually
  # config commit -m "added"
  # config push
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias dots='config dots && config commit -m "dots" && config push'


# WRITE
  alias notes='vim ~/d/NOTES.md'
  alias no='cat <<EOT >> ~/d/NOTES.md'
  alias hab='nvim ~/Desktop/_sync/notes/HABITS'
  alias vi='nvim'
  alias todo='nvim ~/Desktop/_sync/notes/TODO'

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
  alias ll='ls -l'
  alias ld='ls -d .?*'
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
  alias vview='vv ~/.vim/view'
### vpipe: access from current shell folder, exit from last vifm folder
  vpipe() {
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
      echo 'directory picking cancelled/failed'
      return 1
    fi
    cd $dst
  }
  alias vfam='vv ~/Desktop/_sync/fam'
  alias vfin='vv ~/Desktop/_sync/fin'
  alias vide='vv ~/Desktop/_sync/ideas'
  alias vlist='vv ~/Desktop/_sync/lists'
  alias vnote='vv ~/Desktop/_sync/notes'
  alias vwrite='vv ~/Desktop/_sync/write'

# MANAGE
alias cc='fc -ln -1 | pbcopy'
alias rm='rm -i'
alias co='copy'
alias swap='v ~/.vim/swapfiles/'
alias swapr='rm -f ~/.vim/swapfiles/*.*'
function mkc () { mkdir -p "$1" && cd "$1"; }
function del () { command mv "$@" ~/.Trash; }
function dcl () { cd $1 && ls -al | more ; }

## COPY PREV COMMAND TO CLIPBOARD
pb () { echo "$@" | pbcopy; }
  # $ history (identify line ni)
  # $  !221
  # $  old command (press enter to copy to clipboard)
  # - Past in vim...

# DOCKER
  alias d="docker"
  alias dc="docker container"
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
## DIL: LIST IMAGES BETTER
dil() {
  docker image ls | awk '{printf "%-13s %-7s %-10s %s\n", $3, $7, $2, "| " $1}' | sed 1d
}

## DIR: RUN IMAGE
dir() {
  local cid
  cid=$(docker images -a | sed 1d | fzf -q "$1" | awk '{print $1}')
  [ -n "$cid" ] && docker run --detach "$cid"
}
## DIRM: REMOVE IMAGES
dirm() {
  docker images | sed 1d | fzf -m | awk '{print $3}' | xargs docker rmi -f
}

## DVL: LIST VOLUMES
dvl() {
  docker volume ls
}

## DVRM: REMOVE VOLUMES
dvrm() {
  docker volume ls | sed 1d | fzf -m | awk '{print $2}' | xargs docker volume rm
}

## DNL: LIST NETWORKS
dnl() {
  docker network ls
}

## DNRM: REMOVE NETWORKS
dnrm() {
  docker network ls | sed 1d | fzf -m | awk '{print $1}' | xargs docker network rm
}

## DS: DOCKER STATS
ds() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker stats
}

## DCS: START CONTAINERS
dcs() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container start
} 
## DCST: STOP RUNNING CONTAINERS
dcst() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container stop
}
## DCRM: REMOVE STOPPED CONTAINERS
function dcrm() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container rm
}

## DCSR: STOP RUNNING CONTAINERS AND REMOVE THEM
dcsr() {
  docker ps -a | sed 1d | fzf -m | awk '{print $1}' | xargs docker container stop | xargs docker container rm
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
  alias gi='touch .gitignore && echo -e "node_modules \ndist \n*.log \n" >> .gitignore && echo "created .gitignore"'
  alias gs='git status'
  alias gl='git log'
  alias gbl='git branch -l'
  alias gb='git checkout $(git branch | fzf) | ls'
  alias gcb='git checkout -b'
  alias gadd='git add .'
  alias gcom='git add . && git commit -m'
  alias ginit='touch .gitignore && echo -e "node_modules \ndist \n*.log \n" >> .gitignore && git init && git add . && git commit -m "Initial commit" && git checkout -b "test" && git log --decorate'
  alias grm='rm .gitignore && rm -rf .git'

# REMOTE SSH
  # list keys
  alias vk='vv ~/.ssh'
  # View list of keys used to access servers
  alias keys='ssh-keygen -lv -f ~/.ssh/known_hosts | less'
  # list active keys
  alias keya='for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq'
  # config keys
  alias keyc='vi ~/.ssh/config'
  # list agents
  alias agents="ps aux | grep ssh-agent | awk '/\?\?/{print $1;}'"
  # agent0 = stop ALL ssh agents
  function agent0() {
    kill -9 $( ps ax | grep ssh-agent | awk '/\?\?/{print $1;}')
    agents 
    echo "All agents and $SSH_AGENT_PID ssh-agent is now stopped"
  }

  # agent1 = start ssh agent 
  function agent1 () {
    if ps -p $SSH_AGENT_PID > /dev/null
      then 
        echo "$SSH_AGENT_PID ssh-agent is already running"
        else
      eval `ssh-agent -s`
    fi
  }

  # connect to devices
  alias p1='ssh -p22 $p2 -o VisualHostKey=yes'
  alias p2='ssh -p22 $p1 -o VisualHostKey=yes'

  # scp. = copy aliases permanently in a new ssh session.
  function scp.() {
    scp ~/.ssh/.bash_aliases ~/.ssh/.vimrc $1:
  }

  # ssh. = copy aliases temporary in a new ssh session.
  function ssh.() {
    scp ~/.ssh/.bash_aliases ~/.ssh/.vimrc $1: 
    ssh -t $1 "bash --rcfile ~/.bash_aliases; mv vifmrc .vifm/ ;rm ~/.bash_aliases ~/.vimrc"
  }

# KUBERNETES
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
  # get namespaces
  alias kgns="kubectl get ns"
  alias kgp="kubectl get pod"
  alias kgs="kubectl get svc"
  alias ki="kubectl cluster-info"

## kgnsp: GET NAMESPACES PODS
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
ff () {
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
fl () {
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
  fw () {
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
