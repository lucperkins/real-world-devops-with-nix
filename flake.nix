{
  description = "Real-world DevOps with Nix";

  inputs = { dev.url = "github:the-nix-way/dev-templates"; };

  outputs = { self, dev }:
    let inherit (dev.lib) flake-utils nixpkgs;
    in flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells = {
          default =
            pkgs.mkShell { buildInputs = with pkgs; [ packer terraform ]; };
        };
      });
}
