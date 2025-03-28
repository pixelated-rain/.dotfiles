{
  pkgs,
  config,
  host,
  ...
}: let
  inherit (import ../../hosts/${host}/variables.nix) fontSizes;
in {
  # Styling Options
  stylix = {
    enable = true;
    # not needed because wallpaper is managed by swww
    # image = ../../wallpapers/hollow-knight.png;
    # catppuccin-mocha base16Scheme
    base16Scheme = {
      base00 = "05220b";
      base01 = "12431c";
      base02 = "266232";
      base03 = "41804d";
      base04 = "82b68c";
      base05 = "a6cdae";
      base06 = "c9e2ce";
      base07 = "e9f4eb";
      base08 = "c955b2";
      base09 = "c95578";
      base0A = "c96c55";
      base0B = "b2c955";
      base0C = "55c96c";
      base0D = "55b2c9";
      base0E = "6c55c9";
      base0F = "a655c9";
    };
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code; #jetbrains-mono;
        name = "FiraCode Nerd Font";
      };
      emoji = config.stylix.fonts.monospace;
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      # no serifs
      serif = config.stylix.fonts.sansSerif;

      sizes = fontSizes;
    };
    targets = {
      grub.enable = true;
    };
  };
}
