{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {

        
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "user" "custom/notification" "temperature" "cpu" "memory" "custom/separator" "pulseaudio" "pulseaudio#microphone" "custom/separator" "backlight" "custom/separator" "battery" "custom/separator" "tray" ];

        "backlight" = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = {
            default = ["󰃜" "󰃛" "󰃚"];
          };
        };
        "battery" = {
          bat = "BAT1";
          interval = 60;
          format = "{icon} {capacity}%";
          format-icons = {
            default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            charging = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          };
        };
        "cpu" = {
          interval = 10;
          format = " {usage}%";
          states = {
            warning = 70;
            critical = 90;
          };
        };
        "clock" = {
          format = "{:%H:%M}  ";
          format-alt = "{:%A, %B %d, %Y (%R)} 󰃰 ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
        
        "custom/notification" = {
          exec = "dunstctl count history";
          format = "󱅫 {text}";
        };

        "hyprland/workspaces" = {
          format = "{icon} {windows}";
          window-rewrite-default = "";
          "window-rewrite" = {
            "title<.*youtube.*>" = "";
            "class<firefox>" = "";
            "class<firefox> title<.*github.*>" = "";
            "kitty" = "";
            "code" = "";
          };

        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          tooltip = false;
          format-muted = " Muted";
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          scroll-step = 5;
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            default = [ "" "" "" ];
          };
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          tooltip = false;
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 Muted";
          on-click = "pamixer --default-source -t";
          on-scroll-up = "pamixer --default-source -i 5";
          on-scroll-down = "pamixer --default-source -d 5";
          scroll-step = 5;
        };
        "custom/separator" = {
          interval = "once";
          format = " | ";
        };


      };
    };
  };
}