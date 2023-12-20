let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/123bd723cfd9e90c3fced89fc228445a5fac3368.tar.gz") {};
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
