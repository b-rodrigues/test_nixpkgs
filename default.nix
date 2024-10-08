let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/4a7acc1a9a84fb2283de6a1b2149ed404ac2c68e.tar.gz") {};

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
