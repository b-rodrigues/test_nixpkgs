let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d74f0ecb14965cde6de0a0718509337ddac9058d.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) vapour sf terra;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ system_packages r_pkgs ];
    
}
