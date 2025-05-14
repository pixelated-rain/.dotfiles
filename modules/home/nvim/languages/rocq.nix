{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "coq-lsp.nvim" = {
      enabled = true;
      package = pkgs.vimPlugins.coq-lsp-nvim;
      lazy = true;
      ft = "v";
      after = ''
      '';
    };
  };
}
