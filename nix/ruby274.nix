# build with:
# ```
# nix-build ruby272.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby274";
  version = "2.7.4";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.4.tar.gz";
    sha256 = "3043099089608859fc8cce7f9fdccaa1f53a462457e3838ec3b25a7d609fbc5b";
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
