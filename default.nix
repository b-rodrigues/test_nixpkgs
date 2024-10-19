let
 # early 22 may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/29750d369c0a6bbce1b4f57b4a6f63da06a31390.tar.gz") {};

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
