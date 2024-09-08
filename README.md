# Neovim-config

My current NeoVim config. Nothing more, nothing less.
This exists to keep my config safe in case something goes bonkers.

This config uses Lazy.nvim as its package installer, and a colour scheme similar
to VSCode's Default Dark+ theme.

Neovim version >= 0.10.0 required.

Package Manager: [Lazy.nvim](https://github.com/folke/lazy.nvim)
Colourscheme: [vscode.nvim](https://github.com/Mofiqul/vscode.nvim)
Prerequisites to be installed via your Linux distribution's package manager:

* [fd](https://github.com/sharkdp/fd)
* [ripgrep](https://github.com/BurntSushi/ripgrep)

## Packages

### LSP, Linting, Formatting, and Code Completion

* [conform.nvim](https://github.com/stevearc/conform.nvim)
* [mason.nvim](https://github.com/williamboman/mason.nvim)
  * [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
* [neodev.nvim](https://github.com/folke/neodev.nvim)
* [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  * [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
  * [cmp-calc](https://github.com/hrsh7th/cmp-calc)
  * [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
  * [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
  * [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
  * [cmp-path](https://github.com/hrsh7th/cmp-path)
  * [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
  * [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    * [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
* [nvim-lint](https://github.com/mfussenegger/nvim-lint)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  * [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)

### GUI

* [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
* [lualine](https://github.com/nvim-lualine/lualine.nvim)
* [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
* [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim)

### Utilities

* [Comment.nvim](https://github.com/numToStr/Comment.nvim) - (Mass-insert Comments)
* [glow.nvim](https://github.com/ellisonleao/glow.nvim) - (Markdown Previewer)
* [harpoon](https://github.com/ThePrimeagen/harpoon) - (File Jumping)
* [leap.nvim](https://github.com/ggandor/leap.nvim) - (Advanced Motions)
* [neogen](https://github.com/danymat/neogen) - (Generate Annotations)
* [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - (Colour Code Visualizer)
* [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) - (Find/Replace Panel)
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - (Fuzzy Finder)
  * [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  * [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
* [trouble.nvim](https://github.com/folke/trouble.nvim) - (Diagnostics Panel)
* [undotree](https://github.com/mbbill/undotree) - (Undotree)
* [which-key.nvim](https://github.com/folkr/which-key.nvim) - (Key Bindings)

## Acknowledgement

This configuration is inspired by [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles/tree/master/vim-2022/.config/nvim)
and [NavePnow](https://github.com/NavePnow/dotfiles/tree/main/.config/nvim).
