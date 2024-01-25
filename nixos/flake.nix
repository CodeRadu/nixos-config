{
  description = "Radu's nixos flake configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
  };
  outputs = inputs@{self, nixpkgs, home-manager, grub2-themes, ...}: {
    nixosModules = {
      users-radu = ./users/radu;
    };
    nixosConfigurations = {
      radu-pc = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = with self.nixosModules; [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
          users-radu
          grub2-themes.nixosModules.default
        ];
      };
    };
  };
}
