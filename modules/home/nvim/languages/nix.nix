{
  programs.nvf.settings.vim.languages.nix = {
    enable = true;
    format.enable = true;
    extraDiagnostics.enable = true;
    lsp = {
      enable = true;
      server = "nixd";
    };
    treesitter.enable = true;
  };
}
