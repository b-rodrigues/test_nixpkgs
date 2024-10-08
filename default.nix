let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/a289e7bb3f535259c0542c6b755ca8447eb86df4.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) sf terra;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ system_packages r_pkgs ];
    
}
