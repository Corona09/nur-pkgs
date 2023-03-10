# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
    # The `lib`, `modules`, and `overlay` names are special
    lib = import ./lib { inherit pkgs; }; # functions
    modules = import ./modules; # NixOS modules
    overlays = import ./overlays; # nixpkgs overlays

    cfft = pkgs.callPackage ./pkgs/cfft { };
    dmenu = pkgs.callPackage ./pkgs/dmenu { };
    dwm = pkgs.callPackage ./pkgs/dwm { };
    dwmblocks = pkgs.callPackage ./pkgs/dwmblocks { };
    fcitx5-pinyin-moegirl = pkgs.callPackage ./pkgs/fcitx5-pinyin-moegirl { };
    fcitx5-pinyin-personal = pkgs.callPackage ./pkgs/fcitx5-pinyin-personal { };
    fcitx5-pinyin-zhwiki = pkgs.callPackage ./pkgs/fcitx5-pinyin-zhwiki { };
    gbkunzip = pkgs.callPackage ./pkgs/gbkunzip { };
    pigchacli = pkgs.callPackage ./pkgs/pigchacli { };
    qq = pkgs.callPackage ./pkgs/qq { };
    st = pkgs.callPackage ./pkgs/st { };
    templates = pkgs.callPackage ./pkgs/templates { };
    todo = pkgs.callPackage ./pkgs/todo { };
    gnomeExtensions = {
        input-method-panel = pkgs.callPackage ./pkgs/gnome-shell-extensions/input-method-panel { };
        soft-brightness = pkgs.callPackage ./pkgs/gnome-shell-extensions/soft-brightness { };
        colored-application-menu-icon = pkgs.callPackage ./pkgs/gnome-shell-extensions/colored-application-menu-icon { };
    };
    adoc-utils = pkgs.callPackage ./pkgs/adoc-utils { };
}
