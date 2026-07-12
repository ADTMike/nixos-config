{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    nodejs_24
    gcc
    python3
    nodePackages.corepack
  ];
  
  programs = {
    go.enable = true;
  };
}
