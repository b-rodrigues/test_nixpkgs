let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/ff2a3e92a872d97c76899dd0ba250c1dcc913e6b.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto;
};
in
 pkgs.mkShell {
   buildInputs = [  rpkgs system_packages  ];
     shellHook = ''
       quarto check
     '';
}
