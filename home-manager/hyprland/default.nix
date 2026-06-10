{pkgs, ...}: {
  catppuccin.hyprland.enable = false;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
    monitor = [
      "eDP-1,1920x1080@60,2560x600,1"
      "HDMI-A-1,  2560x1440@60,0x0,1"
    ]; # add if logic here sometime in future idk
    debug.disable_logs  = false;
    general = {

      gaps_in = 5;
      gaps_out = 10;
      border_size = 0;
      # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    };
    input = {
      kb_layout="us,ua";
      kb_options="grp:win_space_toggle";
    };
    decoration = {
      blur = {
        enabled = true;
        size = 5;
        passes = 1;
        new_optimizations = "on";
      
      };
      rounding = 10;
      rounding_power = 4.0;
      active_opacity = 1;
      inactive_opacity = 0.8;
    };
    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
    };
   
  
    };
  };
  imports = [
    ./binds.nix
    ./animations.nix
    ./windowrules.nix
    # ./plugins.nix no hyprexpo?
    ./autostart.nix
  ];
}
