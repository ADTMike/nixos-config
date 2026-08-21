{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tcpdump
    nmap
  ];
}
