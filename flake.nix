{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ neovim lazygit nixfmt starship pre-commit semgrep semgrep-core lua lua54Packages.luarocks ];
          shellHook = ''
	  # Install pre-commit hooks found in .pre-commit-config.yaml, which includes gitleaks
	  pre-commit install

	  # Install dagger.io
	  curl -L https://dl.dagger.io/dagger/install.sh | BIN_DIR=$HOME/.local/bin sh

	  zsh'';
        };
      });
}
