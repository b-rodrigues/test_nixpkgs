let
 # 24 may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/465a7f1ef101d4241f5416ef9968ec3f4de5d53a.tar.gz") {};

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
