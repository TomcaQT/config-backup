#!/bin/bash

# Check if correct number of parameters is provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <action> <config>"
    echo "Actions: pull, cp"
    echo "Configs: nvim, tmux, zsh, all"
    exit 1
fi

# Store the parameters
action=$1
config=$2

# Define source repository and local directories
REPO_URL="your-git-repo-url"  # Replace with your config repo URL
CONFIG_DIR="$HOME/.config"

# Function to pull Neovim config
pull_nvim() {
    echo "Pulling Neovim config to local folder..."
    rm -rf "nvim"
    # Add your pull commands here
    # For example: git clone or rsync from your repo
    cp -R "$CONFIG_DIR/nvim/" "nvim/"
}

# Function "to pull Tmux config
pull_tmux() {
    echo "Pulling Tmux config to local folder..."
    rm -rf "tmux"
    mkdir "tmux"
    # Pull .tmux.conf and any other tmux files
    cp "$CONFIG_DIR/tmux/tmux.conf" "tmux/tmux.conf"
}

# Function to copy Neovim config
copy_nvim() {
    echo "Copying Neovim config to system..."
    mkdir -p "$CONFIG_DIR/nvim"
    cp -r "nvim/"* "$CONFIG_DIR/nvim/"
}

# Function to copy Tmux config
copy_tmux() {
    echo "Copying Tmux config to system..."
    mkdir -p "$CONFIG_DIR/tmux"
    cp "tmux/.tmux.conf" "$CONFIG_DIR/tmux/.tmux.conf"
}

setup_git_aliases() {
    echo "Setting up git aliases..."
    # Common git aliases
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status
    git config --global alias.unstage 'reset HEAD --'
    git config --global alias.last 'log -1 HEAD'
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --gloval alias ll "log --oneline"    
    echo "Git aliases have been set up successfully!"
}

# Main logic
case $action in
    "pull")
        case $config in
            "nvim")
                pull_nvim
                ;;
            "tmux")
                pull_tmux
                ;;
            "all")
                pull_nvim
                pull_tmux
                ;;
            *)
                echo "Invalid config. Valid options are: nvim, tmux, all"
                exit 1
                ;;
        esac
        ;;
    "install")
        case $config in
            "nvim")
                copy_nvim
                ;;
            "tmux")
                copy_tmux
                ;;
            "git")
                setup_git_aliases
                ;;
            "all")
                copy_nvim
                copy_tmux
                setup_git_aliases
                ;;
            *)
                echo "Invalid config. Valid options are: nvim, tmux, git, all"
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Invalid action. Valid actions are: pull, install"
        exit 1
        ;;
esac
