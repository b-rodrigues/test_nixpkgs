let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/069077c3797516a781580f4685f4326d0f1f53d9.tar.gz") {};

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
