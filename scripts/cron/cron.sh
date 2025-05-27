#!/bin/bash

/opt/homebrew/bin/brew update
/opt/homebrew/bin/brew upgrade
/opt/homebrew/bin/brew cleanup
/opt/homebrew/bin/brew cask cleanup
/opt/homebrew/bin/brew bundle dump --global --force
