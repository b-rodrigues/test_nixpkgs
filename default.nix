let
 # 23 may 2022
 pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/fc3790f9952d21da3f3696ec2e3f03081704842a.tar.gz") {};

 r_pkgs = builtins.attrValues {
   inherit (pkgs.rPackages) rJava;
};

 system_packages = builtins.attrValues {
   inherit (pkgs) R;
};
in
 pkgs.mkShell {
   buildInputs = [ system_packages r_pkgs ];
    
}
