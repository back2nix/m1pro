{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "flake:nix-darwin";
    home-manager.url = "flake:home-manager";
  };
  outputs = inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      darwinConfigurations = {
        nixos = import ./darwinConfigurations/nixos.nix flakeContext;
      };
      homeConfigurations = {
        nixos = import ./homeConfigurations/nixos.nix flakeContext;
      };
    };
}
