let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/6dc63cc97db41013c20ee12265759ad1083b9d39.tar.gz") {};
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