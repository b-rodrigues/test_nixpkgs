let
 # 22 may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/eb8c029c9c7c61c4ea3c7b1ee0b6d45b1ad9e282.tar.gz") {};

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
