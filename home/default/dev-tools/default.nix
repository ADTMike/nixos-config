{ config, pkgs, ...}:

{
  imports = [
    ./ides.nix
    ./compilers.nix
    ./containers.nix
    ./ai.nix
  ];
}
