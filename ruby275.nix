# build with:
# ```
# nix-build ruby.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby275";
  version = "2.7.5";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.5.tar.gz";
    sha256 = "2755b900a21235b443bb16dadd9032f784d4a88f143d852bc5d154f22b8781f1";
  };

  phases = [
    "unpackPhase"
    "configurePhase"
    "buildPhase"
    "installPhase"
  ];

  buildInputs = [
    openssl
    zlib
    readline
    gdbm
  ];

  unpackPhase = ''
    tar xfz $src -C /build
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
