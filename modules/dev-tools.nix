{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Version Control
    git
    gh                 # GitHub CLI
    lazygit            # Terminal UI for git
    
    # Editors and IDEs
    vim
    neovim

    
    # Build tools
    gnumake
    cmake
    ninja
    
    # Compilers and languages
    gcc
    clang
    nodejs
    yarn
    python3
    python3Packages.pip
    python3Packages.ipython
    rustup             # Rust toolchain installer
    go
    
    # Development utilities
    docker
    docker-compose
    jq                 # JSON processor
    yq                 # YAML processor
    shellcheck         # Shell script analysis
    
    # Documentation
    man-pages
    tldr              # Simplified man pages
  ];
  
  # Enable Docker
  virtualisation.docker.enable = true;
  

}
