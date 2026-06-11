{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    sqls
    sql-formatter
    sqlfluff
    ollama
  ];

  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
    
    initLua = ''
      require("lazy").setup({
        spec = {
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          { import = "plugins" },
        },
        defaults = {
          lazy = true,
        },
        checker = {
          enabled = true,
        },
        change_detection = {
          notify = false,
        },
      })
    '';
  };

  xdg.configFile = {
    "nvim/lua/plugins/colorscheme.lua".text = ''
      return {
        {
          "ellisonleao/gruvbox.nvim",
          priority = 1000,
          lazy = false,
          opts = {
            contrast = "hard",
            transparent_mode = false,
          },
          config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.cmd.colorscheme("gruvbox")
          end,
        },
      }
    '';

    "nvim/lua/plugins/codecompanion.lua".text = ''
  return {
    {
      "olimorris/codecompanion.nvim",
      lazy = false,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
      opts = {
        strategies = {
          chat = {
            adapter = "ollama",
          },
          inline = {
            adapter = "ollama",
          },
        },
      },
    },
  }
'';

"nvim/lua/plugins/auto-session.lua".text = ''
      return {
        {
          "rmagatti/auto-session",
          lazy = false,
          opts = {
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
            log_level = "error",
          },
        },
      }
    '';
  };
}
