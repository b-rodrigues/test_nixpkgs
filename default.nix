let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/heads/master.tar.gz") {};
 rpkgs = builtins.attrValues {
   inherit (pkgs.rPackages) terra;
};
 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ rpkgs system_packages ];
}
