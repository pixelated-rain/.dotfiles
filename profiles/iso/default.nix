{
  pkgs,
  host,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ../../hosts/${host}
    # ../../modules/drivers
    # ../../modules/core
  ];
  nixpkgs.hostPlatform = {system = "x86_64-linux";};
  networking.wireless.enable = false;
}
