let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/cba4bff5c69aaec62b9339a5027d9bd845e660cd.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) lwgeom;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
