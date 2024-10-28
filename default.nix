let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/71eeb7ee567bc5655df5fd115e0c064b51c2b942.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) AER;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
