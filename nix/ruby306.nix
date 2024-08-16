# build with:
# ```
# nix-build ruby306.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby306";
  version = "3.0.6";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.6.tar.gz";
    sha256 = "6e6cbd490030d7910c0ff20edefab4294dfcd1046f0f8f47f78b597987ac683e";
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
    ln -s /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Security.framework/Versions/A/Headers/ Security
    export LDFLAGS=-I$(pwd)/Security
    ./configure --prefix=$out --disable-install-doc --disable-install-rdoc
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';
}
