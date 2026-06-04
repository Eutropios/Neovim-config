require("vim._core.ui2").enable({})

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("pack")
require("treesitter")
require("lsp")
vim.cmd.colorscheme("moonfly")
