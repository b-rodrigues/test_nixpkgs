let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/archive/9fe18e9dc8929b073d38bc63be4201f9514992d2.tar.gz") {};

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
