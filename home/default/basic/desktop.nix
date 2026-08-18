{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    qalculate-gtk
    celluloid
    imv
    thunar
    libreoffice
  ];
}
