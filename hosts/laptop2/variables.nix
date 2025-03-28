{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "CharredLee";
  gitEmail = "gcc2hq@virginia.edu";

  # Hyprland Settings
  extraMonitorSettings = "
    monitor = ,1920x1080@60,auto,1
  ";
  extraHardwareSettings = "";
  defaultWallpaper = "hollow-knight.png";

  fontSizes = {
    applications = 14;
    terminal = 18;
    desktop = 12;
    popups = 12;
  };

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "zen"; # Set Default Browser (google-chrome-stable for google-chrome)
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
