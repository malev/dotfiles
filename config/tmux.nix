{config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
    ];
    extraConfig = ''
      set -g mouse on

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on
    '';
  };
}