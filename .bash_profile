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

# CONFIG FOR DOTFILES 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Completion
#npm completion

# Aliases
alias clist='cd ~/Desktop/_sync/lists && ls'
alias cide='cd ~/Desktop/_sync/ideas && ls'
alias cwrite='cd ~/Desktop/_sync/write && ls'
alias clearn='cd ~/Desktop/_sync/learn && ls'
alias clearndev='cd ~/Desktop/_sync/learn/dev && ls'
alias cfam='cd ~/Desktop/_sync/fam && ls'
alias cnotes='cd ~/Desktop/_sync/notes && ls'
alias cdevtest='cd ~/devtest && ls'
alias cdevapp='cd ~/devapp && ls'
alias cdev='cd ~/Desktop/dev'
 
alias vvimrc='vim ~/.vimrc'
alias vbash_profile='vim ~/.bash_profile'
alias vvsc='vim ~/Library/Application\ Support/Code/User/settings.json'
alias vtodo='vim ~/Desktop/_sync/notes/TODO'
alias vtolearn='vim ~/Desktop/_sync/notes/TOLEARN'
alias vbacklog='vim ~/Desktop/_sync/notes/BACKLOG'
alias vgoals='vim ~/Desktop/_sync/notes/GOALS'
alias vstatus='vim ~/Desktop/_sync/notes/STATUS'
alias vhabits='vim ~/Desktop/_sync/notes/HABITS'
alias vnote="vim ~/Desktop/_sync/notes/NOTE"

alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
lsf () { ls -al | grep '^-'; }
lsd () { ls -d */; }
mkc () { mkdir -p "$1" && cd "$1"; }
del () { command mv "$@" ~/.Trash; }
cdl () { cd $1 && ls -al | more ; }
vif () { vim $(ls | fzf); }

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


export CDPATH=".:~:~/Desktop:~/Desktop/dev:~/Desktop/_sync/"
export PATH="/usr/local/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/f/.fzf/bin:/Users/f/Library/Python/3.7/bin:/Users/f/.vimpkg/bin:/Users/f/Desktop/dev/shell:/Users/f/Desktop/_sync/learn/dev/"

# Pyenv
 if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
 fi
