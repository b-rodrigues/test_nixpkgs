let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/f11263d6948953a83df38e232ddf773bc5d4470f.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) rJava xlsx withr;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
