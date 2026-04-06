{pkgs, ... }: {
  imports = [
      ./rofi.nix
      ./powermenu.nix

    ];
  xdg.configFile."rofi/powermenu.rasi".source = ./powermenu.rasi;
}