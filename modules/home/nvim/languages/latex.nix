{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "vimtex" = {
      package = pkgs.vimPlugins.vimtex;
      setupOpts = {
        tex_flavor = "latex";
        vimtex_view_method = "zathura";
        vimtex_quickfix_mode = 0;
        conceallevel = 1;
        tex_conceal = "abdmg";
      };
    };
  };
}
