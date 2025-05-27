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
    ++ lib.optional config.variables.gaming [
      retroarch-free
    ]
    ++ lib.optional config.variables.silly [
      cmatrix
      cowsay
      fortune-kind
      pipes-rs
    ];
}
