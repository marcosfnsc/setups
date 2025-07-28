{ pkgs ? import <nixpkgs> { }
, pkgsLinux ? import <nixpkgs> { system = "x86_64-linux"; }
}:

pkgs.dockerTools.buildImage {
  name = "test_nvim";

  copyToRoot = pkgs.buildEnv {
    name = "test_nvim";
    paths = [
      pkgs.bash
        pkgs.curl
        pkgs.git
        pkgs.neovim
        pkgs.nodejs
        pkgs.ripgrep
    ];
  };


  config = {
    workingDir = "/data";
    Cmd = [ "${pkgs.bash}/bin/bash" "-c" "./setup_nvim.sh && sleep infinity" ];
  };
}
