{pkgs, ...}:

{
home.file."wallpapers/" = {
  source = ../../wallpapers; # add if logic sometime idk
  recursive = true;
};
services.hyprpaper = {
  enable = true;
  settings = {
  
  splash = false;
  preload = [ "~/wallpapers/1.jpg" ]; 
  wallpaper = {
    "monitor" = "";   
    "path" = "~/wallpapers/1.jpg";
    "fit_mode" = "cover";
  }; 
  };
  
};
}