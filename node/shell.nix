with import <nixpkgs> {};
let nodeNix = import ~/Arcane/_n/node/default.nix {};
    nix-convert = pkgs.writeShellScriptBin ''nix-convert'' ''nix-shell -p nodePackages.node2nix --command "node2nix -i ./node-packages.json -o ./node-packages.nix"'';

in stdenv.mkDerivation {
    name = "nodeNix";
    buildInputs = [
        nodeNix.typescript
        nodeNix.typescript-language-server
        nodeNix.emmet-ls
        nodeNix.prettier
        nodeNix.eslint
        nix-convert
    ];
}
