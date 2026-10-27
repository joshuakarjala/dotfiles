#!/bin/sh
# only if running osx
if test "$(uname -s)" != "Darwin"; then
    exit
fi

# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo 'Allow Selection in QuickLook'
defaults write com.apple.finder QLEnableTextSelection -bool true

echo 'Enable full keyboard access for all controls'
echo '(e.g. enable Tab in modal dialogs)'
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo 'Disable auto-correct'
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo 'Finder: disable window animations and Get Info animations'
defaults write com.apple.finder DisableAllAnimations -bool true

echo 'Finder: show all filename extensions'
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo 'Disable the warning when changing a file extension'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

echo 'Avoid creating .DS_Store files on network volumes'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Restarting Finder and Dock to apply the changes"
killall Finder Dock 2>/dev/null || true
