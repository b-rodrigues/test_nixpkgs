let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/f074c0b02af937bc839f0e4648a3cdfbb5f34452.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) ChemmineOB;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
