# build with:
# ```
# nix-build ruby272.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby272";
  version = "2.7.2";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.2.tar.gz";
    sha256 = "6e5706d0d4ee4e1e2f883db9d768586b4d06567debea353c796ec45e8321c3d4";
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
