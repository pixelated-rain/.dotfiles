{
  # Host identity ( read by flake.nix to wire drivers + user )
  profile = "nvidia-laptop"; # driver bundle under ./profiles
  user = "amelia";

  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "pixelated-rain";
  gitEmail = "dreamsofsoftrain@gmail.com";

  # Only keys that differ from the modules/core/variables.nix defaults.
  extraMonitorSettings = [
    { output = "DP-3"; mode = "3840x2160@60.0Hz"; position = "0x0"; scale = "1.0"; }
    { output = "eDP-1"; mode = "1920x1080@60.0Hz"; position = "auto-right"; scale = "1.0"; }
  ];

  extraHardwareSettings = {
    opengl = { nvidia_anti_flicker = 0; };
    debug  = { damage_tracking = 0; };
  };

  theme = "catppuccin-mocha";

  fontSizes = {
    applications = 16;
    terminal = 24;
    desktop = 14;
    popups = 14;
  };

  defaultWallpaper = "foxies.gif";

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "";
  consoleKeyMap = "us";

  # variables which toggle packages
  gamedev = true;
  gaming = true;
  texlive = true;
  silly = true;

  editor = "nvim";
  EDITOR = "nvim";
  VISUAL = "nvim";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;
}
