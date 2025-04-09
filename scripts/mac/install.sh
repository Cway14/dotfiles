#! /bin/bash

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
defaults write -g NSWindowShouldDragOnGesture -bool true

sudo pmset repeat shutdown MTWRF 3:00:00

# install scripts
./brew.sh
./symlinks.sh
