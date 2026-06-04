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

-- back to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Return to Netrw" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines w/o moving cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = false })
	vim.api.nvim_command("write")
end, { desc = "Lsp formatting" })

vim.keymap.set(
	"n",
	"<C-j>",
	"<cmd>cprev<CR>zz",
	{ desc = "Quick Fix previous" }
)
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quick Fix next" })
vim.keymap.set(
	"n",
	"<leader>j",
	"<cmd>lprev<CR>zz",
	{ desc = "Location Fix previous" }
)
vim.keymap.set(
	"n",
	"<leader>k",
	"<cmd>lnext<CR>zz",
	{ desc = "Location Fix next" }
)

vim.keymap.set(
	"n",
	"<leader>re",
	"<cmd>restart<cr>",
	{ desc = "Restart config :restart)" }
)

-- native undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

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
