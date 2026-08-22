{ config, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings.mgr = {
      sort_by = "natural";
      sort_dir_first = true;
    };
  };

  xdg.configFile."yazi/theme.toml".text = ''
    [flavor]
    dark = "gruvbox-dark"
  '';

  xdg.configFile."yazi/flavors/gruvbox-dark.yazi".source = ./tmp/gruvbox-dark.yazi;
}
