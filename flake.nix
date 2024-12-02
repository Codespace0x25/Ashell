{
  description = "Nix flake for AShell, a shell written in assembly.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages = {
        ashell = pkgs.stdenv.mkDerivation {
          pname = "ashell";
          version = "0.5.0";

          # Source URL
          src = pkgs.fetchurl {
            url = "https://github.com/Codespace0x25/Ashell/archive/refs/tags/0.5.0.tar.gz";
            sha256 = "sha256-PLACEHOLDER"; # Replace this after prefetching
          };

          # Nix uses its own `PREFIX` and `BINDIR`
          makeFlags = [
            "PREFIX=$(out)"
            "BINDIR=$(out)/bin"
          ];

          # Build and install using Makefile
          buildPhase = "make";
          installPhase = "make install";

          # No dependencies other than glibc, which is implicit
          meta = with pkgs.lib; {
            description = "A lightweight shell written in assembly.";
            homepage = "https://github.com/Codespace0x25/Ashell";
            license = licenses.gpl3;
            maintainers = [ maintainers.yourName ]; # Update with your handle
            platforms = platforms.linux;
          };
        };
      };

      # Optional: Add an app for direct usage
      apps = {
        ashell = {
          type = "app";
          program = "${self.packages.${system}.ashell}/bin/AShell";
        };
      };
    };
}
