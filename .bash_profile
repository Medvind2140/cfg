# START WITH TMUX AT BASH STARTUP
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
	exec tmux
  # exec zsh
fi

# INIT FZF SETTINGS
# NOTE! If keybinding CTRL+T does not work -> run $ set -o vi 
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# INIT SEPARATE .BASH_ALIASES
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# INIT .PROFILE
if [ -f ~/.profile ]; then
  . ~/.profile
fi

# PREVENT COMMAND LOGGING IN FILE
unset HISTFILE

# PREVENT FILE-OVERWRITES WITH APPEND
set -o noclobber

# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

## PYENV
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#	eval "$(pyenv init -)"
#fi

## GIT COMPLETION
# source ~/.git-completion.bash

# INIT COMPLETION
if [ -f $(brew --prefix)/etc/bash_completion.d ]; then
	. $(brew --prefix)/etc/bash_completion.d
fi
 # [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# PATHS
# export CDPATH=".:~:~/Desktop:~/Desktop/dev:~/Desktop/_sync/"
export PATH="/usr/local/bin:/usr/local/:/bin:/usr/bin:/usr/sbin:/sbin:/Users/f/.fzf/bin:/Users/f/Library/Python/3.7/bin:/usr/local/lib/node_modules"


source /Users/f/.config/broot/launcher/bash/br
