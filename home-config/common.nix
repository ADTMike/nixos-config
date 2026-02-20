{ config, pkgs, ...}:
{
  home.packages = with pkgs; [	
    git
    curl
    lazygit
    tree-sitter
    fzf
    ripgrep
    fd
    nerd-fonts.zed-mono
  ];
  fonts.fontconfig.enable =true;
}
