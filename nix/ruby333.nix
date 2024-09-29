# build with:
# ```
# nix-build ruby334.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby333";
  version = "3.3.3";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.3.tar.gz";
    sha256 = "83c05b2177ee9c335b631b29b8c077b4770166d02fa527f3a9f6a40d13f3cce2";
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
