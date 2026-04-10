{pkgs, ...}:
let 
  volOSD = pkgs.writeShellScript "volosd.sh" ''
    pamixer --get-mute | grep -q "true" && dunstify -a="OSD" -r 6969 "Muted" --hint=int:value:0 || dunstify -a "OSD" -r 6969 "Volume" --hint=int:value:$(pamixer --get-volume)
  '';
  briOSD = pkgs.writeShellScript "briosd.sh" ''

  '';
in 
{
  wayland.windowManager.hyprland.settings = {

    "$mod" = "SUPER";
    "$browser" = "firefox";
    "$terminal" = "kitty";
    "$filemanager" = "thunar";
    "$code" = "code";
    
    bind =
      [ # mod,key, dispatcher, params
        "$mod, B, exec, $browser"
        "$mod, T, exec, $terminal"
        "$mod, C, exec, $code"
        "$mod, E, exec, $filemanager"

        "$mod, A, exec, hyprctl keyword layerrule animation slide left, ^rofi$ &&  rofi -show run"

        "$mod, Q, killactive"
        "$mod SHIFT, Q, exec, hyprctl kill"
        "$mod, F, fullscreen"
        "$mod, V, togglefloating"
        "ALT, H, movefocus, l"
        "ALT, J, movefocus, d"
        "ALT, K, movefocus, u"
        "ALT, L, movefocus, r"
        "$mod, G, togglegroup"
        "$mod, X, exec, hyprctl keyword layerrule animation slide right, ^rofi$ && rofi-powermenu"
        "$mod, N, exec, hyprctl keyword layerrule animation popin 80%, ^rofi$ && rofi-dunst-manager" # this could be moved to the scipt but i think that ill forget that its there idk
        "$mod, D, exec, hyprctl keyword layerrule animation popin 80%, ^rofi$ && rofi-cliphist"
        "CONTROL SHIFT,B, exec, waybar"

        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        ", XF86AudioMute, exec, exec swayosd-client --output-volume mute-toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86MonBrightnessUp, exec, swayosd-client --brightness raise"
        ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"

      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

      
  bindm = [
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
    ];
  binde = [
    "$mod, left, moveactive,-50 0"
    "$mod, right, moveactive,50 0"
    "$mod, up, moveactive,0 -50"
    "$mod, down, moveactive,0 50"
  ];
  bindl=[",switch:off:Lid Switch, exec, hyprlock --immediate"];
  gesture = [
    "3,horizontal,workspace"
  ];
  
  };
  wayland.windowManager.hyprland.extraConfig = ''
    # hyprlang noerror true
    bind = $mod, Tab, hyprexpo:expo, toggle"
    # hyprlang noerror false
  '';
}
