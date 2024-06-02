let
 pkgs = import (fetchTarball "https://github.com/b-rodrigues/nixpkgs/commit/e3f6e7a8ee005e4b3f9e8446d1958cf983a8f672") {};
 terra = pkgs.rPackages.terra.overrideAttrs (attrs: {
  # buildInputs = attrs.buildInputs ++ pkgs.lib.optional pkgs.stdenv.isDarwin [ pkgs.curl.dev pkgs.libtiff ];
   configureFlags = [
        "--with-proj-lib=${pkgs.lib.getLib pkgs.proj}/lib"
      ];
 });
 system_packages = builtins.attrValues {
   inherit (pkgs) R openbugs;
};
in
 pkgs.mkShell {
   buildInputs = [ terra system_packages ];
}
