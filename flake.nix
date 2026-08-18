{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  outputs = { nixpkgs, home-manager, noctalia, ... }:
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
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [ noctalia.homeModules.default ];
          home-manager.users.default = import ./home/default/home.nix;
        }
      ];
    };
  };
}
