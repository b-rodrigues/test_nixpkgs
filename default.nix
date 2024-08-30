let
 pkgs = import (fetchTarball "https://github.com/r-ryantm/nixpkgs/archive/d5822adf5ba569f79e982dd9296675d82cd9d149.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto reticulate torch;
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
