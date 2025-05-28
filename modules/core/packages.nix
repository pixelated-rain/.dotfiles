{
  config,
  pkgs,
  ...
}: {
  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    virt-manager.enable = true;
    mtr.enable = true;
    adb.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    [
      brightnessctl
      eza
      ffmpeg
      file-roller
      fzf
      gimp
      greetd.tuigreet
      hyprpicker
      imv
      killall
      krabby
      libnotify
      libvirt
      lm_sensors
      lxqt.lxqt-policykit
      mask
      masklint
      mpv
      mullvad-vpn
      ncdu
      obs-studio
      pavucontrol
      pciutils
      picard
      playerctl
      qbittorrent-enhanced
      quickemu
      ripgrep
      socat
      unrar
      unzip
      usbutils
      v4l-utils
      wget
    ]
    ++ lib.optionals config.variables.gaming [
      # TODO: move retroarch to ../home, add config
      azahar # 3ds emu
      cemu # wii u emu
      melonDS #nds emu
      dolphin-emu # wii/gcn emu
      joycond # user daemon for joycon devices
      joycond-cemuhook
      prismlauncher # minecraft launcher
      retroarch-free # generic emu
      scarab # HK mod installer/manager
    ]
    ++ lib.optionals config.variables.silly [
      cmatrix
      cowsay
      fortune-kind
      pipes-rs
    ];
}
