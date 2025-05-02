let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/8a8ad47bed7301195c77b0eaa240095871ea04fd.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto reticulate;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto typst python312Full;
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
