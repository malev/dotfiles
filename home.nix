{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "24.05";
    username = "marcosvanetta";
    homeDirectory = "/Users/marcosvanetta";
    packages = with pkgs; [
      alacritty
      fzf
      git
      htop
      jq
      kubectl
      ripgrep
      tmux
      yazi
      unzip
      zip
      wezterm
      wget
    ];
    file.".config" = {
      source = ./config;
      recursive = true;
    };
    sessionVariables = { CLICOLOR = 1; };
  };
  imports = [
    ./config/fzf.nix
    ./config/git.nix
    ./config/nvim.nix
    ./config/tmux.nix
    ./config/zsh.nix
  ];
  programs.alacritty.enable = true;
  programs.home-manager.enable = true;
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()
      config.color_scheme = "catppuccino-macchiato"
      config.font_size = 15.0
      config.font = wezterm.font "JetBrains Mono"
      config.macos_window_background_blur = 30
      config.window_background_opacity = 1
      config.window_decorations = 'RESIZE'
      config.audible_bell = "Disabled"

      return config
    '';
  };
  programs.zsh.enable = true;
}
