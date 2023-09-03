local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim"
    },
    keys = {
        {
            "<leader>pf",
            "<cmd>lua require('telescope.builtin').find_files()<cr>",
            desc = "Open fuzzy finder."
        },
        {
            "<C-p>",
            "<cmd>lua require('telescope.builtin').git_files()<cr>",
            desc = "Git files"
        },
        {
            "<C-g>",
            "<cmd>lua require('telescope.builtin').live_grep()<cr>",
            desc = "Grep files"
        },
        {
            "<leader>ps",
            "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ')})<cr>",
            desc = "Grep in buffer"
        },
        {
            "<leader>u",
            "<cmd>Telescope undo<cr>",
            desc = "Undo history",
        },
    },
    config = function()
        local ts = require("telescope")
        local tsu = require("telescope-undo.actions")
        ts.setup({
            defaults = {
                file_ignore_patterns = {
                    ".git",
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
            extensions = {
                undo = {
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = "horizontal",
                    layout_config = {
                        preview_height = 0.8,
                    },
                    mappings = {
                        ["<C-a>"] = tsu.yank_additions,
                        ["<C-d>"] = tsu.yank_deletions,
                        ["<C-r>"] = tsu.restore
                    },
                },
            },
        })
        ts.load_extension("undo")
    end,
}

return M
