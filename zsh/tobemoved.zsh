# load aliases table
zmodload -F zsh/parameter p:aliases

alias dots='~/.dotfiles'
alias config='$XDG_CONFIG_HOME'

alias brewup='echo "Updating Brewfile..." && brew bundle dump --force --describe --file=$HOME/.dotfiles/Brewfile'

export PATH=$PATH:~/.dotfiles/scripts

export EDITOR=nvim
export VISUAL="$EDITOR"

export XDG_CONFIG_HOME=$HOME/.config
export NODE_COMPILE_CACHE=.cache/nodejs-compile-cache
export K9S_CONFIG_DIR=$XDG_CONFIG_HOME/k9s

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"


# Source SAP zshrc
if [ -e ~/.zshrc_sap ]
then
    echo "Sourcing SAP zshrc..."
    source ~/.zshrc_sap
fi

# TODO: move to /functions

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

fv() {
  fzf | xargs nvim
}

eval "$(pyenv init --path)"
