{ pkgs }:
pkgs.stdenv.makeDerivation {
  name = "sugar-dark";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "";
    sha256 = "";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}