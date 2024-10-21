let
 pkgs = import (fetchTarball "https://github.com/rstats-on-nix/nixpkgs/archive/refs/heads/2022-01-16.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) later;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ system_packages r_pkgs ];
    
}
