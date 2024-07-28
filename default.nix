let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/0fdaa290cd90b18bf6877c36cef53241b3396d5d.tar.gz") {};
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
       R -e 'kind <- "cpu-intel";version <- available.packages()["torch","Version"];options(repos = c(torch = sprintf("https://torch-cdn.mlverse.org/packages/%s/%s/", kind, version),CRAN = "https://cloud.r-project.org"));install.packages("torch", type = "binary")'
       quarto check
       quarto render hello.qmd
       quarto render hello_typst.qmd
     '';
}
