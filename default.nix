let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/92feb4fd1907886f9c834628e7f6ea70bbfbe7a0.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) later;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ pkgs.quantlib ];
    
}
