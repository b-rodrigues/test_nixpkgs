let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/c09dcac8b6cc9e660169aeb76429f165b7eeb103.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto pandoc typst;
};
in
 pkgs.mkShell {
   buildInputs = [  rpkgs system_packages  ];
     shellHook = ''
       quarto check
     '';
}
