let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/491d6f78adbc0970f86ac982bb368578474adb93.tar.gz") {};
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
