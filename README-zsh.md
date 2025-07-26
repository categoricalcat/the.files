# Zsh Configuration for NixOS

This `.zshrc` is designed to work with NixOS where all dependencies are managed declaratively through the system configuration.

## Prerequisites

The following packages must be installed via NixOS configuration:
- `zsh`
- `oh-my-zsh`
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`
- `zsh-history-substring-search`
- `spaceship-prompt` (theme)
- `fastfetch` (for SSH greeting)
- `direnv` (for per-directory environments)

## Features

### Core Features
- **Oh My Zsh** with plugins:
  - `docker` - Docker command completions and aliases
  - `git` - Git aliases and functions  
  - `sudo` - Press ESC twice to add sudo to current command
  - `zsh-autosuggestions` - Fish-like autosuggestions
  - `zsh-syntax-highlighting` - Syntax highlighting as you type
  - `history-substring-search` - Search history with partial matches
- **Spaceship theme** - Modern, informative prompt
- **Fastfetch on SSH** - Shows system info when connecting via SSH
- **direnv** - Automatic environment switching per directory

### Additional Features
- **Stow integration** - Automatically stows dotfiles on shell startup
- **Warp terminal support** - Special features for Warp terminal
- **History optimization** - 10k history with deduplication
- **Smart directory navigation** - Auto-cd, pushd stack
- **NPM global packages** - User-level npm installations
- **Custom aliases** - Common shortcuts

## Key Bindings

- `Ctrl+Space` - Accept autosuggestion
- `Ctrl+]` - Accept and execute autosuggestion
- `↑`/`↓` - Search history with substring matching
- `Ctrl+P`/`Ctrl+N` - Alternative history search
- `ESC ESC` - Prepend sudo to current command (via sudo plugin)

## Configuration

All dependencies are managed through NixOS. No manual installation is required.

To use this configuration:
1. Ensure the required packages are in your NixOS configuration
2. Place this file at `~/.zshrc` (handled by GNU Stow)
3. Start a new shell session

## Customization

- **Theme**: Change `ZSH_THEME` variable in the file
- **Plugins**: Modify the `plugins=()` array
- **Editor**: Change `EDITOR` variable (default: "emacs")
- **Aliases**: Add custom aliases at the bottom of the file 