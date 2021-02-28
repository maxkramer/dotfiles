#!/bin/zsh

echo Installing homebrew
$(which ruby) -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Verifying Homebrew install'
brew doctor

echo 'Installing Homebrew bundler'
brew tap Homebrew/bundle

echo 'Installing Homebrew bundled dependencies'
brew bundle --file=$HOME/.dotfiles/Brewfile

echo 'Cleaning up homebrew cache...'
brew cleanup > /dev/null 2>&1

echo 'Would you like to set Google Chrome to be your default browser?'
open -a 'Google Chrome' --args --make-default-browser

echo 'Setting iTerm preferences folder'
/usr/libexec/PlistBuddy -c "Add PrefsCustomFolder $HOME.dotfiles/iterm" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Add LoadPrefsFromCustomFolder true" ~/Library/Preferences/com.googlecode.iterm2.plist
