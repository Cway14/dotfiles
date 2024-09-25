#! /bin/bash

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1

# install scripts
./brew.sh
./symlinks.sh
