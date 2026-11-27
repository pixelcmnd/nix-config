{ pkgs, ... }: {
  # dev utils / compilers / programming langs etc.
  home.packages = with pkgs; [
    # nix related
    nixpkgs-review # Build packages affected by Nixpkgs pull requests
    nix-update # Update package versions and source hashes
    nix-init # Generate package expressions from source URLs
    nix-prefetch-git # Prefetch Git sources and calculate their hashes
    nix-prefetch-github # Prefetch GitHub sources and calculate their hashes
    nix-output-monitor # Display build progress with nom
    nix-tree # Explore store dependency trees
    nix-diff # Explain differences between derivations
    nvd # Show package changes between system generations
    nix-melt # A TUI flake.lock viewer https://github.com/nix-community/nix-melt
    deadnix # Find and remove unused code in .nix source files
    nixd # Feature-rich Nix language server interoperating with C++ nix
    nixfmt # Nix formatter
    nixfmt-tree # Format all Nix files in a project with treefmt
    statix # Lints and suggestions for the nix programming language
    codespell # Find common spelling mistakes in source code and prose

    # Java
    jdt-language-server

    # Python
    python3 # High-level dynamically-typed programming language
    pyright # Python language server
    ruff # Extremely fast Python linter and code formatter
    uv # Extremely fast Python package installer and resolver, written in Rust

    # JavaScript / TypeScript
    typescript-language-server
    prettier

    # Clang
    clang # C/C++ compiler and language-family frontend for LLVM
    clang-tools # Standalone command line tools for C++ development
    lldb # Next-generation high-performance debugger

    # Misc
    pv # Tool for monitoring the progress of data through a pipeline
    rustup # Rust toolchain installer
    go # Go Programming language
    markdown-oxide # Language server for Markdown
    taplo # TOML toolkit written in Rust
    just # Handy way to save and run project-specific commands
    luarocks # A package manager for Lua modules.
    luajit # High-performance JIT compiler for Lua 5.1
    duckdb # Embeddable SQL OLAP Database Management System
    tree-sitter # Parser generator tool and an incremental parsing library
  ];
}
