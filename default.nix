let
 # end may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e7f619c49b26a25f8c86fd8e6fc7bcfe8eb3ee76.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) rJava;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ system_packages r_pkgs ];
    
}
