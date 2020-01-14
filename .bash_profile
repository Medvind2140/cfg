# START BASH IN TMUX
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ];
#	then
#		exec tmux
#fi

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# VIM KEYS IN TERMINAL
set -o vi
                                        
# PREVENT COMMAND LOGGING IN FILE
unset HISTFILE

# PREVENT FILE-OVERWRITES WITH APPEND
set -o noclobber

# SSH-AGENT
{ eval `ssh-agent`; ssh-add -A; } &>/dev/null

# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# PYENV
if command -v pyenv 1>/dev/null 2>&1; then
eval "$(pyenv init -)"
fi

# POWERLINE
	# Avoid Errors
	 export LC_ALL=en_US.UTF-8
	 export LANG=en_US.UTF-8
	 export PATH=$PATH:$HOME/Library/Python/2.7/bin

	# Initiate Powerline

		powerline-daemon -q
		POWERLINE_BASH_CONTINUATION=1
		POWERLINE_BASH_SELECT=1
		. /Users/f/.pyenv/versions/3.7.4/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

	# Get folder listing colors
		export CLICOLOR=1
		export LSCOLORS=Hxfxcxdxbxegedabagacad
		alias ls='ls -GFh'
 
#	 export PS1="[\u@\h \W]\$(git_branch)\$ "

# source ~/.git-completion.bash

# COMPLETION
if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
. $(brew --prefix)/etc/bash_completion.d
fi
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# bash-completion (bash v3.2.57)
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

# bash-completion (bash v5.x)
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
source <(kubectl completion bash)

# PATHS
export CDPATH=".:~:~/Desktop:~/Desktop/dev:~/Desktop/_sync/"
export PATH="/usr/local/bin:/usr/local/:/bin:/usr/bin:/usr/sbin:/sbin:/Users/f/.fzf/bin:/Users/f/Library/Python/3.7/bin:/Users/f/.vimpkg/bin:/Users/f/Desktop/dev/shell"

# CONFIG
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# config add file
# config commit -m "..."
# config log

# FUNCTIONS
mkc () { mkdir -p "$1" && cd "$1"; }
del () { command mv "$@" ~/.Trash; }
cdl () { cd $1 && ls -al | more ; }


# ALIASES
alias ll='ls -al'
alias la='ls -a'
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias clists='cd ~/Desktop/_sync/lists && ls'
alias cideas='cd ~/Desktop/_sync/ideas && ls'
alias cwrite='cd ~/Desktop/_sync/write && ls'
alias cl='cd ~/Desktop/_sync/learn && ls'
alias cld='cd ~/Desktop/_sync/learn/dev && ls'
alias cfam='cd ~/Desktop/_sync/fam && ls'
alias cnotes='cd ~/Desktop/_sync/notes && ls'
alias cdevjs='cd ~/d/js && ls'
alias cdev='cd ~/d && ls'
 
alias a='export a=$(pwd) && echo $a'
alias b='export b=$(pwd) && echo $b'
alias aa='echo a:$a && echo b:$b'

alias vvim='vim ~/.vimrc'
alias vbash='vim ~/.bash_profile'
alias sbash='source ~/.bash_profile'
alias vvsc='vim ~/Library/Application\ Support/Code/User/settings.json'

alias vtodo='vim ~/Desktop/_sync/notes/TODO'
alias vtolearn='vim ~/Desktop/_sync/notes/TOLEARN'
alias vbacklog='vim ~/Desktop/_sync/notes/BACKLOG'
alias vgoals='vim ~/Desktop/_sync/notes/GOALS'
alias vstatus='vim ~/Desktop/_sync/notes/STATUS'
alias vhabits='vim ~/Desktop/_sync/notes/HABITS'
alias vnote='vim ~/Desktop/_sync/notes/NOTE'

alias vinvest='vim ~/Desktop/_sync/learn/fin/invest'
alias vwords='vim ~/Desktop/_sync/learn/words'
alias vterms='vim ~/Desktop/_sync/learn/dev/terms'
alias vdevops="vim ~/Desktop/_sync/learn/dev/devops"
alias vsecurity="vim ~/Desktop/_sync/learn/dev/security"
alias vgo='vim ~/Desktop/_sync/learn/dev/go'
alias vworkflow='vim ~/Desktop/_sync/learn/dev/workflow'

alias pack="cat package.json"
alias vars="set | sed -n 148,158p"
alias c="pbcopy"

alias v="vultr-cli"

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
