{
  description = "the.files dotfiles flake";

  outputs =
    { ... }:
    {
      homeModules = {
        default =
          { ... }:
          {
            home.file = {
              ".zshrc" = {
                source = ./.zshrc;
                force = true;
              };
              ".ssh/config" = {
                source = ./.ssh/config;
                force = true;
              };
              ".config/starship.toml" = {
                source = ./.config/starship.toml;
                force = true;
              };
              ".config/niri" = {
                source = ./.config/niri;
                recursive = true;
                force = true;
              };
              ".config/zsh" = {
                source = ./.config/zsh;
                recursive = true;
                force = true;
              };
            };
          };
      };
    };
}
