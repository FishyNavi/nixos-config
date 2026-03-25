{pkgs, ...}:
{


  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-lavender-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ]; 
        size = "standard";
        variant = "mocha";
      };
    };
  };

}