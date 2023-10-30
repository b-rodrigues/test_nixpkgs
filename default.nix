let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/51bca353242eecbb5537907e16d0dfc9b66fb231.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto pandoc;
};
in
 pkgs.mkShell {
   buildInputs = [  rpkgs system_packages  ];
     shellHook = ''
       quarto check
     '';
}
