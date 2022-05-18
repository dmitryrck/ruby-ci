# build with:
# ```
# nix-build ruby276.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby276";
  version = "2.7.6";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.6.tar.gz";
    sha256 = "e7203b0cc09442ed2c08936d483f8ac140ec1c72e37bb5c401646b7866cb5d10";
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
    ncurses
    groff
    libyaml
    libffi
    jemalloc
    bison
    libiconv
    libunwind
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
