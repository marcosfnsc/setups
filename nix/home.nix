{ pkgs, unstablePkgs, ... }:

{
  home.username = "marcos";
  home.homeDirectory = "/home/marcos";
  home.stateVersion = "25.05";
  home.enableNixpkgsReleaseCheck = false;

  home.packages = [
    #pkgs.curl
    #pkgs.git
    #pkgs.less
    #pkgs.qbittorrent
    #pkgs.ripgrep
    #pkgs.rsync
    #pkgs.usbutils # for get the lsusb command
    #pkgs.zsh
    pkgs.android-tools
    pkgs.dive
    pkgs.eza
    pkgs.htop
    pkgs.jq
    pkgs.lsof
    pkgs.ncdu
    pkgs.neofetch
    pkgs.nixd
    pkgs.shellcheck
    pkgs.tinyxxd
    pkgs.tree
    pkgs.yt-dlp
    unstablePkgs.nmap
    unstablePkgs.rclone
    unstablePkgs.skim
    unstablePkgs.tmux
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
