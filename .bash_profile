# Start Bash in Tmux
	if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ];
		then
			exec tmux
	fi
		[ -f ~/.fzf.bash ] && source ~/.fzf.bash
                                        
# Prevent command logging in file
unset HISTFILE
# Prevent file-overwrites with append
set -o noclobber

# SSH-agent
{ eval `ssh-agent`; ssh-add -A; } &>/dev/null

# Config for dotfiles 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# Powerline
	# Avoid Errors
	 export LC_ALL=en_US.UTF-8
	 export LANG=en_US.UTF-8
	 export PATH=$PATH:$HOME/Library/Python/2.7/bin

	# Initiate Powerline

		powerline-daemon -q
		POWERLINE_BASH_CONTINUATION=1
		POWERLINE_BASH_SELECT=1
		. /Users/f/.pyenv/versions/3.7.4/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh
#		. /Users/f/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

	# Get folder listing colors
		export CLICOLOR=1
		export LSCOLORS=Hxfxcxdxbxegedabagacad
		alias ls='ls -GFh'

 source ~/.git-completion.bash
 
# export PS1="[\u@\h \W]\$(git_branch)\$ "


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
export PATH="/usr/local/bin:/usr/local/:/bin:/usr/bin:/usr/sbin:/sbin:/Users/f/.fzf/bin:/Users/f/Library/Python/3.7/bin:/Users/f/.vimpkg/bin:/Users/f/Desktop/dev/shell:/Users/f/Desktop/_sync/learn/dev/:/Users/f/dev/flutter/bin"

# Pyenv
 if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
 fi

# ALIASES
alias clist='cd ~/Desktop/_sync/lists && ls'
alias cide='cd ~/Desktop/_sync/ideas && ls'
alias cwrite='cd ~/Desktop/_sync/write && ls'
alias cl='cd ~/Desktop/_sync/learn && ls'
alias cld='cd ~/Desktop/_sync/learn/dev && ls'
alias cfa='cd ~/Desktop/_sync/fam && ls'
alias cnotes='cd ~/Desktop/_sync/notes && ls'
alias cdevt='cd ~/dev/test && ls'
alias cdev='cd ~/dev && ls'
 
alias vvim='vim ~/.vimrc'
alias vbash='vim ~/.bash_profile'
alias sbash='source ~/.bash_profile'
alias vvsc='vim ~/Library/Application\ Support/Code/User/settings.json'

alias todo='vim ~/Desktop/_sync/notes/TODO'
alias tolearn='vim ~/Desktop/_sync/notes/TOLEARN'
alias backlog='vim ~/Desktop/_sync/notes/BACKLOG'
alias goals='vim ~/Desktop/_sync/notes/GOALS'
alias status='vim ~/Desktop/_sync/notes/STATUS'
alias habits='vim ~/Desktop/_sync/notes/HABITS'
alias note='vim ~/Desktop/_sync/notes/NOTE'

alias linvest='vim ~/Desktop/_sync/learn/fin/invest'
alias lwords='vim ~/Desktop/_sync/learn/words'
alias lterms='vim ~/Desktop/_sync/learn/dev/terms'
alias ldevops="vim ~/Desktop/_sync/learn/dev/devops"
alias lsecurity="vim ~/Desktop/_sync/learn/dev/security"
alias lgo='vim ~/Desktop/_sync/learn/dev/go'

alias pack="cat package.json"
alias vars="set | sed -n 148,158p"
alias c="pbcopy"
alias v="vultr-cli"
alias k="kubectl"
	complete -F __start_kubectl k
alias kr="kubectl api-resources | less"
alias ki="kubectl cluster-info"
alias kc="kubectl config view"
alias kw="kubectl get service"
alias d="docker"
	complete -F __start_docker d
alias di="docker images -a"
alias dps="docker ps -a -n9 --format 'table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Size}}\t{{.Ports}}'"
alias dm="docker-machine"
alias dc="docker-compose"
	complete -F __start_docker-compose dc
alias dce="docker-compose exec app /bin/bash"
alias ad="az devops"

alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

la () { ls -al;}
lf () { ls -al | grep '^-'; }
ld () { ls -ad */; }
mkc () { mkdir -p "$1" && cd "$1"; }
del () { command mv "$@" ~/.Trash; }
cdl () { cd $1 && ls -al | more ; }
vif () { vim $(ls | fzf); }


