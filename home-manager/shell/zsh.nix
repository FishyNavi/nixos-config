{pkgs, ... }:{
  home.packages = [pkgs.zsh-powerlevel10k];
  
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ${./p10k.zsh}
    '';

    # loginShellInit TODO
    autosuggestion = {
      enable = true;
      strategy = ["completion"];
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "last-working-dir"
      ];
    };
  };
}