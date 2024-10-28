let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/9a88197fe7825f486052e3a9eca4a68192335978.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) AER;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ r_pkgs system_packages ];
    
}
