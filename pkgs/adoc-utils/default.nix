{
  stdenv
, fetchurl
, fetchzip
, ...
} @args:

stdenv.mkDerivation rec {
    pname = "adoc-utils";
    version = "1.0";

    lxgwhei = fetchurl({
        url = "https://github.com/lxgw/LxgwNeoXiHei/releases/download/v1.007/LXGWNeoXiHei.ttf";
        sha256 = "sha256-ChYpRCw8DAo8bo6fJ+5LyF+FGmER+4nY2aEx1GIROdU=";
    });

    lxgwkailight = fetchurl({
        url = "https://github.com/lxgw/LxgwWenKai/releases/download/v1.250/LXGWWenKai-Light.ttf";
        sha256 = "sha256-BALU3/InersprS1WIrYGTxIiqRi955ZWCAef+6n1ytI=";
    });

    lxgwkaibold = fetchurl({
        url = "https://github.com/lxgw/LxgwWenKai/releases/download/v1.250/LXGWWenKai-Bold.ttf";
        sha256 = "sha256-GVeL1pdc1xgwZqrr6G2iHJWSjUyXhq5pdPI3pmDcpi0=";
    });

    lxgwmonolight = fetchurl({
        url = "https://github.com/lxgw/LxgwWenKai/releases/download/v1.250/LXGWWenKaiMono-Light.ttf";
        sha256 = "sha256-Q6eM7PoLtUuZ97MNivn52Cvqby8IulmNZNLIfmQVy9g=";
    });

    lxgwmonobold = fetchurl({
        url = "https://github.com/lxgw/LxgwWenKai/releases/download/v1.250/LXGWWenKaiMono-Bold.ttf";
        sha256 = "sha256-NuDFveWWfDCZ2sTP8TcBgNnQ2Mdse5yLsY9OGGYQHSM=";
    });

    smileysans = fetchzip {
        url = "https://github.com/atelier-anchor/smiley-sans/releases/download/v1.1.1/smiley-sans-v1.1.1.zip";
        sha256 = "sha256-/lsAZRHgmx1TMjm2O5Z0IOiHQM8LKJPXcBKZrlXt3RA=";
        stripRoot = false;
    };

    dontUnpack = true;
    dontBuild = true;

    installPhase = ''
        install -Dm644 $lxgwhei       $out/fonts/LXGWNeoXiHei.ttf
        install -Dm644 $lxgwkailight  $out/fonts/LXGWWenKai-Light.ttf
        install -Dm644 $lxgwkaibold   $out/fonts/LXGWWenKai-Bold.ttf
        install -Dm644 $lxgwmonolight $out/fonts/LXGWWenKaiMono-Light.ttf
        install -Dm644 $lxgwmonobold  $out/fonts/LXGWWenKaiMono-Bold.ttf
        install -Dm644 $smileysans/SmileySans-Oblique.ttf $out/fonts/SmileySans-Oblique.ttf
        install -Dm644 ${./src/theme.yml}   $out/theme/theme.yml
        install -Dm755 ${./src/adoc2pdf.sh} $out/bin/adoc2pdf
        sed -i "s@<out>@$out@g" $out/bin/adoc2pdf
        '';
}
