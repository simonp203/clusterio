{
  description = "Flake for clusterio";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    # importing package example
    # packages."x86_64-linux".default =
    #   pkgs.callPackage (import ./default.nix) {};

    devShells."x86_64-linux".default = pkgs.mkShell {
      packages = [pkgs.pnpm pkgs.nodejs];
    };
  };
}
