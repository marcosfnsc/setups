{ pkgs ? import <nixpkgs> { }
, pkgsLinux ? import <nixpkgs> { system = "x86_64-linux"; }
}:

pkgs.dockerTools.buildImage {
  name = "test_nvim";
  tag = "latest";

  copyToRoot = pkgs.buildEnv {
    name = "test_nvim";
    paths = [
      pkgs.bash
      pkgs.cacert
      pkgs.coreutils
      pkgs.curl
      pkgs.gcc
      pkgs.git
      pkgs.gnutar
      pkgs.gzip
      pkgs.neovim
      pkgs.nodejs
      pkgs.ripgrep
    ];
  };

  config = {
    workingDir = "/test";
    Env = [
      "SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt"
    ];
    Cmd = [ "${pkgs.bash}/bin/bash" "-c" "bash setup_nvim.sh && sleep infinity" ];
  };
}
