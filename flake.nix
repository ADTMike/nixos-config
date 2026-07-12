{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.master = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/master/configuration.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.config = {
            allowUnfree = true;
            android_sdk.accept_license = true;
          };
        }
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.default = import ./home/default/home.nix;
        }
      ];
    };
  };
}
