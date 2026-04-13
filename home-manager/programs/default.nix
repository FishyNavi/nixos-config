{pkgs, ... }: {
  imports = [
      ./common.nix
      ./xdg.nix
      ./nc.nix
      ./gtk.nix
      ./waybar.nix
      ./hypridle.nix
      ./hyprlock.nix
      ./hyprpaper.nix
      # ./conky.nix # fk conky 
      ./wluma.nix
      ./swayosd.nix
      ./fastfetch.nix
    ];
}