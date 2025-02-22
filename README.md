# Configuration Management Script

This script helps manage configuration files for Neovim, Tmux, and Zsh, as well as setting up Git aliases. It provides functionality to pull configs from system locations to a local directory and copy them back.

## Installation

1. Clone this repository:
```bash
git clone git@github.com:TomcaQT/config-backup.git
cd config-backup
```

2. Make the script executable:
```bash
chmod +x config
```

## Usage

The script follows this syntax:
```bash
./config <action> <config>
```

### Available Actions

- `pull`: Pull configurations from system locations to local folders
- `install`: Copy configurations from local folders to system locations
- `git-alias`: Set up Git aliases

### Available Configs

- `nvim`: Neovim configuration
- `tmux`: Tmux configuration
- `all`: All configurations

### Examples

1. Pull configurations from system to local folders:
```bash
./config pull nvim    # Pull Neovim config
./config pull tmux    # Pull Tmux config
./config pull all     # Pull all configs
```

2. Copy configurations from local folders to system:
```bash
./config install nvim      # Copy Neovim config
./config install tmux      # Copy Tmux config
./config install all       # Copy all configs
```

3. Set up Git aliases:
```bash
./config git-alias
```

## Directory Structure

The script expects the following directory structure:
```
.
├── config (script)
├── nvim/
├── tmux/
└── zsh/
```

## Git Aliases

The script sets up the following Git aliases:
- `git co`: checkout
- `git br`: branch
- `git ci`: commit
- `git st`: status
- `git unstage`: reset HEAD --
- `git last`: Show last commit
- `git lg`: Pretty log with graph
- `git ca`: Commit amend
- `git dc`: Show cached diff

## File Locations

- Neovim config: `~/.config/nvim/`
- Tmux config: `~/.config/.tmux.conf`

## Note

Make sure to back up your existing configurations before using the copy (`cp`) action, as it will overwrite existing files.

