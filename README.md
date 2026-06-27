<h2 align="center">Pixel's Nix Config</h2>

This repository is home to the Nix code that builds my systems:
1. NixOS Desktop: NixOS with home-manager, niri, noctalia-shell, etc. (currently inactive)
2. macOS Desktop: nix-darwin with home-manager, shares the same home-manager configuration with NixOS Desktop.

See [./hosts](./hosts) for details of each host.

## Why Nix?

Nix allows for easy-to-manage, collaborative, reproducible deployments. This means that once something is set up and configured, it works (almost) forever. If someone else shares their configuration, anyone else can just use it (provided you understand what you're adapting).

**If you want to know Nix & Flakes in detail, then I'd recommend ryan4yin's book!**
**[NixOS & Nix Flakes Book - 🛠️ ❤️ An unofficial & opinionated :book: for beginners](https://github.com/ryan4yin/nixos-and-flakes-book)**



> **IMPORTANT: You should NOT deploy this flake directly on your machine.
> It will not succeed.**
> This flake contains my hardware configuration (such as partitions, etc.) which is not suitable for your hardware.
> You may use this repo as a reference to build your own configuration.

## References

The configuration is heavily inspired by [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
