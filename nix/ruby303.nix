# build with:
# ```
# nix-build ruby303.nix
# ```

{ pkgs ? import <nixpkgs> {} }:
with import <nixpkgs> {};

pkgs.stdenv.mkDerivation {
  name = "ruby303";
  version = "3.0.3";

  src = pkgs.fetchurl {
    url = "https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.3.tar.gz";
    sha256 = "3586861cb2df56970287f0fd83f274bd92058872d830d15570b36def7f1a92ac";
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
    #ln -s /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk
    export LDFLAGS="-I$(pwd)/Security -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
    ./configure --prefix=$out --disable-install-doc --disable-install-rdoc
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';
}
