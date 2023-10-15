#! /bin/bash

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# TODO: source lua/packer.lua and run packersync
echo "Run :so on lua/packer.lua and :PackerSync in nvim to install plugins"
# For now, run this manually:
    # - Open nvim
    # - :so ~/.config/nvim/lua/packer.lua
    # - :PackerSync
    # restart nvim
# nvim --headless -c 'so ~/.config/nvim/lua/packer.lua' -c 'PackerSync'