{pkgs, ... }: {
  imports = [
      ./common.nix
      ./xdg.nix
      ./nc.nix
      ./gtk.nix
      ./waybar.nix
    ];
}