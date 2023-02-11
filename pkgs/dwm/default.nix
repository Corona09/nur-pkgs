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
        rev = "ea5bf97c8d9128a3229546944b9d1936d7581aa4";
        fetchSubmodules = false;
        sha256 = "sha256-HH40niT65gqaRAhQN8TyhTvwk+kx+Bn3i6YyVVDXGvk=";
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
