{pkgs, ... }: {
  imports = [
      ./common.nix
      ./xdg.nix
      ./nc.nix
    ];
}