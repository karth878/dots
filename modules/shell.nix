{ config, lib, pkgs, ... }:

{
  # ZSH with Rose Pine theme
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "python" "docker" "sudo" "vscode" ];
      theme = "robbyrussell"; # Base theme we'll override with starship
    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  # Make zsh the default shell
  users.defaultUserShell = pkgs.zsh;
  
  # Starship prompt with Rose Pine theme
  programs.starship = {
    enable = true;
    settings = {
      # Rose Pine inspired colors
      character = {
        success_symbol = "[➜](bold #9ccfd8)";
        error_symbol = "[✗](bold #eb6f92)";
      };
      
      git_branch = {
        style = "bold #f6c177";
      };
      
      directory = {
        style = "bold #c4a7e7";
      };
    };
  };
  
  # Add Alacritty terminal with Rose Pine theme
  environment.systemPackages = with pkgs; [
    starship
    fzf           # Fuzzy finder
    zoxide        # Smarter cd command
    direnv        # Per-directory environment variables
  ];
  

        
}
