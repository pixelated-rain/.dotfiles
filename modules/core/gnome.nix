{pkgs, ...}: let
  gst = pkgs.gst_all_1;

  gstPlugins = [
    gst.gst-plugins-base
    gst.gst-plugins-good
    gst.gst-plugins-bad
    gst.gst-plugins-rs
    gst.gst-libav
    gst.gst-plugins-ugly
  ];
in {
  # Desktop environments
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  programs.hyprland.enable = true;

  # GNOME JavaScript runtime
  environment.systemPackages = [
    pkgs.gjs
  ];

  # GSettings schemas required by DING
  environment.sessionVariables.XDG_DATA_DIRS = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.nautilus}/share/gsettings-schemas/${pkgs.nautilus.name}"
  ];

  # GObject introspection for Hanabi's GstPlay renderer
  environment.sessionVariables.GI_TYPELIB_PATH = [
    "${gst.gst-plugins-bad}/lib/girepository-1.0"
  ];

  # GStreamer playback plugins for Hanabi
  environment.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 =
    map (p: "${p}/lib/gstreamer-1.0") gstPlugins;
}
