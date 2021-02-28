#!/bin/zsh

echo "Disabling local Time Machine snapshots"
sudo tmutil disablelocal;

echo "Disabling hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0;

echo "Removing the sleep image file to save disk space"
sudo rm -rf /Private/var/vm/sleepimage;

echo "Creating a zero-byte file instead"
sudo touch /Private/var/vm/sleepimage;

echo "…and make sure it can’t be rewritten"
sudo chflags uchg /Private/var/vm/sleepimage;

echo "Enabling showing icons for hard drives and removable media on the desktop"

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true;

echo "Removing all (default) app icons from the Dock"
defaults write com.apple.dock persistent-apps -array ""; killall Dock;

echo "Enabling save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false;

echo "Enabling automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true;

echo "Enabling reveal IP, hostname, OS, etc. when clicking clock in login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName;

echo "Trackpad: enabling tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1;

echo "Trackpad: mapping bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true;

echo "Setup lock hot-corner for top right"
defaults write com.apple.dock wvous-tr-corner -int 10

echo "Enable requiring password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0;

echo "Enabling saving screenshots to the desktop"
SCREENSHOTS_DIR=$HOME/Desktop/screenshots
mkdir -p $SCREENSHOTS_DIR
defaults write com.apple.screencapture location -string $SCREENSHOTS_DIR;

echo "Enabling saving screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png";

echo "Disabling shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true;

echo "Enabling quitting via ⌘ + Q"
defaults write com.apple.finder QuitMenuItem -bool true;

echo "Setting the Desktop as the default location for new Finder windows"
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/";

echo "Showing all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;

echo "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false;

echo "Automatically opening a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true;

echo "Using the list view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv";

echo "Adding the Quit Finder button to the Finder menu"
defaults write com.apple.finder QuitMenuItem -bool YES

echo "Disabling the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false;

echo "Disabling Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true;

echo "Disabling showing Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true;

echo "Automatically hiding and showing the Dock"
defaults write com.apple.dock autohide -bool true;

echo "Setting the icon size of Dock items to 50 pixels"
defaults write com.apple.dock tilesize -int 50;

echo "Using plain text mode for necleanmymacw TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0;

echo "Enabling open and save files as UTF-8 in TextEdit by default"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4;

echo "Showing the battery life as a percentage"
defaults write com.apple.menuextra.battery ShowPercent -string "YES";

echo "Removing items from the dock"
defaults delete com.apple.dock persistent-apps; killall Dock

apps_to_start_at_login=("/Applications/Flux.app","/Applications/Bartender.app","/Applications/Hazel.app","/Applications/Docker.app")
for s in ${apps_to_start_at_login[*]}
do
  osascript -e 'tell application "System Events" to make login item at end with properties {path: $s, hidden:false}'
done
