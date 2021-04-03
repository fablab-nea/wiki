let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};

  inherit (pkgs) lib;
in
pkgs.stdenvNoCC.mkDerivation {
  name = "fablab-nea-wiki";

  src = builtins.path {
    name = "fablab-nea-wiki-src";
    path = ./.;
    filter = path: type: let
      relPath = lib.removePrefix (toString ./.) path;
    in
    (lib.hasPrefix "/src" relPath
      || lib.hasPrefix "/assets" relPath
      || relPath == "/book.toml");
  };

  nativeBuildInputs = with pkgs; [
    mdbook
  ];

  buildPhase = "mdbook build -d $out";

  dontInstall = true;
}
