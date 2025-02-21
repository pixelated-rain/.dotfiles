{ inputs, pkgs, config, ... }: 
{
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];
  
  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    catppuccin-kvantum
    (catppuccin-papirus-folders.override {
      accent = "mauve";
      flavor = "frappe";
    })
  ];
  
  catppuccin = {
    flavor = "frappe";
    accent = "mauve";

    programs = {
      kitty.enable = true;
      btop.enable = true;
      firefox.enable = true;
      gtk.enable = true;
      rofi.enable = true;
    };
  };
}
