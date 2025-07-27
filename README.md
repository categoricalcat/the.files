# the.files

Personal dotfiles managed with GNU Stow.

## What's Here

- `.zshrc` - Zsh config with auto-stow, git aliases, docker shortcuts
- `.config/starship.toml` - Powerline-style prompt
- `.ssh/config` - SSH client settings

## Setup

```bash
cd ~
git clone [repo-url] the.files
cd the.files
stow -v -R -t ~ .
```

Done. Open a new shell.

## Features

**Auto-stow**: Configs update automatically on shell startup.

**Zsh goodies**:
- Git aliases: `ga` (add), `gc` (commit), `gst` (status), etc.
- Docker shortcuts: `dps`, `dex`, `dlog`
- Smart history with deduplication
- SSH greeting via fastfetch
- Directory stack navigation

**Starship prompt**: Shows git status, language versions, docker context.

## Manual Stow

```bash
# Update all symlinks
cd ~/the.files && stow -v -R .

# Remove symlinks
cd ~/the.files && stow -v -D .

# Stow specific file
cd ~/the.files && stow -v -t ~ .zshrc
```

## Dependencies

- GNU Stow
- Zsh
- Starship
- fastfetch (optional) 