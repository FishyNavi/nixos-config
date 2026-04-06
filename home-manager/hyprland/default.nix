{pkgs, ...}: {
  
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    monitor = [
      "eDP-1,1920x1080@60,2560x600,1.2"
      "HDMI-A-1,  2560x1440@60,0x0,1"
    ]; # add if logic here sometime in future idk
    general = {
      gaps_in = 5;
      gaps_out = 10;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    };
    decoration = {
      blur = {
        enabled = true;
        size = 5;
        passes = 1;
        new_optimizations = "on";

      };
    };
  
    };
  };
  imports = [
    ./binds.nix
    ./autostart.nix
    ./animations.nix
    ./windowrules.nix
    ./plugins.nix
  ];
}
