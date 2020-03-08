# START BASH IN TMUX
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
fi

# INIT FZF SETTINGS
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# INIT SEPARATE .BASH_ALIASES
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# VIM KEYS IN TERMINAL
# set -o vi
                                        
# PREVENT COMMAND LOGGING IN FILE
unset HISTFILE

# PREVENT FILE-OVERWRITES WITH APPEND
set -o noclobber

# SSH-AGENT
{ eval `ssh-agent`; ssh-add -A; } &>/dev/null

# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# INIT PYENV
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

# INIT COMPLETION
if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
	. $(brew --prefix)/etc/bash_completion.d
fi
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# bash-completion (bash v3.2.57)
# export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

# bash-completion (bash v5.x)
#[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
#source <(kubectl completion bash)

# PATHS
# export CDPATH=".:~:~/Desktop:~/Desktop/dev:~/Desktop/_sync/"
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

# FUZZY RIPGREP, ANYFILE, FILE OR FILE > CONTENT, OPEN IN VIM
rgl () {
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

# FUZZY RIPGREP, CONTENT IN ANYFILE, OPEN IN VIM
rgs () {
	cd ~/Desktop/_sync/
  local file
  local line
  read -r file line <<<"$(rg --smart-case --vimgrep $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"
  if [[ -n $file ]]
  then
     nvim $file +"$line|norm! zv zz"
  fi
	cd -
}

# VIFM EXIT TO ORIGIN FOLDER
vifmVisit() {
	local dst="$(command vifm --choose-dir - "$@")"
	if [ -z "$dst" ]; then
		echo 'Directory picking cancelled/failed'
		return 1
	fi
}

# VIFM EXIT TO DEST FOLDER
vifmDest() {
	local dst="$(command vifm --choose-dir - "$@")"
	if [ -z "$dst" ]; then
		echo 'Directory picking cancelled/failed'
		return 1
	fi
	cd "$dst"
}
