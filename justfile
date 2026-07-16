# just is a command runner, Justfile is very similar to Makefile, but simpler.

# Use zsh for shell commands
# To use this justfile, you need to enter a shell with just & zsh installed:
#
#   nix shell nixpkgs#just nixpkgs#zsh
set shell := ["zsh", "-c"]

############################################################################
#  Common commands(suitable for all machines)
############################################################################

# List all the just commands
default:
    @just --list

# Update all the flake inputs
[group('nix')]
up:
  nix flake update --commit-lock-file

# Update specific input
# Usage: just upp nixpkgs
[group('nix')]
upp input:
  nix flake update {{input}} --commit-lock-file

# List all generations of the system profile
[group('nix')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Open a nix shell with the flake
[group('nix')]
repl:
  nix repl -f flake:nixpkgs

# Garbage collect all unused nix store entries and optimise store
[group('nix')]
gc:
  nix store gc
  nix store optimise

[group('nix')]
fmt:
  # format the nix files in this repo
  find . -path ./.git -prune -o -name '*.nix' -exec alejandra {} +

# Show all the auto gc roots in the nix store
[group('nix')]
gcroot:
  ls -al /nix/var/nix/gcroots/auto/ || true

# Verify all the store entries
# Nix Store can contains corrupted entries if the nix store object has been modified unexpectedly.
# This command will verify all the store entries,
# and we need to fix the corrupted entries manually via `sudo nix store delete <store-path-1> <store-path-2> ...`
[group('nix')]
verify-store:
  nix store verify --all

# Repair Nix Store Objects
[group('nix')]
repair-store *paths:
  nix store repair {{paths}}

# Update all Nixpkgs inputs
[group('nix')]
up-nix:
  nix flake update --commit-lock-file nixpkgs-stable nixpkgs-master nixpkgs-darwin nixpkgs-patched

# override nixpkgs's commit hash
[group('nix')]
override-pkgs hash:
  nix flake update --commit-lock-file nixpkgs --override-input nixpkgs github:NixOS/nixpkgs/{{hash}}

############################################################################
#  Darwin related commands
############################################################################

[macos]
[group('desktop')]
brew-upgrade:
  brew update
  brew upgrade --yes
  brew upgrade --cask --greedy

# Reset launchpad to force it to reindex Applications
[macos]
[group('desktop')]
reset-launchpad:
  defaults write com.apple.dock ResetLaunchPad -bool true
  killall Dock

# #################################################
# Other useful commands
# #################################################


# Remove all reflog entries and prune unreachable objects
[group('git')]
ggc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now

# Amend the last commit without changing the commit message
[group('git')]
game:
  git commit --amend -a --no-edit
