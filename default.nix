let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/5a9439f74a50196f3cf256d9af176b202a3880ca.tar.gz") {};
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
