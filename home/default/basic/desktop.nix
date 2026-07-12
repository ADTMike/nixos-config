{ config,pkgs, ... }:
{
	home.packages = with pkgs; [
 		kdePackages.kcalc
		kdePackages.dragon
		libreoffice
  ];
}
