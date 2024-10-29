let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/e4d4a1bc24025e1b9f0c7c3107871649277abf60.tar.gz") {};

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
