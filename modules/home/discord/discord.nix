{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # discord
    # (discord.override {
    #  withVencord = true;
    # })
    webcord-vencord
  ];
  xdg.configFile."Vencord/themes/frappe.theme.css".source = ./frappe.theme.css;
}
