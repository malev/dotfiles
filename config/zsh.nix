{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    defaultKeymap = "emacs";
    # history.append = true;
    history.extended = true;
    history.ignoreDups = true;
    history.ignoreAllDups = true;
    history.ignoreSpace = true;
    history.share = true;
    history.size = 1000000;
    initExtra = ''
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      setopt hist_save_no_dups
      [[ ! -f ${./p10k.zsh} ]] || source ${./p10k.zsh}
    '';
    plugins = [
      {
        name = "powerlevel10k-config";
        src = ./p10k-config;
        file = "p10k.zsh";
      }
    ];
    shellAliases = {
      ll = "ls -l";
      ls = "ls --color=auto";
      gst = "git status";
      update = "sudo nixos-rebuild switch";
      hupdate = "home-manager switch";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "zsh-users/zsh-syntax-highlighting"; tags = [ as:theme depth:1 ]; }
        { name = "zsh-users/zsh-autosuggestions"; tags = [ as:theme depth:1 ]; }
        { name = "zsh-users/zsh-completions"; tags = [ as:theme depth:1 ]; }
      ];
    };
  };
}
