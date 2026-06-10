{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland.url = "github:hyprwm/Hyprland";
    
#    hyprland-plugins = {
#      url = "github:hyprwm/hyprland-plugins";
#      inputs.hyprland.follows = "hyprland";
#    };
  };

  outputs = { self, nixpkgs, home-manager,catppuccin, ... }@inputs: {
      nixosConfigurations.amethyst = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; 
        specialArgs = { inherit inputs;}; 
        modules = [
          ./hosts/amethyst
          home-manager.nixosModules.home-manager
          ./home-manager
          
        ];
      };
    };
}
