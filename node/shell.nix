with import <nixpkgs> { };
let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
  pkgsUnstable = import unstableTarball { };
  nix-convert = pkgs.writeShellScriptBin ''nix-convert'' ''node2nix -i ./node-packages.json -o ./node-packages.nix'';

in
stdenv.mkDerivation {
  name = "nodeNix";
  buildInputs = with pkgsUnstable; [
    nodejs
    nodePackages.node2nix
    nodePackages.vscode-langservers-extracted

    nix-convert
  ];
}
