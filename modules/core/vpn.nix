{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.proton-vpn
  ];

  # Keep Tailscale installed and configured elsewhere.
  # Help VPN and Tailscale routing coexist.
  networking.firewall.checkReversePath = "loose";
}
