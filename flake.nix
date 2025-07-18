{
  description = "SvelteKit + Bun: Are You a Frog?";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs_20
            pkgs.bun
            pkgs.git
          ];
          shellHook = ''
            echo "\033[1;32mWelcome to the Are You a Frog? dev shell!\033[0m"
            echo "Run 'bun install' and 'bun run dev' to start SvelteKit."
          '';
        };
      }
    );
} 