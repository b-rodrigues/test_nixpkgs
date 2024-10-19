let
 # July 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/be948cdf737fec2f1d69ff721da2c0bd2232bb46.tar.gz") {};

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
