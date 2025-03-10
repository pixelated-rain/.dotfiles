{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;

    settings.vim = {
      extraPackages = with pkgs; [
        git
        fzf
        ripgrep
        fd
        zoxide
      ];

      vimAlias = true;
      viAlias = true;
      withNodeJs = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        wrap = false;
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      spellcheck = {
        enable = false;
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = true;
        lsplines.enable = false;
        nvim-docs-view.enable = false;
        lspconfig.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "catppuccin";
        };
      };

      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      tabline = {
        nvimBufferline.enable = true;
      };

      treesitter.context.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = true;
      };

      projects.project-nvim.enable = true;
      dashboard.dashboard-nvim.enable = true;

      notes = {
        todo-comments = {
          enable = true;
          setupOpts = {
            signs = true;
          };
        };
      };

      notify = {
        nvim-notify.enable = false;
        # nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
      };

      utility = {
        ccc.enable = false;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop = {
            enable = true;
            mappings.hop = null;
          };
          leap.enable = false;
          precognition.enable = false;
        };

        images.image-nvim = {
          enable = false;
          setupOpts = {
            backend = "kitty";
          };
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        illuminate.enable = true;
        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };
        smartcolumn = {
          enable = false;
        };
        fastaction.enable = true;
      };

      session = {
        nvim-session-manager.enable = false;
      };

      comments = {
        comment-nvim.enable = true;
      };
    };
  };
}
