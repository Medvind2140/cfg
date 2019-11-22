[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Allow piping GPG
GPG_TTY=$(tty)
export GPG_TTY

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/f/Desktop/dev/serverless-app/node_modules/tabtab/.completions/serverless.bash ] && . /Users/f/Desktop/dev/serverless-app/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/f/Desktop/dev/serverless-app/node_modules/tabtab/.completions/sls.bash ] && . /Users/f/Desktop/dev/serverless-app/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/f/Desktop/dev/serverless-app/node_modules/tabtab/.completions/slss.bash ] && . /Users/f/Desktop/dev/serverless-app/node_modules/tabtab/.completions/slss.bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias config='/usr/bin/git --git-dir=/Users/f/.cfg --work-tree=/Users/f'
