{
  description = "the.files dotfiles flake";

  outputs = { ... }: {
    homeModules = {
      default = { ... }: {
        home.file = {
          ".zshrc".source = ./.zshrc;
          ".ssh/config".source = ./.ssh/config;
          ".config/niri".source = ./.config/niri;
          ".config/zsh".source = ./.config/zsh;
          ".config/starship.toml".source = ./.config/starship.toml;
        };
      };
    };
  };
}
