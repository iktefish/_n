with import <nixpkgs> {};
let 
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
  pkgsUnstable = import unstableTarball {};
  nodeNix = import ~/Arcane/_n/node/default.nix {};
  nix-convert = pkgs.writeShellScriptBin ''nix-convert'' ''nix-shell -p nodePackages.node2nix --command "node2nix -i ./node-packages.json -o ./node-packages.nix"'';

in stdenv.mkDerivation {
  name = "nodeNix";
  buildInputs = with pkgsUnstable; [
    nodeNix.typescript
    nodeNix.typescript-language-server
    nodeNix.emmet-ls
    nodeNix.prettier
    nodeNix.eslint
    nix-convert
  ];
}
