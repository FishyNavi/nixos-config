{config, ...}:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "nm-applet --indicator"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "hyprpaper"
      # "systemctl --user restart conky.service"
      "systemctl --user restart wluma.service"
      "systemctl --user restart swayosd.service"
      


    ];
    
  };
}