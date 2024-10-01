{ pkgs, ... }:
let
  toLua = str: ''
    lua << EOF
    ${str}
    EOF
  '';
  toLuaFile = file: ''
    lua << EOF
    ${builtins.readFile file}
    EOF
  '';
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      { plugin = catppuccin-nvim; }
      { plugin = cmp-buffer; }
      { plugin = cmp-path; }
      {
        plugin = nvim-cmp;
        config = toLuaFile ./nvim/cmp.lua;
      }
      { plugin = cmp-nvim-lsp; }
      {
        plugin = conform-nvim;
        config = toLuaFile ./nvim/conform.lua;
      }
      {
        plugin = mini-nvim;
        config = toLuaFile ./nvim/mini.lua;
      }
      {
        plugin = nvim-autopairs;
        config = toLua "require('nvim-autopairs').setup()";
      }
      {
        plugin = nvim-ts-autotag;
        config = toLua "require('nvim-ts-autotag').setup()";
      }
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./nvim/lsp.lua;
      }
      { plugin = plenary-nvim; }
      { plugin = rest-nvim; }
      {
        plugin = telescope-nvim;
        config = toLuaFile ./nvim/telescope.lua;
      }
      {
        plugin = toggleterm-nvim;
        config = toLua "require('toggleterm').setup()";
      }
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-bash
        p.tree-sitter-go
        p.tree-sitter-gotmpl
        p.tree-sitter-html
        p.tree-sitter-javascript
        p.tree-sitter-json
        p.tree-sitter-lua
        p.tree-sitter-markdown
        p.tree-sitter-nix
        p.tree-sitter-python
        p.tree-sitter-ruby
        p.tree-sitter-sql
        p.tree-sitter-terraform
        p.tree-sitter-typescript
        p.tree-sitter-vim
        p.tree-sitter-yaml
      ]))
    ];
    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/mappings.lua}
      ${builtins.readFile ./nvim/treesitter.lua}
      ${builtins.readFile ./nvim/whitespaces.lua}
    '';
    extraPackages = with pkgs; [
      lua-language-server
      nil
      nixfmt-classic
      nixpkgs-fmt
      vscode-langservers-extracted
      stylua
    ];
  };
}