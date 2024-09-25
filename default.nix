let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/189e5f171b163feb7791a9118afa778d9a1db81f.tar.gz") {};

 terra = pkgs.rPackages.terra.overrideAttrs (attrs: {
                configureFlags = [
                    "--with-proj-lib=${pkgs.lib.getLib pkgs.proj}/lib"
                ];
            });

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
   buildInputs = [ rpkgs system_packages tex terra ];
     shellHook = ''
       quarto check
       quarto render hello.qmd
       quarto render hello_typst.qmd
     '';
}
