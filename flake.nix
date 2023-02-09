{
    description = "My personal NUR repository";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        flake-utils-plus.url = "github:gytis-ivaskevicius/flake-utils-plus";
    };
    outputs = { self, nixpkgs, flake-utils-plus, ... }:
    let
        utils = flake-utils-plus.lib;
        inherit (nixpkgs) lib;
        systems = [
            "x86_64-linux"
            "i686-linux"
            "x86_64-darwin"
            "aarch64-linux"
            "armv6l-linux"
            "armv7l-linux"
        ];
        forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
        packages = forAllSystems (system: import ./default.nix {
            pkgs = import nixpkgs {
                inherit system;
                config.allowUnfree = true;
            };
        });
    };
}
