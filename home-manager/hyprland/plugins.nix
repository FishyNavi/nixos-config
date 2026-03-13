{pkgs, ...}: {
  
  wayland.windowManager.hyprland = {
    plugins = [pkgs.hyprlandPlugins.hyprexpo];
    settings.plugin.hyprexpo = {
      "plugin:hyprexpo:gap_size" = "20";
      "workspace_method" = "center current";
      "columns" = "2";
      "skip_empty" = "true";

    };
  };
}