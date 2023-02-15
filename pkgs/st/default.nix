{
  stdenv
, fetchFromGitHub
, libX11
, libXft
, libXext
, libXinerama
, libXrender
, harfbuzz
, pkg-config
, ...
} @args:

stdenv.mkDerivation rec {
    pname = "st";
    version = "9.0";

    src = fetchFromGitHub ({
        owner = "corona09";
        repo = "st";
        rev = "8e16963aceb537fc274357f505bd575150636db7";
        fetchSubmodules = false;
        sha256 = "sha256-lRrbZExiNyfCNuPmxCU00N6CSLCZr27xbtIz9TH2aLc=";
    });

    nativeBuildInputs = [
        libX11 libXft libXrender harfbuzz
        pkg-config
    ];

    enableParallelBuilding = true;

    postPatch = ''
        sed -i "s@/usr/local@$out@" config.mk
        sed -i "s/tic.*//" Makefile
        '';

    installPhase = ''
        make install
        install -D -m644 ${./st.desktop} $out/share/applications/st-256color.desktop
        install -D -m644 ${./st.svg} $out/share/icons/hicolor/scalable/apps/st.svg
        '';
}
