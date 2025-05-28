# load aliases table
zmodload -F zsh/parameter p:aliases

export NODE_COMPILE_CACHE=.cache/nodejs-compile-cache
export K9S_CONFIG_DIR=~/.config/k9s # TODO: forgot to move k9s to dotfiles

# TODO: npm topic
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"


# TODO: figure out how to have seperate dotfiles for SAP
# Source SAP zshrc
if [ -e ~/.zshrc_sap ]
then
    echo "Sourcing SAP zshrc..."
    source ~/.zshrc_sap
fi

# TODO: move to python topic
eval "$(pyenv init --path)"