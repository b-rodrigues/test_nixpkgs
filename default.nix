let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/1f1623bc18b9f946c0dcb7e0bd0d529c6909ccb5.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto pandoc rstudio;
};
in
 pkgs.mkShell {
   buildInputs = [  rpkgs system_packages  ];
     shellHook = ''
       quarto check
     '';
}
