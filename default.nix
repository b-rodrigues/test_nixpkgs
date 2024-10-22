let
 pkgs = import (fetchTarball "https://github.com/Kupac/nixpkgs/archive/8becdcf6cc94892310f11b0e26caa5fb36b546b8.tar.gz") {};

# r_pkgs = builtins.attrValues {
#   inherit (pkgs.rPackages) later;
#};

# system_packages = builtins.attrValues {
#   inherit (pkgs) R;
#};
in
 pkgs.mkShell {
   buildInputs = [ quantlib ];
    
}
