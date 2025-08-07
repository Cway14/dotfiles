mv $XDG_CONFIG_HOME/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

ln -sF $ZSH/nvim $XDG_CONFIG_HOME/nvim
