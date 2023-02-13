{
  stdenv
, fetchFromGitHub
, libX11
, libXft
, libXext
, libXinerama
, ...
} @args:

stdenv.mkDerivation rec {
    pname = "dwm";
    version = "6.4";

    src = fetchFromGitHub ({
        owner = "corona09";
        repo = "dwm";
        rev = "d5fa522a587bfc92cba84123aa3db2550dcb8287";
        fetchSubmodules = false;
        sha256 = "sha256-w/NVU1H6LSPe8PU/JPHQfOFVnsrwUVLBejjuTomVzzQ=";
    });

    buildInputs = [
        libX11 libXft libXext libXinerama
    ];

    prePatch = ''
        sed -i "s@/usr/local/bin@$out/bin@" config.mk
        sed -i "s@/usr/local@$out@" config.mk
        patch < ${./fix-makefile.diff}
        '';

    makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" ];

    # preInstall = ''
    #     mkdir -p $out/scripts
    #     '';
    postInstall = ''
        cp -f scripts/xbrightness.sh $out/bin/xbrightness.sh
        cp -f scripts/xgetcolortemp.sh $out/bin/xgetcolortemp.sh
        chmod +x $out/bin/*
        '';
}
