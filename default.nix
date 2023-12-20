let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/62f498db8121f7349a96d1c547dbdb07fb4c192b.tar.gz") {};
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
