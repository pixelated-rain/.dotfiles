{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    firefox-unwrapped
    ungoogled-chromium
  ];
}
