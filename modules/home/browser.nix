{
  #inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    #inputs.zen-browser.packages."${system}".default
    firefox
    ungoogled-chromium
    tor-browser
  ];
}
