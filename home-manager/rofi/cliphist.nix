{pkgs, ...}:
let
  script = pkgs.writeShellScriptBin "rofi-cliphist" ''
    cliphist list | rofi -dmenu -display-columns 2 -p "Clipboard>" -markup-rows -i                                                \
          -theme-str 'window {height: 600px; width: 800px; location: center; border: 2px; border-radius:8px;}'  \
          -theme-str 'listview {columns: 1;}'                                                                    \
          -theme-str 'textbox {horizontal-align: 0.5;}' | cliphist decode | wl-copy
                                      
  '';
in 
{
  home.packages = [script];
}