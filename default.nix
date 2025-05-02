let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/46bcd5008614c3128bd2482dc8d8d7aad04a5235.tar.gz") {};

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
