{pkgs, ...}: let
in {
  programs = {
    firefox.enable = false; # Firefox is not installed by default
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

  environment.systemPackages = with pkgs; [
    appimage-run
    audacity
    bolt-launcher
    brightnessctl
    cmatrix
    cowsay
    docker-compose
    duf
    eza
    ffmpeg
    file-roller
    fzf
    gedit
    gimp
    greetd.tuigreet
    htop
    hyprpicker
    imv
    inxi
    killall
    krabby
    krita
    libnotify
    libvirt
    # linuxKernel.packages.linux_zen.openrazer
    lm_sensors
    lolcat
    lshw
    lutris
    lxqt.lxqt-policykit
    meson
    mpv
    mullvad-vpn
    ncdu
    ninja
    nixfmt-rfc-style
    obs-studio
    opentabletdriver
    pavucontrol
    pciutils
    picard
    pipes-rs
    pkg-config
    playerctl
    polychromatic
    prismlauncher
    qbittorrent-enhanced
    retroarch-free
    ripgrep
    runelite
    socat
    spotify
    tradingview
    unrar
    unzip
    usbutils
    v4l-utils
    virt-viewer
    vlc
    wget
    ytmdl
  ];
}
