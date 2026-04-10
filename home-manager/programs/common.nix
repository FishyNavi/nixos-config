{ config, pkgs, ...}: {
  # TODO: categorize stuff for it to look better
  home.packages = with pkgs; [
    aspell # Spell check
    aspellDicts.en
    aspellDicts.uk
    bat
    dust # Disck usage
    ffmpeg
    glow # markown renerer for terminal
    # iftop # network bandwitch monitor
    imagemagick # image manipulation
    killall
    pandoc # document converter
    ripgrep # faster grep
    tmux # terminal multiplexer 
    tree
    unrar
    unzip
    zip 
    wget
    keepassxc
    pavucontrol
    playerctl
    grim
    slurp
    swappy
    net-tools
    glances
    pciutils
    vlc
    fastfetch
    vesktop
    brightnessctl

    asciiquarium
    cava
    tty-clock
    cmatrix
    qimgv

  ];
  programs= {
    obs-studio.enable = true; # !

  };
  catppuccin.dunst.enable = false;
  services.dunst = {
    enable = true;
    settings = {
      global = {
        background = "#10002B";
        foreground = "#FFFFFF";
        frame_color = "#7B2CBF";
        frame_width = 2;
        corner_radius = 6;
        progress_bar = true;
        progress_bar_color = "#7B2CBF";
        origin = "top-center";
        offset = "0x20";
        alignment = "left";
        width = 300;
        default_timeout = 5000;
        stack_duplicates = true;
        format = "<b>%a</b>\\n%s\\n%b";
      };
      spotify = {
        appname = "Spotify";
        format = "<b>Now Playing</b>\\n%s\\n%b";
      }; # ts for future

    };
  };
  
  

}
