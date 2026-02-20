{ config, pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./desktop.nix
    ./browser.nix
  ];
}
