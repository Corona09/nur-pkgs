{ stdenv, lib, fetchurl,...}:

stdenv.mkDerivation rec {
    pname = "fcitx5-pinyin-moegirl";
    version = "20230114";

    src = fetchurl({
        url = "https://github.com/outloudvi/mw2fcitx/releases/download/20230214/moegirl.dict";
        sha256 = "sha256-JWe4Avae7cQ0u+Wj+lmtxberC+hD/0nwxPXl7LMzNi4=";
    });

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
        install -D -m644 $src $out/share/fcitx5/pinyin/dictionaries/moegirl.dict
        '';
}
