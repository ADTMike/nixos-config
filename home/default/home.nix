{ config, pkgs, ... }:
{
  home.username = "default";
  home.homeDirectory = "/home/default";
  imports = [
   ./basic/default.nix
   ./dev-tools/default.nix
   ./security/default.nix
   ./infra/default.nix
   ./desktop/default.nix
   ./common.nix
  ];
  home.stateVersion = "26.05";
}
