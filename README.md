# Neovim-config
My current NeoVim config. Nothing more, nothing less.  
This exists to keep my config safe in case something goes bonkers.  

This config uses Lazy.nvim as its package installer, and a colour scheme similar to the of the Default Dark+ VSCode Theme.  

Lazy.nvim can be found here: <https://github.com/folke/lazy.nvim>  
Prerequisites to be installed via your Linux distribution's package manager:
* fd - <https://github.com/sharkdp/fd>  
* ripgrep - <https://github.com/BurntSushi/ripgrep>

Packages used:  
* vscode.nvim (Colour scheme) - <https://github.com/Mofiqul/vscode.nvim>
* nvim-treesitter (Language parsing) - <https://github.com/nvim-treesitter/nvim-treesitter>
* telescope.nvim (Fuzzy Finder) - <https://github.com/nvim-telescope/telescope.nvim>
  * plenary.nvim - <https://github.com/nvim-lua/plenary.nvim>
* harpoon (File switching) - <https://github.com/ThePrimeagen/harpoon>
* undotree (Edit tree) - <https://github.com/mbbill/undotree>
* fugitive (git wrapper) - <https://github.com/tpope/vim-fugitive>
* lsp-zero.nvim (LSP wrapper) - <https://github.com/VonHeikemen/lsp-zero.nvim>
  * nvim-lspconfig - <https://github.com/neovim/nvim-lspconfig>
    * mason.nvim - <https://github.com/williamboman/mason.nvim>
    * mason-lspconfig.nvim - <https://github.com/williamboman/mason-lspconfig.nvim>
    * LuaSnip - <https://github.com/L3MON4D3/LuaSnip>
    * nvim-cmp - <https://github.com/hrsh7th/nvim-cmp>
    * cmp-nvim-lsp - <https://github.com/hrsh7th/cmp-nvim-lsp>
