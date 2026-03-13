{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11"; 
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland.url = "github:hyprwm/Hyprland";
    
#    hyprland-plugins = {
#      url = "github:hyprwm/hyprland-plugins";
#      inputs.hyprland.follows = "hyprland";
#    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
      nixosConfigurations.amethyst = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; 
        specialArgs = { inherit inputs; }; 
        modules = [
          ./hosts/amethyst
          home-manager.nixosModules.home-manager
          ./home-manager
        ];
      };
    };
}
