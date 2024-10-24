let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/tree/master.tar.gz") {};

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
