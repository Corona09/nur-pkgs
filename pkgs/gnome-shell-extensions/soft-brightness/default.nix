{ pkgs
, lib
, stdenv
, fetchzip
,... }:
stdenv.mkDerivation rec {
    pname = "gnome-shell-extension-soft-brightness";
    version = "30";
    uuid = "soft-brightness@fifi.org";
    src = fetchzip {
        url = "https://extensions.gnome.org/extension-data/${
            builtins.replaceStrings [ "@" ] [ "" ] uuid
        }.v${builtins.toString version}.shell-extension.zip";
        sha256 = "sha256-NN353Ayydxh1FS77L6mdQcwik5zQqRVMsWiLdHEwBTU=";
        stripRoot = false;
    };
    dontBuild = true;
    prePatch = ''
        patch < ${./support-gnome-43.patch}
        '';
    installPhase = ''
        mkdir -p $out/share/gnome-shell/extensions
        cp -r -T . $out/share/gnome-shell/extensions/${uuid}
        '';

}

