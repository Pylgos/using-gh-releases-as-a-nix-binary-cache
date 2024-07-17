{
  nixConfig = {
    extra-substituters = [ "https://pylgos.github.io/using-gh-releases-as-a-nix-binary-cache/" ];
    # extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.05";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux = {
        test = pkgs.stdenv.mkDerivation {
          name = "test";
          unpackPhase = "true";
          installPhase = ''
            mkdir -p $out/bin
            echo "echo 'Hello, world!'" > $out/bin/hello
            chmod +x $out/bin/hello
          '';
        };
      };
    };
}