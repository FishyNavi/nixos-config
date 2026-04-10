{config, ...}:
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "nm-applet --indicator"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "swayosd-server"
      "hyprpaper"


    ];
    
  };
}