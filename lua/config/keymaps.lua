vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- toggle options
vim.keymap.set("n", "<leader>tw", function()
    utils.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>ts", function()
    utils.toggle("spell")
end, { desc = "Toggle Spelling" })

local wk = require("which-key")
wk.register({
        h = {
        name = "harpoon",
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
        r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "remove file" },
        m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "harpoon menu" },
        n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next file" },
        p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous file" },
        ["1"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<cr>", "file 1" },
        ["2"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<cr>", "file 2" },
        ["3"] = { "<cmd> lua require('harpoon.ui').nav_file(3)<cr>", "file 3" },
    },

})
