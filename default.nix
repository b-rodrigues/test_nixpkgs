let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/7a9965e3a22671a815b6ee6bb1fbf6f039a4bb06.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto pandoc;
};
in
 pkgs.mkShell {
   buildInputs = [  rpkgs system_packages  ];
     shellHook = ''
       quarto check
     '';
}
