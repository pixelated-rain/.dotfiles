{host, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) gitUsername gitEmail;
in {
  programs.git = {
    enable = true;
    userName = "${gitUsername}";
    userEmail = "${gitEmail}";
    ignores = [
      "*/.direnv"
      "*/.envrc"
    ];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
