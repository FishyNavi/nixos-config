{pkgs,...}:
{

    programs.fastfetch.enable = true;
    programs.fastfetch.package = pkgs.fastfetch; # im a bit lazy to config fastfetch and this looks cool!
    xdg.configFile."fastfetch/config.jsonc".text = '' 
    
//   _____ _____ _____ _____ _____ _____ _____ _____ _____ 
//  |   __|  _  |   __|_   _|   __|   __|_   _|     |  |  |
//  |   __|     |__   | | | |   __|   __| | | |   --|     |
//  |__|  |__|__|_____| |_| |__|  |_____| |_| |_____|__|__|  HYPRLAND
//
//  by Bina


    {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "logo": {
            "type": "builtin",
            "height": 15,
            "width": 15,
            "padding": {
                "top": 0,
                "left": 3
            }
        },
        "display": {
            "separator": " "
        },
        "modules": [
        
            {
                "type": "title",
                "keyWidth": 10
            },
            "break",
            {
                "type": "os",
                "key": " ",
                "keyColor": "#af00ff",  // = color4
            },
            {
                "type": "kernel",
                "key": " ",
                "keyColor": "#af00ff",
            },
            {
                "type": "packages",
                "format": "{} (total)",
                "key": " ",
                "keyColor": "#af00ff",  
            },
            {
                "type": "shell",
                "key": " ",
                "keyColor": "#af00ff", 
            },
            {
                "type": "terminal",
                "key": " ",
                "keyColor": "#af00ff", 
            },
            {
                "type": "wm",
                "key": " ",
                "keyColor": "#af00ff", 
            },
            {
                "type": "display",
                "key": "󰍹 ",
                "keyColor": "#af00ff"
            },
            {
                "type": "cpu",
                "format": "{1}",
                "key": " ",
                "keyColor": "#af00ff"
            },
            {
                "type": "gpu",
                "format": "{2} {3}",
                "key": " ",
                "keyColor": "#af00ff"
            },
            {
                "type": "memory",
                "key": " ",
                "keyColor": "#af00ff"
            },
            {
                "type": "swap",
                "key": "󰾴 ",
                "keyColor": "#af00ff"
            },
            {
                "type": "disk",
                "key": " ",
                "keyColor": "#af00ff"
            },
            {
                "type": "uptime",
                "key": " ",
                "keyColor": "#af00ff", 
            },
            {
                "type": "command",
                "key": "󱦟 ",
                "keyColor": "#af00ff",
                "text": "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days"
            },
            "break",
            {
                "type": "command",
                "key": " ",
                "keyColor": "#af00ff",
                "text": "hyprctl splash"
            },
            "break",
            {
                "type": "custom",
                "format": "\u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m "
            },
            "break",
            "break",
        ]
    }
'';

}