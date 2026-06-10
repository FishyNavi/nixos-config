{ pkgs,inputs, ...}: {


  # Homemanager config

  home = {
        username = "vlado";
        homeDirectory = "/home/vlado";

        packages = with pkgs; [
          firefox
	        vscodium
          osu-lazer-bin
          prismlauncher

          python3
          pkgs.openjdk25

          gcc
          cmake
          gnumake
          boost
          eigen
          gdb
        ];

        stateVersion = "25.11";
    };
  programs.home-manager.enable = true;
  
  imports = [

    ../../home-manager/hyprland
    ../../home-manager/shell
    ../../home-manager/programs
    ../../home-manager/rofi
    ../../home-manager/eww

    inputs.catppuccin.homeModules.catppuccin
  ];

  programs.git= {
    enable = true; # silly me
    settings.user = {
      name = "vlado";
      email = "vladoant@proton.me";
    };
  };
      

    


}
