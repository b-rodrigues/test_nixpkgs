let
 pkgs = import (fetchTarball "https://github.com/LeSuisse/nixpkgs/archive/be27a92e35a6b8ddcb9272aa1841e7cfdd9beacf.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto reticulate;
};
 tex = (pkgs.texlive.combine {
   inherit (pkgs.texlive) scheme-small amsmath;
});
 system_packages = builtins.attrValues {
   inherit (pkgs) R quarto pandoc typst;
};
in
 pkgs.mkShell {
   buildInputs = [ rpkgs system_packages tex];
     shellHook = ''
       quarto check
       quarto render hello.qmd
       quarto render hello_typst.qmd
     '';
}
