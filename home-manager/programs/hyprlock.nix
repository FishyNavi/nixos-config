{pkgs, ... }:
{
  catppuccin.hyprlock.enable = false;
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock; 
    settings = {
      general = {
        hide_cursor = false;
        ignore_empty_input = true;
        
      };


      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          
          size = "200, 40";
          position = "-100, -100";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgba(30, 30, 46, 0.5)";
          check_color = "rgba(30, 30, 46, 0.6)";
          fail_color = "rgba(30, 30, 46, 0.5)";
          outline_thickness = 0;
          placeholder_text = "<i>Input password...</i>";
          font_family = "Iosevka Nerd Font";
          font_size = 10;
          fail_text = "$FAIL";
          fail_timeout = 1000;
          halign = "right";

        }
      ];
      label = [
        {
          font_family = "Iosevka Nerd Font";
          font_size = 10;
          position = "-100,10";
          text = "cmd[update:1000000] hyprctl splash";
          monitor = "";
          valign = "end";
          halign = "right";
        }
        {
          font_family = "Iosevka Nerd Font";
          font_size = 20;
          position = "-100,-50";
          text = "Hi there, $USER!";
          monitor = "";
          halign = "right";
        }
        {
          font_family = "JetBrains Mono ExtraBold";
          font_size = 80;
          letter_spacing = -5;
          text = "$TIME12";
          position = "-100,-100";
          valign = "top";
          halign = "right";
        }
      ];
    };
    extraConfig = "";
  };
}
