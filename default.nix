let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/29e315c4d057a67fe8d091f0d6231c2d813876e1.tar.gz") {};
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
       Rscript -e 'quarto::quarto_version()'
     '';
}
