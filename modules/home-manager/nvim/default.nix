{ pkgs, ... }:
{
  imports = [
    ./plugins/gitsigns.nix
    ./plugins/lsp.nix
    ./plugins/mini.nix
    ./plugins/nvim-cmp.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/which-key.nix
  ];

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
  };
}
