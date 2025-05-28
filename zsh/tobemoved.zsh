# load aliases table
zmodload -F zsh/parameter p:aliases

# Source SAP zshrc
if [ -e ~/.zshrc_sap ]
then
    echo "Sourcing SAP zshrc..."
    source ~/.zshrc_sap
fi

eval "$(pyenv init --path)"
