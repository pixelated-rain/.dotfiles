{ pkgs, config, ... }:
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.symbols-only
    twemoji-color-font
    noto-fonts-emoji
    fantasque-sans-mono
  ];

  gtk = {
    enable = true;
    font = {
      name = "Fira Code Semibold";
      size = 12;
    };
    theme = {
      name = "Catppuccin-Frappe";
      package = pkgs.catppuccin-gtk.override {
	accents = [ "mauve" ];
	size = "standard";
	tweaks = [ "normal" ];
	variant = "frappe";
      };
    };
  };
}
