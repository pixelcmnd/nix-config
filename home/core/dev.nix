{pkgs, ...}: {
  # dev utils / compilers / programming langs etc.
  home.packages = with pkgs; [
    # nix related
    hydra-check # check hydra(nix's build farm) for the build status of a package
    nix-index # A small utility to index nix store paths
    nix-init # generate nix derivation from url
    nix-melt # A TUI flake.lock viewer https://github.com/nix-community/nix-melt
    nix-tree # A TUI to visualize the dependency graph of a nix derivation https://github.com/utdemir/nix-tree
    deadnix # Find and remove unused code in .nix source files
    nixd # Feature-rich Nix language server interoperating with C++ nix
    alejandra # Nix formatter
    statix # Lints and suggestions for the nix programming language

    # Python
    python3 # High-level dynamically-typed programming language
    ruff # Extremely fast Python linter and code formatter
    uv # Extremely fast Python package installer and resolver, written in Rust

    # Clang
    clang # C language family frontend for LLVM
    clang-tools # Standalone command line tools for C++ development
    lldb # Next-generation high-performance debugger

    # Misc
    rustup # Rust toolchain installer
    go # Go Programming language
    marksman # Language Server for Markdown
    taplo # TOML toolkit written in Rust
    just # Handy way to save and run project-specific commands
    qemu # Generic and open source machine emulator and virtualizer
  ];
}
