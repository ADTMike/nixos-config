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
    tmux.enable = true;
  };
    
}
