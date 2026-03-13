{ pkgs, ...}: {



  # Homemanager config

  home = {
        username = "vlado";
        homeDirectory = "/home/vlado";

        packages = with pkgs; [
          firefox
	        vscode
        ];

        stateVersion = "25.11";
    };
  programs.home-manager.enable = true;
  
  imports = [

    ../../home-manager/hyprland
    ../../home-manager/shell
    ../../home-manager/programs
    ../../home-manager/waybar
  ];

  programs.git.settings.user = {
    name = "vlado";
    email = "vladoant@proton.me";
  };
      

    


}
