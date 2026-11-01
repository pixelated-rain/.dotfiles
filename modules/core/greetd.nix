{
  pkgs,
  username,
  ...
}: {
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        user = username;
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland"; # start Hyprland with a TUI login manager
      };
    };
  };
}
