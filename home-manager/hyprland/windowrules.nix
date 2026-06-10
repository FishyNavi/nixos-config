{
  wayland.windowManager.hyprland.settings.windowrule = [
    "float on, match:class ^(kitty)$"
    "size 800 500, match:class ^(kitty)$"
    
    "float on, match:class ^(file-roller)$"
    # TODO: add stuff

  ];
  wayland.windowManager.hyprland.settings.layerrule = [
    "blur on, match:namespace ^(waybar)$"
    "blur on, match:namespace ^(rofi)$"
    "animation slide left, match:namespace ^(rofi)$"

  ];
}