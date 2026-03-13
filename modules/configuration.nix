{ pkgs, lib, ...}: {
  

  # User setup
  users.users.vlado = {
    
    isNormalUser = true;
    description = "vlado";
    extraGroups = ["networkmanager" "wheel" "audio" "video"];
    initialPassword = "vlado"; # Change this with passwd!

  };

  time.timeZone = "Europe/Warsaw"; # Timezone
  
  fonts = {
    packages = with pkgs; [
      # Icons
      material-design-icons

      # Normal fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      # nerd fonts
      nerd-fonts.iosevka
    ];
  };


  
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
  nixpkgs.config.allowUnfree = true;
  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    lm_sensors
    nnn
    xfce.thunar

  ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  hardware.bluetooth.enable = true;

  # Printing
  services.printing.enable = true;
  
  # Pipewire audi server
  services.pulseaudio.enable = false;
  security.rtkit.enable = true; # 
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  services.power-profiles-daemon.enable = true; # Enable power profiles

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };


  
 
 
 
 

}
