{pkgs, ...}:
{

  programs.hyprland.enable = true; 

  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    hyprpicker
    hyprpaper
    hyprshade
    pamixer
    wl-clipboard
    libnotify
    sysstat
    cliphist
    kitty
    
  ];
  services.hypridle.enable = true;
#  nix.settings = {
#    substituters = ["https://hyprland.cachix.org"];
#    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
#  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
  services.displayManager.ly.enable = true;
}
