### the.files

- Purpose: personal, portable setup for macOS/NixOS (Zsh + Starship, Emacs, NixOS configs, Minecraft tools).

### Contents

- Zsh: `.config/zsh/` (aliases, keybindings, completion, fzf/zoxide, env); entry `~/.zshrc`.
- Starship: `.config/starship.toml` (segmented prompt: Git, runtimes, Docker, time).
- Emacs: `.emacs.d/` (Prelude-based; Catppuccin theme; Treemacs; TRAMP/server helpers).
- NixOS: `nixos/` (flake; modular services, networking, users).
- Minecraft: `mc-fufuland/` (TS scripts, Dockerfiles, compose; Modrinth workflows).
- Scripts: `usb-ssh.sh`, `query.sh`, helpers referenced by shell aliases.

### Setup (declare and link)

- Fonts: install a Nerd Font (uses “Maple Mono NF CN”).
- macOS packages: `zsh`, `starship`, `fzf`, `zoxide`, `fd`, `git`, `node` (or `fnm`/`nvm`), optional `pnpm`.
- Link config files/dirs:
  - `~/.zshrc` ← repo `.zshrc`
  - `~/.config/zsh/` ← repo `.config/zsh/`
  - `~/.config/starship.toml` ← repo `.config/starship.toml`
- Shell usage: restart; common aliases `g`, `ll`, `ffsh`, `nix-switch`, `gen-commit`.

### Emacs (declare expectations)

- Version: Emacs ≥ 29 (local 30.1).
- Bootstrap: first run fetches Prelude submodule (or run `~/.emacs.d/install-prelude.sh`).
- Reload: `C-c r` (reloads `~/.emacs.d/init.el`).
- UI: Catppuccin (GUI), Treemacs on frame, line numbers/time enabled.
- Remote: `~/.emacs.d/connect-remote-emacs.sh` sets SSH tunnel and connects client.

### NixOS (flake)

- Root: `nixos/`.
- Rebuild (see `nix-switch`): `sudo nixos-rebuild --flake "$HOME/nixos#<hostname>" --upgrade switch`.

### Minecraft (mc-fufuland)

- Node/TS tools for Modrinth; server build assets.
- Check: `mc-fufuland/compose.yaml`, `mc-fufuland/scripts/*`.

### Notable paths

- `.config/zsh/aliases.zsh` (Git/Podman/NixOS aliases)
- `.config/zsh/fzf-zoxide.zsh` (fzf defaults, zoxide init)
- `.config/zsh/environment.zsh` (PATH additions)
- `.emacs.d/init.el` (entry; Prelude, personal lisp, theme, Treemacs, server/TRAMP)
- `.emacs.d/scripts/symlinks.sh` (reads `symlinks.csv` to link dotfiles)
- `usb-ssh.sh` (USB networking + SSH helper)

### Conventions

- `$HOME` must be correct. Scripts are POSIX shell or Zsh. Nerd Font recommended.

### License and links

- License: see `LICENSE`.
- Upstream: `Prelude` (github.com/bbatsov/prelude), `Starship` (starship.rs), `Modrinth` (modrinth.com).


