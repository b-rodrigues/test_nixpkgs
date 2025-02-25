let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/f11263d6948953a83df38e232ddf773bc5d4470f.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto typst;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
   shellHook = ''
       quarto check
       quarto render hello.qmd
       quarto render hello_typst.qmd
     '';
}
