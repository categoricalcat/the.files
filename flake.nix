{
  description = "the.files dotfiles flake";

  outputs =
    { ... }:
    {
      homeModules = {
        default =
          { lib, ... }:
          {
            home.file = {
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
                force = true;
              };
              ".scm_breeze" = {
                source = ./scm_breeze;
                force = true;
              };
            };

            home.activation.realizeSshConfig = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
              run install -d -m 0700 "$HOME/.ssh"
              if [ -L "$HOME/.ssh/config" ]; then
                src="$(readlink -f "$HOME/.ssh/config")"
                run rm -f "$HOME/.ssh/config"
                run install -m 0600 "$src" "$HOME/.ssh/config"
              fi
            '';
          };
      };
    };
}
