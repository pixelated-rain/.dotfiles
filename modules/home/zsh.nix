{profile, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
      TERMINAL = "kitty";
    };

    initContent = ''
      bindkey -s '\eg' 'g\n'
      bindkey -s '\el' 'l\n'
      bindkey -s '\e.' 'cd ..\n'
      bindkey -s '\ef' 'fastfetch\n'
      bindkey -s '\ec' 'clear\n'
      bindkey -s '\ey' 'yazi\n'
       if [ -f $HOME/.zshrc-personal ]; then
          source $HOME/.zshrc-personal
       fi
      krabby name shinx --no-title
      eval "$(direnv hook zsh)"
      function dev () {
        nix flake init --template "github:CharredLee/dev-templates#$@"
        direnv allow
      }
    '';

    shellAliases = {
      sv = "sudo nvim";
      v = "nvim";
      c = "clear";
      y = "yazi";

      # nixos
      fr = "nh os switch ~/.dotfiles --hostname ${profile}";
      fu = "nh os switch ~/.dotfiles --hostname ${profile} --update";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      cat = "bat";
      man = "BAT_THEME='default' batman";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      ls = "eza -a --icons";
      tree = "eza --icons --tree --group-directories-first";

      sdn = "shutdown now";
      rb = "reboot";

      # git
      g = "lazygit";
      ga = "git add";
      gaa = "git add --all";
      gs = "git status";
      gsw = "git switch";
      gb = "git branch";
      gm = "git merge";
      gd = "git diff";
      gpl = "git pull";
      gps = "git push";
      gpso = "git push origin";
      gcl = "git clone";
      gc = "git commit";
      gcm = "git commit -m";
      gcma = "git add --all && git commit -m";
    };
  };
}
