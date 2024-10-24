let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/fd1829b6fc9acc7d5133f2c20ae3ca61e3d66ec2.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) sf;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
