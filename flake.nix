{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    let
      makeGuileBits =
        pkgs:
        pkgs.stdenv.mkDerivation {
          name = "guile-bits";
          src = builtins.path {
            path = ./.;
            name = "guile-bits-src";
          };
          nativeBuildInputs = with pkgs; [
            autoreconfHook
            pkg-config
          ];
          buildInputs = with pkgs; [ guile ];
        };
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.guile-bits = makeGuileBits pkgs;
        packages.default = self.packages.${system}.guile-bits;
      }
    );
}
