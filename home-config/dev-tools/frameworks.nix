{ config, pkgs, ... }:
let
  android = pkgs.androidenv.composeAndroidPackages {
    abiVersions = [ "x86_64" ];
    platformVersions = [ "34" ];
    includeSystemImages = false;
    includeEmulator = false;
    includeNDK = false;
  };
in

{
  nixpkgs.config = {
    android_sdk.accept_license = true;
    allowUnfree = true;
  };
  home.packages = with pkgs; [
    flutter
    android.androidsdk
  ];
}
