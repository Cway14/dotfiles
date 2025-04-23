#! /bin/bash

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
defaults write -g NSWindowShouldDragOnGesture -bool true
defaults write com.apple.dock expose-group-apps -bool true # Fixes mission control with Aerospace

sudo pmset repeat shutdown MTWRF 3:00:00

# install scripts
./brew.sh
./symlinks.sh
