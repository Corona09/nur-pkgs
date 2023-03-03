{ stdenv, python3, libime, ...}:

stdenv.mkDerivation rec {
    pname = "fcitx5-pinyin-personal";
    version = "20230207";

    src = ./src;

    dontUnpack = true;
    dontConfigure = true;
    dontBuild = true;

    nativeBuildInputs = [ python3 libime ];

    installPhase = ''
        python $src/make_dict_file.py $src/personal-emoji.text   > emoji.txt
        python $src/make_dict_file.py $src/personal-phrases.text > phrases.txt
        libime_pinyindict emoji.txt   emoji.dict
        libime_pinyindict phrases.txt phrases.dict
        install -D -m644 emoji.dict   $out/share/fcitx5/pinyin/dictionaries/emoji.dict
        install -D -m644 phrases.dict $out/share/fcitx5/pinyin/dictionaries/phrases.dict
        '';
}
