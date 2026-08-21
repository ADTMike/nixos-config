{ config, pkgs, ... }:
let
  terminal = "ghostty";
  fileManager = "ghostty -e yazi";
  browser = "librewolf";
  mod = "Mod4";
  ipc = "noctalia msg";
in
{
  xdg.configFile."sway/config".text = ''
    set $mod ${mod}
    set $ipc ${ipc}

    # Gaps
    gaps inner 4
    gaps outer 8
    default_border pixel 2
    default_floating_border pixel 2
    hide_edge_borders smart

    # SwayFX
    corner_radius 8
    smart_corner_radius enable

    # Colors
    client.focused #f2e5bb #f2e5bb #282828
    client.focused_inactive #59595900 #59595900 #59595900
    client.unfocused #59595900 #59595900 #59595900
    client.urgent #2e3440 #bf616a #bf616a

    # Input
    input type:keyboard {
        xkb_layout us
    }
    input type:touchpad {
        tap enabled
        natural_scroll disabled
        drag_lock disabled
    }
    seat * xcursor_theme Adwaita 24

    # Window rules
    for_window [class="qalculate-gtk"] floating enable, resize set width 500 height 400
    for_window [class="imv"] floating enable, resize set width 600 height 500
    for_window [class="celluloid"] floating enable, resize set width 800 height 600
    for_window [class="ghostty"] floating enable, resize set width 800 height 500
    for_window [class="librewolf"] fullscreen enable

    # Autostart
    exec noctalia
    exec sleep 2 && noctalia msg wallpaper-set /home/default/Wallpapers/wallpaper.jpg
    exec sleep 2 && noctalia msg nightlight-force-toggle

    # Applications
    bindsym $mod+t exec ${terminal}
    bindsym $mod+q kill
    bindsym $mod+Delete exec swaymsg exit
    bindsym $mod+e exec ${fileManager}
    bindsym $mod+b exec ${browser}

    # Focus
    bindsym $mod+h focus left
    bindsym $mod+j focus down
    bindsym $mod+k focus up
    bindsym $mod+l focus right

    # Resize
    bindsym $mod+Shift+l resize shrink width 30px
    bindsym $mod+Shift+k resize grow height 30px
    bindsym $mod+Shift+j resize shrink height 30px
    bindsym $mod+Shift+h resize grow width 30px

    # Move
    bindsym $mod+Ctrl+h move left
    bindsym $mod+Ctrl+j move down
    bindsym $mod+Ctrl+k move up
    bindsym $mod+Ctrl+l move right

    # Layout
    bindsym $mod+f floating toggle
    bindsym $mod+Shift+f fullscreen toggle
    bindsym $mod+c focus mode_toggle
    bindsym $mod+a focus parent

    # Swap
    bindsym $mod+x mark --replace _swap
    bindsym $mod+Shift+x swap container with mark _swap

    # Workspaces
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5

    bindsym $mod+Shift+1 move container to workspace number 1, workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2, workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3, workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4, workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5, workspace number 5

    # Screenshots — Noctalia
    bindsym Print exec $ipc screenshot-region
    bindsym $mod+Print exec $ipc screenshot-fullscreen

    # Mouse
    bindsym $mod+Alt+h move floating left
    bindsym $mod+Alt+j move floating down
    bindsym $mod+Alt+k move floating up
    bindsym $mod+Alt+l move floating right
    bindsym $mod+Alt+Shift+h resize floating shrink width 30px
    bindsym $mod+Alt+Shift+j resize floating grow height 30px
    bindsym $mod+Alt+Shift+k resize floating shrink height 30px
    bindsym $mod+Alt+Shift+l resize floating grow width 30px

    # Shell — Noctalia
    bindsym $mod+space exec $ipc panel-toggle launcher
    bindsym $mod+s exec $ipc panel-toggle control-center
    bindsym $mod+comma exec $ipc settings-toggle

    # Media keys — Noctalia
    bindsym --locked XF86AudioRaiseVolume exec $ipc volume-up
    bindsym --locked XF86AudioLowerVolume exec $ipc volume-down
    bindsym --locked XF86AudioMute exec $ipc volume-mute
    bindsym --locked XF86MonBrightnessUp exec $ipc brightness-up
    bindsym --locked XF86MonBrightnessDown exec $ipc brightness-down
    bindsym --locked XF86AudioMicMute exec $ipc mic-mute

    bindsym XF86AudioNext exec $ipc media next
    bindsym XF86AudioPause exec $ipc media toggle
    bindsym XF86AudioPlay exec $ipc media toggle
    bindsym XF86AudioPrev exec $ipc media previous
  '';

  home.packages = with pkgs; [
    xdg-utils
    adwaita-icon-theme
    hicolor-icon-theme
    gnome-themes-extra
  ];
}
