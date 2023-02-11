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
        rev = "0f8b677e127b1022cdbf2ff1bc9185fd481da6e1";
        fetchSubmodules = false;
        sha256 = "sha256-tVXp2nIR78ov8SrgYVlqbbkaIHx87lWXS0ukHBfC8g4=";
    });

    buildInputs = [
        libX11 libXft libXext libXinerama
    ];

    prePatch = ''
        sed -i "s@/usr/local/bin@$out/scripts@" config.mk
        sed -i "s@/usr/local@$out@" config.mk
        patch < ${./fix-makefile.diff}
        '';

    makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" ];

    preInstall = ''
        mkdir -p $out/scripts
        '';
    postInstall = ''
        cp -f scripts/xbrightness.sh $out/bin/xbrightness.sh
        cp -f scripts/xgetcolortemp.sh $out/bin/xgetcolortemp.sh
        chmod +x $out/bin/*
        '';
}
