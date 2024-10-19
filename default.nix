let
 # may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/52d66f5647136e39f47d9de68609ace307845c5c.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) rJava;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ system_packages r_pkgs ];
    
}
