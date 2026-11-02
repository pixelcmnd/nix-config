<h2 align="center">Pixel's Nix Config</h2>

This repository contains the Nix configuration for my systems. The active host is `morphine`, an Apple Silicon macOS machine using nix-darwin and Home Manager. The flake has places for NixOS and standalone Home Manager configurations too, but neither currently has a host registered.

- [Hosts](hosts/) explains the current host and how to add another.
- [Home Manager modules](home/) covers the shared and macOS-specific user configuration.
- `flake.nix` defines the inputs and exports; `vars.nix` holds shared user values.

This configuration is specific to my machines and user account. Use it as a reference and adapt it before deploying it on your own machine.

## Why Nix?

Nix lets me keep system and user configuration in one place and reproduce it across machines. If you want to learn more about Nix and flakes, I'd recommend [the NixOS & Nix Flakes Book](https://github.com/ryan4yin/nixos-and-flakes-book).

## References

The configuration is heavily inspired by [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config).
