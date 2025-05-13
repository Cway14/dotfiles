touch $HOME/nextSteps
# make all scripts executable
chmod -R +x ./scripts

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing xcode tools..."
    # cant do much without these
    xcode-select --install

./scripts/install.sh

# echo remaining manual steps
echo "\nNext Steps:"
echo "Install UbuntuMono Nerd Font" > $HOME/nextSteps
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip" > $HOME/nextSteps
cat $HOME/nextSteps
rm $HOME/nextSteps
