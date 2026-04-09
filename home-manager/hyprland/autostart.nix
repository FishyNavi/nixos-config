{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "dunst"
      "nm-applet --indicator"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "hyprpaper"
      "swayosd-server"
      


    ];
    
  };
}