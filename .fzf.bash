# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi
# OPTIONS
export FZF_DEFAULT_OPTS='--inline-info --height 40% --layout=reverse --border'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_DEFAULT_COMMAND='rg --files'

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi
  -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty
  --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

