# Mac specific symlinks
rm ~/Library/Application\ Support/Code/User/keybindings.json
rm ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/lazygit/config.yml

ln -s $PWD/../../vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s $PWD/../../vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $PWD/../../.lazygit_config.yml ~/Library/Application\ Support/lazygit/config.yml