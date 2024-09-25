#! /bin/bash

# Symlinks
rm ~/.zshrc
rm ~/.config
rm ~/.config
rm ~/.config/alacritty/alacritty.toml

ln -s $PWD/../.zshrc ~/.zshrc
ln -s $PWD/../nvim ~/.config
ln -s $PWD/../karabiner ~/.config
ln -s $PWD/../.alacritty.toml ~/.config/alacritty/alacritty.toml
