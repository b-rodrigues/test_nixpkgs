let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/acab8c7bedaa1773d2f7bf7b5705dfae9ff5a602.tar.gz") {};

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
