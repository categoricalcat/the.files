# the.files - Personal Dotfiles Repository

## 🏗️ Overview

This repository contains my personal dotfiles and configuration files for various tools and applications. It uses [GNU Stow](https://www.gnu.org/software/stow/) for easy management and deployment of configuration files to their proper locations in the home directory.

## 📁 Structure

```
the.files/
├── .zshrc              # Zsh shell configuration
├── .config/
│   └── starship.toml   # Starship prompt configuration
├── .ssh/               
│   └── config          # SSH client configuration
└── README.md           # This file
```

## 🚀 Quick Start

### Prerequisites

- **GNU Stow** - For managing symlinks
- **Zsh** - Z shell
- **Starship** - Cross-shell prompt
- **fastfetch** - System information tool (optional, for SSH greeting)

### Installation

1. Clone this repository to your home directory:
```bash
cd ~
git clone <repository-url> the.files
```

2. Use Stow to create symlinks:
```bash
cd ~/the.files
stow -v -R -t ~ .
```

The `-R` flag will restow (first unstow, then stow again), which is useful for updates.

## 🛠️ Configurations Included

### Zsh Configuration (`.zshrc`)

A lightweight Zsh configuration featuring:
- **Auto-stow on startup** - Automatically updates symlinks when opening a new shell
- **Welcome message** - Shows "福福的zsh配置" with user info on startup
- **Git aliases** - Common shortcuts like `ga`, `gc`, `gst`, etc.
- **Docker aliases** - Quick Docker commands
- **Smart directory navigation** - Auto-cd, directory stack management
- **History optimization** - 10k history with deduplication and sharing between sessions
- **Warp terminal support** - Special integration for Warp terminal
- **SSH greeting** - Shows system info via fastfetch when connecting via SSH
- **Auto-completion** - Enhanced completion with interactive menu

Key features:
- Automatic dotfiles synchronization on shell startup
- Extensive Git workflow aliases
- Docker and Docker Compose shortcuts
- Smart history management with duplicate prevention
- Enhanced completion system

### Starship Prompt (`.config/starship.toml`)

A colorful, powerline-style prompt configuration showing:
- Current directory
- Git branch and status
- Programming language versions
- Docker context
- Time
- And more in a beautiful gradient theme

### SSH Configuration (`.ssh/config`)

SSH client configuration file for managing SSH connections and settings.

## 📝 Usage

### Manual Stow Commands

```bash
# Stow all configurations
cd ~/the.files && stow -v .

# Stow specific configuration
cd ~/the.files && stow -v -t ~ .zshrc

# Unstow (remove symlinks)
cd ~/the.files && stow -v -D .

# Restow (update symlinks)
cd ~/the.files && stow -v -R .
```

### Automatic Updates

The `.zshrc` file includes automatic stowing on shell startup, so any changes to the dotfiles will be applied when you open a new terminal. You'll see the "Stowing files..." message each time a new shell starts.

## 🔧 Customization

Feel free to modify any configuration files to suit your needs. After making changes:

1. The changes will be automatically applied on next shell startup (due to auto-stow)
2. Or manually run `stow -v -R .` in the `~/the.files` directory

## 📄 License

These are personal configuration files. Feel free to use them as inspiration for your own setup!

---

<p align="center">
  <em>Happy configuring! 🎉</em>
</p> 