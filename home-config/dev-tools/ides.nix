{ config, pkgs, ...}:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim" = {
    source = lazyvim;
    recursive = true;
  };
  xdg.configFile."nvim/lua/plugins/colorscheme.lua".text = "
    return {
      {
        "ellisonleao/gruvbox.nvim",
        opts = {
          contrast = "hard",  
          transparent_mode = false,
        },
      },

      {
        "LazyVim/LazyVim",
        opts = {
          colorscheme = "gruvbox",
        },
      },
    }
  ";
}
