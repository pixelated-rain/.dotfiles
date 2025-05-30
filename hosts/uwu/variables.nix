{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "pixelated-rain";
  gitEmail = "dreamsofsoftrain@gmail.com";

  # Hyprland Settings
  extraMonitorSettings = "
    monitor = DP-3,3840x2160@60.0Hz,0x0,1.0
    monitor = eDP-1,1920x1080@60.00Hz,1920x0,1.0
  ";
  extraHardwareSettings = "
    render {
      explicit_sync = 2
      explicit_sync_kms = 0
    }

    opengl {
      nvidia_anti_flicker = 0
    }

    misc {
      vfr = 0
    }

    debug {
      damage_tracking = 0
    } 
  ";

  fontSizes = {
    applications = 14;
    terminal = 18;
    desktop = 12;
    popups = 12;
  };
  defaultWallpaper = "star-trail.jpg";

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "firefox"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "us";
  consoleKeyMap = "us";

  editor = "nvim";
  EDITOR = "nvim";
  VISUAL = "nvim";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;
}
