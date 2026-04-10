{pkgs, ... }:
{
services.swayosd.enable = true; 
services.swayosd.package = pkgs.swayosd;
xdg.configFile."swayosd/style.css".text = let 
  bg = "#1e0048ff";
  border = "#5D3FD3";
  text = "#f8f8f2";
in 
  ''
    window#osd {
      background-color: ${bg};
      border: 2px solid ${border};
      border-radius: 8px;
    }
    
    window#osd trough {
      background-color: rgba(255, 255, 255, 0.1);
      min-height: 6px;
    }
    
    window#osd progress {
      background-color: ${text};
    }
  '';
}