# WHAT?
  complete -F __start_docker d
	complete -F __start_kubectl k

# DOTFILES
  alias .alias='nvim ~/.bash_aliases'
  alias .profile='nvim ~/.bash_profile'
  alias .bashrc='nvim ~/.bashrc'
  alias .zshrc='nvim ~/.zshrc'
  alias .fzf='nvim ~/.fzf.bash'
  alias .gitconfig='nvim ~/.gitconfig'
  alias .tmux='nvim ~/.tmux.conf'
  alias .vifmrc='nvim ~/.vifm/vifmrc'
  alias .vimrc='nvim ~/.vimrc'
  alias .eslintrc='nvim ~/.eslintrc'
  alias .vsc='nvim ~/Library/Application\ Support/Code/User/settings.json'
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias dots='config dots && config commit -m \"dots\" && config push'

# WRITE
  alias notes="vim ~/d/NOTES.md"
  alias no="cat <<EOT >> ~/d/NOTES.md"
  alias hab='nvim ~/Desktop/_sync/notes/HABITS'
  alias vi='nvim'
  alias todo='nvim ~/Desktop/_sync/notes/TODO'

# NAV 
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
  alias vl='vv ~/Desktop/_sync/learn' 
  alias vld='vv ~/Desktop/_sync/learn/dev' 
  alias vd='vv ~/d'
  alias vdt='vv ~/d/t'
  alias vds='vv ~/d/st'
  alias cdt='cd ~/d/t'
  alias cds='cd ~/d/st'
  alias cl='cd ~/Desktop/_sync/learn' 
  alias v='vpipe .'
  alias vv='vpipe'
  alias vview='vv ~/.vim/view'
  alias vfam='vv ~/Desktop/_sync/fam'
  alias vfin='vv ~/Desktop/_sync/fin'
  alias vide='vv ~/Desktop/_sync/ideas'
  alias vlist='vv ~/Desktop/_sync/lists'
  alias vnote='vv ~/Desktop/_sync/notes'
  alias vwrite='vv ~/Desktop/_sync/write'

# MANAGE
  alias rm='rm -i'
  alias c="pbcopy"
  alias swap='v ~/.vim/swapfiles/'
  alias swapr='rm -f ~/.vim/swapfiles/*.*'

# DOCKER
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
  alias gi='touch .gitignore && echo "node_modules" >> .gitignore'
  alias gs='git status'
  alias gl='git log'
  alias gbl='git branch -l'
  alias gb='git checkout $(git branch | fzf) | ls'
  alias gcb='git checkout -b'
  alias gadd='git add .'

  alias gcom='git add . && git commit -m'
  alias ginit='echo "node_modules" >> .gitignore && git init && git add . && git commit -m "Initial" && git checkout -b "test" && git log --decorate'
  alias grm='rm .gitignore && rm -rf .git'

# KUBERNETES
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

# OTHERS
  alias sbash='source ~/.bash_profile'
  alias h='htop'
  alias t="tig"
  alias tl="tig reflog"
  alias zz='zsh'
  alias vars="set | sed -n 148,158p"

# FUNCTIONS
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

### v: access from current shell folder, exit from last vifm folder
  vpipe() {
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
      echo 'directory picking cancelled/failed'
      return 1
    fi
    cd $dst
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

mkc () { mkdir -p "$1" && cd "$1"; }
del () { command mv "$@" ~/.Trash; }
cdl () { cd $1 && ls -al | more ; }


