let
 # june 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7708f1e48c77d663659b4b961f5976376820293f.tar.gz") {};

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
