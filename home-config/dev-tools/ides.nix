{ config, pkgs, ...}:
{ 
  home.packages = with pkgs;[
    sqls
    sql-formatter
    sqlfluff
  ];

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
      },{
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module 'auto-session'
        ---@type AutoSession.Config
        opts = {
          allowed_dirs = { '~/environment/**', '~/workspace/**', '/etc/nixos/*'},
          -- log_level = 'debug',
        },
      }
    }
  ";
}
