{ config, pkgs, ... }:
{
  programs = {
    ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        theme = "Gruvbox Dark Hard";
        window-padding-x=10;
      };
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      setOptions = [
        "HIST_IGNORE_DUPS"
        "AUTO_LIST"
      ];
      initContent ="bindkey -v";
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
        ];
        theme = "kafeitu";
      };
    };
    tmux = { 
      enable = true;
      escapeTime = 0;
      keyMode = "vi";
      shell ="/home/default/.nix-profile/bin/zsh";
      plugins = with pkgs.tmuxPlugins; [
        gruvbox
        resurrect
      ];
      extraConfig = "
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      ";
    };
    htop.enable = true;
  };
    
}
