local utils = require("utilities")

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
vim.keymap.set("i", "<S-Tab>", "<Esc><<_i", { desc = "Unindent insert mode" })

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
vim.keymap.set(
	{ "n" },
	"<leader>ii",
	"<cmd>:wincmd s<cr>",
	{ desc = "Split vertically" }
)
vim.keymap.set(
	{ "n" },
	"<leader>iu",
	"<cmd>:wincmd v<cr>",
	{ desc = "Split horizontally" }
)
vim.keymap.set(
	{ "n" },
	"<leader>ij",
	"<cmd>:wincmd j<cr>",
	{ desc = "Move to lower buffer" }
)
vim.keymap.set(
	{ "n" },
	"<leader>il",
	"<cmd>:wincmd l<cr>",
	{ desc = "Move to right buffer" }
)
vim.keymap.set(
	{ "n" },
	"<leader>ih",
	"<cmd>:wincmd h<cr>",
	{ desc = "Move to left buffer" }
)
vim.keymap.set(
	{ "n" },
	"<leader>ik",
	"<cmd>:wincmd k<cr>",
	{ desc = "Move to above buffer" }
)

-- which-key stuff
local wk = require("which-key")
wk.add({
	{ "<leader>", group = "Leader Commands" }, -- naming the leader Commands
	{ "<leader>h", group = "Harpoon" },
	{ "<leader>i", group = "Split windows" },
	{ "<leader>l", "<cmd>Lazy<cr>", desc = "Open Lazy" },
	{ "<leader>p", group = "Telescope" },
	{ "<leader>r", group = "Neotest" },
	{ "<leader>s", group = "Spectre Find/Replace" },
	{ "<leader>t", group = "Trouble" },
	{ "<leader>u", group = "Undotree" },
	{ "<leader>v", group = "LSP and Mason" },
	{ "<leader>w", group = "Workspace" },
})
