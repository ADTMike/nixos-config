{ config, pkgs, ...}: 
let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "34" ];
    buildToolsVersions = [ "34.0.0" ];
    abiVersions = [ "x86_64" "arm64-v8a" ];
  };
in
{
  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };
  home.packages = with pkgs; [
    watchman
    jdk17
    android-tools
    androidComposition.androidsdk
    gradle
  ];

  home.sessionVariables = {
    ANDROID_HOME = "${androidComposition.androidsdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${androidComposition.androidsdk}/libexec/android-sdk";
    JAVA_HOME = "${pkgs.jdk17}";
  };
    
}
