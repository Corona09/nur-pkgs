{ pkgs
, lib
, stdenv
, fetchzip
,... }:
stdenv.mkDerivation rec {
    pname = "gnome-shell-extension-input-method-panel";
    version = "71";
    uuid = "kimpanel@kde.org";
    src = fetchzip {
        url = "https://extensions.gnome.org/extension-data/${
            builtins.replaceStrings [ "@" ] [ "" ] uuid
        }.v${builtins.toString version}.shell-extension.zip";
        sha256 = "sha256-5PrPxmYFAB+ssXdhMn2f0bGZvsDxxuIjZ5TPJnPXOo4=";
        stripRoot = false;
    };
    dontBuild = true;
    installPhase = ''
        mkdir -p $out/share/gnome-shell/extensions
        cp -r -T . $out/share/gnome-shell/extensions/${uuid}
        '';

}
