#! /bin/bash

# if homebrew not installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

else
    echo "Homebrew already installed. Skipping..."
    exit
fi

# install brew packages
brew bundle install --file ./Brewfile

