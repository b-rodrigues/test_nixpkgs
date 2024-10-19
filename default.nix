let
 # mid may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/da7ccf3f63311da228604389a30d8e4ac151d99c.tar.gz") {};

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
