let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/94245a69cc83d0f98edbe919778f34c32ad840cf.tar.gz") {};
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
