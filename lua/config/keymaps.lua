local utils = require("utils")

-- Remap command key
vim.keymap.set("n", "<leader><leader>", ":")
vim.keymap.set("n", "<C-p>", ":")

-- Better up/down
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Navigate buffers
vim.keymap.set("n", "<C-M-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-M-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG<cr>", { desc = "Select all" })

-- Same file
vim.keymap.set({ "i", "v", "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Clear search results
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Paste without replace clipboard
vim.keymap.set("v", "p", '"_dP')

-- Move Lines
vim.keymap.set("n", "<C-M-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<C-M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<C-M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

vim.keymap.set({ "i", "v", "n" }, "<C-w>", "<cmd>bd<cr><esc>", { desc = "Close buffer" })
vim.keymap.set({ "i", "v", "n" }, "<C-M-w>", "<cmd>bd!<cr><esc>", { desc = "Close buffer" })

-- CLose buffer

-- Exit neovim
vim.keymap.set({ "i", "v", "n" }, "<C-q>", "<cmd>q<cr>", { desc = "Exit Vim" })
vim.keymap.set({ "i", "v", "n" }, "<C-M-q>", "<cmd>qa!<cr>", { desc = "Exit Vim" })

-- Better move
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Clear search results
vim.keymap.set("n", "<leader>f", "za")

-- toggle options
vim.keymap.set("n", "<leader>tw", function()
    utils.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>ts", function()
    utils.toggle("spell")
end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>tl", function()
    utils.toggle("relativenumber")
end, { desc = "Toggle Line Numbers" })
vim.keymap.set("n", "<leader>td", utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "<leader>q", utils.toggle_quickfix, { desc = "Toggle Quickfix Window" })

vim.keymap.set("n", "<C-M-f>", function()
    vim.lsp.buf.format({ async = false })
    vim.api.nvim_command("write")
end, { desc = "Lsp formatting" })

-- stuff from old config
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

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

-- which-key stuff
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
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
        t = {
            name = "Trouble",
            o = { "<cmd>lua require('trouble').open()<cr>", "open" },
            w = { "<cmd>lua require('trouble').open('workspace_diagnostics')<cr>", "workspace diagnostics" },
            d = { "<cmd>lua require('trouble').open('document_diagnostics')<cr>", "document diagnostics" },
            q = { "<cmd>lua require('trouble').open('quickfix')<cr>", "quickfix" },
            l = { "<cmd>lua require('trouble').open('loclist')<cr>", "loclist" },
            r = { "<cmd>lua require('trouble').open('lsp_references')<cr>", "lsp references" },
        }
    },

})
