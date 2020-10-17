# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/f/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/f/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/f/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/f/.fzf/shell/key-bindings.bash"
