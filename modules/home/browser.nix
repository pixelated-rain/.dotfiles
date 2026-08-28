{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    firefox-bin
    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
    ungoogled-chromium
    tor-browser
  ];
}
