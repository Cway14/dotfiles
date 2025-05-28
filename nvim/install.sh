mv $XDG_CONFIG_HOME/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter $XDG_CONFIG_HOME/nvim
rm -rf $XDG_CONFIG_HOME/nvim/.git
