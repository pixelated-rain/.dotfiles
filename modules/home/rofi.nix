{ pkgs, ... }:
{
  home.packages = (with pkgs; [ rofi-wayland ]);

  programs.rofi = {
    enable = true;
    package = rofi-wayland;
    theme = "catppuccin-frappe";
    extraConfig = {
      modi = "run,drun,window";
      icon-theme = "Oranchelo";
      show-icons = true;
      terminal = kitty;
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      sidebar-mode = true;
    };
  };
}
