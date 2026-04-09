{pkgs, ...}:

{
home.file."wallpapers/" = {
  source = ../../wallpapers; # add if logic sometime idk
  recursive = true;
};
services.hyprpaper = {
  enable = true;
  settings.
  settings = {
    splash = false;
    preload = [ "~/wallpapers/1.jpg" ]; 
    wallpaper = [ ",~/wallpapers/1.jpg" ]; 
  };
  
};
}