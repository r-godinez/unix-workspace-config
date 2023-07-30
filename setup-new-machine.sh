#!/bin/zsh
#https://brew.sh/
#install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#software installations
brew install docker
brew install python

#app installations
brew install --cask google-chrome
brew install --cask firefox

brew install --cask todoist
brew install --cask notion
brew install --cask alfred
brew install --cask google-drive
brew install --cask spotify
brew install --cask discord

brew install --cask ccleaner
brew install --cask malwarebytes

brew install --cask microsoft-teams
brew install --cask microsoft-office
brew install --cask adobe-creative-cloud

brew install --cask iterm2
brew install --cask powershell
brew install --cask virtualbox
brew install --cask visual-studio
brew install --cask visual-studio-code
brew install --cask raspberry-pi-imager
brew install --cask ltspice
brew install --cask keka

brew update && brew upgrade
brew cleanup
