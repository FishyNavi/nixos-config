{pkgs, ...}: {
  
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    monitor = ",preferred,auto,auto";
    general = {
      gaps_in = 5;
      gaps_out = 10;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    };
  
    };
  };
  imports = [
    ./binds.nix
    ./autostart.nix
    ./windowrules.nix
    ./animations.nix
    ./plugins.nix
  ];
}
