# setup directories
mkdir ~/.config
mkdir ~/.nvm
mkdir ~/.kube

# install software based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running mac install script..."
    ./mac/install.sh

# install ohmyzsh
export TMP_DOTFILES_SCRIPTS_DIR=$PWD
cd ~
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cd $TMP_DOTFILES_SCRIPTS_DIR
./nvim.sh
./symlinks.sh

crontab ./cron/cron.txt
