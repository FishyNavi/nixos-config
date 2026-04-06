{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "Applications";
      drun-display-format = "{name}";
      sidebar-mode = true;
    };
    font = "Iosevka Nerd Font 18";
    theme = let 
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        base = mkLiteral "#1e1e2e";
        text = mkLiteral "#cdd6f4";
        blue = mkLiteral "#b662ffff";
        red  = mkLiteral "#f38ba8";
        bg   = mkLiteral "rgba(30, 30, 46, 0.6)";
        
        background-color = mkLiteral "transparent";
        text-color       = mkLiteral "@text";
        spacing          = 2;
      };

      "window" = {
        location = mkLiteral "west";
        anchor   = mkLiteral "west";
        padding  = 5;
        background-color = mkLiteral "@bg";
        border = mkLiteral "2px 2px 2px 0px";
        border-color = mkLiteral "@blue";
        border-radius = mkLiteral "0px 10px 10px 0px";
        children      = map mkLiteral [ "mainbox" ];
        width   = mkLiteral "360px";
      };
      "mainbox" = {
        spacing = 0;
        padding = 0;
        expand  = true;
        children= map mkLiteral ["inputbar" "listview"];
      };

      "element" = {
        padding = mkLiteral "5px";
        spacing = mkLiteral "8px";
        border-radius = mkLiteral "5px";
        children = map mkLiteral [ "element-icon" "element-text" ];
      };

      "element normal.normal, element alternate.normal" = {
        background-color = mkLiteral "@background-color"; 
        text-color = mkLiteral "@text";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@blue";
        text-color = mkLiteral "@base";
        border-radius = mkLiteral "10px";
      };

      "element-icon" = { size = mkLiteral "1em"; };
      "button" = { padding = mkLiteral " 5px 2px"; };
      "inputbar" = {
        children = map mkLiteral [ "prompt" "textbox-prompt-colon" "entry" ];
        
      };
      
      "listview" = {
        border = mkLiteral "0px solid";
        lines = 12;
        columns = 1;
        fixed-height = false;
      };
    };
  };
}