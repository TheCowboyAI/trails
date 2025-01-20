# Cowboy AI - Trails
Trails is an AI enhanced internet search tool.

This is completely unready and only here testing in public... we are pre-alpha right now.

Here is our philosophy.
    - This is an Event-sourced solution
    - We use NixOS and NixOS Modules
    - We use a Pod Architecture for micro-services
    - This is Open Source under an MIT License

This requires some opinions and following some standards.

We leverage:

    - nats
    - searxng
    - ollama
    - nginx

and our custom UI written in Rust with Leptos and Axum.

ALL of these are NixOS "services", meaning, they are already available as pre-understood by NixOS and you can just configure them.

If I want to make a NixOS system that runs any of these services, it is very straight-forward, see the examples in [./nix/modules].

If I want to compose these "services" together in a "pod" then I simply need to follow some standard practices that kubernetes also uses to arrange the network, integration and orchestration.

As NixOS Modules we have a common language to speak, "nix" and a common way to debug our system.

If we want kubernetes, then that should just be an option we can enable and configure.

Yes, there are a few samples of doing this in the wild, but we wanted to formalize this into a real framework of understanding.

It's all Nix, and it's all Graphs.

Every configuration should be in nix and export to the proper native configurations... This includes all builds of the source.

This module for trails is one such example.
### flake.nix
contains a development environment to build the module

### package.nix
contains build instructions for src

### default.nix
contains installation instructions for binaries

For the root of CIM - Composable Information Machine philosophy, see [https://github.com/thecowboyai/cim-start]