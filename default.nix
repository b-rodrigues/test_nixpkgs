let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/1d8f13b2823c3d772194e12e9ed6d46ef7b30f8e.tar.gz") {};

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
