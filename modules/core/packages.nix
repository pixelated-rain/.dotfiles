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
      appimage-run
      ardour
      audacity
      blender
      bolt-launcher
      brightnessctl
      discord
      docker-compose
      duf
      eza
      ffmpeg
      file-roller
      fzf
      gedit
      gimp
      # failed to build 2025-12-03
      # gpt4all
      greetd.tuigreet
      htop
      hyprpicker
      imv
      inxi
      killall
      krabby
      krita
      libnotify
      libreoffice
      libvirt
      # linuxKernel.packages.linux_zen.openrazer
      lmms
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
      pkg-config
      playerctl
      polychromatic
      polyphone
      qbittorrent-enhanced
      quickemu
      ripgrep
      runelite
      socat
      spotify
      unrar
      unzip
      usbutils
      v4l-utils
      virt-viewer
      vlc
      wget
      xivlauncher
      yt-dlp
      zoxide
      zoom-us
    ]
    ++ lib.optionals config.variables.gaming [
      # TODO: move retroarch to ../home, add config
      cemu # wii u emu
      dolphin-emu # wii/gcn emu
      joycond
      joycond-cemuhook
      melonDS #nds emu
      prismlauncher # minecraft launcher
      retroarch-free # generic emu
    ]
    ++ lib.optionals config.variables.gamedev [
      aseprite
      godot
    ]
    ++ lib.optionals config.variables.silly [
      cmatrix
      cowsay
      fortune-kind
      pipes-rs
    ];
}
