{ pkgs, ... }:
let
  gruvbox-dark = pkgs.stdenv.mkDerivation {
    pname = "yazi-flavor-gruvbox";
    version = "24.4.25";
    src = pkgs.fetchFromGitHub {
      owner = "bennyyip";
      repo = "gruvbox-dark.yazi";
      rev = "91fdfa70f6d593934e62aba1e449f4ec3d3ccc90";
      hash = "sha256-RWqyAdETD/EkDVGcnBPiMcw1mSd78Aayky9yoxSsry4=";
    };
    installPhase = ''
      mkdir -p $out
      cp -r $src/* $out/
    '';
  };

  full-border = pkgs.stdenv.mkDerivation {
    pname = "yazi-plugin-full-border";
    version = "1.0.0";
    src = pkgs.fetchFromGitHub {
      owner = "yazi-rs";
      repo = "plugins";
      rev = "55bf6996ada3df4cbad331ce3be0c1090769fc7c";
      hash = "sha256-v/C+ZBrF1ghDt1SXpZcDELmHMVAqfr44iWxzUWynyRk=";
    };
    installPhase = ''
      mkdir -p $out
      cp -r $src/full-border.yazi/* $out/
    '';
  };
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    flavors = {
      gruvbox-dark = gruvbox-dark;
    };

    plugins = {
      full-border = full-border;
    };

    theme = {
      flavor.dark = "gruvbox-dark";
    };

    settings.mgr = {
      sort_by = "natural";
      sort_dir_first = true;
    };

    initLua = ''
      require("full-border"):setup {
        type = ui.Border.ROUNDED,
      }
    '';
  };
}
