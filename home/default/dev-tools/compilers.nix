{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    nodejs_24
    gcc
    python3
  ];
  
  programs = {
    go.enable = true;
  };
}
