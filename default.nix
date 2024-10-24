let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7bcfaeb21d57b8b926432bf017a94f030fbb2df8.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) sf;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
