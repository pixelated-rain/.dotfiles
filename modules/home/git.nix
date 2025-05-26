{config, ...}: let
  inherit (config.variables) gitUsername gitEmail;
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
