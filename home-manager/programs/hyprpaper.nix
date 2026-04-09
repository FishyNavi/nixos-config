{pkgs, ...}:

{
home.file."wallpapers/" = {
  source = ../../wallpapers; # add if logic sometime idk
  recursive = true;
};
services.hyprpaper = {
  enable = true;
  wallpaper = [
    {
      monitor = "";
      path = "~walppapers/1.jpg";
      fit_mode = cover;
    }
  ];
};
}