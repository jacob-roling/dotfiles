{ stdenv, fetchFromGitHub, fwupd }:

stdenv.mkDerivation rec {
  pname = "framework-fingerprint-driver";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "FrameworkComputer";
    repo = "linux-docs";
    rev = "a0e70206f177c63ee4ca14f1f12b82efd4bb1ce5";
    sha256 = "1swpywyfj3gxbpc2fll2c78vabnv0ljx879qqjglkln9k4b81xba";
    name = "goodix-moc-609c-v01000330.cab";
  };

  nativeBuildInputs = [ fwupd ];

  unpackPhase = "";

  installPhase = ''
    sudo fwupdtool install --allow-reinstall --allow-older $src
  '';

  meta = with stdenv.lib; {
    description = "Framework 13th Gen Intel Laptop Fingerprint Reader Driver";
    maintainers = with maintainers; [ /* Add your username here */ ];
    platforms = platforms.linux;
  };
}