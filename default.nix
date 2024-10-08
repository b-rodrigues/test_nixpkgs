let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/b1a7f21c1ecca85ac7dad0cc2f4d0f480f35968a.tar.gz") {};

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
