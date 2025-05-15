{ config, pkgs, ... }:

{
  home.username = "marcos";
  home.homeDirectory = "/home/marcos";
  home.stateVersion = "24.11";

  home.packages = [
    #pkgs.curl
    #pkgs.rsync
    pkgs.htop
    pkgs.rclone
    pkgs.neofetch
    pkgs.nmap
    pkgs.tmux
    pkgs.yt-dlp
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
