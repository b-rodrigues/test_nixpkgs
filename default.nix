let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/85ea82a3d5140de0361a6c311cf12c2e04fd7183.tar.gz") {};
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
