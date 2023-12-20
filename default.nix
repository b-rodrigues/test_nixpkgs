let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/03ba137ae564eed4c8517bb66187d79687ff19eb.tar.gz") {};
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
