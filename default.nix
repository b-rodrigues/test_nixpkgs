let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/189e5f171b163feb7791a9118afa778d9a1db81f.tar.gz") {};

 system_packages = builtins.attrValues {
   inherit (pkgs.rPackages) vapour sf terra;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ system_packages vapour sf terra ];
    
}
