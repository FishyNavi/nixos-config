{pkgs, ... }: {
  imports = [
      ./rofi.nix
      ./powermenu.nix
      ./cliphist.nix
    ];
  xdg.configFile."rofi/powermenu.rasi".source = ./powermenu.rasi;
}