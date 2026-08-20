{ config, pkgs, ... }:
{
  programs.noctalia = {
    enable = true;
    settings = {
      shell = {
        font_family = "sans-serif";
        settings_show_advanced = true;
        clipboard_enabled = true;
        clipboard_history_max_entries = 100;
      };

      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Gruvbox";
      };

      bar.main = {
        position = "top";
        thickness = 34;
        background_opacity = 0.85;
        radius = 0;
        margin_ends = 0;
        margin_edge = 0;
        padding = 14;
        widget_spacing = 6;
        shadow = false;
        auto_hide = false;
        reserve_space = true;
        start = [ "launcher" "workspaces" ];
        center = [ "clock" ];
        end = [ "media" "tray" "notifications" "volume" "battery" "session" ];
      };

      dock.enabled = false;

      wallpaper = {
        enabled = true;
        default.path = "/home/default/Wallpapers/wallpaper.jpg";
        directory = "/home/default/Wallpapers";
      };

      wallpaper.automation = {
        enabled = true;
        interval_seconds = 1800;
        order = "random";
        recursive = true;
      };

      notification = {
        enable_daemon = true;
        show_app_name = true;
        show_actions = true;
        layer = "top";
        background_opacity = 0.97;
        offset_x = 20;
        offset_y = 8;
      };

      lockscreen = {
        enabled = true;
        blurred_desktop = true;
        blur_intensity = 0.5;
        tint_intensity = 0.3;
      };

      osd = {
        position = "top_right";
        scale = 1.0;
        background_opacity = 0.97;
        offset_x = 20;
        offset_y = 8;
      };

      shell.screenshot = {
        enabled = true;
        save_location = "~/Pictures/Screenshots";
        copy_to_clipboard = true;
      };

      audio = {
        enable_overdrive = false;
        enable_sounds = false;
      };

      idle.behavior.lock = {
        timeout = 600;
        action = "lock";
        enabled = true;
      };

      idle.behavior."screen-off" = {
        timeout = 660;
        action = "screen_off";
        enabled = true;
      };

      system.monitor = {
        enabled = true;
        cpu_poll_seconds = 2.0;
        memory_poll_seconds = 2.0;
      };

      desktop_widgets.enabled = false;
      nightlight.enabled = true;
      weather.enabled = false;
      calendar.enabled = false;
    };
  };

  home.file."Wallpapers/wallpaper.jpg".source = ../wallpaper/wallpaper.jpg;
  home.file."Wallpapers/wallpaper1.jpg".source = ../wallpaper/wallpaper1.jpg;
}
