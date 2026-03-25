{pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ''
      * {
          all: unset;
          border: none;
          border-radius: 6px;
          font-family: "Iosevka Nerd Font", "Symbols Nerd Font", sans-serif;
          font-size: 13px; 
          margin: 0 2px;
      }
      window#waybar {
          background-color: rgba(45, 40, 45, 0.8);
          padding-top: 5px;
          color:rgb(182, 98, 255);
          
          transition: background-color 0.5s;

      }
      #workspaces button {
          transition: background-color 0.5s;
          opacity: 1;
          padding-left: 5px;
          padding-right: 10px;
          color: azure;
          min-width: 40px;
          margin: 2 0px;
          
      }
      #workspaces button.empty {padding-right: 0px;} /* cant even center div in css */
      #workspaces button.active {
          background: rgba(165, 65, 255,0.2);
      }

      #battery, #cpu, #memory, #temperature, #backlight, #pulseaudio, #wireplumber, #tray
      {
          padding: 0 5px;
          color: inherit;
      }
      #group-hardware,#group-audio{
          background-color: rgba(230, 200, 255, 0.2);
      }
      #audio, #hardware{
          color: rgb(205, 149, 255);;
      }


      #network, #power-profiles-daemon, #custom-notification, #custom-grim, #language, #clock
      {
          color: azure;
      }
      #mpris
      {   
          color: azure;
          padding-left: 5px;
          padding-right: 10px;
          
          background-color: rgba(165, 65, 255,0.2);
      }
    '';
    settings = {
      mainBar = {

        
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [  "tray" "group/hardware" "mpris" "group/audio" "backlight" "battery" "power-profiles-daemon" "custom/grim" "network" "language" "custom/notification"   ];
        "memory" = {
          interval = 20;
          format = "  {percentage}%";
        };
        "backlight" = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = {
            default = ["󰃜" "󰃛" "󰃚"];
          };
        };
        "temperature" = {
          format = " {temperatureC}"; # TODO: add format icons
        };
        "battery" = {
          bat = "BAT1";
          interval = 60;
          format = "{icon}{capacity}%";
          format-icons = {
            default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            charging = ["󰢟 " "󰢜 " "󰂆 " "󰂇 " "󰂈 " "󰢝 " "󰂉 " "󰢞 " "󰂊 " "󰂋 " "󰂅 "];
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
          interval = 10;
          on-click = "rofi-dunst-manager";
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
          on-click-right = "pavucontrol";
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
        "custom/grim" = {
          on-click = "grim -g \"\$(slurp)\" - | swappy -f -";
          format = " ";
        };
        "power-profiles-daemon" = {
          format = "{icon} ";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        "mpris" = {
            format = "{player_icon} {dynamic}";
            dynamic-len = 10;
            title-len = 10;
            interval = 1;
            format-paused = "{status_icon} <i>{dynamic}</i>";
            dynamic-order = ["title" "artist" "album"];
            player-icons = {
              default = "▶ ";
              spotify = " ";
              firefox = " ";
            };
            status-icons = {
              paused = "⏸";
            };
        };
        "group/hardware" = {
          orientation = "inherit";
          drawer = {
            
            children-class = "hardware";
            };
          modules = ["cpu" "temperature" "memory"];
        };
        "group/audio" = {
          orientation = "inherit";
          drawer = {
            children-class = "audio";
          };
          modules = ["pulseaudio" "pulseaudio#microphone"];
        };

      # TODO: add network config idk

      };
    };
  };
}