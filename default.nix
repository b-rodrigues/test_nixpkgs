let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/189e5f171b163feb7791a9118afa778d9a1db81f.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) quarto reticulate terra;
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
