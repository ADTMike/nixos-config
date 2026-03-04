{ config, pkgs, ...}:

{
  imports = [
    ./ides.nix
    ./compilers.nix
    ./sdks.nix
  ];
}
