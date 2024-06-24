#!/bin/bash

# Function to install Homebrew if it is not installed
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    echo "Adding Homebrew to PATH..."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Homebrew is already installed."
  fi
}

# Function to install necessary packages
install_packages() {
  echo "Installing necessary packages..."
  brew install cmake protobuf rust python@3.10 git wget
}

# Function to clone the web UI repository
clone_repository() {
  echo "Cloning the stable-diffusion-webui repository to the Desktop..."
  cd ~/Desktop || exit
  git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
}

# Function to run the web UI
run_webui() {
  echo "Running the web UI..."
  cd ~/Desktop/stable-diffusion-webui || exit
  ./webui.sh
}

# Main script execution
install_homebrew
install_packages
clone_repository
run_webui

echo "Installation and setup complete. To relaunch the web UI process later, run './webui.sh' in the 'stable-diffusion-webui' directory on your Desktop."
echo "Note: To update the web UI, run 'git pull' before running './webui.sh'."
