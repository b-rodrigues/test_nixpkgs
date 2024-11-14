let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/1237e5f35dd5d755f2e0279954099fc6af6e3346.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) rJava withr;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
