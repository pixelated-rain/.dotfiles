{
  pkgs,
  host,
  ...
}: let
  inherit (import ../../../hosts/${host}/variables.nix) clock24h;
in {
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        passthrough = false;
        spacing = 4;
        fixed-center = true;
        ipc = true;
        modules-center = [
          "custom/notification"
          "custom/separator#dot-line"
          "custom/cava_mviz"
          "custom/separator#dot-line"
          "clock"
          "custom/separator#dot-line"
          "hyprland/workspaces"
          "custom/separator#dot-line"
          "idle_inhibitor"
        ];
        modules-left = [
          "custom/power"
          "custom/separator#dot-line"
          "tray"
        ];
        #modules-right = [
        #];
      }
    ];
    # JetBrainsMono Nerd Font Mono replaced
    style = builtins.readFile ./style.css;
  };
}
