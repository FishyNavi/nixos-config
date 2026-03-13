{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;
    enableGitIntegration = true;
    
    themeFile = "Catppuccin-Mocha";
    #autoThemeFiles = {
    #  dark = "Catpuccin-Mocha";
    #  light = "Catpuccin-Latte";
    #  noPreference = "Catpuccin-Mocha";
    #};
   font = {
    name = "Iosevka Nerd Font";
    size = 10;
   };
  extraConfig = ''
    modify_font cell_width 110%
    tab_bar_allign top
    tab_bar_style powerline
    map ctrl+c copy_or_interrupt
    map ctrl+v paste_from_clipboard

  '';
  };
}