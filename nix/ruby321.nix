# build with:
#
# nix-build ruby321.nix

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby321";
  version = "3.2.1";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.1.tar.gz";
    sha256 = "13d67901660ee3217dbd9dd56059346bd4212ce64a69c306ef52df64935f8dbd";
  };

  phases = [
    "unpackPhase"
    "configurePhase"
    "buildPhase"
    "installPhase"
  ];

  buildInputs = [
    autoconf
    gdbm
    libffi
    libyaml
    openssl
    readline
    zlib
  ];

  unpackPhase = ''
    tar xfz $src
  '';

  configurePhase = ''
    cd ruby-$version
    ./configure --prefix=$out --disable-install-doc --disable-install-rdoc
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';
}
