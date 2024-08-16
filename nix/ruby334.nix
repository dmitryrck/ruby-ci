# build with:
# ```
# nix-build ruby334.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby334";
  version = "3.3.4";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.4.tar.gz";
    sha256 = "fe6a30f97d54e029768f2ddf4923699c416cdbc3a6e96db3e2d5716c7db96a34";
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
