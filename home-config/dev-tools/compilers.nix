{ config, pkgs, ... }:
{

  home.packages = with pkgs;[
    nodejs_24
    gcc
  ];
  
  programs = {
    go.enable = true;
  };
}
