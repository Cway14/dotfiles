#!/bin/bash

brew update
brew upgrade
brew cleanup
brew cask cleanup
brew bundle dump --global --force
