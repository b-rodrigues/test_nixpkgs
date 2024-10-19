let
 # 26 may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/2e0c027ee32a92e232da61e79ea517fa1b4cfbab.tar.gz") {};

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
