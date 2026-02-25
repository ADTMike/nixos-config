{ config, pkgs, ... }:
{
  home.username = "default";
  home.homeDirectory = "/home/default";
  programs.home-manager.enable = true=;
  imports = [
   ./basic/default.nix
   ./dev-tools/default.nix
   ./common.nix
  ];
  home.stateVersion = "25.11";
}
