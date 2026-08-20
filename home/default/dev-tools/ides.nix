{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    sqls
    sql-formatter
    sqlfluff
    gopls
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
          { import = "lazyvim.plugins.extras.ai.avante" },
          { import = "lazyvim.plugins.extras.lang.go" },
          { import = "plugins" },
        },
        defaults = {
          lazy = true,
        },
        checker = {
          enabled = false,
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

    "nvim/lua/plugins/avante.lua".text = ''
      return {
        {
          "yetone/avante.nvim",
          opts = {
            provider = "ollama",
            providers = {
              ollama = {
                endpoint = "http://127.0.0.1:11434",
                model = "glm-5.2:cloud",
                is_env_set = require("avante.providers.ollama").check_endpoint_alive,
                timeout = 60000,
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
