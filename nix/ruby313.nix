# build with:
# ```
# nix-build ruby313.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby313";
  version = "3.1.3";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.3.tar.gz";
    sha256 = "5ea498a35f4cd15875200a52dde42b6eb179e1264e17d78732c3a57cd1c6ab9e";
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
