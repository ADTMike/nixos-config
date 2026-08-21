{ config, pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./desktop.nix
    ./browser.nix
    ./common.nix
    ./fileman.nix
  ];
}
