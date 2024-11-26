# build with:
# ```
# nix-build ruby336.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby336";
  version = "3.3.6";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.6.tar.gz";
    sha256 = "8dc48fffaf270f86f1019053f28e51e4da4cce32a36760a0603a9aee67d7fd8d";
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
