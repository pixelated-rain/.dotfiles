{pkgs, ...}: {
  home.packages = [
    pkgs.pcmanfm-qt
  ];

  systemd.user.services.pcmanfm-desktop = {
    Unit = {
      Description = "PCManFM-Qt Desktop (Hyprland only)";

      After = ["hyprland-session.target"];
      PartOf = ["hyprland-session.target"];
    };

    Service = {
      ExecStartPre = "${pkgs.bash}/bin/bash -c 'sed -i \"s/^BgColor=.*/BgColor=#00000000/\" \"$HOME/.config/pcmanfm-qt/default/settings.conf\"'";

      ExecStart = "${pkgs.pcmanfm-qt}/bin/pcmanfm-qt --desktop";

      Environment = "QT_QPA_PLATFORMTHEME=gtk3";

      Restart = "on-failure";
    };

    Install = {
      WantedBy = ["hyprland-session.target"];
    };
  };
}
