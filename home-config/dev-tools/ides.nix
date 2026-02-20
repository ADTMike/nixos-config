{ config, pkgs, ...}:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
        lazy-nvim
    ];
  };
  
  xdg.configFile."nvim/lua/plugins/colorscheme.lua".text = "
    return {
      {
        'ellisonleao/gruvbox.nvim',
        opts = {
          contrast = 'hard',  
          transparent_mode = false,
        },
      },

      {
        'LazyVim/LazyVim',
        opts = {
          colorscheme = 'gruvbox',
        },
      },
    }
  ";
}
