{ inputs, ... }@flakeContext:
let
  homeModule = { config, lib, pkgs, ... }: {
    config = {
      home = {
        stateVersion = "23.11";
      };
      programs = {
        tmux = {
          enable = true;
        };
      };
    };
  };
  nixosModule = { ... }: {
    home-manager.users.nixos = homeModule;
  };
in
(
  (
    inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        homeModule
      ];
      pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
    }
  ) // { inherit nixosModule; }
)
