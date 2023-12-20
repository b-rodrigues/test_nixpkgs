let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/d66f51d9db7d9e0cf88a5ec8af6dde8d0da85df7.tar.gz") {};
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
