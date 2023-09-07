# Neovim-config

My current NeoVim config. Nothing more, nothing less.  
This exists to keep my config safe in case something goes bonkers.  

This config uses Lazy.nvim as its package installer, and a colour scheme similar to the of the Default Dark+ VSCode Theme.  

Package Manager: Lazy.nvim - <https://github.com/folke/lazy.nvim>  
Colourscheme: vscode.nvim - <https://github.com/Mofiqul/vscode.nvim>  
Prerequisites to be installed via your Linux distribution's package manager:

* fd - <https://github.com/sharkdp/fd>  
* ripgrep - <https://github.com/BurntSushi/ripgrep>

## Packages:  

### LSP and Code Completion

* nvim-treesitter - <https://github.com/nvim-treesitter/nvim-treesitter>
    * nvim-treesitter-refactor - <https://github.com/nvim-treesitter/nvim-treesitter-refactor>
* nvim-lspconfig - <https://github.com/neovim/nvim-lspconfig>
* mason.nvim - <https://github.com/williamboman/mason.nvim>
    * mason-lspconfig.nvim - <https://github.com/williamboman/mason-lspconfig.nvim>
* null-ls (This might need a replacement) - <https://github.com/jose-elias-alvarez/null-ls.nvim>
* nvim-cmp - <https://github.com/hrsh7th/nvim-cmp>
    * cmp-nvim-lsp - <https://github.com/hrsh7th/cmp-nvim-lsp>
    * cmp-buffer - <https://github.com/hrsh7th/cmp-buffer>
    * cmp-cmdline - <https://github.com/hrsh7th/cmp-cmdline>
    * cmp-path - <https://github.com/hrsh7th/cmp-path>

### GUI

* gitsigns.nvim - <https://github.com/lewis6991/gitsigns.nvim>
* nvim-tree.lua - <https://github.com/nvim-tree/nvim-tree.lua>
* nvim-web-devicons - <https://github.com/nvim-tree/nvim-web-devicons>
* statuscol.nvim - <https://github.com/luukvbaal/statuscol.nvim>
* bufferline.nvim - <https://github.com/akinsho/bufferline.nvim>
* nui.nvim - <https://github.com/MunifTanjim/nui.nvim>
* lualine - <https://github.com/nvim-lualine/lualine.nvim>

### Utilities

* which-key.nvim (Key Bindings) - <https://github.com/folkr/which-key.nvim>
* telescope.nvim (Fuzzy Finder) - <https://github.com/nvim-telescope/telescope.nvim>
    * plenary.nvim - <https://github.com/nvim-lua/plenary.nvim>
* leap.nvim (File Motions) - <https://github.com/ggandor/leap.nvim>
* harpoon (File Jumping) - <https://github.com/ThePrimeagen/harpoon>
* LuaSnip (Code Snippets) - <https://github.com/L3MON4D3/LuaSnip>
    * friendly-snippets - <https://github.com/rafamadriz/friendly-snippets>
* indent-blankline.nvim (Indent Visualizer) - <https://github.com/lukas-reineke/indent-blankline.nvim>
* nvim-colorizer.lua (Colour Code Visualizer) - <https://github.com/norcalli/nvim-colorizer.lua>
* undotree (Undotree) - <https://github.com/mbbill/undotree>
* Comment.nvim (Mass-insert Comments) - <https://github.com/numToStr/Comment.nvim>
* neogen (Generate Annotations) - <https://github.com/danymat/neogen>
* trouble.nvim (Diagnostics Panel) - <https://github.com/folke/trouble.nvim>
* nvim-autopairs (Auto-closing braces) - <https://github.com/windwp/nvim-autopairs>


## Acknowledgement

This configuration is inspired by <https://github.com/ThePrimeagen/.dotfiles/tree/master/vim-2022/.config/nvim> and <https://github.com/NavePnow/dotfiles/tree/main/.config/nvim>
