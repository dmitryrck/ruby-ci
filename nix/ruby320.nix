# build with:
# ```
# nix-build ruby320.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby320";
  version = "3.2.0";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.2/ruby-3.2.0.tar.gz";
    sha256 = "daaa78e1360b2783f98deeceb677ad900f3a36c0ffa6e2b6b19090be77abc272";
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
