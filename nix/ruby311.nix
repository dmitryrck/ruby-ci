# build with:
# ```
# nix-build ruby311.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby311";
  version = "3.1.1";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.1.tar.gz";
    sha256 = "fe6e4782de97443978ddba8ba4be38d222aa24dc3e3f02a6a8e7701c0eeb619d";
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
