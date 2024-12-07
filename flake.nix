{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  
  outputs = { self, nixpkgs, ... }: let
    systems = [ "x86_64-linux" "aarch64" ];

    forEachSystem = f: with nixpkgs.lib; foldAttrs mergeAttrs {}
      (lists.forEach systems (system:
        mapAttrs (name: value: { ${system} = value; }) (f system)
      ));
  in forEachSystem (system: let
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {
    devShells.default = pkgs.mkShell {
      inputsFrom = [
        packages.default
      ];
    };

    packages.default = pkgs.stdenv.mkDerivation {
      name  = "kernel32";
      pname = "kernel32";

      shellHook = ''
        export PS1="(kernel32-blog) \u@\h:\w\$ "
      '';

      src = ./.;

      nativeBuildInputs = with pkgs; [ go hugo ];
      
      buildPhase = "hugo --gc --minify --baseURL https://kernel32.xyz";
    };
  });
}
