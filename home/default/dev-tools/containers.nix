{ config, lib, pkgs, ... }:
{
  programs.distrobox = {
    enable = true;
    settings = {
      container_manager = "podman";
    };
    containers = {
      ubuntu = {
        image = "ubuntu:24.04";
        init = true;
        home = "${config.home.homeDirectory}/.local/share/distrobox/ubuntu";
        volume = [
          "${config.home.homeDirectory}/workspace:/workspace"
        ];
      };
    };
  };

  home.packages = with pkgs; [
    podman
  ];

  xdg.configFile."containers/policy.json".text = builtins.toJSON {
    default = [ { type = "insecureAcceptAnything"; } ];
    transports = {
      docker-daemon = {
        "" = [ { type = "insecureAcceptAnything"; } ];
      };
    };
  };

  systemd.user.services.distrobox-home-manager = {
    Unit = {
      Description = "Build the containers declared in ~/.config/distrobox/containers.ini";
      After = [ "default.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = lib.mkForce (
        pkgs.writeShellScript "distrobox-home-manager" ''
          PATH=/run/current-system/sw/bin:${pkgs.podman}/bin:$PATH
          ${config.programs.distrobox.package}/bin/distrobox-assemble create --file ${config.xdg.configHome}/distrobox/containers.ini
        ''
      );
    };
  };
}
