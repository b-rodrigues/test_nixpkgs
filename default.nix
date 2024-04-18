let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/heads/master.tar.gz") {};
 terra = old.pkgs.rPackages.terra.overrideAttrs (attrs: {
   buildInputs = attrs.buildInputs ++ lib.optional stdenv.isDarwin pkgs.libtiff;
 });
 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ terra system_packages ];
}
