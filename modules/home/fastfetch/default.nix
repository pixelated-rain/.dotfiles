{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        color = {
          keys = "35";
          output = "95";
        };
        separator = "  "; # " ➜ ";
      };

      logo = {
        source = ./nixos.png;
        type = "kitty-direct";
        height = 10;
        width = 20;
        padding = {
          top = 2;
          left = 2;
        };
      };

      modules = [
        "break"
        "break"
        {
          type = "custom";
          format = "┌──────────────────── OS ────────────────────┐";
          outputColor = "35";
        }
        {
          type = "os";
          key = "├─ 󰊟 ";
        }
        {
          type = "kernel";
          key = "├─  ";
        }
        {
          type = "packages";
          key = "├─ 󰏖 ";
        }
        {
          type = "shell";
          key = "├─  ";
        }
        {
          type = "custom";
          format = "├──────────────────── WM ────────────────────┤";
          outputColor = "35";
        }
        {
          type = "wm";
          key = "├─  ";
        }
        {
          type = "wmtheme";
          key = "├─ 󰉼 ";
        }
        {
          type = "icons";
          key = "├─ 󰀻 ";
        }
        {
          type = "cursor";
          key = "├─  ";
        }
        {
          type = "terminal";
          key = "├─  ";
        }
        {
          type = "terminalfont";
          key = "├─  ";
        }
        {
          type = "custom";
          format = "├───────────────── Hardware ─────────────────┤";
          outputColor = "35";
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7}";
          key = "├─  ";
        }
        {
          type = "gpu";
          format = "{1} {2}";
          key = "├─ 󰢮 ";
        }
        {
          type = "memory";
          key = "├─  ";
        }
        {
          type = "disk";
          key = "├─ 󰋊 ";
        }
        {
          type = "display"; # "monitor";
          key = "├─  ";
        }
        #{
        #  type = "player";
        #  key = "├─ 󰥠 ";
        #}
        #{
        #  type = "media";
        #  key = "├─ 󰝚 ";
        #}
        {
          type = "custom";
          format = "└────────────────────────────────────────────┘";
          outputColor = "35";
        }
        {
          type = "colors";
          symbol = "circle";
          paddingLeft = 1;
        }
        "break"
        {
          type = "uptime";
          key = " Uptime";
        }
      ];
    };
  };
}
