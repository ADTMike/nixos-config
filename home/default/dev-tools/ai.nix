{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    ollama
  ];
  programs.opencode = {
    enable = true;
  };
  systemd.user.services.ollama = {
    Unit = {
      Description = "Ollama LLM inference server";
      After = [ "network-online.target" ];
    };
    Service = {
      ExecStart = "${pkgs.ollama}/bin/ollama serve";
      Restart = "always";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
