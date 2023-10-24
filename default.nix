let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/bcbe587526652810ed5d6f0c8896bf42df6f52dc.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto pandoc;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto;
};
in
 pkgs.mkShell {
   buildInputs = [  rpkgs system_packages  ];
     shellHook = ''
       quarto check
     '';
}
