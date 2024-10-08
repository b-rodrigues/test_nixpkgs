let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/812fef336e2c1eacccba4e893e0338e65adb3e21.tar.gz") {};

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
