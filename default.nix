let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/6919a0a7295a6795c9ac0e20ec434b747fdba217.tar.gz") {};
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
