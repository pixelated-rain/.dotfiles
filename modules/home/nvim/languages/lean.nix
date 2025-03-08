{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "lean.nvim" = {
      package = pkgs.vimPlugins.lean-nvim;
      event = [
        "BufReadPre *.lean"
        "BufNewFile *.lean"
      ];
      setupOpts = {
        mappings = true;
      };
    };
  };
}
