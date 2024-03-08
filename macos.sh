#!/bin/bash

# Setting packages list
cli_pkgs=(
    "curl"
    "wget"
    "git"
    "ripgrep"
    "lazygit"
    "node"
    "npm"
    "python"
    "virtualenv"
    "tmux"
    "neovim"
)

# Cask Application list to isntall
apps=(
    "google-chrome"
    "firefox"
    "visual-studio-code"
    "spotify"
    "microsoft-edge"
    "iterm2"
    "google-drive"
    "stats"
    "docker"
    "raspberry-pi-imager"
    "whatsapp"
    "postman"
    "logi-options-plus"
    "zoom"
)
# Fonts list
fonts=(
    "font-fira-code"
    "font-fira-code-nerd-font"
)
# Installing XCode
install_xcode() {
    if ! command -v xcode-select --version &>/dev/null; then
        echo "Installing Xcode Command Line Tools before proceeding."
        xcode-select --install
        echo "Press Enter to continue...."
        read
    else
        echo "Xcode Installation Found...."
    fi
}

# Checking and installing Homebrew 
installing_homebrew() {
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Installing Homebrew."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Setting Homebrew path
        if [ -x "/opt/homebrew/bin/brew" ]; then
            # For Apple Silicon Macs
            echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
            export PATH="/opt/homebrew/bin:$PATH"
        fi
    else
        echo "Homebrew is already installed."
    fi
}

# Checking brew is now accessible
checking_brew_accessible() {
    if ! command -v brew &>/dev/null; then
        echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually."
        exit 1
    fi
}

# Update Homebrew and upgrade installed Homebrew packages
update_homebrew() {
    brew update
    brew upgrade
    brew upgrade --cask
    brew cleanup
}

# Installing formulae
install_formulae() {
    for package in "${cli_pkgs[@]}"; do
        if brew list --formula | grep -q "^$package\$";then
            echo "$package is already installed. Skipping...."
        else
            echo "Installing $package"
            brew install "$package"
        fi
    done
}

# Installing Cask
install_cask() {
    for package in "${apps[@]}"; do
        if brew list --cask | grep -q "^$package\$";then
            echo "$package is already installed. Skipping...."
        else
            echo "Installing $package"
            brew install --cask "$package"
        fi
    done
}

# Installing fonts
install_fonts() {

    brew tap homebrew/cask-fonts
    
    for package in "${fonts[@]}"; do
        if brew list --cask | grep -q "^$package\$";then
            echo "$package is already installed. Skipping...."
        else
            echo "Installing $package"
            brew install --cask "$package"
        fi
    done
}

# Setup all installed applications
final_setup () {
    echo "Setup Iterm2 Settings, you may find required file in ./iterm2ColorSchemes/"
    echo "Open iterm2 -> Settings -> Profiles..."
    echo "Press Enter to continue..."
    read

    echo "Sign in to Google Chrome. Press enter to continue..."
    read

    echo "Sign in to Spotify. Press enter to continue..."
    read

    echo "Sign in to Zoom. Press enter to continue..."
    read

    echo "Sign in to Google Drive. Press enter to continue..."
    read

    echo "Sign in to Docker. Press enter to continue..."
    read

    echo "Setup stats. Press enter to continue..."
    read
}

install_xcode
installing_homebrew
checking_brew_accessible
update_homebrew
install_formulae 
install_cask 
install_fonts 
update_homebrew
final_setup
