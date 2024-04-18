let
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/heads/master.tar.gz") {};
 terra = pkgs.rPackages.terra.overrideAttrs (attrs: {
   buildInputs = attrs.buildInputs ++ pkgs.lib.optional pkgs.stdenv.isDarwin [ pkgs.curl.dev pkgs.libtiff ];
   configureFlags = [
        "--with-proj-lib=${lib.getLib pkgs.proj}/lib"
      ];
 });
 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ terra system_packages ];
}
