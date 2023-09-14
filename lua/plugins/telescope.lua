local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        }
    },
    event = "VeryLazy",
    config = function()
        local ts = require("telescope")
        ts.setup({
            defaults = {
                file_ignore_patterns = {
                    ".git",
                },
                layout_config = {
                    horizontal = {
                        width = 0.95,
                        preview_width = 0.6
                    },

                }
            },
            pickers = {
                find_files = { hidden = true },
                live_grep = {
                    additional_args = function(opts)
                        return { "--hidden" }
                    end,
                },
            },
        })
        ts.load_extension("fzf")
    end,
}

return M
