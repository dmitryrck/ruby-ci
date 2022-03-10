# build with:
# ```
# nix-build ruby266.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby266";
  version = "2.6.6";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.6.tar.gz";
    sha256 = "364b143def360bac1b74eb56ed60b1a0dca6439b00157ae11ff77d5cd2e92291";
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
