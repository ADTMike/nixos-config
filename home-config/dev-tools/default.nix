{ config, pkgs, ...}:

{
  imports = [
    ./ides.nix
    ./compilers.nix
    ./frameworks.nix
  ];
}
