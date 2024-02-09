local utils = require("utils")

-- Remap command key
vim.keymap.set("n", "<C-p>", ":", { desc = "Command Mode" })
vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command Mode" })

-- Better up/down
vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move cursor up" }
)
vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move cursor down" }
)

-- Navigate buffers
vim.keymap.set("n", "<C-M-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set(
	"n",
	"<C-M-h>",
	"<cmd>bprevious<cr>",
	{ desc = "Previous buffer" }
)
vim.keymap.set("n", "<S-Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG<cr>", { desc = "Select all" })

-- Same file
vim.keymap.set(
	{ "i", "v", "n" },
	"<C-s>",
	"<cmd>w<cr><esc>",
	{ desc = "Save file" }
)

-- Clear search results
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear search results" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { desc = "Unindent" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent" })

-- Paste without replace clipboard
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without replace" })

-- Move Lines
vim.keymap.set(
	"n",
	"<C-M-j>",
	":m .+1<cr>==",
	{ desc = "Move line down 1 line" }
)
vim.keymap.set(
	"v",
	"<C-M-j>",
	":m '>+1<cr>gv=gv",
	{ desc = "Move selected lines down 1" }
)
vim.keymap.set(
	"i",
	"<C-M-j>",
	"<Esc>:m .+1<cr>==gi",
	{ desc = "Move block down 1" }
)
vim.keymap.set("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move line up 1 line" })
vim.keymap.set(
	"v",
	"<C-M-k>",
	":m '<-2<cr>gv=gv",
	{ desc = "Move selected lines up 1" }
)
vim.keymap.set(
	"i",
	"<C-M-k>",
	"<Esc>:m .-2<cr>==gi",
	{ desc = "Move block up 1" }
)

vim.keymap.set(
	{ "i", "v", "n" },
	"<C-w>",
	"<cmd>bd<cr><esc>",
	{ desc = "Close buffer" }
)
vim.keymap.set(
	{ "i", "v", "n" },
	"<C-M-w>",
	"<cmd>bd!<cr><esc>",
	{ desc = "Close buffer" }
)

-- Exit neovim
vim.keymap.set({ "i", "v", "n" }, "<C-q>", "<cmd>q<cr>", { desc = "Exit Vim" })
vim.keymap.set(
	{ "i", "v", "n" },
	"<C-M-q>",
	"<cmd>qa!<cr>",
	{ desc = "Exit Vim" }
)

-- Better move
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move up 15 lines" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move down 15 lines" })

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
vim.keymap.set(
	"n",
	"<leader>td",
	utils.toggle_diagnostics,
	{ desc = "Toggle Diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>q",
	utils.toggle_quickfix,
	{ desc = "Toggle Quickfix Window" }
)

-- back to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Return to Netrw" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = false })
	vim.api.nvim_command("write")
end, { desc = "Lsp formatting" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

vim.keymap.set(
	"n",
	"<leader>x",
	"<cmd>!chmod +x %<CR>",
	{ silent = true, desc = "chmod file" }
)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git" })

-- which-key stuff
local wk = require("which-key")
wk.register({
	["<leader>"] = {
		{ name = "Leader Commands" }, -- naming the leader Commands
		h = { name = "Harpoon" },
		l = { "<cmd>Lazy<cr>", "Open Lazy" },
		p = { name = "Telescope" },
		r = { name = "Neotest" },
		s = { name = "Spectre Find/Replace" },
		t = { name = "Trouble" },
		u = { name = "Undotree" },
		v = { name = "LSP and Mason" },
		w = { name = "Workspace" },
	},
})
