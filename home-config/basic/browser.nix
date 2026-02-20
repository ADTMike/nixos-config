{ config, pkgs, ...}:
{
  programs.librewolf = { 
    enable = true;
    policies.Cookies = {
      Allow =  [
        "https://mail.google.com"
        "https://github.com"
      ];
    };
  };
}
