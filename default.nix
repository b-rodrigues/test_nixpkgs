let
 # march 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/a4d921be21135b13ce6c775d08d4bf6f5df37528.tar.gz") {};

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
