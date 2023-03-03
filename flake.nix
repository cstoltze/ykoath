{
  description = "A rofi frontend to type TOTP codes from yubikey";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        formatter = pkgs.nixpkgs-fmt;
        defaultPackage = packages.ykoath;
        packages.ykoath = pkgs.writeShellApplication {
          name = "ykoath";
          text = builtins.readFile ./ykoath;
          runtimeInputs = [
            pkgs.yubikey-manager
            pkgs.rofi
            pkgs.xdotool
          ];
        };
      }
    );
}
