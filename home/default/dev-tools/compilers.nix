{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    nodejs_24
    gcc
    python3
    cmake
    gnumake
    llvm
  ];
  
  programs = {
    go.enable = true;
  };
}
