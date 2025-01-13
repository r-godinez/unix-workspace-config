#!/bin/bash

# Function to print messages in green
print_success() {
  echo -e "\033[0;32m$1\033[0m"
}

# Function to print messages in red
print_error() {
  echo -e "\033[0;31m$1\033[0m"
}

# Check for Homebrew and install if not present
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ $? -eq 0 ]; then
    print_success "Homebrew installed successfully."
  else
    print_error "Failed to install Homebrew. Exiting."
    exit 1
  fi
else
  print_success "Homebrew is already installed."
fi

# Update Homebrew
print_success "Updating Homebrew..."
brew update
brew upgrade

# Define the list of apps to install
casks_apps=(
  "alfred"
  "adobe-creative-cloud"
  "balenaetcher"
  "bitwarden"
  "ccleaner"
  "discord"
  "docker"
  "firefox"
  "firefox@developer-edition"
  "google-chrome"
  "google-chrome@dev"
  "google-drive"
  "iterm2"
  "keka"
  "malwarebytes"
  "microsoft-auto-update"
  "microsoft-office"
  "microsoft-teams"
  "notion"
  "powershell"
  "raspberry-pi-imager"
  "spotify"
  "todoist"
  "virtualbox"
  "visual-studio-code"
  "vmware-fusion"
  "zoom"
)

apps=(
  "cmake"
  "docker"
  "docker-completion"
)

# Install apps
print_success "Installing casks apps..."
for casks_apps in "${casks_apps[@]}"; do
  if brew list --cask "$casks_apps" &>/dev/null; then
    print_success "$casks_apps is already installed."
  else
    brew install --cask "$casks_apps"
    if [ $? -eq 0 ]; then
      print_success "$casks_apps installed successfully."
    else
      print_error "Failed to install $casks_apps."
    fi
  fi
done

# Install software for apps
print_success "Installing apps..."
for app in "${apps[@]}"; do
  if brew list --cask "$app" &>/dev/null; then
    print_success "$app is already installed."
  else
    brew install --cask "$app"
    if [ $? -eq 0 ]; then
      print_success "$app installed successfully."
    else
      print_error "Failed to install $app."
    fi
  fi
done

# Update apps and software
print_success "Updating Homebrew..."
brew update
brew upgrade

# Cleanup unused Homebrew files
print_success "Cleaning up..."
brew cleanup

# Final message
print_success "Setup completed. Your macOS environment is ready!"

# Configure settings

# Set appearance to Dark
defaults write -g AppleInterfaceStyle -string "Dark"

# Restarts Dock appearance
killall Dock