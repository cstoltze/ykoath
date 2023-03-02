{
  description = "A rofi frontend to type TOTP codes from yubikey";
  # There's a nice tutorial here on shell scripts in nix
  # https://ertt.ca/nix/shell-scripts/
  # I've still got some work to do to clean this up

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
      pkgs = import nixpkgs { inherit system; };
      in rec {
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
