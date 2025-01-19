{ ... }:
{
  perSystem = { config, self', pkgs, lib, ... }: {
    devShells.default = pkgs.mkShell {
      name = "trails-shell";
      inputsFrom = [
        self'.devShells.rust # import from devshell
        config.pre-commit.devShell # Implement ./nix/modules/pre-commit.nix
      ];
      packages = with pkgs; [
        just

        # Nix        
        pkg-config
        nix-index
        nixpkgs-fmt
        nixd
        alejandra

        # Rust
        bacon

        cargo
        cargo-edit
        cargo-expand
        cargo-udeps
        cargo-whatfeatures
        cargo-generate
        cargo-leptos
        cargo-make
        cargo-edit
        dart-sass
        leptosfmt
        trunk

        # wasm
        wasmtime
        wasmserve
        wasm-tools
        wasm-pack
        alsa-lib

        # Node
        nodejs_23
        nodePackages.tailwindcss
        nodePackages.typescript-language-server
        (nodePackages.tailwindcss.overrideAttrs (_: {
          plugins = [
            nodePackages."@tailwindcss/aspect-ratio"
            nodePackages."@tailwindcss/forms"
            nodePackages."@tailwindcss/language-server"
            nodePackages."@tailwindcss/line-clamp"
            nodePackages."@tailwindcss/typography"
          ];
        }))

        # dev docs
        config.process-compose.cargo-doc-live.outputs.package
      ];
    };
  };
}
