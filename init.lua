require("config.options")
require("config.lazy")
require("colors")

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require("config.keymaps")
        require("config.autocmd")
    end,
})
