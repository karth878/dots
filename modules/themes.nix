{ config, lib, pkgs, ... }:

{
  # Neovim with Rose Pine theme
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    configure = {
      customRC = ''
        " Rose Pine Theme Configuration
        set termguicolors
        let g:rose_pine_variant = 'moon'
        colorscheme rose-pine
        
        " Development enhancements
        syntax enable
        set number
        set relativenumber
        set autoindent
        set expandtab
        set tabstop=2
        set shiftwidth=2
        
        " LSP configuration
        lua << EOF
        require('lspconfig').pyright.setup{}
        require('lspconfig').rust_analyzer.setup{}
        require('lspconfig').tsserver.setup{}
        EOF
      '';
      
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          rose-pine          # Rose Pine theme
          vim-nix            # Nix support
          nvim-lspconfig     # LSP support
          nvim-cmp           # Completion
          cmp-nvim-lsp       # LSP source for nvim-cmp
          cmp-buffer         # Buffer source for nvim-cmp
          cmp-path           # Path source for nvim-cmp
          nvim-treesitter    # Better syntax highlighting
          telescope-nvim     # Fuzzy finder
          vim-fugitive       # Git integration
          vim-gitgutter      # Git diff in sign column
        ];
      };
    };
  };
  
  # Install GTK themes (even though WSL doesn't have GUI, useful if you use X forwarding)
  environment.systemPackages = with pkgs; [
    rose-pine-gtk-theme
    papirus-icon-theme
  ];
  
  # Git with nice delta diff viewer
  programs.git = {
    enable = true;
    config = {
      user.name = "Your Name";
      user.email = "your.email@example.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = false;
    };
  };
}
