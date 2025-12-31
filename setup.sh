#!/bin/bash
OS="$(uname -s)"

if [ "$OS" == "Darwin" ]; then
    echo "macOS detected. Installing dependencies via Homebrew..."
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Please install Homebrew first."
        exit 1
    fi
    brew install kube-ps1 zsh-autosuggestions zsh-syntax-highlighting gemini-cli
elif [ "$OS" == "Linux" ]; then
    echo "Linux detected. Installing dependencies via apt..."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y zsh
    else
        echo "apt not found. Please install zsh manually."
    fi
    # Clone plugins manually for Linux if they don't exist
    ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
    
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        echo "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        echo "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi

    if [ ! -d "$HOME/kube-ps1" ]; then
        echo "Installing kube-ps1..."
        git clone https://github.com/jonmosco/kube-ps1.git "$HOME/kube-ps1"
    fi
    
    echo "Note: gemini-cli needs to be installed manually on Linux."
fi

# Install Oh My Zsh if missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Setup Gemini CLI
echo "Setting up Gemini CLI..."
mkdir -p "$HOME/.gemini"
# Check if we are in the dotfiles repo or if the file exists in HOME
if [ -f "gemini-settings.json" ]; then
    ln -sf "$(pwd)/gemini-settings.json" "$HOME/.gemini/settings.json"
elif [ -f "$HOME/gemini-settings.json" ]; then
     ln -sf "$HOME/gemini-settings.json" "$HOME/.gemini/settings.json"
fi
