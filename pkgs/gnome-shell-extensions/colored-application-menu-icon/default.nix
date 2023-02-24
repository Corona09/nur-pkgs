{ pkgs
, lib
, stdenv
, fetchzip
,... }:
stdenv.mkDerivation rec {
    pname = "gnome-shell-extension-colored-application-menu-icon";
    version = "4";
    uuid = "appMenuIcon@pratap.fastmail.fm";
    src = fetchzip {
        url = "https://extensions.gnome.org/extension-data/${
            builtins.replaceStrings [ "@" ] [ "" ] uuid
        }.v${builtins.toString version}.shell-extension.zip";
        sha256 = "sha256-yAiKLtAWiyk75GbRlkHQFFif7NELwFX0qEoR9uLuem4=";
        stripRoot = false;
    };
    dontBuild = true;
    installPhase = ''
        mkdir -p $out/share/gnome-shell/extensions
        cp -r -T . $out/share/gnome-shell/extensions/${uuid}
        '';

}
