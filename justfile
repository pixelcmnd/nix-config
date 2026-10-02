## Daily commands

## Run `just` to list the recipes. The default target is `pixel@morphine`;
## Home Manager is part of that nix-darwin system, so `just darwin-switch` applies both.
##
## just fmt                              # Format Nix sources with Alejandra
## just fmt-check                        # Check formatting without editing
## just lint                             # Run Statix and deadnix
## just check                            # Evaluate the Darwin system and flake
## just darwin-plan                      # Preview required downloads and builds
## just darwin-build                     # Build into ./result without activation
## just darwin-diff                      # Build and compare with the running system
## just darwin-check                     # Build and run activation checks via sudo
## just darwin-switch                    # Build and activate via sudo
## just update                           # Update all inputs in flake.lock
## just update nixpkgs home-manager      # Update only selected inputs
## just darwin-generations               # List system generations
## just darwin-rollback                  # Activate the previous generation
## just darwin-rollback 42               # Activate a specific generation
## just darwin-generations-clean         # Keep only the current Darwin generation
## just gc                               # Collect unused paths, keeping generations
##

# nix-darwin manages both macOS and Home Manager in this flake.
# Override the default host with `just host=user@hostname darwin-build`, or pass a
# target directly: `just darwin-build user@hostname`.
set shell := ["zsh", "-eu", "-o", "pipefail", "-c"]
set positional-arguments
host := "pixel@morphine"

# List the available commands.
default: help

[group('meta')]
help:
    @just --list --unsorted

# Display the locked flake inputs.
[group('meta')]
metadata:
    nix flake metadata --no-write-lock-file

# List the flake outputs.
[group('meta')]
show:
    nix flake show --no-write-lock-file

# Explore this configuration interactively (e.g. darwinConfigurations).
[group('meta')]
repl:
    nix repl --no-write-lock-file .

# Evaluate the selected system derivation without building or activating it.
[group('quality')]
eval target=host:
    nix eval --raw --no-write-lock-file ".#darwinConfigurations.\"$1\".system.drvPath"

# Evaluate the selected system and check the flake without building it.
[group('quality')]
check target=host: (eval target)
    nix flake check --no-build --no-write-lock-file

# Format the repository's Nix sources using the configured formatter.
[group('quality')]
fmt:
    alejandra .

# Verify that formatting would not change any files; useful in CI and before a commit.
[group('quality')]
fmt-check:
    alejandra --check .

# Check Nix style and unused bindings without editing files.
[group('quality')]
lint:
    statix check .
    deadnix -f

# Preview the downloads and builds needed for the selected system.
[group('darwin')]
[macos]
darwin-plan target=host:
    darwin-rebuild build --dry-run --no-write-lock-file --flake ".#$1"

# Build macOS and Home Manager into ./result without activating them.
[group('darwin')]
[macos]
darwin-build target=host:
    darwin-rebuild build --print-build-logs --no-write-lock-file --flake ".#$1"

# Build and compare package versions and sizes against the running system.
[group('darwin')]
[macos]
darwin-diff target=host: (darwin-build target)
    nix store diff-closures /run/current-system ./result

# Build and run nix-darwin's activation checks (requires administrator access).
[group('darwin')]
[macos]
darwin-check target=host:
    sudo darwin-rebuild check --print-build-logs --no-write-lock-file --flake ".#$1"

# Build and apply macOS and Home Manager; asks for administrator access.
[group('darwin')]
[macos]
darwin-switch target=host:
    sudo darwin-rebuild switch --print-build-logs --no-write-lock-file --flake ".#$1"

# List nix-darwin generations for the system profile.
[group('darwin')]
[macos]
darwin-generations:
    sudo darwin-rebuild --list-generations

# Delete all non-current Darwin generations; removes rollback history.
# Run `just gc` afterwards to reclaim unreferenced store paths.
[group('darwin')]
[macos]
darwin-generations-clean:
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old

# Restore the previous generation, or a specific one: `just darwin-rollback 42`.
[group('darwin')]
[macos]
darwin-rollback generation="":
    if [[ -n "$1" ]]; then \
        sudo darwin-rebuild switch --switch-generation "$1"; \
    else \
        sudo darwin-rebuild switch --rollback; \
    fi

# Update all inputs, or selected ones: `just update nixpkgs home-manager`.
[group('inputs')]
update *inputs:
    nix flake update "$@"

# Update one input without committing it. Example: `just update-input nixpkgs`.
[group('inputs')]
update-input input:
    nix flake update "$1"

# Collect unused store paths while retaining existing system generations.
[group('maintenance')]
gc:
    nix store gc

# Show store roots that may keep old builds alive (including ./result).
[group('maintenance')]
gc-roots:
    nix-store --gc --print-roots

# Verify store contents; does not repair or delete anything (can be slow).
[group('maintenance')]
verify-store:
    nix store verify --all
