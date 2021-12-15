with import <nixpkgs> {};
let nix-convert = pkgs.writeShellScriptBin ''nix-convert'' ''nix-shell -p nodePackages.node2nix --command "node2nix -i ./node-packages.json -o ./node-packages.nix"'';

in stdenv.mkDerivation {
    name = "nodeNix";
    buildInputs = [
        nix-convert
    ];
}
