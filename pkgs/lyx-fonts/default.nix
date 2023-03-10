{
  stdenv
, fetchurl
, ...
} @args:

stdenv.mkDerivation rec {
    pname = "lyx-fonts";
    version = "1.0";

    cmb10 = fetchurl({
        url = "https://mirror.mwt.me/ctan/fonts/cm/ps-type1/bakoma/ttf/cmb10.ttf";
        sha256 = "sha256-B0SXtQxD6ldZcYFZH5iT04/BKofpUQT1ZX/CSB9hojo=";
    });

    cmbsy10 = fetchurl({
        url = "https://mirror.mwt.me/ctan/fonts/cm/ps-type1/bakoma/ttf/cmbsy10.ttf";
        sha256 = "sha256-nE2a9j3RC0rqY1W9gO0xbIAi2K3ljvGnQX/h2HWgrrk=";
    });

    cmbx10 = fetchurl({
        url = "https://mirror.mwt.me/ctan/fonts/cm/ps-type1/bakoma/ttf/cmbx10.ttf";
        sha256 = "sha256-hLd0GDzTisroAnWkQQEFVWwJikVeJliNEdkT6bFxj5g=";
    });

    cmex10 = fetchurl({
        url = "http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/cmex10.ttf";
        sha256 = "sha256-ryjwwXByOsd2pxv6WVrKCemNFa5cPVTOGa/VYZyWqQU=";
    });

    cmmi10 = fetchurl({
        url = "http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/cmmi10.ttf";
        sha256 = "sha256-MJKWW4gR/WpnZXmWZIRRgfwd0TMLk3+RWAjEhdMWI00=";
    });

    cmr10 = fetchurl({
        url = "http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/cmr10.ttf";
        sha256 = "sha256-Tdl2GwWMAJ25shRfVe5mF9CTwnPdPWxbPkP/YRD6m/Y=";
    });

    eufm10 = fetchurl({
        url = "http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/eufm10.ttf";
        sha256 = "sha256-W4JU5xnfNA+V7VBl4d+g9NWLGIKMHdfO9gSScb3iZ3Y=";
    });

    msam10 = fetchurl({
        url = "http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/msam10.ttf";
        sha256 = "sha256-Za7JlwCDr0Z14ehD6JEA8xhBEzAy2Y9SVqgEXq3qSbQ=";
    }); 

    msbm10 = fetchurl({
        url = "http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/msbm10.ttf";
        sha256 = "sha256-RRrUA9BaJF0yhiOI7W4kxQB//WOcKC4ku68DRMH07wY=";
    });

    cmsy10 = fetchurl({
        url = "http://mirrors.ctan.org/fonts/cm/ps-type1/bakoma/ttf/cmsy10.ttf";
        sha256 = "sha256-uyJu2TLz8QDNDlL15JEu5VO0G2nnv9uNOFTbDrZgUjI=";
    });

    esint10 = fetchurl({
        url = "https://github.com/byrongibson/fonts/raw/master/truetype/ttf-lyx/esint10.ttf";
        sha256 = "sha256-r1txXRUGgDGfbbkNaCUH2gzpY3NFg0Epo2oeKiBRiWo=";
    });

    rsfs10 = fetchurl({
        url = "https://github.com/byrongibson/fonts/raw/master/truetype/ttf-lyx/rsfs10.ttf";
        sha256 = "sha256-A2HiIgYNScgZek5QnitvdK5u4T/DC2WqYrPEDwSRXKI=";
    });

    wasy10 = fetchurl({
        url = "https://github.com/byrongibson/fonts/raw/master/truetype/ttf-lyx/wasy10.ttf";
        sha256 = "sha256-Ioje0sQdHI/rUNjKgHjgzcJ6jafkJXmwsB8mZ/3JRPw=";
    });

    dontUnpack = true;

    installPhase = ''
        install -Dm644 $cmb10   $out/share/fonts/cmb10.ttf
        install -Dm644 $cmbsy10 $out/share/fonts/cmbsy10.ttf
        install -Dm644 $cmbx10  $out/share/fonts/cmbx10.ttf
        install -Dm644 $cmex10  $out/share/fonts/cmex10.ttf
        install -Dm644 $cmmi10  $out/share/fonts/cmmi10.ttf
        install -Dm644 $cmr10   $out/share/fonts/cmr10.ttf
        install -Dm644 $eufm10  $out/share/fonts/eufm10.ttf
        install -Dm644 $msam10  $out/share/fonts/msam10.ttf
        install -Dm644 $msbm10  $out/share/fonts/msbm10.ttf
        install -Dm644 $cmsy10  $out/share/fonts/cmsy10.ttf
        install -Dm644 $esint10 $out/share/fonts/esint10.ttf
        install -Dm644 $rsfs10  $out/share/fonts/rsfs10.ttf
        install -Dm644 $wasy10  $out/share/fonts/wasy10.ttf
        '';

}
