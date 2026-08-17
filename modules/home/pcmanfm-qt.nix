{ pkgs, ... }:

{
  home.packages = [
    pkgs.pcmanfm-qt
  ];

  systemd.user.services.pcmanfm-desktop = {
    Unit = {
      Description = "PCManFM-Qt Desktop";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStartPre = "${pkgs.bash}/bin/bash -c 'sed -i \"s/^BgColor=.*/BgColor=#00000000/\" ~/.config/pcmanfm-qt/default/settings.conf'";
      
      ExecStart = "${pkgs.bash}/bin/bash -c 'export QT_QPA_PLATFORMTHEME=gtk3; exec ${pkgs.pcmanfm-qt}/bin/pcmanfm-qt --desktop'";
      Restart = "on-failure";

      Environment = "QT_QPA_PLATFORMTHEME = gtk3";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
