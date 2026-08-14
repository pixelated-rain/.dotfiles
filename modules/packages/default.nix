{pkgs ? import <nixpkgs> {}}: {
  kingler = pkgs.callPackage ./kingler {};
  datacorn = pkgs.callPackage ./datacorn {};
  aladin = pkgs.callPackage ./aladin {};
}
