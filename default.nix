let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/57d79f6095a820737c84a471e35799413b10a65e.tar.gz") {};
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
