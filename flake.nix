{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    niri-flake.url = "github:sodiboo/niri-flake";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };

  outputs = { self, nixpkgs, niri-flake, hyprpanel, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Change this if using a different architecture
      specialArgs = {
      inherit inputs;
      };
      modules = [
        ./configuration.nix
        inputs.niri-flake.nixosModules.niri
        {
          # Enable the niri window manager
          programs.niri.enable = true;

          # Optional: set as default session for your display manager
          services.displayManager.defaultSession = "niri";
          
          # Add HyprPanel overlay
          nixpkgs.overlays = [inputs.hyprpanel.overlay];
        }
      ];
    };
  };
}
