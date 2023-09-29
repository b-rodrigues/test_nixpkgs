let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/4083f8ca94ccaff6ec16e38415bc04b953ac6bc6.tar.gz") {};
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
