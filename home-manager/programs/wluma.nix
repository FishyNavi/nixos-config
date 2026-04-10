{pkgs,...}:
{
  services.wluma = {
    enable = true;
    package = pkgs.wluma;
    settings = {
      als.time = {
        thresholds =  { 
          "0" = "night";
          "7" = "dark";
          "9" = "dim";
          "11" = "normal";
          "13" = "bright";
          "16" = "normal";
          "18" = "dark";
          "20" = "night";
        };

      };
      output.backlight = [
        {
        name = "eDP-1";
        path = "/sys/class/backlight/intel_backlight";
        capturer = "wayland";
        }
      ];
      output.ddcutil = [
        {
        name = "UK02443021269";
        capturer = "wayland";
        }
      ];
    };
  };
}