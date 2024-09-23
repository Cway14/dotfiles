# setup directories
mkdir ~/.config

# install software based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running mac install script..."
    ./mac/install.sh

# install ohmyzsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

./nvim.sh
./symlinks.sh