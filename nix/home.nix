{ pkgs, unstablePkgs, pkgs_neofetch, ... }:

{
  home.username = "marcos";
  home.homeDirectory = "/home/marcos";
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;

  home.packages = [
    #pkgs.usbutils # for get the lsusb command
    pkgs.android-tools
    pkgs.curl
    pkgs.dive
    pkgs.eza
    pkgs.htop
    pkgs.jq
    pkgs.less
    pkgs.lsof
    pkgs.ncdu
    pkgs.nodejs
    pkgs.qbittorrent
    pkgs.ripgrep
    pkgs.rsync
    pkgs.shellcheck
    pkgs.tinyxxd
    pkgs.tree
    pkgs.zsh
    pkgs_neofetch.neofetch
    unstablePkgs.git
    unstablePkgs.kdePackages.kate
    unstablePkgs.kdePackages.okular
    unstablePkgs.keepassxc
    unstablePkgs.neovim
    unstablePkgs.nmap
    unstablePkgs.rclone
    unstablePkgs.ripgrep-all
    unstablePkgs.skim
    unstablePkgs.tmux
    unstablePkgs.vlc
    unstablePkgs.yay
    unstablePkgs.yt-dlp
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
